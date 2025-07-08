function [par, metaPar, txtPar] = pars_init_Polydactylus_macrochir(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 19.3938;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.02068;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.8;        free.kap   = 0;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 19.6906;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 5224.0302;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 5.126e-02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 5.155e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 2.987e+04; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 8.783e-10;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.10638;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Bri = 0.57497;  free.f_Bri = 1;   units.f_Bri = '-';        label.f_Bri = 'scaled functional response for tL_Bri data'; 
par.f_Cha = 0.5519;   free.f_Cha = 1;   units.f_Cha = '-';        label.f_Cha = 'scaled functional response for tL_Cha data'; 
par.f_Der = 0.56654;  free.f_Der = 1;   units.f_Der = '-';        label.f_Der = 'scaled functional response for tL_Der data'; 
par.f_Eig = 0.54857;  free.f_Eig = 1;   units.f_Eig = '-';        label.f_Eig = 'scaled functional response for tL_Eig data'; 
par.f_Fit = 0.65794;  free.f_Fit = 1;   units.f_Fit = '-';        label.f_Fit = 'scaled functional response for tL_Fit data'; 
par.f_Fli = 0.52864;  free.f_Fli = 1;   units.f_Fli = '-';        label.f_Fli = 'scaled functional response for tL_Fli data'; 
par.f_Mar = 0.56087;  free.f_Mar = 1;   units.f_Mar = '-';        label.f_Mar = 'scaled functional response for tL_Mar data'; 
par.f_Roe = 0.60649;  free.f_Roe = 1;   units.f_Roe = '-';        label.f_Roe = 'scaled functional response for tL_Roe data'; 
par.f_Rop = 0.63242;  free.f_Rop = 1;   units.f_Rop = '-';        label.f_Rop = 'scaled functional response for tL_Rop data'; 
par.f_Spr = 0.52663;  free.f_Spr = 1;   units.f_Spr = '-';        label.f_Spr = 'scaled functional response for tL_Spr data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
