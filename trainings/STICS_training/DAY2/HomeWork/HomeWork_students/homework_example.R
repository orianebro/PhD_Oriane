### This script is just a reminder of commands that may help you start doing the homework 
### of the STICS training session, if you have chosen to do it using R. 
### It should not be seen as a potential solution for the homework, nor as a framework 
### that MUST be followed. Feel free to explore all possibilities offered by R and 
### SticsRPacks packages.
### 
### Do not hesitate to browse the documentation of the R packages to have a full 
### view of the list of provided functions (tab Reference of the web sites), 
### and/or to ask questions using the forum at https://w3.avignon.inra.fr/forge/projects/stics_main_projecu/boards/43 


# Load the necessary packages
library(SticsRPacks)
library(tidyr)
library(dplyr)
library(ggplot2)

# initializations: ADAPT THE PATH HERE! ########################################
javastics <- "D:\\Home\\sbuis\\Documents\\OUTILS-INFORMATIQUE\\STICS\\JavaSTICS-1.5.2-STICS-10.1.1" 
out_dir <- "D:\\Home\\sbuis\\TMP\\HomeWork\\STICS_workspace" 
workspace <- "D:\\Home\\sbuis\\TMP\\HomeWork\\STICS_workspace"
################################################################################


# To generate the tec files for each USMs, you can do it either manually by editing the XML file, 
# by using JavaStics, or through R using the function gen_tec_xml.
# In this case, for which you have to generate only 3 tec files, the easiest solution
# is to use JavaStics.

# For changing the names of the climate and tec files to use in the usms.xml file, 
# you can do it either manually, by using JavaStics, or through R by using the 
# function set_param_xml.
# Again, in this case where only a few USMs have to be modified, the easiest is to use JavaStics.


# Generate the model input files (text files) from javaStics input files (XML files)
gen_usms_xml2txt(javastics = javastics,
                 out_dir = out_dir,
                 workspace = workspace,
                 usm=c("SpringBarley","SpringFieldpea","SpringDurumWheat"))


# run the USMs

## define the model options
model_options <- stics_wrapper_options(javastics = javastics, 
                                       workspace = workspace,
                                       parallel = TRUE)

## run the USMs as they are defined
res <- stics_wrapper(model_options = model_options, var=c("mafruit","totir","totapN"))


## Example of run by changing dose and date of irrigation (or fertilisation) using stics_wrapper
## This is where R can be useful in this work since is allows automatizing tests of parameters values,
## and generating associated plots. 

### WARNING: be aware that for changing doses and dates of irrigation and fertilization from R, 
### sufficient number of applications should have first been initialized in the ***_tec.xml files.
### e.g. if you want to change dose (and possibly date) of fertilization/irrigation for a second application,
### then a second application must have been defined in the ***_tec.xml file (whatever 
### is its dose - could be 0, but with a date between beginning and end date of simulation).
### The definition of doses and dates can be done through R in the following way 
### (WARNING: all doses and dates must be defined, not just additional ones):
param_df <- data.frame(tec_name="ORIGINAL_tec.xml", 
                       julapI_1=213, doseI_1=0,  # First irrigation
                       julapI_2=213, doseI_2=0,  # Second irrigation
                       julapN_1=435, doseN_1=120, engrais_1=1,  # First fertilization: keep the values originally defined
                       julapN_2=213, doseN_2=0, engrais_2=1)  # Second Fertilization ...

#### Modify the tec file using the data.frame
gen_tec_xml(param_df = param_df, 
            file = file.path(workspace, "ORIGINAL_tec.xml"), 
            out_dir = workspace)
#### Regenerate the model input files (txt format)
gen_usms_xml2txt(javastics = javastics,
                 out_dir = out_dir,
                 workspace = workspace,
                 usm=c("SpringBarley","SpringFieldpea","SpringDurumWheat")) 

### run by changing dose and date of first irrigation
res_irri <- stics_wrapper(model_options = model_options, 
                          param_values = c(doseI_1=20,julapI_1=495), 
                          var=c("mafruit","totir","totapN"))

### run by changing dose and date of 2nd application of fertilization
res_fert <- stics_wrapper(model_options = model_options, param_values = c(doseN_2=120,julapN_2=495), var=c("mafruit","totir","totapN"))

### Note that of course several doses and dates can be modified simultaneously using stics_wrapper,
### and we may event think about optimizing doses and dates using estim_param or 
### other optimization functions ... 


# plot results in dynamic graphs
plot(ori=res$sim_list,
     new_irri=res_irri$sim_list, 
     new_fert=res_fert$sim_list,
     var=c("mafruit","totir","totapN"))

# plot end-of-season values (of the last simulated year ...) in bar graphs
## Create a df from the results to use ggplot ...
df <- bind_rows(
  CroPlotR::bind_rows(res$sim_list) %>% 
    group_by(situation) %>% 
    slice(n()) %>%
    bind_cols(Case="ORI"),
  CroPlotR::bind_rows(res_irri$sim_list) %>% 
    group_by(situation) %>% 
    slice(n()) %>%
    bind_cols(Case="IRRI"),
  CroPlotR::bind_rows(res_fert$sim_list) %>% 
    group_by(situation) %>% 
    slice(n()) %>%
    bind_cols(Case="FERT")
)  
df_long <- tidyr::pivot_longer(df, c("mafruit","totir","totapN"), names_to = "variables")

## Plot the results obtained for mafruit
p <- ggplot(filter(df_long, variables=="mafruit"), aes(fill=Case, y=value, x=situation)) + 
  geom_bar(position="dodge", stat="identity")
print(p)
