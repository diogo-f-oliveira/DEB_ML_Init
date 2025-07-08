function [par, metaPar, txtPar] = pars_init_Caretta_caretta(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 7200;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 48.8834;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.067592;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.73925;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 11.2024;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.0011485;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7322;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.407e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 9.225e+07; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.112e-10;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 1.993e+04; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatching'; 
par.del_CCL_a = 0.3834;  free.del_CCL_a = 0;   units.del_CCL_a = '-';    label.del_CCL_a = 'CCL shape coefficient of adults'; 
par.del_CL = 0.31186;  free.del_CL = 1;   units.del_CL = '-';       label.del_CL = 'shape coefficient for Park1926 and HildHats1927'; 
par.del_SCL = 0.38997;  free.del_SCL = 0;   units.del_SCL = '-';      label.del_SCL = 'SCL shape coefficient'; 
par.del_SCL_a = 0.38364;  free.del_SCL_a = 0;   units.del_SCL_a = '-';    label.del_SCL_a = 'SCL shape coefficient of adults'; 
par.f = 0.809;        free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Lab = 1;        free.f_Lab = 0;   units.f_Lab = '-';        label.f_Lab = 'scaled functional response for 1-var data for captive reared'; 
par.t_0 = 12.79;      free.t_0   = 0;   units.t_0 = 'd';          label.t_0 = 'time growth phase starts for embryo data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_V = 0.28;       free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.28;       free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
