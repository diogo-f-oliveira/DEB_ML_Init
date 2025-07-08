function [par, metaPar, txtPar] = pars_init_Basiliscus_plumifrons(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 4.594;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.01713;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.72763;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 19.0281;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7842.5711;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.769e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 9.272e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.286e-10;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.069722;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_200 = 0.5607;  free.f1_200 = 1;   units.f1_200 = '-';       label.f1_200 = 'scaled functional response for tL,tW data at 200 d ind 2'; 
par.f1_300 = 0.79493;  free.f1_300 = 1;   units.f1_300 = '-';       label.f1_300 = 'scaled functional response for tL,tW data at 300 d ind 2'; 
par.f1_365 = 0.59925;  free.f1_365 = 1;   units.f1_365 = '-';       label.f1_365 = 'scaled functional response for tL,tW data at 365 d ind 2'; 
par.f_050 = 0.55393;  free.f_050 = 1;   units.f_050 = '-';        label.f_050 = 'scaled functional response for tL,tW data at 50 d'; 
par.f_120 = 1.2516;   free.f_120 = 1;   units.f_120 = '-';        label.f_120 = 'scaled functional response for tL,tW data at 120 d'; 
par.f_200 = 1.4282;   free.f_200 = 1;   units.f_200 = '-';        label.f_200 = 'scaled functional response for tL,tW data at 200 d ind 1'; 
par.f_300 = 0.92678;  free.f_300 = 1;   units.f_300 = '-';        label.f_300 = 'scaled functional response for tL,tW data at 300 d ind 1'; 
par.f_365 = 0.93873;  free.f_365 = 1;   units.f_365 = '-';        label.f_365 = 'scaled functional response for tL,tW data at 365 d ind 1'; 
par.z_m = 6.0225;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
