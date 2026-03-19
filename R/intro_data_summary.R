# Load libraries
library(ggplot2)
library(tidyr)
library(dplyr)

# Load raw data
raw_15min <- read.csv("data/raw/agg_15min_data.csv", stringsAsFactors = F)

# StringsAsFactors > the default for this is true
# Tammy says you want this unless you know what your data contains but I don't know what that means

# Basic functions to see the data

# Structure of data - and what kind of data type they are
str(raw_15min)
    # chr = character
    # int = no decimal points
    # num = decimals allowed 

# Preliminary data exploration
head()
tail()
summary()
glimpse(raw_15min) # Is prettier than summary and does basically the same thing
head(raw_15min,15) # This gives however many rows you want 

# Lindsey has a new package that does better summaries
  # Go to packages in the bottom right window, then Install, then type in 'summarytools' and click install

library(summarytools)
?`summarytools-package`


# This is a new tool that gives more summary info for whatever df you put in there 
dfSummary(raw_15min)



















