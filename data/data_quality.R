library(assertr)
library(tidyverse)

# Gereinigter Datensatz laden ---------------------------------------------
dframe <- read_csv("data/clean/data_cleaned_r.csv") 


# Daten einsehen ----------------------------------------------------------
glimpse(dframe)
view(dframe)

# Data Quality Checks ausfuehren -------------------------------------------
dframe |> 
  verify(has_all_names("erste_mathenote", "zweite_mathenote",
                       "abschlussnote_mathe")) |> 
  verify(age > 0) |> 
  assert(in_set("U", "R"), address) |> 
  assert(is_uniq, id) |> 
  assert(within_bounds(1, 5), famrel)
