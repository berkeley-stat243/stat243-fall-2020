# Statistics Taboo

First, once in your breakout group, please introduce yourselves and say a little bit about yourself. As an icebreaker, please say what the best class you’ve ever taken (college, high school, or elementary school) was and why.

Second, on to the game.

# Game rules

This is a team game where the teams alternate. When it is one team's turn, one of the players (I'll call this person the 'presenter') on the team tries to get the other players on the team to guess a series of words, one by one, as many as possible within a minute. Then the other team takes a turn. Then the first team goes again, with a different person as the presenter trying to get the others to guess the word.

Here's how a round works in more detail. The presenter tries to get the other players on the team to guess the word given, but without saying the word itself or the  forbidden words. One also can't say any words that are derivatives of the word or the forbidden words. For example if you can't say "line", you also can't say "lines" or "linear".  Once the word is guessed, the team gets a point and the presenter moves to the next word. You want to get as many points as possible in a turn, which lasts for one minute. Whichever team guesses more words over the course of the game wins. 

The players on the other team will monitor the presenter to make sure the forbidden words are not spoken. If the presenter speaks a forbidden word or chooses to “pass” on a word and go to the next one, the team loses a point. The other team is also responsible for keeping time.

There are a bit over a 100 words that I am providing. So you should be able to play such that each person is the presenter twice before words start to repeat too much. If you’d like to keep playing, one option is to try to find an online version, e.g. playtaboo.com (but of course the words won’t be related to statistics or computing). The presenter could share their screen so the other team can monitor, but the teammates of the presenter will have to minimize the shared screen.

# Getting the words

Every person should obtain the necessary code by running the following in R.

load(url("https://bit.ly/3j1bHDs"))

The presenter starts her or his turn by setting the random number seed so she/he gets random words:

set.seed(1)

Then each time you need to get a word, run:

next_word()

The other team should be running the same code, with the same random number seed, so they can see the forbidden words. Of course the presenter’s teammates should not run the code!

In the next round, use set.seed(2), and so on. You can also just use arbitrary random number seed values (instead of 1, 2, etc.) so long as you don’t reuse the same random number seed value in another turn.

There will be some repeats as there are only about 100 underlying word, but the presenter should still use them. To make it more interesting the presenter should not give any indication that the word was already played. 

A bit of geekiness: in addition to the use of statistics and computing words, we’re making use of reproducible random numbers (unit 10 of the class), getting data into R (unit 2), and the next_word function uses a functional programming technique called closures (unit 5) to store the underlying word data.

