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
         v745b, v367, m15, v152, v153, v213, v218,
         v404, v409, v409a, v410, v411, v411a,
         v412a, v412c, v414e, v414f, v414g, v414h,
         v414i, v414j, v414k, v414l, v414m, v414n,
         ) %>%  
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
         household_head_sex = v151, # we should group the variables for the slides
         household_head_age = v152,
         telephone = v153,
         toilet_shared = v160,
         fuel = v161,
         wealth_index = v190,
         age_first_birth = v212,
         currently_pregnant = v213,
         number_living_children = v218,
         currently_breastfeeding = v404,
         plain_water = v409, # nutrition related variables
         sugar_water = v409a,
         juice = v410,
         milk = v411, 
         formula = v411a,
         fortified_food = v412a,
         soup_broth = v412c,
         grain_foods = v414e,
         tuber_foods = v414f,
         eggs = v414g,
         meat = v414h,
         squash = v414i,
         leafy_vegetables = v414j,
         vitamin_a_fruits = v414k,
         other_fruits = v414l,
         organ_meat = v414m,
         fish = v414n,
         
         homeowner = v745a,
         landowner = v745b,
         child_wanted = v367,
         pob = m15
  )


# Save to CSV
write.csv(dhs, "output1.csv", row.names=FALSE)

# 'caseid', 'bidx',    'v413', 'v414a', 'v414b', 'v414c', 'v414d', 'v414e'
