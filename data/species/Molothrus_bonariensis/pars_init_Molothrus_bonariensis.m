function [par, metaPar, txtPar] = pars_init_Molothrus_bonariensis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.979;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.053149;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.82788;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 693.3265;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.028342;   free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7322.3734;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.162e+03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 3.054e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.013e-13;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.01;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 1.237e+04; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.fZ_00 = 0.39965;  free.fZ_00 = 1;   units.fZ_00 = '-';        label.fZ_00 = 'scaled functional response for tW2 data at 00 d'; 
par.fZ_02 = 2.5875;   free.fZ_02 = 1;   units.fZ_02 = '-';        label.fZ_02 = 'scaled functional response for tW2 data at 02 d'; 
par.fZ_04 = 1.9087;   free.fZ_04 = 1;   units.fZ_04 = '-';        label.fZ_04 = 'scaled functional response for tW2 data at 04 d'; 
par.fZ_06 = 1.8224;   free.fZ_06 = 1;   units.fZ_06 = '-';        label.fZ_06 = 'scaled functional response for tW2 data at 06 d'; 
par.fZ_08 = 0.96847;  free.fZ_08 = 1;   units.fZ_08 = '-';        label.fZ_08 = 'scaled functional response for tW2 data at 08 d'; 
par.f_00 = 0.020813;  free.f_00  = 1;   units.f_00 = '-';         label.f_00 = 'scaled functional response for tW data at 00 d'; 
par.f_03 = 3.191;     free.f_03  = 1;   units.f_03 = '-';         label.f_03 = 'scaled functional response for tW data at 03 d'; 
par.f_06 = 1.8707;    free.f_06  = 1;   units.f_06 = '-';         label.f_06 = 'scaled functional response for tW data at 06 d'; 
par.f_09 = 1.5539;    free.f_09  = 1;   units.f_09 = '-';         label.f_09 = 'scaled functional response for tW data at 09 d'; 
par.f_12 = 0.37209;   free.f_12  = 1;   units.f_12 = '-';         label.f_12 = 'scaled functional response for tW data at 12 d'; 
par.f_fm00 = 1.6254;  free.f_fm00 = 1;   units.f_fm00 = '-';       label.f_fm00 = 'scaled functional response for tW_fm data at 00 d'; 
par.f_fm03 = 2.6077;  free.f_fm03 = 1;   units.f_fm03 = '-';       label.f_fm03 = 'scaled functional response for tW_fm data at 03 d'; 
par.f_fm06 = 1.8493;  free.f_fm06 = 1;   units.f_fm06 = '-';       label.f_fm06 = 'scaled functional response for tW_fm data at 06 d'; 
par.f_fm09 = 1.0513;  free.f_fm09 = 1;   units.f_fm09 = '-';       label.f_fm09 = 'scaled functional response for tW_fm data at 09 d'; 
par.fz_00 = 2.0646;   free.fz_00 = 1;   units.fz_00 = '-';        label.fz_00 = 'scaled functional response for tW1 data at 00 d'; 
par.fz_02 = 2.6539;   free.fz_02 = 1;   units.fz_02 = '-';        label.fz_02 = 'scaled functional response for tW1 data at 02 d'; 
par.fz_04 = 2.817;    free.fz_04 = 1;   units.fz_04 = '-';        label.fz_04 = 'scaled functional response for tW1 data at 04 d'; 
par.fz_06 = 1.8545;   free.fz_06 = 1;   units.fz_06 = '-';        label.fz_06 = 'scaled functional response for tW1 data at 06 d'; 
par.fz_08 = 0.75348;  free.fz_08 = 1;   units.fz_08 = '-';        label.fz_08 = 'scaled functional response for tW1 data at 08 d'; 
par.t_R = 320;        free.t_R   = 0;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 2.0647;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
