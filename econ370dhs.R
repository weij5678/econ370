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

##    region of Kenya (v024), urban/rural, water source, sanitation facilities, 
##    electricity, mother's education in years (numeric), household size, 
##    sex of the household head, whether the toilet facilities are shared, 
##    cooking fuel, wealth index, mother's age at first birth, 
##    whether the mother owns her home (alone or with a partner), 
##    whether the mother owns her land (alone or with a partner), 
##    whether the child was wanted by mother, place of birth (e.g. hospital, home)
##    

treedata <- dhs %>% 
  select(hw70, hw1, bord, b0, b1, b2, b4, b11, 
         v012, v024, v025, v113, v116, v119, v133,
         v136, v151, v160, v161, v190, v212, v745a,
         v745b, v367, m15) %>%  
  rename(haz = hw70, 
         age_months = hw1, 
         mob = b1, 
         yob = b2, 
         sex = b4, 
         interval = b11, 
         mom_age = v012,
         region = v024,
         urban_rural = v025,
         water_source = v113,
         sanitation = v116,
         electricity = v119,
         mothers_education = v133,
         household_size = v136,
         household_head_sex = v151,
         toilet_shared = v160,
         fuel = v161,
         wealth_index = v190,
         age_first_birth = v212,
         homeowner = v745a,
         landowner = v745b,
         child_wanted = v367,
         pob = m15
  )


# Save to CSV
write.csv(dhs, "output1.csv", row.names=FALSE)

# 'caseid', 'bidx', 'v025', 'v190', 'v191', 'v106', 'v150', 'v151', 'v152', 'v153', 'v113', 'v116', 'v212', 'v213', 'v218', 'v220', 'v310', 'v311', 'v312', 'v313', 'v323', 'v323a', 'v325a', 'v327', 'v367', 'v372', 'v372a', 'v375a', 'v376', 'v376a', 'v3a00a', 'v3a00b', 'v3a00c', 'v3a00d', 'v3a00e', 'v3a00f', 'v3a00g', 'v3a00h', 'v3a00i', 'v3a00j', 'v3a00k', 'v3a00l', 'v3a00m', 'v3a00n', 'v3a00o', 'v393', 'v394', 'v395', 'v401', 'v404', 'v405', 'v406', 'v407', 'v408', 'v413', 'v414a', 'v414b', 'v414c', 'v414d', 'v414e'
