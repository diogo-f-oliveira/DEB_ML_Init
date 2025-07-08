function [par, metaPar, txtPar] = pars_init_Perna_canaliculus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 6546.1;     free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.12912;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.76;     free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.23;     free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0061646;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.86034;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 24.5105;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 3454.0501;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 5.205e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 4.986e-01; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 2.945e+02; free.E_Hp  = 0;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 7.459e-10;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 41221.52;  free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'T_AH'; 
par.T_AL = 39176.26;  free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'T_AL'; 
par.T_H = 302.93;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'T_H'; 
par.T_L = 278.21;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'T_L'; 
par.d_V2 = 0.1615;    free.d_V2  = 0;   units.d_V2 = '-';         label.d_V2 = 'specific desity of structure, dry weight '; 
par.del_M = 0.24602;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient; starvation data suggest 0.236'; 
par.del_Me = 3.2349;  free.del_Me = 1;   units.del_Me = '-';       label.del_Me = 'shape coefficient for larval data'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f2 = 0.70478;     free.f2    = 1;   units.f2 = '-';           label.f2 = 'scaled functional response for Treatment 2'; 
par.f3 = 0.72614;     free.f3    = 1;   units.f3 = '-';           label.f3 = 'scaled functional response for Treatment 3'; 
par.f4 = 0.72614;     free.f4    = 1;   units.f4 = '-';           label.f4 = 'scaled functional response for Treatment 4'; 
par.f5 = 0.79741;     free.f5    = 1;   units.f5 = '-';           label.f5 = 'scaled functional response for Treatment 5'; 
par.f_LWN = 0.80776;  free.f_LWN = 1;   units.f_LWN = '-';        label.f_LWN = 'scaled functional response for LW data'; 
par.f_tL0 = 0.75976;  free.f_tL0 = 1;   units.f_tL0 = '-';        label.f_tL0 = 'scaled functional response for larval data'; 
par.f_tL1 = 1.2;      free.f_tL1 = 1;   units.f_tL1 = '-';        label.f_tL1 = 'scaled functional response for tL data at site 1'; 
par.f_tL2 = 1.2;      free.f_tL2 = 1;   units.f_tL2 = '-';        label.f_tL2 = 'scaled functional response for tL data at site 2'; 
par.kap_Pf3 = 0.27197;  free.kap_Pf3 = 1;   units.kap_Pf3 = '-';      label.kap_Pf3 = 'faecation efficiency of food to faeces, treatment 5'; 
par.kap_Pf4 = 0.42358;  free.kap_Pf4 = 1;   units.kap_Pf4 = '-';      label.kap_Pf4 = 'faecation efficiency of food to faeces, treatment 5'; 
par.kap_Pf5 = 0.71191;  free.kap_Pf5 = 1;   units.kap_Pf5 = '-';      label.kap_Pf5 = 'faecation efficiency of food to faeces, treatment 5'; 
par.kap_Xf3 = 0.65;   free.kap_Xf3 = 0;   units.kap_Xf3 = '-';      label.kap_Xf3 = 'digestion efficiency of food to reserve, treatment 4'; 
par.kap_Xf4 = 0.41;   free.kap_Xf4 = 0;   units.kap_Xf4 = '-';      label.kap_Xf4 = 'digestion efficiency of food to reserve, treatment 4'; 
par.kap_Xf5 = 0.16;   free.kap_Xf5 = 0;   units.kap_Xf5 = '-';      label.kap_Xf5 = 'digestion efficiency of food to reserv, treatment 5e'; 
par.tw2fw = 0.216;    free.tw2fw = 0;   units.tw2fw = '-';        label.tw2fw = 'total (live) weight to flesh wet weight, data mean = 0.216'; 
par.tw2fw_LWN = 0.28;  free.tw2fw_LWN = 0;   units.tw2fw_LWN = '-';    label.tw2fw_LWN = 'total (live) weight to flesh wet weight, data mean = 0.216'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_X = 0.138;      free.d_X   = 0;   units.d_X = 'g/cm^3';     label.d_X = 'specific density of food'; 
par.d_V = 0.138;      free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.138;      free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 
par.d_P = 0.138;      free.d_P   = 0;   units.d_P = 'g/cm^3';     label.d_P = 'specific density of faeces'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
