function [par, metaPar, txtPar] = pars_init_Chiromantis_petersii(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.50738;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor for toad'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.042705;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99502;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 24622.8335;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7333.2544;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.020e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.661e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 7.562e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hj = 1.319e+03; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.del_M = 0.091184;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for SVL toad'; 
par.del_ML09 = 0.032435;  free.del_ML09 = 1;   units.del_ML09 = '-';     label.del_ML09 = 'shape coefficient for TL tadpole at 0.9 cm'; 
par.del_ML12 = 0.16378;  free.del_ML12 = 1;   units.del_ML12 = '-';     label.del_ML12 = 'shape coefficient for TL tadpole at 1.2 cm'; 
par.del_ML16 = 0.11665;  free.del_ML16 = 1;   units.del_ML16 = '-';     label.del_ML16 = 'shape coefficient for TL tadpole at 1.6 cm'; 
par.del_ML20 = 0.13367;  free.del_ML20 = 1;   units.del_ML20 = '-';     label.del_ML20 = 'shape coefficient for TL tadpole at 2.0 cm'; 
par.del_ML24 = 0.17858;  free.del_ML24 = 1;   units.del_ML24 = '-';     label.del_ML24 = 'shape coefficient for TL tadpole at 2.4 cm'; 
par.del_ML28 = 0.14416;  free.del_ML28 = 1;   units.del_ML28 = '-';     label.del_ML28 = 'shape coefficient for TL tadpole at 2.8 cm'; 
par.del_ML32 = 0.13202;  free.del_ML32 = 1;   units.del_ML32 = '-';     label.del_ML32 = 'shape coefficient for TL tadpole at 3.2 cm'; 
par.del_ML36 = 0.16683;  free.del_ML36 = 1;   units.del_ML36 = '-';     label.del_ML36 = 'shape coefficient for TL tadpole at 3.6 cm'; 
par.del_ML40 = 0.16648;  free.del_ML40 = 1;   units.del_ML40 = '-';     label.del_ML40 = 'shape coefficient for TL tadpole at 4.0 cm'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tL = 1;         free.f_tL  = 0;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 
par.t_0 = 0.037941;   free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time till start of embryo development'; 
par.z_m = 0.4724;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for male'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
