function [par, metaPar, txtPar] = pars_init_Anser_anser(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.1279;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.024419;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.97605;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 7680.5894;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.32804;    free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7318.3232;  free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.781e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.360e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 6.290e-16;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.02;       free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hx = 8.491e+03; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at fledging'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_JOe = 0.48067;  free.f_JOe = 1;   units.f_JOe = '-';        label.f_JOe = 'scaled functional response for tJOe data'; 
par.f_We = 0.77058;   free.f_We  = 1;   units.f_We = '-';         label.f_We = 'scaled functional response for tWe data'; 
par.f_tW2_050 = 1.3395;  free.f_tW2_050 = 1;   units.f_tW2_050 = '-';    label.f_tW2_050 = 'scaled functional response for tW data S-line at 050 d'; 
par.f_tW2_075 = 0.95965;  free.f_tW2_075 = 1;   units.f_tW2_075 = '-';    label.f_tW2_075 = 'scaled functional response for tW data S-line at 075 d'; 
par.f_tW2_200 = 1.0878;  free.f_tW2_200 = 1;   units.f_tW2_200 = '-';    label.f_tW2_200 = 'scaled functional response for tW data S-line at 075 d'; 
par.f_tW3_050 = 1.2782;  free.f_tW3_050 = 1;   units.f_tW3_050 = '-';    label.f_tW3_050 = 'scaled functional response for tW data D-line at 050 d'; 
par.f_tW3_075 = 0.93464;  free.f_tW3_075 = 1;   units.f_tW3_075 = '-';    label.f_tW3_075 = 'scaled functional response for tW data D-line at 075 d'; 
par.f_tW3_200 = 1.0653;  free.f_tW3_200 = 1;   units.f_tW3_200 = '-';    label.f_tW3_200 = 'scaled functional response for tW data D-line at 075 d'; 
par.f_tW4_050 = 1.2945;  free.f_tW4_050 = 1;   units.f_tW4_050 = '-';    label.f_tW4_050 = 'scaled functional response for tW data SxD-line at 050 d'; 
par.f_tW4_075 = 0.95755;  free.f_tW4_075 = 1;   units.f_tW4_075 = '-';    label.f_tW4_075 = 'scaled functional response for tW data SxD-line at 075 d'; 
par.f_tW4_200 = 1.0558;  free.f_tW4_200 = 1;   units.f_tW4_200 = '-';    label.f_tW4_200 = 'scaled functional response for tW data SxD-line at 200 d'; 
par.f_tW5_050 = 1.2782;  free.f_tW5_050 = 1;   units.f_tW5_050 = '-';    label.f_tW5_050 = 'scaled functional response for tW data DxS-line at 050 d'; 
par.f_tW5_075 = 0.94906;  free.f_tW5_075 = 1;   units.f_tW5_075 = '-';    label.f_tW5_075 = 'scaled functional response for tW data DxS-line at 075 d'; 
par.f_tW5_200 = 1.0599;  free.f_tW5_200 = 1;   units.f_tW5_200 = '-';    label.f_tW5_200 = 'scaled functional response for tW data DxS-line at 200 d'; 
par.f_tW_50 = 1.219;  free.f_tW_50 = 1;   units.f_tW_50 = '-';      label.f_tW_50 = 'scaled functional response for tW data at 50 d'; 
par.f_tW_99 = 0.92469;  free.f_tW_99 = 1;   units.f_tW_99 = '-';      label.f_tW_99 = 'scaled functional response for tW data at 99 d'; 
par.t_0 = 4.4161;     free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development at T'; 
par.t_R = 1112.9666;  free.t_R   = 1;   units.t_R = 'd';          label.t_R = 'time since birth at first brood'; 
par.z_m = 3.2494;     free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
