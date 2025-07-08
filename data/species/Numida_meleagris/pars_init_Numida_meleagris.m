function [par, metaPar, txtPar] = pars_init_Numida_meleagris(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 8.8857;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.15925;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.2;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.058214;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.96342;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 50.8193;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7311.0635;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.736e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.329e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.632e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 2.072e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_010 = 1.7303;  free.f1_010 = 1;   units.f1_010 = '-';       label.f1_010 = 'scaled functional response for tW_fm data at 10 d'; 
par.f1_020 = 0.36675;  free.f1_020 = 1;   units.f1_020 = '-';       label.f1_020 = 'scaled functional response for tW_fm data at 20 d'; 
par.f1_040 = 2.0957;  free.f1_040 = 1;   units.f1_040 = '-';       label.f1_040 = 'scaled functional response for tW_fm data at 40 d'; 
par.f1_090 = 0.81421;  free.f1_090 = 1;   units.f1_090 = '-';       label.f1_090 = 'scaled functional response for tW_fm data at 90 d'; 
par.f1_150 = 0.14301;  free.f1_150 = 1;   units.f1_150 = '-';       label.f1_150 = 'scaled functional response for tW_fm data at 150 d'; 
par.f_000 = -0.003127;  free.f_000 = 1;   units.f_000 = '-';        label.f_000 = 'scaled functional response for tW data at 000 d'; 
par.f_040 = 1.4583;   free.f_040 = 1;   units.f_040 = '-';        label.f_040 = 'scaled functional response for tW data at 040 d'; 
par.f_060 = 2.0529;   free.f_060 = 1;   units.f_060 = '-';        label.f_060 = 'scaled functional response for tW data at 060 d'; 
par.f_140 = 0.958;    free.f_140 = 1;   units.f_140 = '-';        label.f_140 = 'scaled functional response for tW data at 140 d'; 
par.t_0 = 0;          free.t_0   = 0;   units.t_0 = 'd';          label.t_0 = 'time at start development at T'; 
par.t_R = 196;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 8.898;      free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
