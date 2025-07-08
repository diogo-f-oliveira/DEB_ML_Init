function [par, metaPar, txtPar] = pars_init_Herklotsichthys_quadrimaculatus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'T_A'; 
par.z = 1.4185;       free.z     = 1;   units.z = '-';            label.z = 'z'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'kap_X'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'kap_P'; 
par.v = 0.025632;     free.v     = 1;   units.v = 'cm/d';         label.v = 'v'; 
par.kap = 0.99681;    free.kap   = 1;   units.kap = '-';          label.kap = 'kap'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'kap_R'; 
par.p_M = 66.3761;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M]'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'k_J'; 
par.E_G = 5156.3497;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G]'; 
par.E_Hb = 4.449e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'E_Hb'; 
par.E_Hj = 1.669e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'E_Hj'; 
par.E_Hp = 2.088e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'E_Hp'; 
par.h_a = 1.593e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'h_a'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 's_G'; 

%% other parameters 
par.del_M = 0.18981;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'del_M, shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'f, scaled function response for 0-variate data'; 
par.f_Fij = 0.5189;   free.f_Fij = 1;   units.f_Fij = '-';        label.f_Fij = 'f, , scaled function response for tL_Fij data'; 
par.f_Mun = 0.51832;  free.f_Mun = 1;   units.f_Mun = '-';        label.f_Mun = 'f, , scaled function response for tL_Mun data'; 
par.f_Von = 0.49914;  free.f_Von = 1;   units.f_Von = '-';        label.f_Von = 'f, , scaled function response for tL_Von data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
