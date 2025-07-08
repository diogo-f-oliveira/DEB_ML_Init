function [par, metaPar, txtPar] = pars_init_Heteronympha_merope(metaData)

metaPar.model = 'hex'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9528;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.30834;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.18;     free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0079886;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.76246;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.kap_V = 0.01;     free.kap_V = 1;   units.kap_V = '-';        label.kap_V = 'conversion efficient E -> V -> E'; 
par.p_M = 130.8542;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5325.3135;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 7.757e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.s_j = 0.9998;     free.s_j   = 0;   units.s_j = '-';          label.s_j = 'reprod buffer/structure at pupation as fraction of max'; 
par.E_He = 4.896e-03; free.E_He  = 1;   units.E_He = 'J';         label.E_He = 'maturity at emergence'; 
par.h_a = 6.896e-04;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_A0 = 8893;      free.T_A0  = 0;   units.T_A0 = 'K';         label.T_A0 = 'Arrhenius temperature egg'; 
par.T_A1 = 5835;      free.T_A1  = 0;   units.T_A1 = 'K';         label.T_A1 = 'Arrhenius temperature 1st instar'; 
par.T_A2 = 3772;      free.T_A2  = 0;   units.T_A2 = 'K';         label.T_A2 = 'Arrhenius temperature 2nd instar'; 
par.T_A3 = 3;         free.T_A3  = 0;   units.T_A3 = 'K';         label.T_A3 = 'Arrhenius temperature 3rd instar'; 
par.T_A4 = 0;         free.T_A4  = 0;   units.T_A4 = 'K';         label.T_A4 = 'Arrhenius temperature 4th instar'; 
par.T_A5 = 5085;      free.T_A5  = 0;   units.T_A5 = 'K';         label.T_A5 = 'Arrhenius temperature 5th instar'; 
par.T_AH = 90000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature  at high temp boundary'; 
par.T_AL = 50000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature  at low temp boundary'; 
par.T_AP = 9528;      free.T_AP  = 0;   units.T_AP = 'K';         label.T_AP = 'Arrhenius temperature pupa'; 
par.T_H = 300.15;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'high boundary temperature'; 
par.T_H0 = 299.15;    free.T_H0  = 0;   units.T_H0 = 'K';         label.T_H0 = 'high boundary temperature egg'; 
par.T_H6 = 303.15;    free.T_H6  = 0;   units.T_H6 = 'K';         label.T_H6 = 'high boundary temperature pupa'; 
par.T_L = 275.15;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'low boundary temperature'; 
par.del_M = 0.66328;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for head capsule of larva'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_5 = 0.99949;    free.f_5   = 1;   units.f_5 = '-';          label.f_5 = 'scaled functional response for tW data'; 
par.f_e = 1;          free.f_e   = 0;   units.f_e = '-';          label.f_e = 'scaled functional response for imago'; 
par.s_1 = 2.9174;     free.s_1   = 1;   units.s_1 = '-';          label.s_1 = 'stress at instar 1: L_1^2/ L_b^2'; 
par.s_2 = 4.0858;     free.s_2   = 1;   units.s_2 = '-';          label.s_2 = 'stress at instar 2: L_2^2/ L_1^2'; 
par.s_3 = 1.376;      free.s_3   = 1;   units.s_3 = '-';          label.s_3 = 'stress at instar 3: L_3^2/ L_2^2'; 
par.s_4 = 1.2712;     free.s_4   = 1;   units.s_4 = '-';          label.s_4 = 'stress at instar 4: L_4^2/ L_3^2'; 
par.s_5 = 1.0649;     free.s_5   = 1;   units.s_5 = '-';          label.s_5 = 'stress at instar 5: L_5^2/ L_4^2'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_X = 0.2;        free.d_X   = 0;   units.d_X = 'g/cm^3';     label.d_X = 'specific density of food'; 
par.d_V = 0.2;        free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.2;        free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 
par.d_P = 0.2;        free.d_P   = 0;   units.d_P = 'g/cm^3';     label.d_P = 'specific density of faeces'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
