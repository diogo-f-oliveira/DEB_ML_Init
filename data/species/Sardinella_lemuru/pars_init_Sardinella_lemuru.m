function [par, metaPar, txtPar] = pars_init_Sardinella_lemuru(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'T_A'; 
par.z = 4.0669;       free.z     = 1;   units.z = '-';            label.z = 'z'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'kap_X'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'kap_P'; 
par.v = 0.021332;     free.v     = 1;   units.v = 'cm/d';         label.v = 'v'; 
par.kap = 0.96737;    free.kap   = 1;   units.kap = '-';          label.kap = 'kap'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'kap_R'; 
par.p_M = 18.0398;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M]'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'k_J'; 
par.E_G = 5230.4111;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G]'; 
par.E_Hb = 1.797e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'E_Hb'; 
par.E_Hj = 1.797e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'E_Hj'; 
par.E_Hp = 3.826e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'E_Hp'; 
par.h_a = 3.915e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'h_a'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 's_G'; 

%% other parameters 
par.del_M = 0.17573;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'del_M'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'f'; 
par.f_tL = 1.017;     free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'f_tL'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
