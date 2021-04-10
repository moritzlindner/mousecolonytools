# mousecolonytools
### mousecolonytools: A collection of tools to facilitate genotyping and mouse colony management

## Installation
```{r}
if (!requireNamespace("remotes", quietly = TRUE)){
  install.packages("remotes")
}
remotes::install_github("moritzlindner/mousecolonytools")
```

## Description
This package contains a set of tools to facilitate mouse colony management. It is built to fit the needs of the lab but may also be helfpu to others.

Important functions are "sangergenotype", a function that can batch process .ab1 files obtained from Sanger-sequencing based genotyping experiments as well as a collection of functions that allows to easily generate kinship2 pedigrees from mouse colony datasheets generated with the colony management system TickAtLab.
