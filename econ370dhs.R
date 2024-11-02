# Test
# change
# install.packages('gitcreds')
# install.packages("tidyverse")
# install.packages("haven") 
# install.packages("fastDummies")
# install.packages("tree")
# install.packages("randomForest")
# install.packages("gbm")
# install.packages("rpart")
# install.packages("rpart.plot")

library(tidyverse)
library(haven)
library(tree)
library(randomForest)
library(gbm)
library(fastDummies)
library(rpart)
library(rpart.plot)
library(grf)

######### INSERT PCA PACKAGE #######

library(gitcreds)
gitcreds_set()

mypath <- "~/ECON370/ECON370dhs/econ370 project/"


dhs <- read_dta(paste0(mypath, "SNBR71DT/SNBR71DT/SNBR71FL.dta")) %>% 
  filter(!is.na(midx)) %>% 
  filter(b5 == 1) %>% 
  filter(v135 == 1)


