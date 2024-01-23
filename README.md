# Investigating the Statistics of Motor Vehicle Thefts in the City of Toronto

## Overview of the Paper

This paper aims to gather and analyze the data from the Toronto Police Services and look for any patterns or relations in our discoveries

No LLMs were used at all throughout this entire paper.

## File Structure

-   `inputs/data` contains the raw and cleaned data that will be used for analysis
-   `outputs/paper` contains the files used to generate the paper. This includes the pdf, the quarto document, and the bibliography
-   `scripts` contains the R scripts used to simulate, download, clean, and analyze the data.

## Running the paper

1.  Run `scripts/01-download_data.R` to get the raw data
2.  Run `scripts/02-cleaning_data.R`to clean the raw data
3.  Run `outputs/paper/TermPaper1.qmd` to generate the paper pdf
