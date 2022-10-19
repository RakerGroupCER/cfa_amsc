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
describe(my_data$amsc_1)
describe(my_data$amsc_2)
describe(my_data$amsc_3)
describe(my_data$amsc_4)
describe(my_data$amsc_5)
describe(my_data$amsc_6)
describe(my_data$amsc_7)
describe(my_data$amsc_8)
describe(my_data$amsc_9)
describe(my_data$amsc_10)
describe(my_data$amsc_11)
describe(my_data$amsc_12)
describe(my_data$amsc_13)
describe(my_data$amsc_14)
describe(my_data$amsc_15)
describe(my_data$amsc_16)
describe(my_data$amsc_17)
describe(my_data$amsc_18)
describe(my_data$amsc_19)
describe(my_data$amsc_20)
describe(my_data$amsc_21)
describe(my_data$amsc_22)
describe(my_data$amsc_23)
describe(my_data$amsc_24)
describe(my_data$amsc_25)
describe(my_data$amsc_26)
describe(my_data$amsc_27)
describe(my_data$amsc_28)

################################################################################