function [par, metaPar, txtPar] = pars_init_Cassiopea_xamachana(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.19045;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.022986;     free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.975;      free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 126.7601;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 525.3334;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.827e-06; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.253e-01; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 6.696e+01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.860e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.26562;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_MR = 0.25641;  free.del_MR = 1;   units.del_MR = '-';       label.del_MR = 'shape coefficient for # of appendices'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_D4_05 = 0.10107;  free.f_D4_05 = 1;   units.f_D4_05 = '-';      label.f_D4_05 = 'scaled functional response for tL(:,3) data at 05 d'; 
par.f_D4_10 = 0.12788;  free.f_D4_10 = 1;   units.f_D4_10 = '-';      label.f_D4_10 = 'scaled functional response for tL(:,3) data at 10 d'; 
par.f_D4_20 = 0.018287;  free.f_D4_20 = 1;   units.f_D4_20 = '-';      label.f_D4_20 = 'scaled functional response for tL(:,3) data at 20 d'; 
par.f_D4_30 = 0.096256;  free.f_D4_30 = 1;   units.f_D4_30 = '-';      label.f_D4_30 = 'scaled functional response for tL(:,3) data at 40 d'; 
par.f_D4_40 = 0.015378;  free.f_D4_40 = 1;   units.f_D4_40 = '-';      label.f_D4_40 = 'scaled functional response for tL(:,3) data at 30 d'; 
par.f_D8_05 = 0.14373;  free.f_D8_05 = 1;   units.f_D8_05 = '-';      label.f_D8_05 = 'scaled functional response for tL(:,2) data at 05 d'; 
par.f_D8_10 = 0.12349;  free.f_D8_10 = 1;   units.f_D8_10 = '-';      label.f_D8_10 = 'scaled functional response for tL(:,2) data at 10 d'; 
par.f_D8_20 = 0.013082;  free.f_D8_20 = 1;   units.f_D8_20 = '-';      label.f_D8_20 = 'scaled functional response for tL(:,2) data at 20 d'; 
par.f_D8_30 = 0.037116;  free.f_D8_30 = 1;   units.f_D8_30 = '-';      label.f_D8_30 = 'scaled functional response for tL(:,2) data at 30 d'; 
par.f_D8_40 = 0.018142;  free.f_D8_40 = 1;   units.f_D8_40 = '-';      label.f_D8_40 = 'scaled functional response for tL(:,2) data at 40 d'; 
par.f_L0_05 = 0.0022082;  free.f_L0_05 = 1;   units.f_L0_05 = '-';      label.f_L0_05 = 'scaled functional response for tL(:,7) data at 05 d'; 
par.f_L0_10 = 0.071228;  free.f_L0_10 = 1;   units.f_L0_10 = '-';      label.f_L0_10 = 'scaled functional response for tL(:,7) data at 10 d'; 
par.f_L0_20 = 0.051349;  free.f_L0_20 = 1;   units.f_L0_20 = '-';      label.f_L0_20 = 'scaled functional response for tL(:,7) data at 20 d'; 
par.f_L0_30 = 0.056549;  free.f_L0_30 = 1;   units.f_L0_30 = '-';      label.f_L0_30 = 'scaled functional response for tL(:,7) data at 30 d'; 
par.f_L0_40 = 0.049677;  free.f_L0_40 = 1;   units.f_L0_40 = '-';      label.f_L0_40 = 'scaled functional response for tL(:,7) data at 40 d'; 
par.f_L2_05 = 0.10101;  free.f_L2_05 = 1;   units.f_L2_05 = '-';      label.f_L2_05 = 'scaled functional response for tL(:,6) data at 05 d'; 
par.f_L2_10 = 0.074298;  free.f_L2_10 = 1;   units.f_L2_10 = '-';      label.f_L2_10 = 'scaled functional response for tL(:,6) data at 10 d'; 
par.f_L2_20 = 0.037268;  free.f_L2_20 = 1;   units.f_L2_20 = '-';      label.f_L2_20 = 'scaled functional response for tL(:,6) data at 20 d'; 
par.f_L2_30 = 0.045067;  free.f_L2_30 = 1;   units.f_L2_30 = '-';      label.f_L2_30 = 'scaled functional response for tL(:,6) data at 30 d'; 
par.f_L2_40 = 0.19143;  free.f_L2_40 = 1;   units.f_L2_40 = '-';      label.f_L2_40 = 'scaled functional response for tL(:,6) data at 40 d'; 
par.f_L4_05 = 0.11115;  free.f_L4_05 = 1;   units.f_L4_05 = '-';      label.f_L4_05 = 'scaled functional response for tL(:,5) data at 05 d'; 
par.f_L4_10 = 0.087521;  free.f_L4_10 = 1;   units.f_L4_10 = '-';      label.f_L4_10 = 'scaled functional response for tL(:,5) data at 10 d'; 
par.f_L4_20 = 0.018528;  free.f_L4_20 = 1;   units.f_L4_20 = '-';      label.f_L4_20 = 'scaled functional response for tL(:,5) data at 20 d'; 
par.f_L4_30 = 0.041641;  free.f_L4_30 = 1;   units.f_L4_30 = '-';      label.f_L4_30 = 'scaled functional response for tL(:,5) data at 30 d'; 
par.f_L4_40 = 0.042615;  free.f_L4_40 = 1;   units.f_L4_40 = '-';      label.f_L4_40 = 'scaled functional response for tL(:,5) data at 40 d'; 
par.f_L8_05 = 0.145;  free.f_L8_05 = 1;   units.f_L8_05 = '-';      label.f_L8_05 = 'scaled functional response for tL(:,4) data at 05 d'; 
par.f_L8_10 = 0.027522;  free.f_L8_10 = 1;   units.f_L8_10 = '-';      label.f_L8_10 = 'scaled functional response for tL(:,4) data at 10 d'; 
par.f_L8_20 = 0.059756;  free.f_L8_20 = 1;   units.f_L8_20 = '-';      label.f_L8_20 = 'scaled functional response for tL(:,4) data at 20 d'; 
par.f_L8_30 = 0.05463;  free.f_L8_30 = 1;   units.f_L8_30 = '-';      label.f_L8_30 = 'scaled functional response for tL(:,4) data at 30 d'; 
par.f_L8_40 = 0.0095438;  free.f_L8_40 = 1;   units.f_L8_40 = '-';      label.f_L8_40 = 'scaled functional response for tL(:,4) data at 40 d'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
