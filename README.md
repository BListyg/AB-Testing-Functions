# AB-Testing-Functions
R Code for Evan Miller's Bayesian AB Testing Functions

(Evan Miller)[https://www.evanmiller.org/bayesian-ab-testing.html] wrote 4 functions for conducting Bayesian AB Testing in Julia. 

I converted them to R.

I'm having issues with R's version of lgamma for the multi-group Poisson function, but the rest work and return identical results to the original Julia code (it helps that Julia is very legible and easy to switch to R).
