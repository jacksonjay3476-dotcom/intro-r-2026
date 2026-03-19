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


# Base R functions - no packages or libraries needed

# If you don't know what column you want. Helpful when you have lists of lists
raw_15min[2,] # Gives the second row
raw_15min[ , 2] # Returns the second column

mean(raw_15min$speed) # This will yield NA because there are NAs in the data
hist(raw_15min$volume) # Click 'zoom' in the bottom right corner to turn the hist into a separate window

# Filters

# Pipe is unique to R
# Can be %>%  or |> \\ %>%  is the old one. The shortcut is control, shift, m

occ_20plus <- raw_15min |> filter(occupancy > 20)
    # This says take the raw data, and |> means to take out. So take the raw data, and 
    # take out that which has an occupancy greater than 20


# If you want to filter multiple things out at once, put them both in the filter() function 
    # and separate by an &
occ10_sp80 <- raw_15min |> 
    filter(occupancy < 10 & speed > 80)
table(occ10_sp80$detector_id)


# Working with NA's
blank_example <- raw_15min |> filter(is.na(speed))
# Asks each value for speed if it's an NA and returns all those that are a yes

complete_df <- raw_15min |> filter(!is.na(speed))
# Adding the ! does the opposite and returns everything where there's not an NA

subset_o10s80 <- occ10_sp80 |> 
                filter(detector_id %in% c(101185, 101176))
#Also could do this:

sub_det <- c(101185, 101176)

subset2_o10s80 <- occ10_sp80 |> 
        filter(detector_id %in% sub_det)

# Save complete_df as an RDS. RDS compresses the file. This one is 550 kb but the main one was 3 kb

saveRDS(complete_df, "data/clean_data.rds")








