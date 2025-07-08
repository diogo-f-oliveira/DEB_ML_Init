function [par, metaPar, txtPar] = pars_init_Ostrea_chilensis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.1548;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.6652;     free.F_m   = 1;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'kap_X'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'kap_P'; 
par.v = 0.013814;     free.v     = 1;   units.v = 'cm/d';         label.v = 'v'; 
par.kap = 0.99533;    free.kap   = 1;   units.kap = '-';          label.kap = 'kap'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'kap_R'; 
par.p_M = 47.0945;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M]'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'k_J'; 
par.E_G = 2344.9921;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G]'; 
par.E_Hb = 1.743e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'E_Hb'; 
par.E_Hj = 3.272e-04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'E_Hj'; 
par.E_Hp = 6.065e+00; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'E_Hp'; 
par.h_a = 1.474e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'h_a'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 's_G'; 

%% other parameters 
par.E_Hr = 3.812e-04; free.E_Hr  = 1;   units.E_Hr = 'J';         label.E_Hr = 'maturity at release'; 
par.del_M = 0.31552;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Mb = 0.72306;  free.del_Mb = 1;   units.del_Mb = '-';       label.del_Mb = 'shape coefficient at birth'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Chap = 1;       free.f_Chap = 1;   units.f_Chap = '-';       label.f_Chap = 'scaled functional response for 1-var data'; 
par.f_Rich1 = 0.99966;  free.f_Rich1 = 1;   units.f_Rich1 = '-';      label.f_Rich1 = 'scaled functional response for 1-var data'; 
par.f_Rich2 = 0.96627;  free.f_Rich2 = 1;   units.f_Rich2 = '-';      label.f_Rich2 = 'scaled functional response for 1-var data'; 
par.f_Vide = 0.99797;  free.f_Vide = 1;   units.f_Vide = '-';       label.f_Vide = 'scaled functional response for 1-var data'; 
par.f_Wils = 0.99077;  free.f_Wils = 1;   units.f_Wils = '-';       label.f_Wils = 'scaled functional response for 1-var data'; 
par.f_Wint1 = 0.99978;  free.f_Wint1 = 1;   units.f_Wint1 = '-';      label.f_Wint1 = 'scaled functional response for 1-var data'; 
par.f_Wint2 = 0.8797;  free.f_Wint2 = 1;   units.f_Wint2 = '-';      label.f_Wint2 = 'scaled functional response for 1-var data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
