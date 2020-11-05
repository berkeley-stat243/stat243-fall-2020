---
title: Thinking about simulation studies
...

We'll consider the simulation study in Section 4 of Cao et al. as an example of the kind of simulation
study that researchers set up to evaluate statistical and machine learning methods.

In particular, we'll discuss the goals of the simulation study, the choices made in determining how 
the simulated datasets were generated, what aspects of the data that the methodology
might be sensitive to, and how one interprets the tables showing the simulation results.

Please start by finding a group of three people (two if necessary) and take 15-20 minutes to do the following:

 - briefly discuss your answers to question 5 of problem set 6
 - write up pseudo-code (or mathematical expressions or R code, your choice) giving the details of 
 how the authors generate a simulated dataset
 - consider the choices the authors made in generating the simulated datasets. Select a few you think 
 might be important and brainstorm how one might simulate the data differently. We'll collect these
 ideas in a google doc (I will ask each group to provide a sample of their ideas.)

For example, they choose sample sizes of n=100, 400, 900 subjects. One could suggest that 
these may not be realistic numbers of subjects and suggest they should have tried other
values (e.g., n=30 or n=5000). 
