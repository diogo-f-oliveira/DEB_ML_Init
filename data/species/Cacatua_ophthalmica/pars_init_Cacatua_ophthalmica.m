function [par, metaPar, txtPar] = pars_init_Cacatua_ophthalmica(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.7291;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.029436;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.92876;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 489.6429;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.020998;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7308.2192;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.943e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 9.107e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty for P.a.g.'; 
par.h_a = 3.775e-15;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 6.257e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging for P.a.g.'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_000 = 7.4558e-08;  free.f1_000 = 1;   units.f1_000 = '-';       label.f1_000 = 'scaled functional response for tW1 data at 000 d'; 
par.f1_010 = 1.4311;  free.f1_010 = 1;   units.f1_010 = '-';       label.f1_010 = 'scaled functional response for tW1 data at 010 d'; 
par.f1_020 = 2.1004;  free.f1_020 = 1;   units.f1_020 = '-';       label.f1_020 = 'scaled functional response for tW1 data at 020 d'; 
par.f1_070 = 0.9035;  free.f1_070 = 1;   units.f1_070 = '-';       label.f1_070 = 'scaled functional response for tW1 data at 070 d'; 
par.f1_100 = 0.69041;  free.f1_100 = 1;   units.f1_100 = '-';       label.f1_100 = 'scaled functional response for tW1 data at 100 d'; 
par.f2_000 = 7.0738e-18;  free.f2_000 = 1;   units.f2_000 = '-';       label.f2_000 = 'scaled functional response for tW2 data at 000 d'; 
par.f2_010 = 3.3657;  free.f2_010 = 1;   units.f2_010 = '-';       label.f2_010 = 'scaled functional response for tW2 data at 010 d'; 
par.f2_020 = 2.1393;  free.f2_020 = 1;   units.f2_020 = '-';       label.f2_020 = 'scaled functional response for tW2 data at 020 d'; 
par.f2_070 = 0.4855;  free.f2_070 = 1;   units.f2_070 = '-';       label.f2_070 = 'scaled functional response for tW2 data at 070 d'; 
par.f2_100 = 2.3005;  free.f2_100 = 1;   units.f2_100 = '-';       label.f2_100 = 'scaled functional response for tW2 data at 100 d'; 
par.t_R = 1095;       free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
