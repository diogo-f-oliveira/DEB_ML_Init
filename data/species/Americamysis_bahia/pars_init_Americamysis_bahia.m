function [par, metaPar, txtPar] = pars_init_Americamysis_bahia(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 11610;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temp'; 
par.z = 0.082353;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.010637;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.91206;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 2097.09;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.17056;    free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4321.6911;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.125e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 5.141e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 3.461e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.101e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.14524;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.del_M_G = 0.1256;  free.del_M_G = 0;   units.del_M_G = '-';      label.del_M_G = 'shape coefficient in GreaGutj2011; measurement: tip of uropod to tip of antennal scale'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for tL_f and tL_m data'; 
par.f_DL1 = 0.59977;  free.f_DL1 = 1;   units.f_DL1 = '-';        label.f_DL1 = 'scaled functional response for GreaGutj2011 data'; 
par.f_DL2 = 0.69823;  free.f_DL2 = 1;   units.f_DL2 = '-';        label.f_DL2 = 'scaled functional response for GreaGutj2011 data'; 
par.f_DL3 = 0.77681;  free.f_DL3 = 1;   units.f_DL3 = '-';        label.f_DL3 = 'scaled functional response for GreaGutj2011 data'; 
par.f_DL4 = 0.8106;   free.f_DL4 = 1;   units.f_DL4 = '-';        label.f_DL4 = 'scaled functional response for GreaGutj2011 data'; 
par.f_Kuh = 0.97083;  free.f_Kuh = 1;   units.f_Kuh = '-';        label.f_Kuh = 'scaled functional response for Kuhn2001'; 
par.f_MK1 = 0.71688;  free.f_MK1 = 1;   units.f_MK1 = '-';        label.f_MK1 = 'scaled functional response for McKe1987 food regime 1'; 
par.f_MK2 = 0.80292;  free.f_MK2 = 1;   units.f_MK2 = '-';        label.f_MK2 = 'scaled functional response for McKe1987 food regime 2'; 
par.f_MK3 = 0.87201;  free.f_MK3 = 1;   units.f_MK3 = '-';        label.f_MK3 = 'scaled functional response for McKe1987 food regime 3'; 
par.f_MK4 = 0.88406;  free.f_MK4 = 1;   units.f_MK4 = '-';        label.f_MK4 = 'scaled functional response for McKe1987 food regime 4'; 
par.f_Sca_f = 0.4216;  free.f_Sca_f = 1;   units.f_Sca_f = '-';      label.f_Sca_f = 'scaled functional response for ScarStee2017'; 
par.f_Sca_m = 0.73088;  free.f_Sca_m = 1;   units.f_Sca_m = '-';      label.f_Sca_m = 'scaled functional response for ScarStee2017'; 
par.f_data1 = 0.8603;  free.f_data1 = 1;   units.f_data1 = '-';      label.f_data1 = 'scaled functional response for data1'; 
par.f_data2 = 1.0308;  free.f_data2 = 1;   units.f_data2 = '-';      label.f_data2 = 'scaled functional response for data2'; 
par.f_data3 = 1.022;  free.f_data3 = 1;   units.f_data3 = '-';      label.f_data3 = 'scaled functional response for data3'; 
par.f_data4 = 0.98523;  free.f_data4 = 1;   units.f_data4 = '-';      label.f_data4 = 'scaled functional response for data4'; 
par.z_m = 0.07614;    free.z_m   = 0;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
