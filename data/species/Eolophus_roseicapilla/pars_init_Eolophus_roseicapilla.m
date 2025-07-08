function [par, metaPar, txtPar] = pars_init_Eolophus_roseicapilla(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 2.7806;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.022258;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.95485;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 655.6716;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.027013;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7324.4378;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 5.717e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.241e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty for P.a.g.'; 
par.h_a = 3.119e-15;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.081e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging for P.a.g.'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_05 = -0.056228;  free.f1_05 = 1;   units.f1_05 = '-';        label.f1_05 = 'scaled functional response for tW data at 05 d'; 
par.f1_10 = 4.837;    free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW data at 10 d'; 
par.f1_20 = 1.5949;   free.f1_20 = 1;   units.f1_20 = '-';        label.f1_20 = 'scaled functional response for tW data at 20 d'; 
par.f1_30 = 0.85676;  free.f1_30 = 1;   units.f1_30 = '-';        label.f1_30 = 'scaled functional response for tW data at 30 d'; 
par.f1_40 = 0.85782;  free.f1_40 = 1;   units.f1_40 = '-';        label.f1_40 = 'scaled functional response for tW data at 40 d'; 
par.f_05 = 0.81587;   free.f_05  = 1;   units.f_05 = '-';         label.f_05 = 'scaled functional response for tW data at 05 d'; 
par.f_10 = 2.0859;    free.f_10  = 1;   units.f_10 = '-';         label.f_10 = 'scaled functional response for tW data at 10 d'; 
par.f_30 = 1.5301;    free.f_30  = 1;   units.f_30 = '-';         label.f_30 = 'scaled functional response for tW data at 30 d'; 
par.f_40 = 1.2657;    free.f_40  = 1;   units.f_40 = '-';         label.f_40 = 'scaled functional response for tW data at 40 d'; 
par.f_50 = 0.84332;   free.f_50  = 1;   units.f_50 = '-';         label.f_50 = 'scaled functional response for tW data at 50 d'; 
par.f_90 = 0.99268;   free.f_90  = 1;   units.f_90 = '-';         label.f_90 = 'scaled functional response for tW data at 90 d'; 
par.t_R = 363;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 2.8116;     free.z_m   = 0;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
