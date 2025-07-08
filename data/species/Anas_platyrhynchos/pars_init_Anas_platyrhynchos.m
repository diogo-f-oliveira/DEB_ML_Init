function [par, metaPar, txtPar] = pars_init_Anas_platyrhynchos(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 6.412;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.050176;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.74639;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 117.6132;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.0048178;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7323.1592;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.822e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.562e+06; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.174e-16;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.02;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 4.836e+05; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.del_M = 0.18003;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_10 = 1.7185;   free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW_fm data at 10 d'; 
par.f1_30 = 1.4962;   free.f1_30 = 1;   units.f1_30 = '-';        label.f1_30 = 'scaled functional response for tW_fm data at 30 d'; 
par.f1_50 = 1.3334;   free.f1_50 = 1;   units.f1_50 = '-';        label.f1_50 = 'scaled functional response for tW_fm data at 50 d'; 
par.f1_60 = 0.0051626;  free.f1_60 = 1;   units.f1_60 = '-';        label.f1_60 = 'scaled functional response for tW_fm data at 60 d'; 
par.f_10 = 1.7241;    free.f_10  = 1;   units.f_10 = '-';         label.f_10 = 'scaled functional response for tW data at 10 d'; 
par.f_30 = 1.4761;    free.f_30  = 1;   units.f_30 = '-';         label.f_30 = 'scaled functional response for tW data at 30 d'; 
par.f_50 = 1.3759;    free.f_50  = 1;   units.f_50 = '-';         label.f_50 = 'scaled functional response for tW data at 50 d'; 
par.f_60 = 0.0048319;  free.f_60  = 1;   units.f_60 = '-';         label.f_60 = 'scaled functional response for tW data at 60 d'; 
par.f_tN = 0.93575;   free.f_tN  = 1;   units.f_tN = '-';         label.f_tN = 'scaled functional response for tN data'; 
par.t_0 = 2.2025;     free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development at T'; 
par.t_R = 365;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 6.6522;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
