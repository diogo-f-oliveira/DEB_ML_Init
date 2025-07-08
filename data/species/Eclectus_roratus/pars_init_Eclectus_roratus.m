function [par, metaPar, txtPar] = pars_init_Eclectus_roratus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.0921;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.020152;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.92574;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 705.3961;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.029227;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7320.4448;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.189e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 5.406e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.212e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 3.091e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_f00 = 1.2567;   free.f_f00 = 1;   units.f_f00 = '-';        label.f_f00 = 'scaled functional response for tW data at 00 d'; 
par.f_f20 = 2.4135;   free.f_f20 = 1;   units.f_f20 = '-';        label.f_f20 = 'scaled functional response for tW data at 20 d'; 
par.f_f40 = 0.92067;  free.f_f40 = 1;   units.f_f40 = '-';        label.f_f40 = 'scaled functional response for tW data at 40 d'; 
par.f_f60 = 0.8767;   free.f_f60 = 1;   units.f_f60 = '-';        label.f_f60 = 'scaled functional response for tW data at 60 d'; 
par.f_f70 = 0.67185;  free.f_f70 = 1;   units.f_f70 = '-';        label.f_f70 = 'scaled functional response for tW data at 70 d'; 
par.f_f80 = 0.76065;  free.f_f80 = 1;   units.f_f80 = '-';        label.f_f80 = 'scaled functional response for tW data at 80 d'; 
par.f_f99 = 0.98294;  free.f_f99 = 1;   units.f_f99 = '-';        label.f_f99 = 'scaled functional response for tW data at 99 d'; 
par.f_m00 = 0.63583;  free.f_m00 = 1;   units.f_m00 = '-';        label.f_m00 = 'scaled functional response for tW data at 00 d'; 
par.f_m20 = 8.9023e-05;  free.f_m20 = 1;   units.f_m20 = '-';        label.f_m20 = 'scaled functional response for tW data at 20 d'; 
par.f_m40 = 0.11486;  free.f_m40 = 1;   units.f_m40 = '-';        label.f_m40 = 'scaled functional response for tW data at 40 d'; 
par.f_m60 = 14.1483;  free.f_m60 = 1;   units.f_m60 = '-';        label.f_m60 = 'scaled functional response for tW data at 60 d'; 
par.f_m70 = -0.015911;  free.f_m70 = 1;   units.f_m70 = '-';        label.f_m70 = 'scaled functional response for tW data at 70 d'; 
par.f_m80 = 0.087124;  free.f_m80 = 1;   units.f_m80 = '-';        label.f_m80 = 'scaled functional response for tW data at 80 d'; 
par.f_m99 = 0.98912;  free.f_m99 = 1;   units.f_m99 = '-';        label.f_m99 = 'scaled functional response for tW data at 99 d'; 
par.t_R = 730;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 3.1194;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
