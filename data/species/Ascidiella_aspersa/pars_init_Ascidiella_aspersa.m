function [par, metaPar, txtPar] = pars_init_Ascidiella_aspersa(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 1811.1647;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.4106;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 18;         free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, max spec searching rate'; 
par.kap_X = 0.06277;  free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1371;   free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.032033;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.9;        free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 286.2608;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 1569.4052;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.564e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.126e+01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.136e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.Lw_02010 = 0.211;  free.Lw_02010 = 0;   units.Lw_02010 = 'cm';    label.Lw_02010 = 'initial length for tL_2010 data'; 
par.Lw_02011 = 0.409;  free.Lw_02011 = 0;   units.Lw_02011 = 'cm';    label.Lw_02011 = 'initial length for tL_2011 data'; 
par.Lw_02012 = 0.258;  free.Lw_02012 = 0;   units.Lw_02012 = 'cm';    label.Lw_02012 = 'initial length for tL_2012 data'; 
par.Lw_02013 = 0.192;  free.Lw_02013 = 0;   units.Lw_02013 = 'cm';    label.Lw_02013 = 'initial length for tL_2013 data'; 
par.Lw_0spr = 1.32;   free.Lw_0spr = 0;   units.Lw_0spr = 'cm';     label.Lw_0spr = 'initial length for tL_spr data'; 
par.Lw_0sum = 0.321;  free.Lw_0sum = 0;   units.Lw_0sum = 'cm';     label.Lw_0sum = 'initial length for tL_sum data'; 
par.del_M = 0.14944;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tL000 = 0.0073919;  free.f_tL000 = 1;   units.f_tL000 = '-';      label.f_tL000 = 'scaled functional response for tL201* data at 000 d'; 
par.f_tL100 = 0.25957;  free.f_tL100 = 1;   units.f_tL100 = '-';      label.f_tL100 = 'scaled functional response for tL201* data at 100 d'; 
par.f_tL200 = 0.8781;  free.f_tL200 = 1;   units.f_tL200 = '-';      label.f_tL200 = 'scaled functional response for tL201* data at 200 d'; 
par.f_tL300 = 0.8781;  free.f_tL300 = 1;   units.f_tL300 = '-';      label.f_tL300 = 'scaled functional response for tL201* data at 300 d'; 
par.f_tLspr = 0.52999;  free.f_tLspr = 1;   units.f_tLspr = '-';      label.f_tLspr = 'scaled functional response for tL_spr data'; 
par.f_tLsum = 1.0245;  free.f_tLsum = 1;   units.f_tLsum = '-';      label.f_tLsum = 'scaled functional response for tL_sum data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_X = 0.2;        free.d_X   = 0;   units.d_X = 'g/cm^3';     label.d_X = 'specific density of food'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
