
# Load the necessary packages
library(SticsRPacks)
library(tidyr)
library(dplyr)
library(ggplot2)

##### Initializations: ADAPT THE PATH HERE! ####################################
javastics <- "D:\\JavaSTICS\\JavaSTICS-1.5.2-STICS-10.1.1"
workspace <- "D:\\STICS_training\\DAY4\\Practical_Works\\Practical_Work_3_students"
out_dir <- workspace
################################################################################



##### First Part

# Generate the model input files (text files) from javaStics input files (XML files)
gen_usms_xml2txt(javastics = javastics,
                 out_dir = out_dir,
                 workspace = workspace)


# run the USMs in successive mode

## get the list of USMs
usm_list <- get_usms_list(file = file.path(workspace,"usms.xml"))

## define the model options, using the successive argument to specify the list of
## USMs to chain.
## Be careful, successive is supposed to be a list of list (or list of vectors)
## of USMs to chain, since it can handle several sequences of USMs to chain.
model_options <- stics_wrapper_options(javastics = javastics,
                                       workspace = workspace,
                                       successive = list(usm_list))

## run the USMs as they are defined

## Find the variable names ...
get_var_info(keyword = "soil organic")

required_var <- c("resmes", "azomes", "masec(n)", "SOC", "SON",
                  "SOCtot", "SONtot", "msrac(n)", "QNplante")
res <- stics_wrapper(model_options = model_options,
                     var = required_var)

## Plot daily values of simulated variables to see variables that are chained 
plot(res$sim_list,successive = list(usm_list))
ggsave(file.path(workspace,"dyn.png"), width=30, units="cm")



##### Second Part

## TO DO #######
# Define the required variables for the simulations (read the practical work description up to the end ;-) )
required_var <- 
################

# Run the model to get the simulated values of these variables for the initial case.
res_ini <- stics_wrapper(model_options = model_options,
                         var = required_var)

# Case "We do what we want": change catch crops for baresoil

## TO DO #######
## Create a new xls file by copying the file "inputs_stics_PW3.xlsx", 
## adapt it to this case, 
## read the sheets in R 
## and convert them to STICS XML files.
## TIPS: use the functions read_params_table and gen_***_xml from the package SticsRFiles.
################

## Re-generate the STICS model input file (text format)
gen_usms_xml2txt(javastics = javastics,
                 out_dir = out_dir,
                 workspace = workspace)
res_baresoil <- stics_wrapper(model_options = model_options,
                     var = required_var)

# Case Organic matter lovers: change harvest date and exportation for catch crops

## TO DO #######
## Create a new xls file by copying the file "inputs_stics_PW3.xlsx", 
## adapt it to this case, 
## read the sheets in R 
## and convert them to STICS XML files.
## TIPS: use the functions read_params_table and gen_***_xml from the package SticsRFiles.
################


## Re-generate the STICS model input file (text format)
gen_usms_xml2txt(javastics = javastics,
                 out_dir = out_dir,
                 workspace = workspace)
res_OMLovers <- stics_wrapper(model_options = model_options, var = required_var)

# Leguminous lovers: only leg. as CC and no export of last cut of alfalfa

## TO DO #######
## Create a new xls file by copying the file "inputs_stics_PW3.xlsx", 
## adapt it to this case, 
## read the sheets in R 
## and convert them to STICS XML files.
## TIPS: use the functions read_params_table and gen_***_xml from the package SticsRFiles.
################


## Re-generate the STICS model input file (text format)
gen_usms_xml2txt(javastics = javastics,
                 out_dir = out_dir,
                 workspace = workspace)
res_LegLovers <- stics_wrapper(model_options = model_options, var = required_var)


# Post-treatments and plots

## Group results obtained in df
df <- bind_rows(
  CroPlotR::bind_rows(res_ini$sim_list) %>%
    group_by(situation) %>%
    slice(n()) %>%            # Extract results for last date
    bind_cols(Case="ORI"),
  CroPlotR::bind_rows(res_baresoil$sim_list) %>%
    group_by(situation) %>%
    slice(n()) %>%
    bind_cols(Case="bareSoil"),
  CroPlotR::bind_rows(res_OMLovers$sim_list) %>%
    group_by(situation) %>%
    slice(n()) %>%
    bind_cols(Case="OMLovers"),
  CroPlotR::bind_rows(res_LegLovers$sim_list) %>%
    group_by(situation) %>%
    slice(n()) %>%
    bind_cols(Case="LegLovers")
)
Cases <- c("ORI","bareSoil","OMLovers","LegLovers")
df$Case <- factor(df$Case, levels = Cases)

## Print and save df
View(df)
write.table(df, file = file.path(workspace, "values_per_year.csv"), sep = ";", 
            row.names = FALSE)

## Compute cumulative variables (set masec(n) and mafruit to 0 for alfalfa, not harvested)
cumulative_var <- c("masecnp", "mafruit", "mafauchetot", "drat", "Qles")
df_sum <- df %>%
  mutate(masecnp=case_when(situation %in% c("12_T5_2016_b1","13_T5_2017_b1") ~0,
                           TRUE ~ masecnp)) %>%
  group_by(Case) %>%
  summarise(across(all_of(cumulative_var),sum))

## Print and save df
View(df_sum)
write.table(df_sum, file = file.path(workspace, "cumulated_values.csv"), sep = ";", 
            row.names = FALSE)

df_long <- tidyr::pivot_longer(df_sum, all_of(cumulative_var), names_to = "variables")

## Plot the results obtained for cumulative variables
p <- ggplot(df_long, aes(x=Case, y=value)) +
  geom_bar(position="dodge", stat="identity") +
  theme(axis.text.x = element_text(angle = 45, hjust=1)) +
  facet_wrap(~variables, scales="free_y")
print(p)
ggsave(file.path(workspace,"cumul.png"))

## Compute evolution of SOC and SON
df_OM <- df %>%
  group_by(Case) %>%
  select(c("SOC","SON")) %>%
  slice(n())
SOC_ini <- res_ini$sim_list$`01_T5_2009_b1`$SOC0[1]
SON_ini <- res_ini$sim_list$`01_T5_2009_b1`$SON0[1]
df_OM <-
  bind_rows(data.frame(Case="INI", "SOC"=SOC_ini, "SON"=SON_ini),
            df_OM) %>%
  mutate(`SOC evolution`=SOC-SOC_ini,
         `SON evolution`=SON-SON_ini)
df_OM$Case <- factor(df_OM$Case, levels = c("INI", "ORI","bareSoil","OMLovers","LegLovers"))
View(df_OM)
write.table(df_OM, file = file.path(workspace, "SOC_SON_evolution.csv"), sep = ";", 
            row.names = FALSE)


df_OM_long <- tidyr::pivot_longer(df_OM, c("SOC","SON"), names_to = "variables")
p <- ggplot(df_OM_long, aes(x=Case, y=value)) +
  geom_bar(position="dodge", stat="identity") +
  theme(axis.text.x = element_text(angle = 45, hjust=1)) +
  facet_wrap(~variables, scales="free_y")
print(p)
ggsave(file.path(workspace,"OM.png"))
