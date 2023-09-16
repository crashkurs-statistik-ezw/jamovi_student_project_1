library(tidyverse)
library(janitor)

raw_data <- read_csv("data/raw/student_data.csv")

cleaned_raw_data <- raw_data |> 
  clean_names() |> 
  rename(
    erste_mathenote = g1,
    zweite_mathenote = g2,
    abschlussnote_mathe = g3
  ) |> 
  rowid_to_column() |>  
  rename(
    id = rowid
  ) |> 
  dplyr::filter(
    row_number() != 79,
    famsup != "yes") 


write_csv(cleaned_raw_data, "data/clean/data_cleaned_r.csv")



# Ändere alle Variablennamen in snake_case
# Schreibe die Spalten g1, g2 und g3 in erste_mathenote, zweite_mathenothe und abschlussnote_mathe um
# Füge eine id Spalte hinzu, welche eindeutige Zahlen für jede Reihe repräsentiert
# Entferne die Reihe 79 aus dem Datensatz

# Erstelle eine neue Variable basierend auf pstatus und kodiere die Werte A und L mit living together und apart um.
# Filtere alle Schüler*innen aus dem Datensatz, die familiäre Lernunterstützung erhalten
# Exportiere den Datensatz als CSV-Datei in den Ordner data/clean
# Führe folgende Qualitätsprüfungen für die Daten durch:
#   Überprüfe, ob der Daetnsatz folgenden Spaltennamen hat: “erste_mathenote”, “zweite_mathenote”, “abschlussnote_mathe”.
# Überprüfe, ob das Alter größer als 0 ist.
# Stelle sicher, dass der Wert in der Spalte “address” entweder “U” oder “R” ist.
# Stelle sicher, dass die Werte in der Spalte “id” eindeutig sind.
# Stelle sicher, dass die Werte in der Spalte “famrel” im Bereich von 1 bis 5 liegen.
