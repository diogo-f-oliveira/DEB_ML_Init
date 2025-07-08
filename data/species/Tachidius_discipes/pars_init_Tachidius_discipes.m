function [par, metaPar, txtPar] = pars_init_Tachidius_discipes(metaData)

metaPar.model = 'abp'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8036;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.023279;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.014549;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99974;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 3450.9223;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.0020451;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4431.7248;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 9.259e-06; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.016e-04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.737e-05;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 3.227e-06; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.T_AH = 31465;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature high boundary'; 
par.T_AL = 462923;    free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature low boundary'; 
par.T_H = 298.88;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'Higher temperature boundary for optimal growth'; 
par.T_L = 277.23;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'Lower temperature boundary for optimal growth'; 
par.del_M = 1.7198;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tL12 = 1.3444;  free.f_tL12 = 1;   units.f_tL12 = '-';       label.f_tL12 = 'scaled functional response for data at 12 C'; 
par.f_tL15 = 1.2072;  free.f_tL15 = 1;   units.f_tL15 = '-';       label.f_tL15 = 'scaled functional response for data at 15 C'; 
par.f_tL18 = 1.1732;  free.f_tL18 = 1;   units.f_tL18 = '-';       label.f_tL18 = 'scaled functional response for data at 18 C'; 
par.f_tL21 = 1.1277;  free.f_tL21 = 1;   units.f_tL21 = '-';       label.f_tL21 = 'scaled functional response for data at 21 C'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
