function [par, metaPar, txtPar] = pars_init_Hoplobatrachus_tigerinus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.z = 8.8817;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for frog'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.12414;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.96233;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 21.7839;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7314.6836;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 9.797e+00; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.479e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.205e-10;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hj = 1.962e+02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.del_M = 0.20308;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for tadpole'; 
par.del_Mj = 0.43294;  free.del_Mj = 1;   units.del_Mj = '-';       label.del_Mj = 'shape coefficient for toad'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_1 = 1.254;      free.f_1   = 1;   units.f_1 = '-';          label.f_1 = 'scaled functional response for tfW1 data'; 
par.f_10 = 1.4049;    free.f_10  = 1;   units.f_10 = '-';         label.f_10 = 'scaled functional response for tfW10 data'; 
par.f_120 = 0.49469;  free.f_120 = 1;   units.f_120 = '-';        label.f_120 = 'scaled functional response for tfW120 data'; 
par.f_20 = 1.1774;    free.f_20  = 1;   units.f_20 = '-';         label.f_20 = 'scaled functional response for tfW20 data'; 
par.f_40 = 0.98479;   free.f_40  = 1;   units.f_40 = '-';         label.f_40 = 'scaled functional response for tfW40 data'; 
par.f_5 = 1.6674;     free.f_5   = 1;   units.f_5 = '-';          label.f_5 = 'scaled functional response for tfW5 data'; 
par.f_80 = 0.70137;   free.f_80  = 1;   units.f_80 = '-';         label.f_80 = 'scaled functional response for tfW80 data'; 
par.z_b = 8.9632;     free.z_b   = 1;   units.z_b = '-';          label.z_b = 'zoom factor for tadpole'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 


%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
