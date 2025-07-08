function [par, metaPar, txtPar] = pars_init_Leuconotopicus_borealis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.7784;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.043252;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.7134;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 789.7057;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.032164;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7325.8757;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.265e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 5.441e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 9.956e-16;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 3.215e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f0_00 = 1.2999;   free.f0_00 = 0;   units.f0_00 = '-';        label.f0_00 = 'scaled functional response for tW0 data at 00 d'; 
par.f0_05 = 1.8227;   free.f0_05 = 0;   units.f0_05 = '-';        label.f0_05 = 'scaled functional response for tW0 data at 05 d'; 
par.f0_10 = 1.6599;   free.f0_10 = 0;   units.f0_10 = '-';        label.f0_10 = 'scaled functional response for tW0 data at 10 d'; 
par.f0_15 = 0.025911;  free.f0_15 = 0;   units.f0_15 = '-';        label.f0_15 = 'scaled functional response for tW0 data at 15 d'; 
par.f1_00 = 1.7821;   free.f1_00 = 1;   units.f1_00 = '-';        label.f1_00 = 'scaled functional response for tW1 data at 00 d'; 
par.f1_05 = 1.6519;   free.f1_05 = 1;   units.f1_05 = '-';        label.f1_05 = 'scaled functional response for tW1 data at 05 d'; 
par.f1_10 = 1.5601;   free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tW1 data at 10 d'; 
par.f1_15 = 0.72168;  free.f1_15 = 1;   units.f1_15 = '-';        label.f1_15 = 'scaled functional response for tW1 data at 15 d'; 
par.f3_00 = 2.3981;   free.f3_00 = 0;   units.f3_00 = '-';        label.f3_00 = 'scaled functional response for tW3 data at 00 d'; 
par.f3_05 = 1.8967;   free.f3_05 = 0;   units.f3_05 = '-';        label.f3_05 = 'scaled functional response for tW3 data at 05 d'; 
par.f3_10 = 1.4846;   free.f3_10 = 0;   units.f3_10 = '-';        label.f3_10 = 'scaled functional response for tW3 data at 10 d'; 
par.f3_15 = 0.17726;  free.f3_15 = 0;   units.f3_15 = '-';        label.f3_15 = 'scaled functional response for tW3 data at 15 d'; 
par.t_R = 255.5;      free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
