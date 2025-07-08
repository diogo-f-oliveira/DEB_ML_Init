function [par, metaPar, txtPar] = pars_init_Aerodramus_brevirostris(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.2045;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.021402;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.91614;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 672.4958;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.027624;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7320.9783;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.494e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.301e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.749e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.001;      free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.652e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_02 = 0.53309;  free.f1_02 = 1;   units.f1_02 = '-';        label.f1_02 = 'scaled functional response for tW data at 02 d for sib 2'; 
par.f1_05 = 2.6444;   free.f1_05 = 1;   units.f1_05 = '-';        label.f1_05 = 'scaled functional response for tW data at 05 d for sib 2'; 
par.f1_10 = 2.9662;   free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW data at 10 d for sib 2'; 
par.f1_15 = 1.7762;   free.f1_15 = 1;   units.f1_15 = '-';        label.f1_15 = 'scaled functional response for tW data at 15 d for sib 2'; 
par.f1_20 = 0.87359;  free.f1_20 = 1;   units.f1_20 = '-';        label.f1_20 = 'scaled functional response for tW data at 20 d for sib 2'; 
par.f1_25 = 1.4946;   free.f1_25 = 1;   units.f1_25 = '-';        label.f1_25 = 'scaled functional response for tW data at 25 d for sib 2'; 
par.f_02 = 0.94496;   free.f_02  = 1;   units.f_02 = '-';         label.f_02 = 'scaled functional response for tW data at 02 d for sib 1'; 
par.f_05 = 2.7984;    free.f_05  = 1;   units.f_05 = '-';         label.f_05 = 'scaled functional response for tW data at 05 d for sib 1'; 
par.f_10 = 3.658;     free.f_10  = 1;   units.f_10 = '-';         label.f_10 = 'scaled functional response for tW data at 10 d for sib 1'; 
par.f_15 = 2.0828;    free.f_15  = 1;   units.f_15 = '-';         label.f_15 = 'scaled functional response for tW data at 15 d for sib 1'; 
par.f_20 = 1.148;     free.f_20  = 1;   units.f_20 = '-';         label.f_20 = 'scaled functional response for tW data at 20 d for sib 1'; 
par.f_25 = 1.3479;    free.f_25  = 1;   units.f_25 = '-';         label.f_25 = 'scaled functional response for tW data at 25 d for sib 1'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
