function [par, metaPar, txtPar] = pars_init_Dryocopus_martius(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.328;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.055218;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.95822;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 634.1673;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.025839;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7325.0768;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 7.152e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.484e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.347e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.534e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.W_01 = 149.7;     free.W_01  = 0;   units.W_01 = 'g';         label.W_01 = 'intitial weight in tW data for ind 1'; 
par.W_02 = 140.3;     free.W_02  = 0;   units.W_02 = 'g';         label.W_02 = 'intitial weight in tW data for ind 2'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_00 = 1.0468;   free.f1_00 = 1;   units.f1_00 = '-';        label.f1_00 = 'scaled functional response for tW data at 00 d'; 
par.f1_05 = 1.3715;   free.f1_05 = 1;   units.f1_05 = '-';        label.f1_05 = 'scaled functional response for tW data at 05 d'; 
par.f1_10 = 0.93305;  free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW data at 10 d'; 
par.f1_15 = 0.88542;  free.f1_15 = 1;   units.f1_15 = '-';        label.f1_15 = 'scaled functional response for tW data at 15 d'; 
par.f1_20 = 1.1286;   free.f1_20 = 1;   units.f1_20 = '-';        label.f1_20 = 'scaled functional response for tW data at 20 d'; 
par.f1_25 = 1.0271;   free.f1_25 = 1;   units.f1_25 = '-';        label.f1_25 = 'scaled functional response for tW data at 25 d'; 
par.f1_30 = 1.0603;   free.f1_30 = 1;   units.f1_30 = '-';        label.f1_30 = 'scaled functional response for tW data at 30 d'; 
par.f1_35 = 1.0877;   free.f1_35 = 1;   units.f1_35 = '-';        label.f1_35 = 'scaled functional response for tW data at 35 d'; 
par.f1_40 = 1.0967;   free.f1_40 = 1;   units.f1_40 = '-';        label.f1_40 = 'scaled functional response for tW data at 40 d'; 
par.f2_00 = 0.92982;  free.f2_00 = 1;   units.f2_00 = '-';        label.f2_00 = 'scaled functional response for tW data at 00 d'; 
par.f2_05 = 1.2971;   free.f2_05 = 1;   units.f2_05 = '-';        label.f2_05 = 'scaled functional response for tW data at 05 d'; 
par.f2_10 = 1.1145;   free.f2_10 = 1;   units.f2_10 = '-';        label.f2_10 = 'scaled functional response for tW data at 10 d'; 
par.f2_15 = 0.78071;  free.f2_15 = 1;   units.f2_15 = '-';        label.f2_15 = 'scaled functional response for tW data at 15 d'; 
par.f2_20 = 1.0702;   free.f2_20 = 1;   units.f2_20 = '-';        label.f2_20 = 'scaled functional response for tW data at 20 d'; 
par.f2_25 = 1.069;    free.f2_25 = 1;   units.f2_25 = '-';        label.f2_25 = 'scaled functional response for tW data at 25 d'; 
par.f2_30 = 1.0041;   free.f2_30 = 1;   units.f2_30 = '-';        label.f2_30 = 'scaled functional response for tW data at 30 d'; 
par.f2_35 = 1.1105;   free.f2_35 = 1;   units.f2_35 = '-';        label.f2_35 = 'scaled functional response for tW data at 35 d'; 
par.f2_40 = 0.79548;  free.f2_40 = 1;   units.f2_40 = '-';        label.f2_40 = 'scaled functional response for tW data at 40 d'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 3.4116;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
