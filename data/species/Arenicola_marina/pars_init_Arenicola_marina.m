function [par, metaPar, txtPar] = pars_init_Arenicola_marina(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 3800;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.66898;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.0097941;    free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.91814;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 15.8222;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4127.3773;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.278e-03; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.941e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 1.045e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 6.694e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Htr = 8.438e-04; free.E_Htr = 1;   units.E_Htr = 'J';        label.E_Htr = 'maturity at trochophore larva stage'; 
par.del_MTL = 0.20492;  free.del_MTL = 1;   units.del_MTL = '-';      label.del_MTL = 'shape coefficient for trunk length'; 
par.del_MTL_dewilde = 0.13873;  free.del_MTL_dewilde = 1;   units.del_MTL_dewilde = '-';  label.del_MTL_dewilde = 'shape coefficient for trunk length_dewilde'; 
par.del_Me = 0.66;    free.del_Me = 0;   units.del_Me = '-';       label.del_Me = 'shape coefficient for embryo (mean shape coeff. between time at fertilization and time at birth)'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_dewilde2 = 0.1;  free.f_dewilde2 = 0;   units.f_dewilde2 = '-';   label.f_dewilde2 = 'scaled functional response for de wilde data unfed'; 
par.f_field = 0.8;    free.f_field = 0;   units.f_field = '-';      label.f_field = 'scaled functional response for field'; 
par.f_pat1 = 0.93415;  free.f_pat1 = 1;   units.f_pat1 = '-';       label.f_pat1 = 'scaled functional response for 1-var data of olive (fed)'; 
par.f_pat2 = 0.3544;  free.f_pat2 = 1;   units.f_pat2 = '-';       label.f_pat2 = 'scaled functional response for 1-var data of olive (unfed)'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
