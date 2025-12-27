# rnsso

`rnsso` is an R package designed to simplify the loading and processing of unit-level data from the **National Sample Survey Office (NSSO)** of India.

## Current Status
This package is currently in development. While the long-term goal is to support all major NSSO survey rounds, the current version specifically focuses on:
* **HCES 2023-24** (Household Consumption Expenditure Survey)

## Key Features
- **Master Load:** Automatically detect and read all "LEVEL" files from a folder.
- **Auto-Layout:** Applies correct variable names, widths, and types based on survey metadata.
- **Variable Labeling:** Automatically attaches descriptive labels to columns for easier analysis.

## Installation
Once uploaded, you can install this package using:
```R
# install.packages("devtools")
devtools::install_github("your-username/rnsso")
```

## Quick start guide:

```R
library(randap)

# Load a specific level
df <- rnsso_read_data("path/to/LEVEL - 01.txt", level = "L01")

# Or load an entire folder of datasets
hces_list <- rnsso_read_data("path/to/dataset_folder/")
```
=======
# rnnso
An R package for processing and analyzing National Sample Survey Office (NSSO) unit-level data. Currently supporting the Household Consumption Expenditure Survey (HCES) 2023-24.

