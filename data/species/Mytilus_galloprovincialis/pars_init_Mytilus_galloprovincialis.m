function [par, metaPar, txtPar] = pars_init_Mytilus_galloprovincialis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 14821.191;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.37593;      free.z     = 0;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.7;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.023785;     free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.47679;    free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 9.0477;     free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2380.6249;  free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 5.630e-05; free.E_Hb  = 0;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 4.028e-02; free.E_Hj  = 0;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.587e+03; free.E_Hp  = 0;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 7.979e-10;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 31292.8769;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrh. temp for upper boundary'; 
par.T_AL = -0.001021;  free.T_AL  = 1;   units.T_AL = 'K';         label.T_AL = 'Arrh. temp for lower boundary'; 
par.T_H = 303.2494;   free.T_H   = 1;   units.T_H = 'K';          label.T_H = 'Upper temp boundary'; 
par.T_L = 293.15;     free.T_L   = 1;   units.T_L = 'K';          label.T_L = 'Lower temp boundary'; 
par.del_M = 0.23035;  free.del_M = 0;   units.del_M = '-';        label.del_M = 'shape coefficient after metam'; 
par.del_Mb = 0.23287;  free.del_Mb = 0;   units.del_Mb = '-';       label.del_Mb = 'shape coefficient at birth'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for f data'; 
par.fsubt = 0.67753;  free.fsubt = 0;   units.fsubt = '-';        label.fsubt = 'scaled functional response for fsubtidal data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
