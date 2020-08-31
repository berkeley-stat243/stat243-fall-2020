##########################################################
### Demo code for Unit 3 of Stat243, 
### "The bash shell, UNIX utilities, and version control"
### Chris Paciorek, September 2020
##########################################################

#####################################################
# 2: Using the bash shell
#####################################################

## @knitr simple-grep-sed

grep "," file.txt  # look for lines with commas in file.txt
sed -i 's/,/;/g' file.txt  # replace commas with semicolons in file.txt

## @knitr

#####################################################
# 3: bash shell examples
#####################################################

## @knitr simple-grep-sed

grep "," file.txt  # look for lines with commas in file.txt
sed -i 's/,/;/g' file.txt  # replace commas with semicolons in file.txt

## @knitr git-clone
git clone https://github.com/berkeley-stat243/stat243-fall-2019

## @knitr data                
cd stat243-fall-2018/data
gunzip coop.txt.gz
cut -b50-70 coop.txt | less 
cut -b60-61 coop.txt | sort | uniq
cut -b60-61 coop.txt | sort | uniq -c

## @knitr mission2             
tail -n 1 cpds.csv | grep -o ',' | wc -l
nfields=$(tail -n 1 cpds.csv | grep -o ',' | wc -l)

nfields=$(echo "${nfields}+1" | bc)

## @knitr mission3             
cd ../units
grep -l 'example.pdf' unit3-dataIO.R
ls -tr *.R | tail -n 5
ls -tr *.R | tail -n 5 | grep pdf
ls -tr *.R | tail -n 5 | grep optim
ls -tr *.R | tail -n 5 | xargs grep 'example.pdf'
ls -tr *.R | tail -n 5 | xargs grep -l 'example.pdf'
## here's how we could do it by explicitly passing the file names
## rather than using xargs
grep -l 'example.pdf' $(ls -tr *.R | tail -n 5)

## @knitr mission4
grep library unit[1-9]*.R
grep --no-filename library *.R
grep --no-filename "^library" *.R
grep --no-filename "^library" *.R | sort | uniq
grep --no-filename "^library" *.R | sort | uniq | cut -d'#' -f1
grep --no-filename "^library" *.R | sort | uniq | cut -d'#' -f1 | \
    tee libs.txt
grep -v "help =" libs.txt > tmp2.txt
sed 's/;/\n/g' tmp2.txt | sed 's/ //g' |
    sed 's/library(//' | sed 's/)//g' > libs.txt
## note: on a Mac, use 's/;/\\\n/g'   -- see https://superuser.com/questions/307165/newlines-in-sed-on-mac-os-x
echo "There are $(wc -l libs.txt | cut -d' ' -f1) \
unique packages we will install."
## note: on Linux, wc -l puts the number as the first characters of the output
## on a Mac, there may be a bunch of spaces preceding the number, so try this:
## echo "There are $(wc -l libs.txt | tr -s ' ' | cut -d' ' -f2) \
## unique packages we will install."


## @knitr mission4a               -
Rscript -e "pkgs <- scan('libs.txt', what = 'character'); \
install.packages(pkgs, repos = 'https://cran.cnr.berkeley.edu')"

## @knitr mission5               
echo "Sys.sleep(1e5)" > job.R 
nJobs=30 
for (( i=1; i<=${nJobs}; i++ )); do     
   R CMD BATCH --no-save job.R job-${i}.out & 
done 

## @knitr mission5a          
ps -o pid,pcpu,pmem,user,cmd -C R 
ps -o pid,pcpu,pmem,user,cmd,start_time --sort=start_time -C R | tail -n 30
ps -o pid --sort=start_time -C R | tail -n ${nJobs} | xargs kill

# on a Mac:
ps -o pid,pcpu,pmem,user,command | grep exec/R
# not clear how to sort by start time
ps -o pid,command | grep exec/R | cut -d' ' -f1 |  tail -n ${nJobs} | xargs kill


grep bash unit4-bash.sh

grep -c bash unit4-bash.sh

num=$(grep -c bash unit4-bash.sh)
echo "There are ${num} occurrences of the word 'bash' in this file."

echo There are $(grep -c bash unit4-bash.sh) occurrences of the word 'bash' in this file.

# For Belgium, determine the minimum unemployment value (field #6) in cpds.csv in a pro- grammatic way.

grep Belgium cpds.csv | cut -d',' -f6  | sort -n 

# Have what is printed out to the screen look like “Belgium 6.2”.

# Now store the unique values of the countries in a variable, first stripping out the quotation marks and removing the space in “New Zealand”, which causes problems because of the space in its name.

countries=$(cut -d',' -f2 cpds.csv | tail -n +2 | sort -u | sed 's/"//g') 

# Figure out how to automate step 1 to do the calculation for all the countries and print to the screen.

for c in ${countries}; do
    echo ${c} $(grep ${c} cpds.csv | cut -d',' -f6  | sort -n | head -n +2)
done

# First, take the fourth column. Figure out the unique values in that column.
# Next, automate the process of determining if any of the values are non-numeric so that you don’t have to scan through all of the unique values looking for non-numbers. You’ll need to look for the following regular expression pattern “[^0-9]”, which is interpreted as NOT any of the numbers 0 through 9.

cut -d',' -f4 RTADataSub.csv | sort | uniq 

nfields=60
for (( i=2; i <= ${nfields}; i++ )); do
    echo "field number $i $(cut -d',' -f${i} RTADataSub.csv | sort | uniq)"
    done
