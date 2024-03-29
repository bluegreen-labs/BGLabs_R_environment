# installing required R packages from the main repo
# or binary distributions if available from RStudio
options(repos = c(
  binary = "https://packagemanager.rstudio.com/cran/__linux__/jammy/latest",
  CRAN = "https://cloud.r-project.org"
))

install_package <- function(package){
  if (grepl("/", package)){
    # github install
    status <- try(
      devtools::install_github(package, quiet = TRUE)
      )
  } else {
    # normal install
    status <- try(install.packages(package, quiet = TRUE))
  }

  if(!inherits(status, "try-error")){
    message(paste0(".... SUCCESS installed: ", package))
  } else {
    message(paste0(".... FAILED install: ", package))
  }
}

message(
  "
  This routine installs the BlueGreen Labs R environment.
  "
  )

#---- data wrangling and plotting -----
message("- Installing data science tools")

pkgs <- c(
  "tidyverse",
  "broom",
  "multidplyr",
  "lubridate",
  "patchwork"
  )

invisible(lapply(pkgs, install_package))

#---- geospatial libraries -----
message("- Installing geospatial libraries")

pkgs <- c(
  "raster",
  "terra",
  "sf",
  "rnaturalearth",
  "rgdal",
  "rgeos",
  "mapview",
  "MODISTools",
  "daymetr",
  "ecmwfr",
  "ncdf4",
  "gdalUtils"
  )

invisible(lapply(pkgs, install_package))

#---- development ----
message("- Installing development tools")

pkgs <- c(
  "utils",
  "devtools",
  "goodpractice",
  "pkgdown",
  "bookdown",
  "lintr",
  "covr",
  "rmarkdown",
  "knitr",
  "testthat",
  "usethis"
  )

invisible(lapply(pkgs, install_package))

#---- Optimization ----
message("- Installing optimizers")

pkgs <- c(
  "BayesianTools",
  "GenSA"
  )

invisible(lapply(pkgs, install_package))

#---- machine learning in R ----
message("- Installing ML tools")

pkgs <- c(
  "randomForest",
  "keras",
  "caret"
)

invisible(lapply(pkgs, install_package))

#---- movement ecology ----
message("- Installing movement ecology tools")

pkgs <- c(
  "bluegreen-labs/geoloctools",
  "oce",
  "geosphere",
  "igrf",
  "circular",
  "FlightR",
  "SWotherspoon/SGAT",
  "SWotherspoon/BAStag",
  "SLisovski/GeoLight",
  "SLisovski/TwGeos",
  "GeoLocTools",
  "suncalc"
)

invisible(lapply(pkgs, install_package))

