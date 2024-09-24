#devtools::install_github("SticsRPacks/SticsRPacks")

rm(list =ls())

list.of.packages <- c("SticsOnR")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)

library(SticsRPacks)
library(SticsOnR)
library(SticsRFiles)

search()
setwd("C:/Users/defreitas/OneDrive - Cirad/Mes_Programmes/Versions_JavaSTICS/JavaSTICS-1.5.1-STICS-10.0.0/JavaSTICS-1.5.1-STICS-10.0.0")

# Define javaStics installation 

# STICS version 

javastics = normalizePath("0-javastics", winslash = "/")

# C'est ici que tu sélectionnes les variables dont tu as besoin 
# et si tu veux directement faire tourner avec javastics tu peux les sélectionner sur javastics
# Model outputs > Choosing outputs > Daily outputs

sim_variables = c("idrps", "ilaxs","ilans", "ilevs",
                  "imats", "inn1moy", "inn2moy","inns",
                  "lai_n",  "fxn", "leaching_from_lev", "lessiv", 
                  "resmes", "fxt",  
                  "masec_kg_ha", "Nmineral_from_plt", "Nvolat_from_plt", "Nvolat_from_lev", 
                  "mafruit", 
                  "QNplante", "QNdenit", "Qles", "Qfix",
                  "SoilN", "swfac", "zrac", "chargefruit",
                  "iplts", "cep", "ces", "cprecip", "ep", "esol", "trr_n","cumraint")


workspace = "0-data_TD"

# Usms to simulate
usms = get_usms_list(file = file.path(workspace,"usms.xml"))

# Subset for sorghum sole cropping
usms_Sorg_SC= usms[grep("Nieb", usms, invert=TRUE)]

# Generate the var.mod file:
gen_varmod(workspace, sim_variables)

# Run  simulations 
run_javastics(javastics = javastics, 
              workspace = workspace, 
              stics_exe = "stics_modulo.exe", 
              usm = usms_Sorg_SC)

sim = get_sim(workspace = workspace, usm = usms_Sorg_SC) # Get the results

