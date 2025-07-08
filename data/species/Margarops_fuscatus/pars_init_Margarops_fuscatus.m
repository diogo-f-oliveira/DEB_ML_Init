function [par, metaPar, txtPar] = pars_init_Margarops_fuscatus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.3984;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.023953;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99203;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 3918.1129;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.16035;    free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7323.7229;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.327e+01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.122e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.656e-14;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.095e+02; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_00 = 3.4589;    free.f_00  = 1;   units.f_00 = '-';         label.f_00 = 'scaled functional response for tW data at 00 d'; 
par.f_05 = 2.4165;    free.f_05  = 1;   units.f_05 = '-';         label.f_05 = 'scaled functional response for tW data at 05 d'; 
par.f_10 = 1.5199;    free.f_10  = 1;   units.f_10 = '-';         label.f_10 = 'scaled functional response for tW data at 10 d'; 
par.f_15 = 1.1193;    free.f_15  = 1;   units.f_15 = '-';         label.f_15 = 'scaled functional response for tW data at 15 d'; 
par.f_20 = 0.64144;   free.f_20  = 1;   units.f_20 = '-';         label.f_20 = 'scaled functional response for tW data at 20 d'; 
par.f_p00 = 3.6441;   free.f_p00 = 1;   units.f_p00 = '-';        label.f_p00 = 'scaled functional response for tWp data at 00 d'; 
par.f_p05 = 2.6852;   free.f_p05 = 1;   units.f_p05 = '-';        label.f_p05 = 'scaled functional response for tWp data at 05 d'; 
par.f_p10 = 1.5255;   free.f_p10 = 1;   units.f_p10 = '-';        label.f_p10 = 'scaled functional response for tWp data at 10 d'; 
par.f_p15 = 0.96635;  free.f_p15 = 1;   units.f_p15 = '-';        label.f_p15 = 'scaled functional response for tWp data at 15 d'; 
par.f_p20 = 0.66273;  free.f_p20 = 1;   units.f_p20 = '-';        label.f_p20 = 'scaled functional response for tWp data at 20 d'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
