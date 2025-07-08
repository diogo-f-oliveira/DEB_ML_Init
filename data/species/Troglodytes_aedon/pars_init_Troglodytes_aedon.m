function [par, metaPar, txtPar] = pars_init_Troglodytes_aedon(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.4257;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.03464;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.81218;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 596.2981;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.024464;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7302.2946;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 8.236e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.349e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.022e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 5.896e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_00 = 1.9892;    free.f_00  = 1;   units.f_00 = '-';         label.f_00 = 'scaled functional response for tW data at 00 d'; 
par.f_04 = 2.3882;    free.f_04  = 1;   units.f_04 = '-';         label.f_04 = 'scaled functional response for tW data at 04 d'; 
par.f_08 = 1.6471;    free.f_08  = 1;   units.f_08 = '-';         label.f_08 = 'scaled functional response for tW data at 08 d'; 
par.f_12 = 0.86957;   free.f_12  = 1;   units.f_12 = '-';         label.f_12 = 'scaled functional response for tW data at 12 d'; 
par.f_16 = 1.1604;    free.f_16  = 1;   units.f_16 = '-';         label.f_16 = 'scaled functional response for tW data at 16 d'; 
par.f_p00 = 2.1594;   free.f_p00 = 1;   units.f_p00 = '-';        label.f_p00 = 'scaled functional response for tW data at 00 d, parasitized'; 
par.f_p04 = 2.0573;   free.f_p04 = 1;   units.f_p04 = '-';        label.f_p04 = 'scaled functional response for tW data at 04 d, parasitized'; 
par.f_p08 = 1.577;    free.f_p08 = 1;   units.f_p08 = '-';        label.f_p08 = 'scaled functional response for tW data at 08 d, parasitized'; 
par.t_R = 320;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
