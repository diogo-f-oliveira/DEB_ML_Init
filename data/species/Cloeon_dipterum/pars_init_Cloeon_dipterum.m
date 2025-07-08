function [par, metaPar, txtPar] = pars_init_Cloeon_dipterum(metaData)

metaPar.model = 'hep'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6946;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.066224;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor for female'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0029903;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.5975;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 808.9862;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4469.6889;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.933e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.872e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.E_Rj = 8382.7356;  free.E_Rj  = 1;   units.E_Rj = 'J/cm^3';    label.E_Rj = 'reproduction buffer density at emergence'; 
par.h_a = 7.484e-03;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 1;          free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.L_ini_W = 0.652;  free.L_ini_W = 0;   units.L_ini_W = 'cm';     label.L_ini_W = 'initial length tS (Wage2015)'; 
par.L_ini_c = 0.2678;  free.L_ini_c = 0;   units.L_ini_c = 'cm';     label.L_ini_c = 'initial length tL_c (gaia2016, winter)'; 
par.L_ini_g = 0.3574;  free.L_ini_g = 0;   units.L_ini_g = 'cm';     label.L_ini_g = 'initial length tL (gaia2016, summer)'; 
par.L_ini_w = 0.2678;  free.L_ini_w = 0;   units.L_ini_w = 'cm';     label.L_ini_w = 'initial length tL_w (gaia2016, winter)'; 
par.T_AL = 41390;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature for lower boundary'; 
par.T_L = 285.4;      free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary  temperature'; 
par.del_M = 0.11622;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_Mh = 0.79846;  free.del_Mh = 1;   units.del_Mh = '-';       label.del_Mh = 'shape coefficient for head length'; 
par.del_Mi = 0.1107;  free.del_Mi = 1;   units.del_Mi = '-';       label.del_Mi = 'shape coefficient for (sub)imago'; 
par.del_Mw = 0.15339;  free.del_Mw = 1;   units.del_Mw = '-';       label.del_Mw = 'shape coefficient for wing length'; 
par.del_Y = 1.0126;   free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_S = 1;          free.f_S   = 0;   units.f_S = '-';          label.f_S = 'scaled functional response for Swee2018 data'; 
par.f_W = 0.486;      free.f_W   = 0;   units.f_W = '-';          label.f_W = 'scaled functional response (Wage2015)'; 
par.f_c = 0.27056;    free.f_c   = 1;   units.f_c = '-';          label.f_c = 'scaled functional response for Cian1979 data'; 
par.f_fm1 = 1;        free.f_fm1 = 0;   units.f_fm1 = '-';        label.f_fm1 = 'scaled functional response for tL data (gaia2016)'; 
par.f_g = 1;          free.f_g   = 0;   units.f_g = '-';          label.f_g = 'scaled functional response for gaia2019 data'; 
par.f_gup = 0.568;    free.f_gup = 1;   units.f_gup = '-';        label.f_gup = 'scaled functional response for GuptMich1993 data'; 
par.f_tL_c = 0.85997;  free.f_tL_c = 1;   units.f_tL_c = '-';       label.f_tL_c = 'scaled functional response for tL data (gaia2016 semifield winter, cold)'; 
par.f_tL_g = 0.59389;  free.f_tL_g = 1;   units.f_tL_g = '-';       label.f_tL_g = 'scaled functional response for tL data (gaia2016 semifield summer)'; 
par.f_tL_w = 0.65733;  free.f_tL_w = 1;   units.f_tL_w = '-';       label.f_tL_w = 'scaled functional response for tL data (gaia2016 semifield winter, warm)'; 
par.h_b = 0.003;      free.h_b   = 0;   units.h_b = '1/d';        label.h_b = 'background hazard rate (Wage2015)'; 
par.s_1 = 19.74;      free.s_1   = 0;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 1.611;      free.s_2   = 0;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.s_3 = 1.871;      free.s_3   = 0;   units.s_3 = '-';          label.s_3 = 'stress at instar 3: L_3^2/ L_2^2'; 
par.s_4 = 1.947;      free.s_4   = 0;   units.s_4 = '-';          label.s_4 = 'stress at instar 4: L_4^2/ L_3^2'; 
par.s_5 = 1.139;      free.s_5   = 0;   units.s_5 = '-';          label.s_5 = 'stress at instar 5: L_5^2/ L_4^2'; 
par.s_6 = 1.014;      free.s_6   = 0;   units.s_6 = '-';          label.s_6 = 'stress at instar 6: L_6^2/ L_5^2'; 
par.s_7 = 0.9987;     free.s_7   = 0;   units.s_7 = '-';          label.s_7 = 'stress at instar 7 (N1): L_7^2/ L_6^2'; 
par.s_8 = 0.9042;     free.s_8   = 0;   units.s_8 = '-';          label.s_8 = 'stress at instar 8 (N2): L_8^2/ L_7^2'; 
par.s_shrink = 7.6068;  free.s_shrink = 1;   units.s_shrink = '-';     label.s_shrink = 'shrinking stress coefficient'; 
par.t0_c = 26;        free.t0_c  = 0;   units.t0_c = 'd';         label.t0_c = 'time since birth at start of experiment (Cian1979)'; 
par.t0_fm1 = 16;      free.t0_fm1 = 0;   units.t0_fm1 = 'd';       label.t0_fm1 = 'time since birth at time zero (gaia2016)'; 
par.t_0 = 13;         free.t_0   = 0;   units.t_0 = 'd';          label.t_0 = 'time since birth at start of experiment (gaia2019)'; 
par.z_m = 0.058085;   free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for male'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
