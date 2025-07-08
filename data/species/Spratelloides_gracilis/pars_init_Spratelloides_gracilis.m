function [par, metaPar, txtPar] = pars_init_Spratelloides_gracilis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'T_A'; 
par.z = 0.61169;      free.z     = 1;   units.z = '-';            label.z = 'z'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'kap_X'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'kap_P'; 
par.v = 0.025002;     free.v     = 1;   units.v = 'cm/d';         label.v = 'v'; 
par.kap = 0.99023;    free.kap   = 1;   units.kap = '-';          label.kap = 'kap'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'kap_R'; 
par.p_M = 149.0424;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M]'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'k_J'; 
par.E_G = 5221.7985;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G]'; 
par.E_Hb = 1.503e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'E_Hb'; 
par.E_Hj = 2.898e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'E_Hj'; 
par.E_Hp = 1.852e+01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'E_Hp'; 
par.h_a = 4.322e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'h_a'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 's_G'; 

%% other parameters 
par.del_M = 0.15187;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'del_M, shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'f, scaled function response for 0-variate data'; 
par.f_Ali = 0.99767;  free.f_Ali = 1;   units.f_Ali = '-';        label.f_Ali = 'f, , scaled function response for tL_Ali data'; 
par.f_Liz = 1;        free.f_Liz = 1;   units.f_Liz = '-';        label.f_Liz = 'f, , scaled function response for tL_Liz data'; 
par.f_Muf = 1;        free.f_Muf = 1;   units.f_Muf = '-';        label.f_Muf = 'f, , scaled function response for tL_Muf data'; 
par.f_Mus = 0.60727;  free.f_Mus = 1;   units.f_Mus = '-';        label.f_Mus = 'f, , scaled function response for tL_Mus data'; 
par.f_Thi = 1;        free.f_Thi = 1;   units.f_Thi = '-';        label.f_Thi = 'f, , scaled function response for tL_Thi data'; 
par.f_Tow = 1;        free.f_Tow = 1;   units.f_Tow = '-';        label.f_Tow = 'f, , scaled function response for tL_Tow data'; 
par.f_Tuf = 0.99987;  free.f_Tuf = 1;   units.f_Tuf = '-';        label.f_Tuf = 'f, , scaled function response for tL_Tuf data'; 
par.f_Tus = 0.54677;  free.f_Tus = 1;   units.f_Tus = '-';        label.f_Tus = 'f, , scaled function response for tL_Tus data'; 
par.f_Von = 0.73627;  free.f_Von = 1;   units.f_Von = '-';        label.f_Von = 'f, , scaled function response for tL_Von data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
