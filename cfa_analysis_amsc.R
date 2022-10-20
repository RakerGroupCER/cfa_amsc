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

## The "dlpyr" package is used to renaming columns in dataframe
library(dplyr)

################################################################################

### THIS SECTION READS IN THE DATA FROM AN .XLSX FILE ###

## Data file should be in the working directory.
# Example file name is "data.xls"; change it match actual data file name.
my_data <- read_excel(file.choose())

################################################################################

### THIS SECTION CREATES SUMMARY STATISTICS FOR THE AMS-C ITEMS ###

## Descriptive statistics for each item.
# Items have been labeled "amsc_#" to reflect order in published instrument.
# Adjust values in select function based on location of item variables 
# in data set
desc_stats <- my_data %>% select(16:43)
desc_stats_table <- describe(desc_stats)

## Frequency Tables for each item.
# Create list of variable names
varlist <- names(desc_stats)

# Create labels for responses
freq_table_asmc <- c("1", "2", "3", "4", "5")

# Build table of frequencies
for (i in varlist) {
  temp_store <- table(desc_stats[[i]])
  freq_table_asmc <- cbind(freq_table_asmc, temp_store)
}

# Make frequency table a data frame
freq_table_asmc <- as.data.frame(freq_table_asmc)

# Create variable names for frequency table and replace old variable names
freq_table_asmc <- as.data.frame(freq_table_asmc)
colnames(freq_table_asmc) <- varlist

# Transpose frequency table and select only those observations for amsc items
amsc_freq_transpose <- as.data.frame(t(freq_table_asmc))
amsc_freq_transpose <- amsc_freq_transpose[2:29,]

## Combine Descriptive and Frequency Tables
summary_table <- cbind(desc_stats_table, amsc_freq_transpose)
var_keep <- c("mean", "sd", "median", "skew", "kurtosis", "1", "2", "3", "4", "5")
summary_table <- summary_table[var_keep]

# Format summary table (i.e., round off variables)
summary_table$mean <- round(summary_table$mean, 2)
summary_table$sd <- round(summary_table$sd, 2)
summary_table$skew <- round(summary_table$skew, 3)
summary_table$kurtosis <- round(summary_table$kurtosis, 3)

## Return Descriptive Statistics Table
summary_table

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
factor_summary <- describe(predict.factors)
var_keep <- c("mean", "sd", "median", "min", "max", "skew", "kurtosis")
factor_summary <- factor_summary[var_keep]

## Add predicted factor scores to data set (as a "new" data set)
new_my_data <- cbind(my_data, predict.factors)

################################################################################
