function [par, metaPar, txtPar] = pars_init_Thalia_democratica(metaData)

metaPar.model = 'stf'; 

%% core primary parameters 
par.z = 0.0971;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 290.3;      free.F_m   = 1;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.4;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.06648;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.1;        free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 8000;       free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2088;       free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 0.5935;    free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth asexual stage'; 
par.E_Hp = 0.9943;    free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.963e-06;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 8;          free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hbs = 0.03146;  free.E_Hbs = 1;   units.E_Hbs = 'J';        label.E_Hbs = 'maturity at birth sexual stage'; 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 
par.del_M = 0.07946;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_LF = 0.5;       free.f_LF  = 0;   units.f_LF = '-';         label.f_LF = 'scaled functional response for f_LF'; 
par.f_LN = 1;         free.f_LN  = 0;   units.f_LN = '-';         label.f_LN = 'scaled functional response for f_LN'; 
par.f_LdL = 1;        free.f_LdL = 0;   units.f_LdL = '-';        label.f_LdL = 'scaled functional response for f_LdL'; 
par.f_WJX = 0.4094;   free.f_WJX = 1;   units.f_WJX = '-';        label.f_WJX = 'scaled functional response for f_JX'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class);
par.d_X = 0.2;        free.d_X   = 0;   units.d_X = 'g/cm^3';     label.d_X = 'specific density of food'; 


%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
