function [par, metaPar, txtPar] = pars_init_Clupanodon_thrissa(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.9178;       free.z     = 1;   units.z = '-';            label.z = 'zomm factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, specific food searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'defecation efficiency'; 
par.v = 0.023118;     free.v     = 1;   units.v = 'cm/d';         label.v = 'engery conductance'; 
par.kap = 0.95216;    free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 25.2081;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec. somatic maintenance'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surfave area-spec. som maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maintenan rate coefficent'; 
par.E_G = 5233.0742;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec costs for structure'; 
par.E_Hb = 5.719e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.895e+00; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at end of acceleration'; 
par.E_Hp = 8.224e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.893e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.23503;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response'; 
par.f_0500 = 0.70621; free.f_0500 = 1;  units.f_0500 = '-';       label.f_0500 = 'scaled functional response for tL data at 0500 d'; 
par.f_0750 = 0.72309; free.f_0750 = 1;  units.f_0750 = '-';       label.f_0750 = 'scaled functional response for tL data at 0750 d'; 
par.f_1000 = 0.67052; free.f_1000 = 1;  units.f_1000 = '-';       label.f_1000 = 'scaled functional response for tL data at 1000 d'; 
par.f_1500 = 0.69631; free.f_1500 = 1;  units.f_1500 = '-';       label.f_1500 = 'scaled functional response for tL data at 1500 d'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
