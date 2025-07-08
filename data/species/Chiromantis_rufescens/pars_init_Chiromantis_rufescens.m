function [par, metaPar, txtPar] = pars_init_Chiromantis_rufescens(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.9472;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for toad'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.025808;     free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.76938;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 17.5085;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7322.2016;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.945e+01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 5.639e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 7.729e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hj = 4.577e+02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.del_M = 0.32759;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for SVL toad'; 
par.del_ML05 = 0.87275;  free.del_ML05 = 1;   units.del_ML05 = '-';     label.del_ML05 = 'shape coefficient for TL tadpole at 0.5 cm'; 
par.del_ML08 = 1.1458;  free.del_ML08 = 1;   units.del_ML08 = '-';     label.del_ML08 = 'shape coefficient for TL tadpole at 0.8 cm'; 
par.del_ML11 = 0.42115;  free.del_ML11 = 1;   units.del_ML11 = '-';     label.del_ML11 = 'shape coefficient for TL tadpole at 1.1 cm'; 
par.del_ML14 = 0.19736;  free.del_ML14 = 1;   units.del_ML14 = '-';     label.del_ML14 = 'shape coefficient for TL tadpole at 1.4 cm'; 
par.del_ML17 = 0.12676;  free.del_ML17 = 1;   units.del_ML17 = '-';     label.del_ML17 = 'shape coefficient for TL tadpole at 1.7 cm'; 
par.del_ML20 = 0.10612;  free.del_ML20 = 1;   units.del_ML20 = '-';     label.del_ML20 = 'shape coefficient for TL tadpole at 2.0 cm'; 
par.del_ML23 = 0.10483;  free.del_ML23 = 1;   units.del_ML23 = '-';     label.del_ML23 = 'shape coefficient for TL tadpole at 2.3 cm'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tL = 1;         free.f_tL  = 0;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 
par.t_0 = -2.0295;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time till start of embryo development'; 
par.z_m = 1.5744;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for male'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
