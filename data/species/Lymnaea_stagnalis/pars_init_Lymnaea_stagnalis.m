function [par, metaPar, txtPar] = pars_init_Lymnaea_stagnalis(metaData)

metaPar.model = 'abj'; 

%% core primary parameters 
par.z = 0.2959;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.01394;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.6876;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.475;    free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 58.57;      free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 3900;       free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 0.285;     free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 50.1;      free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 496.6;     free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.287e-05;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.L_0 = 0.4343;     free.L_0   = 1;   units.L_0 = 'cm';         label.L_0 = 'initial structural length in tL_100, tL_50, tL_25 data'; 
par.L_0A = 0.9866;    free.L_0A  = 1;   units.L_0A = 'cm';        label.L_0A = 'initial structural length in A till D data'; 
par.L_0BohlJoos1982 = 0.694;  free.L_0BohlJoos1982 = 1;   units.L_0BohlJoos1982 = 'cm';  label.L_0BohlJoos1982 = 'initial structural length in D data'; 
par.L_0FLE = 0.05;    free.L_0FLE = 1;   units.L_0FLE = 'cm';      label.L_0FLE = 'initial structural length in tL_FLE data'; 
par.N_0 = 50;         free.N_0   = 1;   units.N_0 = '#';          label.N_0 = 'initial cumulative # of eggs in tN_A till tN_D data'; 
par.N_100 = 20;       free.N_100 = 1;   units.N_100 = '#';        label.N_100 = 'initial cumulative # of eggs in tN_100 data'; 
par.N_25 = 20;        free.N_25  = 1;   units.N_25 = '#';         label.N_25 = 'initial cumulative # of eggs in tN_25 data'; 
par.N_50 = 20;        free.N_50  = 1;   units.N_50 = '#';         label.N_50 = 'initial cumulative # of eggs in tN_50 data'; 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 
par.del_M = 0.341;    free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_100 = 1.292;    free.f_100 = 1;   units.f_100 = '-';        label.f_100 = 'scaled functional response for tL_100 data'; 
par.f_25 = 0.617;     free.f_25  = 1;   units.f_25 = '-';         label.f_25 = 'scaled functional response for tL_25 data'; 
par.f_50 = 0.823;     free.f_50  = 1;   units.f_50 = '-';         label.f_50 = 'scaled functional response for tL_50 data'; 
par.f_A = 1.964;      free.f_A   = 1;   units.f_A = '-';          label.f_A = 'scaled functional response for tL_A data'; 
par.f_B = 0.3155;     free.f_B   = 1;   units.f_B = '-';          label.f_B = 'scaled functional response for tL_B data'; 
par.f_BohlJoos1982 = 1.1;  free.f_BohlJoos1982 = 1;   units.f_BohlJoos1982 = '-';  label.f_BohlJoos1982 = 'scaled functional response for tL_BohlJoos1982 data'; 
par.f_C = 0.8873;     free.f_C   = 1;   units.f_C = '-';          label.f_C = 'scaled functional response for tL_C data'; 
par.f_D = 0.192;      free.f_D   = 1;   units.f_D = '-';          label.f_D = 'scaled functional response for tL_D data'; 
par.f_FLE = 1.286;    free.f_FLE = 1;   units.f_FLE = '-';        label.f_FLE = 'scaled functional response for tL_FLE data'; 
par.w_s = 0.35;       free.w_s   = 1;   units.w_s = '-';          label.w_s = 'contibution of shell in tWd_A till tWd_D data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
