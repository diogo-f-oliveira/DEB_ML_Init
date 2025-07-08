function [par, metaPar, txtPar] = pars_init_Aporrectodea_caliginosa(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 7976;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.44571;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 65.8979;    free.F_m   = 1;   units.F_m = 'g/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.258;    free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.018505;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.4373;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.475;    free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 1680.0973;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002793;   free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 6880.3277;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.063e+01; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 1.167e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.258e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.L0 = 0.26126;     free.L0    = 1;   units.L0 = '-';           label.L0 = 'initial structural length in adults from Holm2001'; 
par.T_AH = 28750;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature for upper boundary'; 
par.T_H = 293.2;      free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'upper boundary'; 
par.Wwg = 0.34921;    free.Wwg   = 1;   units.Wwg = 'g';          label.Wwg = 'fresh weight of gut content in Holm2001'; 
par.bw = 0.73733;     free.bw    = 1;   units.bw = '-';           label.bw = 'distribution width for diapause'; 
par.del_M = 0.066193;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Bart_high = 1.1011;  free.f_Bart_high = 1;   units.f_Bart_high = '-';  label.f_Bart_high = 'scaled functional response for high food conditions of Bart2019 - 3g horse dung)'; 
par.f_Bart_high_b = 0.89424;  free.f_Bart_high_b = 1;   units.f_Bart_high_b = '-';  label.f_Bart_high_b = 'scaled functional response for medium food conditions of Bart2019 - 1.5g horse dung - paired worms)'; 
par.f_Bart_low = 0.94424;  free.f_Bart_low = 1;   units.f_Bart_low = '-';   label.f_Bart_low = 'scaled functional response for low food conditions of Bart2019 - 1g horse dung)'; 
par.f_Bart_low_b = 0.75832;  free.f_Bart_low_b = 1;   units.f_Bart_low_b = '-';  label.f_Bart_low_b = 'scaled functional response for low food conditions of Bart2019 - 1g horse dung - paired worms)'; 
par.f_Bart_medium = 0.97925;  free.f_Bart_medium = 1;   units.f_Bart_medium = '-';  label.f_Bart_medium = 'scaled functional response for high food conditions of Bart2019 - 3g horse dung)'; 
par.m_0 = 8.6098;     free.m_0   = 1;   units.m_0 = '';           label.m_0 = 'moisture threshold for movement'; 
par.max_r_mb = 77.8891;  free.max_r_mb = 1;   units.max_r_mb = 'cm/d';  label.max_r_mb = 'maximum moisture dependent movement rate'; 
par.mu_OM = 186.2;    free.mu_OM = 0;   units.mu_OM = 'J/g.%';    label.mu_OM = 'soil organic matter from percent to joule/gram'; 
par.mu_c = 190;       free.mu_c  = 0;   units.mu_c = 'J/g';       label.mu_c = 'mass coupler energy - cast weight'; 
par.r_mb = 5.6028;    free.r_mb  = 1;   units.r_mb = 'cm/d';      label.r_mb = 'moisture dependent movement rate'; 
par.t_0 = 39.6592;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development'; 
par.wV = 5.8976;      free.wV    = 1;   units.wV = 'g /cm^3';     label.wV = 'reserve contribution to weight - water replacement at reserve depletion'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_V = 0.26307;    free.d_V   = 1;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
