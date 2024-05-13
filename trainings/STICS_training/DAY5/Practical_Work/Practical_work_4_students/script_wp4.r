#######################################################
# Template for STICS training session, practical work 4
#######################################################

library(SticsRPacks)
library(tibble)
library(dplyr)		
library(tidyr)

# Give here the path to javastics and to the PW4 workspace (replace *** by relevant values)
javastics <- "D:\\JavaSTICS\\JavaSTICS-1.5.2-STICS-10.1.1"
workspace <- "D:\\STICS_training\\DAY5\\Practical_Work\\Practical_work_4_students\\workspace_WP4"
out_dir <- file.path(workspace,"results_optim")

##########
# Preamble
##########

# Read the observations
obs <- get_obs(workspace = workspace)

# Get the names of the USMs
usm_list <- names(obs)

# Get the names of the observed variables 
obs_var <- setdiff(names(dplyr::bind_rows(obs)), c("Date","Plant"))

# Get the number of observations per USM
# ... will be easier using the next version of CroPlotR (for which the summary 
#     function can be used with observations only) 
obs_number <- bind_rows(obs, .id = "situation") %>%
  pivot_longer(cols = all_of(obs_var), names_to = "variable", values_to = "value") %>%
  group_by(situation, variable) %>%
  summarise(non_na_count = sum(!is.na(value)), .groups = "drop") %>%
  pivot_wider(values_from = non_na_count, names_from = variable)
View(obs_number)
#########
# Part I: Analyzing initial simulation results
#########

# I.1: Run the simulations for all the given USMs 
######
# Generate the model (txt) input files
gen_usms_xml2txt(javastics = javastics, workspace = workspace,
                 out_dir = workspace)

# Run the model using default parameter values 
# and require to return simulated values for observed variables
model_options <- stics_wrapper_options(javastics = javastics, 
                                       workspace = workspace,
                                       parallel = TRUE)
sim_ini <- stics_wrapper(model_options = model_options,
                         var=obs_var)

# I.2: Compare observed and simulated data
######

# Plot initial simulation results VS observations and compute some goodness-of-fit criteria
# cf. function of the package CroPLotR (https://github.com/SticsRPacks/CroPlotR?tab=readme-ov-file#211-dynamic-plots and https://github.com/SticsRPacks/CroPlotR?tab=readme-ov-file#212-scatter-plots)																						  
plot(sim_ini$sim_list, obs=obs, var = c("lai_n", "masec_n", "mafruit"))
plot(sim_ini$sim_list, obs=obs, type="scatter", shape_sit = "symbol")
ggplot2::ggsave(file.path(out_dir,"scatterplot_ini.png"), width=30, units="cm")
											 
View(summary(sim_ini=sim_ini$sim_list, 
        obs=obs, stats=c("EF","rRMSE","RME")))

##########
# Part II: Choosing the configuration of parameter estimation
##########

# Get values of parameters among all cultivars (replace *** by the name of a parameter)
get_param_xml(file=file.path(workspace,"plant","my_corn_plt.xml"), param="vitircarbT")

# Get bounds of parameters as defined for all species (replace *** by the name of a parameter)
get_param_info(param = "vitircarbT")


## list parameters to estimate ... replace *** by relevant values !!! 
## (name of parameters, lower and upper bounds)
param_info <- list(vitircarbT=list(lb=0.00005, ub=0.002))

## filter the observations to use ... replace *** by the names of the USMs and variables 
## you want to use for calibration
calibrated_usms <- c("sit396","sit2t197","sit2t397")
obs_4_calibration <- filter_obs(obs, var=c("mafruit"), 
                                situation = calibrated_usms, 
                       include = TRUE)

###########
# Part III: Estimating parameters’ values for the new cultivar
###########

## Set a not too high value to nb_rep (number of repetitions) to save computation time,
## but a sufficiently high to test a few different starting points.
## Set a not too low value to xtol_rel (threshold for stopping criterion) to save computation time, 
## but a sufficiently low to reach convergence ...
optim_options <- list(xtol_rel=1e-3, out_dir=out_dir,
                      nb_rep=5)

## run parameter estimation 
res_estim <- estim_param(obs_list = obs_4_calibration, 
                         model_function = stics_wrapper, 
                         model_options = model_options, 
                         optim_options = optim_options,
                         param_info = param_info)   

##########
# Part IV: Evaluating the parameters’ values proposed for the new cultivar
##########

# Run the model using the estimated parameter values 
sim_after <- stics_wrapper(model_options = model_options,
                           var=obs_var,
                           param_values = res_estim$final_values)

# Plot initial simulation results VS observations on situations used for calibration
# and compute goodness-of-fit criteria
plot(sim_ini=sim_ini$sim_list[calibrated_usms], 
     sim_after=sim_after$sim_list[calibrated_usms], obs=obs[calibrated_usms], var = c("lai_n", "masec_n", "mafruit"))
plot(sim_ini=sim_ini$sim_list[calibrated_usms], 
     sim_after=sim_after$sim_list[calibrated_usms], obs=obs[calibrated_usms], type="scatter")
ggplot2::ggsave(file.path(optim_options$out_dir,"scatterplot_calib.png"), width=30, units="cm")

View(summary(sim_ini=sim_ini$sim_list[calibrated_usms], 
        sim_after=sim_after$sim_list[calibrated_usms], 
        obs=obs[calibrated_usms], stats=c("EF","rRMSE")))

# Plot initial simulation results VS observations on situations NOT used for calibration
# and compute goodness-of-fit criteria
evaluated_usms <- setdiff(usm_list, calibrated_usms)
plot(sim_ini=sim_ini$sim_list[evaluated_usms], 
     sim_after=sim_after$sim_list[evaluated_usms], 
     obs=obs[evaluated_usms], 
     var = c("lai_n", "masec_n", "mafruit"))
plot(sim_ini=sim_ini$sim_list[evaluated_usms], 
     sim_after=sim_after$sim_list[evaluated_usms], 
     obs=obs[evaluated_usms], type="scatter")
ggplot2::ggsave(file.path(optim_options$out_dir,"scatterplot_eval.png"), width=30, units="cm")

View(summary(sim_ini=sim_ini$sim_list[evaluated_usms], 
        sim_after=sim_after$sim_list[evaluated_usms], 
        obs=obs[evaluated_usms], 
        stats=c("EF","rRMSE","RME")))

# Same but only for last observation of Yield per season
# (no easy way for the moment to extract yield at harvest using SticsRPacks functions,
# it will hopefully come in further versions).
df_lastobs <- bind_rows(obs, .id="situation") %>% 							
    group_by(situation) %>% 
    select(situation, Date, mafruit) %>%
    filter(!is.na(mafruit)) %>%					
    slice(n()) 
lastobs <- split(df_lastobs, f = df_lastobs$situation, drop = TRUE, lex.order = TRUE)
																		
plot(sim_ini=sim_ini$sim_list[evaluated_usms], 
     sim_after=sim_after$sim_list[evaluated_usms], 
     obs=lastobs[evaluated_usms], type="scatter")
ggplot2::ggsave(file.path(optim_options$out_dir,"scatterplot_eval_lastobs.png"), width=30, units="cm")

View(summary(sim_ini=sim_ini$sim_list[evaluated_usms], 
        sim_after=sim_after$sim_list[evaluated_usms], 
        obs=lastobs[evaluated_usms], 
        stats=c("EF","rRMSE","RME")))
