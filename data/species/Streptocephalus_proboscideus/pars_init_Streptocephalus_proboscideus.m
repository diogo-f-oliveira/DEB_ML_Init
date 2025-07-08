function [par, metaPar, txtPar] = pars_init_Streptocephalus_proboscideus(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.092909;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.026319;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99117;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 973.8173;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4462.3895;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.052e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 4.628e-03; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.955e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.197e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.1807;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f0_10 = 0.81627;  free.f0_10 = 1;   units.f0_10 = '-';        label.f0_10 = 'scaled functional response for tL data low food at 10 d'; 
par.f0_15 = 0.38558;  free.f0_15 = 1;   units.f0_15 = '-';        label.f0_15 = 'scaled functional response for tL data low food at 15 d'; 
par.f0_20 = 0.48482;  free.f0_20 = 1;   units.f0_20 = '-';        label.f0_20 = 'scaled functional response for tL data low food at 20 d'; 
par.f0_25 = 0.4666;   free.f0_25 = 1;   units.f0_25 = '-';        label.f0_25 = 'scaled functional response for tL data low food at 25 d'; 
par.f0_30 = 1.043;    free.f0_30 = 1;   units.f0_30 = '-';        label.f0_30 = 'scaled functional response for tL data low food at 30 d'; 
par.f0_35 = 2.5355;   free.f0_35 = 1;   units.f0_35 = '-';        label.f0_35 = 'scaled functional response for tL data low food at 35 d'; 
par.f1_10 = 0.94726;  free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tL data middle food at 10 d'; 
par.f1_20 = 0.17379;  free.f1_20 = 1;   units.f1_20 = '-';        label.f1_20 = 'scaled functional response for tL data middle food at 20 d'; 
par.f1_30 = 1.4465;   free.f1_30 = 1;   units.f1_30 = '-';        label.f1_30 = 'scaled functional response for tL data middle food at 30 d'; 
par.f1_35 = 3.7899;   free.f1_35 = 1;   units.f1_35 = '-';        label.f1_35 = 'scaled functional response for tL data middle food at 35 d'; 
par.f2_05 = 1.9982;   free.f2_05 = 1;   units.f2_05 = '-';        label.f2_05 = 'scaled functional response for tL data high food at 05 d'; 
par.f2_10 = 0.37641;  free.f2_10 = 1;   units.f2_10 = '-';        label.f2_10 = 'scaled functional response for tL data high food at 10 d'; 
par.f2_15 = 0.54342;  free.f2_15 = 1;   units.f2_15 = '-';        label.f2_15 = 'scaled functional response for tL data high food at 15 d'; 
par.f2_20 = 0.74794;  free.f2_20 = 1;   units.f2_20 = '-';        label.f2_20 = 'scaled functional response for tL data high food at 20 d'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
