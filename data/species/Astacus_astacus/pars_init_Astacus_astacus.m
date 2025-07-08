function [par, metaPar, txtPar] = pars_init_Astacus_astacus(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 3.0813;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.02285;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.90624;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 42.6233;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4435.9809;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.884e+00; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 6.697e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 6.323e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 1.300e+00; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatching'; 
par.E_Hpm = 2.680e+03; free.E_Hpm = 1;   units.E_Hpm = 'J';        label.E_Hpm = 'maturity at puberty for males'; 
par.del_M = 0.24655;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for total length'; 
par.del_MC = 0.547;   free.del_MC = 1;   units.del_MC = '-';       label.del_MC = 'shape coefficient for carapace length'; 
par.del_Mh = 0.15289;  free.del_Mh = 1;   units.del_Mh = '-';       label.del_Mh = 'shape coefficient for total length at hatching and birth'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_BastM1 = 0.83269;  free.f_BastM1 = 1;   units.f_BastM1 = '-';     label.f_BastM1 = 'scaled functional response for Otocac, meat diet'; 
par.f_BastM2 = 0.47488;  free.f_BastM2 = 1;   units.f_BastM2 = '-';     label.f_BastM2 = 'scaled functional response for Otocac, meat diet'; 
par.f_BastV1 = 0.74982;  free.f_BastV1 = 1;   units.f_BastV1 = '-';     label.f_BastV1 = 'scaled functional response for Otocac, vegetable diet'; 
par.f_BastV2 = 0.53093;  free.f_BastV2 = 1;   units.f_BastV2 = '-';     label.f_BastV2 = 'scaled functional response for Otocac, vegetable diet'; 
par.f_Hudi = 1;       free.f_Hudi = 0;   units.f_Hudi = '-';       label.f_Hudi = 'scaled functional response for Medjimurje data'; 
par.f_Magu = 0.93464;  free.f_Magu = 1;   units.f_Magu = '-';       label.f_Magu = 'scaled functional response for naturally hatched'; 
par.f_Poli = 0.83188;  free.f_Poli = 1;   units.f_Poli = '-';       label.f_Poli = 'scaled functional response for advanced hatched'; 
par.t_0 = 39.8288;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 
par.z_m = 3.585;      free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
