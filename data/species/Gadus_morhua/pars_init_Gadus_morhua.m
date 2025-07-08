function [par, metaPar, txtPar] = pars_init_Gadus_morhua(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 4605.2065;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 9.1194;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.021019;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.97337;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 25.5736;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7317.9432;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.554e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 2.140e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 3.641e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.479e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 1.950e-03; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.del_M = 0.1425;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for TL'; 
par.del_ME = 0.051635;  free.del_ME = 1;   units.del_ME = '-';       label.del_ME = 'shape coefficient for embryo'; 
par.del_MY = 0.48092;  free.del_MY = 1;   units.del_MY = '-';       label.del_MY = 'shape coefficient for yolk'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_BjorStei2007 = 1.7334;  free.f_BjorStei2007 = 1;   units.f_BjorStei2007 = '-';  label.f_BjorStei2007 = 'scaled functional response for BjorStei2007 data'; 
par.f_McCoGeub2006 = 0.71065;  free.f_McCoGeub2006 = 1;   units.f_McCoGeub2006 = '-';  label.f_McCoGeub2006 = 'scaled functional response for McCoGeub2006 data'; 
par.f_OtteNyha1999 = 1.0081;  free.f_OtteNyha1999 = 1;   units.f_OtteNyha1999 = '-';  label.f_OtteNyha1999 = 'scaled functional response for OtteNyha1999 data'; 
par.s_R = 0.96274;    free.s_R   = 1;   units.s_R = '-';          label.s_R = 'fraction of eggs in gonads that is resorbed'; 
par.s_Y = 0.85246;    free.s_Y   = 1;   units.s_Y = '-';          label.s_Y = 'reduction factor for yolk absorption'; 
par.w_ad = 0.96111;   free.w_ad  = 1;   units.w_ad = '-';         label.w_ad = 'ash-free dry - dry weight ratio'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_V = 0.20667;    free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
