function [par, metaPar, txtPar] = pars_init_Passer_domesticus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 2.8548;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.13772;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.66297;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 21.1609;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.00086706;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7316.3404;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.009e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.018e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.062e-14;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.001;      free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.598e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.fH_00 = 33.6241;  free.fH_00 = 1;   units.fH_00 = '-';        label.fH_00 = 'scaled functional response for tW data at 00 d'; 
par.fH_03 = -0.039745;  free.fH_03 = 1;   units.fH_03 = '-';        label.fH_03 = 'scaled functional response for tW data at 03 d'; 
par.fH_06 = 10.6218;  free.fH_06 = 1;   units.fH_06 = '-';        label.fH_06 = 'scaled functional response for tW data at 06 d'; 
par.fH_09 = 5.2709;   free.fH_09 = 1;   units.fH_09 = '-';        label.fH_09 = 'scaled functional response for tW data at 09 d'; 
par.fH_12 = 5.4617;   free.fH_12 = 1;   units.fH_12 = '-';        label.fH_12 = 'scaled functional response for tW data at 12 d'; 
par.fL_00 = 21.4375;  free.fL_00 = 1;   units.fL_00 = '-';        label.fL_00 = 'scaled functional response for tW data at 00 d'; 
par.fL_03 = 7.6856;   free.fL_03 = 1;   units.fL_03 = '-';        label.fL_03 = 'scaled functional response for tW data at 03 d'; 
par.fL_06 = 9.7324;   free.fL_06 = 1;   units.fL_06 = '-';        label.fL_06 = 'scaled functional response for tW data at 06 d'; 
par.fL_09 = 8.1492;   free.fL_09 = 1;   units.fL_09 = '-';        label.fL_09 = 'scaled functional response for tW data at 09 d'; 
par.fL_12 = 0.012153;  free.fL_12 = 1;   units.fL_12 = '-';        label.fL_12 = 'scaled functional response for tW data at 12 d'; 
par.t_R = 152;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
