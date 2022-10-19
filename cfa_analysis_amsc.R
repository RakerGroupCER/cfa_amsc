################################################################################
##       Confirmatory Factor Analysis                                         ##
##       for the Academic Motivation Scale - Chemistry                        ##
################################################################################

## Author: Jeffrey R. Raker
## Released: 2022
## Last Updated: 2022-10-18

################################################################################

### THIS SECTION IS FOR LOADING NECESSARY PACKAGES ###

## Install packages (and dependencies) if necessary
# install.packages("readxl", dependencies = TRUE)

## The "readxl" package is used to input data from an .xlsx file
library (readxl)

## The "epiDisplay" package is used to tabulate data
library(epiDisplay)

## The "psych" package is used to generate descriptive statistics
library(psych)

## The "lavaan" package is used to run and evaluate the CFA model
library(lavaan)

## The "tidyverse" package is used to subset data
library(tidyverse)

################################################################################

### THIS SECTION READS IN THE DATA FROM AN .XLSX FILE ###

## Data file should be in the working directory.
# Example file name is "data.xls"; change it match actual data file name.
my_data <- read_excel(file.choose())

################################################################################

### THIS SECTION CREATES SUMMARY STATISTICS FOR THE AMS-C ITEMS ###

## Frequency Tables for each item. Also creates a bar chart for the responses.
# Items have been labeled "amsc_#" to reflect order in published instrument.
tab1(my_data$amsc_1, cum.percent = TRUE)
tab1(my_data$amsc_2, cum.percent = TRUE)
tab1(my_data$amsc_3, cum.percent = TRUE)
tab1(my_data$amsc_4, cum.percent = TRUE)
tab1(my_data$amsc_5, cum.percent = TRUE)
tab1(my_data$amsc_6, cum.percent = TRUE)
tab1(my_data$amsc_7, cum.percent = TRUE)
tab1(my_data$amsc_8, cum.percent = TRUE)
tab1(my_data$amsc_9, cum.percent = TRUE)
tab1(my_data$amsc_10, cum.percent = TRUE)
tab1(my_data$amsc_11, cum.percent = TRUE)
tab1(my_data$amsc_12, cum.percent = TRUE)
tab1(my_data$amsc_13, cum.percent = TRUE)
tab1(my_data$amsc_14, cum.percent = TRUE)
tab1(my_data$amsc_15, cum.percent = TRUE)
tab1(my_data$amsc_16, cum.percent = TRUE)
tab1(my_data$amsc_17, cum.percent = TRUE)
tab1(my_data$amsc_18, cum.percent = TRUE)
tab1(my_data$amsc_19, cum.percent = TRUE)
tab1(my_data$amsc_20, cum.percent = TRUE)
tab1(my_data$amsc_21, cum.percent = TRUE)
tab1(my_data$amsc_22, cum.percent = TRUE)
tab1(my_data$amsc_23, cum.percent = TRUE)
tab1(my_data$amsc_24, cum.percent = TRUE)
tab1(my_data$amsc_25, cum.percent = TRUE)
tab1(my_data$amsc_26, cum.percent = TRUE)
tab1(my_data$amsc_27, cum.percent = TRUE)
tab1(my_data$amsc_28, cum.percent = TRUE)

## Descriptive statistics for each item.
# Adjust values in select function based on location of 
# item variables in data set
desc_stats <- my_data %>% select(1:28)
describe(desc_stats)

################################################################################

### THIS SECTION SETS THE CFA MODEL ###

model.test <- '
  AMOT =~ amsc_5 + amsc_12 + amsc_19 + amsc_26
  EEXT =~ amsc_1 + amsc_8 + amsc_15 + amsc_22
  EINT =~ amsc_7 + amsc_14 + amsc_21 + amsc_28
  EIDN =~ amsc_3 + amsc_10 + amsc_17 + amsc_24
  IEXP =~ amsc_4 + amsc_11 + amsc_18 + amsc_25
  IACM =~ amsc_6 + amsc_13 + amsc_20 + amsc_27
  IKNW =~ amsc_2 + amsc_9 + amsc_16 + amsc_23
  '

################################################################################

### THIS SECTION RUNS THE CFA MODEL ###

cfa.model <- cfa(data = my_data, model = model.test, ordered =TRUE)

################################################################################

### THIS SECTION SUMMARIZES THE CFA MODEL ###

## Generate summary of model including GOF statistics
summary(cfa.model, standardized = TRUE, fit.measure = TRUE)

## Modification indices to further evaluate the model
# Edit "minimum.value" as needed to truncate number of returned indices
modindices(cfa.model, minimum.value = 100, sort = TRUE)

################################################################################

### THIS SECTION GENERATES FACTOR SCORES FOR CFA MODEL ###

## Predict factor scores
predict.factors <- lavPredict(cfa.model)

## Generate descriptive statistics for the factor scores
describe(predict.factors)

## Add predicted factor scores to data set (as a "new" data set)
new_my_data <- cbind(my_data, predict.factors)

################################################################################
