function [par, metaPar, txtPar] = pars_init_Python_regius(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 12.0438;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor for female'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.048298;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.86178;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 40.4475;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.001961;   free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7831.0844;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 4.930e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 7.115e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.064e-11;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.L_01 = 5.353;     free.L_01  = 0;   units.L_01 = 'cm';        label.L_01 = 'initial structural length of 01'; 
par.L_02 = 5.643;     free.L_02  = 0;   units.L_02 = 'cm';        label.L_02 = 'initial structural length of 02'; 
par.L_03 = 5.989;     free.L_03  = 0;   units.L_03 = 'cm';        label.L_03 = 'initial structural length of 03'; 
par.L_04 = 5.368;     free.L_04  = 0;   units.L_04 = 'cm';        label.L_04 = 'initial structural length of 04'; 
par.L_05 = 6.446;     free.L_05  = 0;   units.L_05 = 'cm';        label.L_05 = 'initial structural length of 05'; 
par.L_06 = 8.589;     free.L_06  = 0;   units.L_06 = 'cm';        label.L_06 = 'initial structural length of 06'; 
par.L_07 = 7.025;     free.L_07  = 0;   units.L_07 = 'cm';        label.L_07 = 'initial structural length of 07'; 
par.L_08 = 8.589;     free.L_08  = 0;   units.L_08 = 'cm';        label.L_08 = 'initial structural length of 08'; 
par.L_13 = 9.085;     free.L_13  = 0;   units.L_13 = 'cm';        label.L_13 = 'initial structural length of 13'; 
par.del_M = 0.087064;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.e_01 = 0.8;       free.e_01  = 0;   units.e_01 = '-';         label.e_01 = 'scaled reserve density of 01'; 
par.e_02 = 0.8;       free.e_02  = 0;   units.e_02 = '-';         label.e_02 = 'scaled reserve density of 02'; 
par.e_03 = 0.8;       free.e_03  = 0;   units.e_03 = '-';         label.e_03 = 'scaled reserve density of 03'; 
par.e_04 = 0.8;       free.e_04  = 0;   units.e_04 = '-';         label.e_04 = 'scaled reserve density of 04'; 
par.e_05 = 0.8;       free.e_05  = 0;   units.e_05 = '-';         label.e_05 = 'scaled reserve density of 05'; 
par.e_06 = 0.8;       free.e_06  = 0;   units.e_06 = '-';         label.e_06 = 'scaled reserve density of 06'; 
par.e_07 = 0.8;       free.e_07  = 0;   units.e_07 = '-';         label.e_07 = 'scaled reserve density of 07'; 
par.e_08 = 0.8;       free.e_08  = 0;   units.e_08 = '-';         label.e_08 = 'scaled reserve density of 08'; 
par.e_13 = 0.8;       free.e_13  = 0;   units.e_13 = '-';         label.e_13 = 'scaled reserve density of 13'; 
par.f = 0.85;         free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.kap_X_01 = 0.95;  free.kap_X_01 = 0;   units.kap_X_01 = '-';     label.kap_X_01 = 'digestion efficiency of 01'; 
par.kap_X_03 = 0.5514;  free.kap_X_03 = 0;   units.kap_X_03 = '-';     label.kap_X_03 = 'digestion efficiency of 03'; 
par.kap_X_04 = 0.65;  free.kap_X_04 = 0;   units.kap_X_04 = '-';     label.kap_X_04 = 'digestion efficiency of 04'; 
par.kap_X_05 = 0.5809;  free.kap_X_05 = 0;   units.kap_X_05 = '-';     label.kap_X_05 = 'digestion efficiency of 05'; 
par.kap_X_07 = 0.65;  free.kap_X_07 = 0;   units.kap_X_07 = '-';     label.kap_X_07 = 'digestion efficiency of 07'; 
par.z_m = 10.9151;    free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for male'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
