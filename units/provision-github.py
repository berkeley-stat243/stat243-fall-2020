#!/usr/bin/python3
# vim: set et sw=4 ts=4:

#
# Given a  list of Berkeley email addresses and a GitHub org:
#  - for each member
#    + create a repo in a specified github org
#    + and set authz
#
# Requires GitHub API secrets.
#
#

import argparse
import json
import os
import string
import pdb

import requests

safe_chars = string.ascii_letters + string.digits + '-'

def escape_chars(s):
    retval = ''
    for char in s:
        if char not in safe_chars: newchar = '-'
        else: newchar = char
        retval = retval + newchar
    return retval

def users_parse(text):
    vals = []
    text = text.split(',')
    for idx, value in enumerate(text):
        tmp = value.split('@')
        if len(tmp) == 2 and tmp[1] != "berkeley.edu":
            print("Found non-Berkeley email: " + value + ". Omitting.")
        else:
            vals.append(tmp[0])
    return(vals)

def gh_account_check(auth, user):
    '''Check if user's github.b.e account is active (i.e., have the logged in to github.b.e).'''
    uri = '{}/users/{}'.format(config['github_base_uri'], user)
    r = requests.get(uri, auth=auth)
    return r.status_code != 404

def gh_create_org_repo(auth, org, repo):
    '''Create a repo within a github org.'''
    print("Creating repo for " + repo + ".")
    uri = '{}/orgs/{}/repos'.format(config['github_base_uri'], org)
    params = {
        'name': repo,
        'private': 'true',
        'auto_init': 'true'
    }

    r = requests.post(uri, data=json.dumps(params), auth=auth)
    # Note that repository creation should be idempotent:
    # API will tell us (with 422 code) if repository exists and will leave it alone.
    if r.status_code == 404:
        print("Could not create repo for " + user + ".")
    if r.status_code == 422:
        print("Note: Repository already exists.")

    
def gh_teams_uri(base_uri, org):
    return '{}/orgs/{}/teams'.format(base_uri, org)

def gh_get_org_team_id(auth, org, team):
    '''
        Return the id of a team with a github org, or None if
        there is no such team.
        https://developer.github.com/v3/teams/
    '''
    uri = gh_teams_uri(config['github_base_uri'], org)
    r = requests.get(uri, auth=auth)
    teams = r.json()
    for t in teams:
        if t['slug'] == team: return t['id']
    return None

def gh_create_org_team(auth, org, team):
    '''
        Create a team within a github org and return its id.
        https://developer.github.com/v3/teams/
    '''
    uri = gh_teams_uri(config['github_base_uri'], org)
    params = {
        'name': team,
        'privacy': 'secret'
    }
    r = requests.post(uri, data=json.dumps(params), auth=auth)

    # fetch the id of the team we just created
    return gh_get_org_team_id(auth, org, team)
    
def gh_add_member_to_team(auth, team_id, user):
    '''
        Add a user to a team.
        https://developer.github.com/enterprise/2.14/v3/teams/members/
    '''
    print("Adding " + user + " to team.")
    uri = '{}/teams/{}/memberships/{}'.format(
        config['github_base_uri'], team_id, user)
    params = {
        'role': 'member',
    }
    r = requests.put(uri, data=json.dumps(params), auth=auth)
    if r.status_code == 404:
        print("Could not add user " + user + " to team.")
        #raise Exception('Bad URI: ' + uri)

            
def gh_add_collaborator(auth, owner, repo, user):
    ''' PUT /repos/:owner/:repo/collaborators/:username'''
    uri = '{}/repos/{}/{}/collaborators/{}'.format(
        config['github_base_uri'], owner, repo, user)
    params = {
        'permission': 'admin'
    }
    r = requests.put(uri, data=json.dumps(params), auth=auth)
    if r.status_code != 204:
        print("Could not add " + user + " as collaborator for repo " + repo + ".")
    return r

def has_all_keys(d, keys):
    return all (k in d for k in keys)

def read_json_data(filename, required_keys=[]):
    '''Read and validate data from a json file.'''
    if not os.path.exists(filename):
        s = "No such file: {}".format(filename)
        raise Exception(s)
    data = json.loads(open(filename).read())
    # check that we've got all of our required keys
    if not has_all_keys(data, required_keys):
        s = "Missing parameters in {}: {}".format(
            filename,
            set(required_keys) - set(data.keys())
        )
        raise Exception(s)
    return data

## main
home_dir = os.environ['HOME']
default_secrets = os.path.join(home_dir, 'provision-github-secrets.json')

parser = argparse.ArgumentParser(description="Create per-user GitHub repos from list of users.")
parser.add_argument('-v', dest='verbose', action='store_true',
    help='Be verbose.')
parser.add_argument('-d', dest='debug', action='store_true', help='Debug.')
parser.add_argument('-n', dest='dryrun', action='store_true',
    help='Dry run. Print Grouper membership without updating GitHub.')
parser.add_argument('-c', dest='config',
    default='provision-github.json', help='Configuration file.')
parser.add_argument('-s', dest='secrets', default=default_secrets,
    help='Secrets file.')
parser.add_argument('-t', dest='team', action='store_true',
                    help='Create team and add members.')
parser.add_argument('-u', dest='users', default=None,
                    help='Users, comma-separated (either CalNet usernames or @berkeley.edu email addresses.')
args = parser.parse_args()

# read secrets from secrets file
if args.use_grouper:
    secrets = read_json_data(args.secrets,
        ['github_user', 'github_token'])
else:
    secrets = read_json_data(args.secrets,
        ['github_user', 'github_token'])
    
# read config from config file
config = read_json_data(args.config,
    ['orgs', 'github_base_uri', 'grouper_base_uri'])

if args.use_grouper:
    grouper_auth = requests.auth.HTTPBasicAuth(secrets['grouper_user'],
        secrets['grouper_pass'])

github_auth = requests.auth.HTTPBasicAuth(secrets['github_user'],
    secrets['github_token'])

for o in config['orgs'].keys():
    org = config['orgs'][o]
    if not args.debug:
        if args.team:
            team_id = gh_create_org_team(github_auth, o, org['team'])
            if team_id is None:
                raise Exception("No team id for {}".format(org['team']))
    if args.users != None:
        print("Including users: ", args.users)
        members = users_parse(args.users)
    for user in members:
        if user == "": continue # why does this happen? (This also happened for Stat 243 in Fall 2019....)
        esc_user = escape_chars(user)
        if args.verbose:
            if user == esc_user:
                print('{}'.format(user))
            else:
                print('{:18} escaped: {}'.format(user, esc_user))
        if args.debug: continue
        # Only proceed with user if they have an active github.b.e account.
        # Otherwise, repository would be created but user would not be a member
        # of their own repository.
        if gh_account_check(github_auth, esc_user):
            if args.team:
                gh_add_member_to_team(github_auth, team_id, esc_user)
            gh_create_org_repo(github_auth, o, esc_user)
            # add user as admin collaborator to the repo named after the user
            owner = o
            r = gh_add_collaborator(github_auth, owner, esc_user, esc_user)
            # add admins as admin collaborator
            for admin in org['admins']:
                r = gh_add_collaborator(github_auth, owner, esc_user, admin)
        else:
            print("User account not yet activated for " + esc_user + ".")
