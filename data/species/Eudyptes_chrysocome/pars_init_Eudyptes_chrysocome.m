function [par, metaPar, txtPar] = pars_init_Eudyptes_chrysocome(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 4.5528;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.41327;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.12305;  free.kap_P = 1;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.028816;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99043;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 1439.1014;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.060099;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7301.0164;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 4.222e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.195e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.008e-12;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 5.989e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f1_00 = 2.344;    free.f1_00 = 1;   units.f1_00 = '-';        label.f1_00 = 'scaled functional response for tW1 data at 0 d'; 
par.f1_07 = 3.1962;   free.f1_07 = 1;   units.f1_07 = '-';        label.f1_07 = 'scaled functional response for tW1 data at 7 d'; 
par.f1_35 = 1.0377;   free.f1_35 = 1;   units.f1_35 = '-';        label.f1_35 = 'scaled functional response for tW1 data at 35 d'; 
par.f1_40 = 1.0273;   free.f1_40 = 1;   units.f1_40 = '-';        label.f1_40 = 'scaled functional response for tW1 data at 40 d'; 
par.fA_e = 0.55643;   free.fA_e  = 1;   units.fA_e = '-';         label.fA_e = 'scaled functional response for tJOe_A data'; 
par.fB_e = 1.1066;    free.fB_e  = 0;   units.fB_e = '-';         label.fB_e = 'scaled functional response for tJOe_B data'; 
par.f_00 = 0.10796;   free.f_00  = 1;   units.f_00 = '-';         label.f_00 = 'scaled functional response for tW data at 0 d'; 
par.f_07 = 2.7974;    free.f_07  = 1;   units.f_07 = '-';         label.f_07 = 'scaled functional response for tW data at 7 f'; 
par.f_35 = 1.0442;    free.f_35  = 1;   units.f_35 = '-';         label.f_35 = 'scaled functional response for tW data at 35 d'; 
par.f_40 = 1.2777;    free.f_40  = 1;   units.f_40 = '-';         label.f_40 = 'scaled functional response for tW data at 40 d'; 
par.t_R = 1825;       free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
