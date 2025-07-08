function [par, metaPar, txtPar] = pars_init_Oryctolagus_cuniculus_NZW(metaData)

metaPar.model = 'stx'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 5.0465;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.89984;  free.kap_X = 1;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.037175;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.78078;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 1583.7059;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7814.8998;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 7.433e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hx = 1.733e+06; free.E_Hx  = 1;   units.E_Hx = 'J';         label.E_Hx = 'maturity at weaning'; 
par.E_Hp = 5.280e+06; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.288e-14;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.1;        free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 
par.t_0 = 9.9532e-07;  free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development, at T_ref'; 

%% other parameters 
par.E_Hpm = 9.822e+06; free.E_Hpm = 1;   units.E_Hpm = 'J';        label.E_Hpm = 'maturity at puberty for male'; 
par.E_R0 = 854.9337;  free.E_R0  = 1;   units.E_R0 = '-';         label.E_R0 = 'energy in repro buffer at the beginning of pregnancy'; 
par.K_del = 6.098;    free.K_del = 0;   units.K_del = '-';        label.K_del = 'half-saturation coeff for the pup saturation curve, not used'; 
par.del_M = 0.12155;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient crown-rump length'; 
par.del_M2 = 0.059928;  free.del_M2 = 1;   units.del_M2 = '-';       label.del_M2 = 'shape coefficient nose-tibia length'; 
par.del_upreg = 125.0226;  free.del_upreg = 1;   units.del_upreg = '-';    label.del_upreg = 'determines energy allocation to pups, can be dependand on max number of pups for upregulation'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_0154 = 0.87341;  free.f_0154 = 1;   units.f_0154 = '-';       label.f_0154 = 'f for pregnant females 0154'; 
par.f_0192 = 0.89802;  free.f_0192 = 1;   units.f_0192 = '-';       label.f_0192 = 'f for pregnant females 0192'; 
par.f_0203 = 0.92709;  free.f_0203 = 1;   units.f_0203 = '-';       label.f_0203 = 'f for pregnant females 0203'; 
par.f_0397 = 0.76856;  free.f_0397 = 1;   units.f_0397 = '-';       label.f_0397 = 'f for pregnant females 0397'; 
par.f_1085 = 0.84794;  free.f_1085 = 1;   units.f_1085 = '-';       label.f_1085 = 'f for pregnant females 1085'; 
par.f_Wwe = 0.47513;  free.f_Wwe = 1;   units.f_Wwe = '-';        label.f_Wwe = 'scaled functional response embryo data  ZaikDom2013 '; 
par.f_tWw1 = 1.0561;  free.f_tWw1 = 1;   units.f_tWw1 = '-';       label.f_tWw1 = 'scaled functional response for tW data from BergChaz1976'; 
par.f_tWw2 = 0.94004;  free.f_tWw2 = 1;   units.f_tWw2 = '-';       label.f_tWw2 = 'scaled functional response for tW data from MasoShap1986 MALES'; 
par.f_tWw3 = 0.9646;  free.f_tWw3 = 1;   units.f_tWw3 = '-';       label.f_tWw3 = 'scaled functional response for tW data from MasoShap1986 FEMALES'; 
par.f_tWw4 = 0.84084;  free.f_tWw4 = 1;   units.f_tWw4 = '-';       label.f_tWw4 = 'scaled functional response for tW data from Mahm2013 MALES single lactation'; 
par.f_tWw5 = 0.89595;  free.f_tWw5 = 1;   units.f_tWw5 = '-';       label.f_tWw5 = 'scaled functional response for tW data from Mahm2013 MALES double lactation'; 
par.f_tWw6 = 0.80268;  free.f_tWw6 = 1;   units.f_tWw6 = '-';       label.f_tWw6 = 'scaled functional response for tW data from Mahm2013 FEMALES single lactation'; 
par.f_tWw7 = 0.83235;  free.f_tWw7 = 1;   units.f_tWw7 = '-';       label.f_tWw7 = 'scaled functional response for tW data from Mahm2013 FEMALES double lactation'; 
par.kap_RL = 0.95;    free.kap_RL = 0;   units.kap_RL = '-';       label.kap_RL = 'milk production efficiency of the mother, and milk assimilation efficiency of the foetus; should be high (comments file)'; 
par.p_FAm = 576.1748;  free.p_FAm = 1;   units.p_FAm = 'J/d.cm^2';  label.p_FAm = 'foetus max surf-spec assimilation rate'; 
par.v_F = 0.022313;   free.v_F   = 1;   units.v_F = 'cm/d';       label.v_F = 'foetus energy conductance'; 
par.z_m = 5.048;      free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
