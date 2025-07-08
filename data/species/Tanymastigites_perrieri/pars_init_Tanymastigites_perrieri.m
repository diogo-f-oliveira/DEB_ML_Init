function [par, metaPar, txtPar] = pars_init_Tanymastigites_perrieri(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.11252;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.02986;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.98986;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 4905.4547;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4445.372;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 5.872e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 9.861e-04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.163e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.563e-04;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.12062;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f10_05 = 0.29499;  free.f10_05 = 1;   units.f10_05 = '-';       label.f10_05 = 'scaled functional response for tL_10 data at 05 d'; 
par.f10_10 = 4.2896;  free.f10_10 = 1;   units.f10_10 = '-';       label.f10_10 = 'scaled functional response for tL_10 data at 10 d'; 
par.f10_30 = 0.15553;  free.f10_30 = 1;   units.f10_30 = '-';       label.f10_30 = 'scaled functional response for tL_10 data at 30 d'; 
par.f10_60 = 1.7104;  free.f10_60 = 1;   units.f10_60 = '-';       label.f10_60 = 'scaled functional response for tL_10 data at 60 d'; 
par.f10_80 = 0.64062;  free.f10_80 = 1;   units.f10_80 = '-';       label.f10_80 = 'scaled functional response for tL_10 data at 80 d'; 
par.f20_05 = 0.42187;  free.f20_05 = 1;   units.f20_05 = '-';       label.f20_05 = 'scaled functional response for tL_20 data at 05 d'; 
par.f20_10 = 1.0626;  free.f20_10 = 1;   units.f20_10 = '-';       label.f20_10 = 'scaled functional response for tL_20 data at 10 d'; 
par.f20_30 = 0.9914;  free.f20_30 = 1;   units.f20_30 = '-';       label.f20_30 = 'scaled functional response for tL_20 data at 30 d'; 
par.f20_60 = 0.9832;  free.f20_60 = 1;   units.f20_60 = '-';       label.f20_60 = 'scaled functional response for tL_20 data at 60 d'; 
par.f25_02 = 0.43979;  free.f25_02 = 1;   units.f25_02 = '-';       label.f25_02 = 'scaled functional response for tL_25 data at 02 d'; 
par.f25_05 = 1.8634;  free.f25_05 = 1;   units.f25_05 = '-';       label.f25_05 = 'scaled functional response for tL_25 data at 05 d'; 
par.f25_10 = 0.94031;  free.f25_10 = 1;   units.f25_10 = '-';       label.f25_10 = 'scaled functional response for tL_25 data at 10 d'; 
par.f30_02 = 0.20168;  free.f30_02 = 1;   units.f30_02 = '-';       label.f30_02 = 'scaled functional response for tL_30 data at 02 d'; 
par.f30_05 = 1.1227;  free.f30_05 = 1;   units.f30_05 = '-';       label.f30_05 = 'scaled functional response for tL_30 data at 05 d'; 
par.f30_10 = 0.93593;  free.f30_10 = 1;   units.f30_10 = '-';       label.f30_10 = 'scaled functional response for tL_30 data at 10 d'; 
par.f35_02 = 0.2421;  free.f35_02 = 1;   units.f35_02 = '-';       label.f35_02 = 'scaled functional response for tL_35 data at 02 d'; 
par.f35_05 = 1.3044;  free.f35_05 = 1;   units.f35_05 = '-';       label.f35_05 = 'scaled functional response for tL_35 data at 05 d'; 
par.f35_10 = 1.3542;  free.f35_10 = 1;   units.f35_10 = '-';       label.f35_10 = 'scaled functional response for tL_35 data at 10 d'; 
par.z_m = 0.10902;    free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
