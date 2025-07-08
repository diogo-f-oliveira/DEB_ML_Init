function [par, metaPar, txtPar] = pars_init_Chironomus_riparius(metaData)

metaPar.model = 'hax'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6711.144;   free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.61942;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0073929;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.44236;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.kap_V = 1.1465e-06;  free.kap_V = 1;   units.kap_V = '-';        label.kap_V = 'conversion efficiency E -> V -> E'; 
par.p_M = 145.1326;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.035617;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4017.7378;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.634e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.764e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.E_He = 1.074e+00; free.E_He  = 1;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
par.E_Rj = 5322.6951;  free.E_Rj  = 1;   units.E_Rj = 'J/cm^3';    label.E_Rj = 'reproduction buffer density at pupation'; 
par.h_a = 1.401e-07;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 18827.0801;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature for upper boundary'; 
par.T_H = 309.9509;   free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'upper boundary'; 
par.del_M_1 = 0.082999;  free.del_M_1 = 1;   units.del_M_1 = '-';      label.del_M_1 = 'shape coefficient for larva length (measurments using alive individuals)'; 
par.del_M_2 = 0.067207;  free.del_M_2 = 1;   units.del_M_2 = '-';      label.del_M_2 = 'shape coefficient for larva length (measurments using dead individuals)'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var and ad libitum data'; 
par.f1 = 0.46182;     free.f1    = 1;   units.f1 = '-';           label.f1 = 'sc. funct. res.  0.1 mg tetramin per ind per d'; 
par.f2 = 0.83196;     free.f2    = 1;   units.f2 = '-';           label.f2 = 'sc. funct. res.  0.2 mg tetramin per ind per d'; 
par.f22 = 0.83819;    free.f22   = 1;   units.f22 = '-';          label.f22 = 'sc. funct. res.  0.2 mg tetramin per ind per d'; 
par.f3 = 1.0085;      free.f3    = 1;   units.f3 = '-';           label.f3 = 'sc. funct. res.  0.3 mg tetramin per ind per d'; 
par.f4 = 1.2285;      free.f4    = 1;   units.f4 = '-';           label.f4 = 'sc. funct. res.  0.4 mg tetramin per ind per d'; 
par.f5 = 1.4991;      free.f5    = 1;   units.f5 = '-';           label.f5 = 'sc. funct. res.  0.6 mg and 1.2 mg tetramin per ind per d'; 
par.f_B1 = 1;         free.f_B1  = 1;   units.f_B1 = '-';         label.f_B1 = 'sc. funct. response for Bayer2021 data, 0.6 mg/larvae/day'; 
par.f_B2 = 0.58008;   free.f_B2  = 1;   units.f_B2 = '-';         label.f_B2 = 'sc. funct. response for Bayer2021 data, 0.3 mg/larvae/day'; 
par.f_B3 = 0.25263;   free.f_B3  = 1;   units.f_B3 = '-';         label.f_B3 = 'sc. funct. response for Bayer2021 data, 0.15 mg/larvae/day'; 
par.f_B4 = 0.11557;   free.f_B4  = 1;   units.f_B4 = '-';         label.f_B4 = 'sc. funct. response for Bayer2021 data, 0.1 mg/larvae/day'; 
par.f_fm = 1.932;     free.f_fm  = 1;   units.f_fm = '-';         label.f_fm = 'sc. funct. res.  1.4 mg tetramin per ind per d'; 
par.f_resp = 0.62795;  free.f_resp = 1;   units.f_resp = '-';       label.f_resp = 'scaled functional response for respiration data'; 
par.hb = 0.020618;    free.hb    = 1;   units.hb = '1/d';         label.hb = 'background hazard rate coefficient'; 
par.k_starv = 3.0929;  free.k_starv = 1;   units.k_starv = '1/d';    label.k_starv = 'starvation rate coefficient'; 
par.s_1 = 2.4875;     free.s_1   = 1;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 2.4829;     free.s_2   = 1;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.tau_1 = 0.28885;  free.tau_1 = 1;   units.tau_1 = '-';        label.tau_1 = 'scaled time related to time-variable f: end of decrease'; 
par.z_m = 0.52606;    free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
