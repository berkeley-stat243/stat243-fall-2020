# stat243-fall-2020
This repository holds course materials for the fall 2020 offering of Statistics 243 at UC Berkeley.

If you would like to audit the class, enroll as a UC Berkeley undergraduate, or enroll as a concurrent enrollment student (i.e., for visiting students), or for some other reason are not enrolled, please fill out [this survey](https://forms.gle/j5KP7TwGgHGYQZHt8) as soon as possible. All those enrolled or wishing to take the class should have filled it out by Friday, August 28 at 5 pm.

You can view the [syllabus here](https://github.com/berkeley-stat243/stat243-fall-2020/blob/master/syllabus.pdf).

## Course content

 - This site: most non-recorded course material
 - SCF tutorials (see below)
 - bCourses: links to Zoom class and section meetings, Zoom class recordings, and pre-recorded videos

Note that the various tutorials referred to in the class materials (e.g., the UNIX and bash shell tutorials, the dynamic documents tutorial, the Git tutorial, the string processing tutorial, etc.), are available [here](http://statistics.berkeley.edu/computing/training/tutorials).

If you're not yet familiar with Git, go to the upper right of this page and click on 'Clone or download' and then 'Download ZIP'.

## Logistics

Instructor office hours:

  - Chris (in class Zoom): 
     - Mondays, 2:30-3:30 pm
     - Tuesdays, 7:30-9:00 am
     - Thursdays, 10:30-11:30 am
     - Thursdays, 6:00-7:00 pm
  - Zoe (in section Zoom): 
     - Wednesdays, 5:00-6:00 pm
     - Fridays, 1:10-2:10 pm
     - Fridays, informally after 2:10-2:40 pm lab section (show up right after lab)

## Software

The `howtos` directory has information on installing and/or getting access to the software you'll need for the course. In particular, in the second week of class you'll need to get access to the UNIX command line in some fashion. See https://github.com/berkeley-stat243/stat243-fall-2020/blob/master/howtos/accessingUnixCommandLine.md for some options on how to do this. 

## Submitting assignments

The file [submitting-electronically.txt](./howtos/submitting-electronically.txt) has information on setting up a Github repository for the class and submitting your assignments by committing your solution to Github. We will discuss this in section on Friday Sep. 4.

## Online discussion and questions.

We will use the [course Piazza site](https://piazza.com/berkeley/fall2020/stat243) for communication (announcements, questions, and discussion). If you're enrolled in the class you should be a member of the group and be able to access it. If you're auditing or not yet enrolled and would like access, make sure to fill out the survey above and I will add you. 

## Schedule (Tentative):

**Week 1**

Class:
 - Wed Aug 26 (live): general introduction, basic UNIX demo
 - Fri Aug 28 (OPTIONAL, live): [game event](./units/class2-taboo-game.md) to get to know each other

Assignments:
 - Fri Aug 28: fill out [class survey](https://forms.gle/ZPvuDmQSw4YoRGVJ9)

Section:
 - (REQUIRED) Meet Chris in small groups for 10 minutes (sign up [here](https://calendar.google.com/calendar/selfsched?sstoken=UU9PYnFKdFk4YUhhfGRlZmF1bHR8NDJmMzM4MDc1YjM1NjliNzNkYzExOWFhMzljZGY3ODU)).
 - (OPTIONAL) R and basic UNIX practice

**Week 2**

Class:
 - Mon Aug 31 (live): webscraping demo
 - Wed Sep 2 (OPTIONAL, live): group work on bash tutorial problems (see SCF Using the Bash Shell tutorial)
 - Fri Sep 4 (live): bash shell demo

Assignments:
 - Mon Aug 31, 10 am: Unit 2 reading/videos questions (see [assignment on bCourses](https://bcourses.berkeley.edu/courses/1497598/assignments/8151392)).
 - Tue Sep 1, 5 pm: Login to github.berkeley.edu with your Calnet credentials (that's all you have to do). Also fill out this survey so we can set office hours.
 - Wed Sep 2 (OPTIONAL): suggested day to have completed optional UNIX problems (see SCF Basics of UNIX tutorial)
 - Fri Sep 4 (OPTIONAL): suggested day to have completed R catch-up (see [R Bootcamp](https://github.com/berkeley-scf/r-bootcamp-fall-2020) Modules 1-5 and Week 1 section materials)

Section: Git and R Markdown introduction, problem set requirements/submission tools

**Week 3**

Class:
 - Mon Sep 7: no class (holiday)
 - Wed Sep 9 (live): bash challenge problems group work
 - Fri Sep 11: no class; please work on the regular expression/string processing material assigned for Monday Sep 14. I'll be available on the class Zoom during class time for questions.

Assignments:
 - Wed Sep 9, 10 am: bash tutorial problems (see [assignment on bCourses](https://bcourses.berkeley.edu/courses/1497598/assignments/8157938))
 - *Fri Sep 11, 5 pm: PS 1* (submitted as a PDF on Gradescope and by pushing all materials (pdf and source files) to your Github repository)

Section: assertions and testing

**Week 4**

Class:
 - Mon Sep 14: strings/regular expressions demo and group work
 - Wed Sep 16: no class; please work on the PS2 problem 3 reading in preparation for Friday section
 - Fri Sep 18: no class; please read Sections 1-4.3 of Unit 5 and watch the associated videos (Unit 5, Videos 1-3)

Assignments:
 - Mon Sep 14, 10 am: regex practice problems and string processing tutorial reading (see [assignment on bCourses](https://bcourses.berkeley.edu/courses/1497598/assignments/8162505))
 - Fri Sep 18, noon: please complete problem 3 of PS2 (except for the part about your section group collective answer) and turn in your initial comments for problem 3b via [this Google form](https://forms.gle/KUmWhv768FUa5uZe9).

Section: discussion of reproducibility

**Week 5**

Class:
 - Mon Sep 21: no class; please read Unit 5, Sections 4.4-6.4 and watch the associated videos (Unit 5, Videos 4-6)
 - Wed Sep 23: review of some concepts from Unit 5, Sections 1-6.4, discussion of passing arguments to functions and lazy evaluation (Unit 5, Section 6.5)
 - Fri Sep 25: variable scope and variable look-up (Unit 5, Sections 6.6-6.8)

Assignments
 - *Mon Sep 21, 5 pm: PS 2* (submitted as a PDF on Gradescope and by pushing all materials (pdf and source files) to your Github repository)
 - Wed Sep 23, 10 am: Unit 5, Sections 1-6.4 reading/videos questions (see [assignment on bCourses](https://bcourses.berkeley.edu/courses/1497598/assignments/8166320))


Section: debugging

**Week 6**

Class:
 - Mon Sep 28: writing efficient code (Unit 5, Section 7 and "Writing Efficient R Code" tutorial, Section 4) 
 - Wed Sep 30: group work on efficiency problems (Unit 5, Section 7.3)
 - Fri Oct 2: no class: please work on Unit 5, Section 7.1; Efficient R tutorial Sections 4.5-4.6; Unit 5, Sections 8.1-8.4 and watch the associated videos 

Assignments
 - Mon Sep 28, 10 am: Unit 5, Sections 6.8, 6.10, 6.11 and [Writing Efficient R code" tutorial](https://github.com/berkeley-scf/tutorial-efficient-R) Sections 1-4.1 reading/videos questions (see [assignment on bCourses](https://bcourses.berkeley.edu/courses/1497598/assignments/8169945))
 - *Fri Oct 2, 10 am: PS3* (submitted as a PDF on Gradescope and by pushing all materials (pdf and source files) to your Github repository)
 - Fri Oct 2: [request an SCF account](https://scf.berkeley.edu/account) if you don't already have one

Section: code review of PS3

**Week 7**

Class:
 - Mon Oct 5: discussion of memory use in R (Unit 5, Section 8)
 - Wed Oct 7: no class: please work on Unit 6, Sections 1-2 and watch the associated videos (Unit 6, Videos 1-5)
 - Fri Oct 9: discussion of precision of computer numbers and implications for calculations (Unit 6, Section 3)

Assignments
 - Mon Oct 5, 10 am: Unit 5, Section 7.1; Efficient R tutorial Sections 4.5-4.6; Unit 5, Sections 8.1-8.4 reading/videos questions (see [assignment on bCourses](https://bcourses.berkeley.edu/courses/1497598/assignments/8173210)).
 - Fri Oct 9, 10 am: Unit 6, Sections 1-2 and Videos 1-5 reading/videos questions (see [assignment on bCourses](https://bcourses.berkeley.edu/courses/1497598/assignments/8175608))

Section: introduction to Python

**Week 8**

Class:
 - Mon Oct 12: no class: please read Unit 7, Sections 1-4
 - Wed Oct 14: parallelization examples (Unit 7, Sections 4-5)
 - Fri Oct 16: quiz review

Assignments:
 - *Mon Oct 12, 5 pm: PS4* (submitted as a PDF on Gradescope and by pushing all materials (pdf and source files) to your Github repository)
 - Wed Oct 14, 10 am: Unit 7, Sections 1-4 reading questions (see [assignment on bCourses](https://bcourses.berkeley.edu/courses/1497598/assignments/8177181))

Section: Linux cluster usage and parallelization

**Week 9**

Class:
 - Mon Oct 19: Quiz 1
 - Wed Oct 21: demo using Python's Dask package for parallelization (Unit 7, Section 7 and Unit 8, Section 2.2)
 - Fri Oct 23: no class: please work on Unit 8, Section 3 and watch the associated videos (Unit 8, Videos 1-5)

Section: No section - Zoe is available to help with the SCF, sbatch, future package, etc. 12-1 pm and 2-3 pm.

**Week 10**

Class:
 - Mon Oct 26: group work on SQL query problems (Unit 8, Section 3)

Assignments:
 - *Mon Oct 26, 10 am: PS5* (submitted as a PDF on Gradescope and by pushing all materials (pdf and source files) to your Github repository)
 - Mon Oct 26, 10 am: Unit 8, Sections 3 reading questions (see [assignment on bCourses UNDER CONSTRUCTION](https://bcourses.berkeley.edu/courses/1497598/assignments/XYZ))
