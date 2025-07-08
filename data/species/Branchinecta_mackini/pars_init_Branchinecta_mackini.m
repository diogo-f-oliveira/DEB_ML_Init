function [par, metaPar, txtPar] = pars_init_Branchinecta_mackini(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.065035;     free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.035328;     free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99151;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 5249.4211;  free.p_M   = 0;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4446.2746;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.670e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 2.743e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 1.353e+01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.319e-04;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.19488;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f70_00 = 1.0393;  free.f70_00 = 1;   units.f70_00 = '-';       label.f70_00 = 'scaled functional response for tL_70 data at 00 d'; 
par.f70_20 = 0.98198;  free.f70_20 = 1;   units.f70_20 = '-';       label.f70_20 = 'scaled functional response for tL_70 data at 20 d'; 
par.f70_40 = 1.6279;  free.f70_40 = 1;   units.f70_40 = '-';       label.f70_40 = 'scaled functional response for tL_70 data at 40 d'; 
par.f70_60 = 1.5521;  free.f70_60 = 1;   units.f70_60 = '-';       label.f70_60 = 'scaled functional response for tL_70 data at 60 d'; 
par.f71_00 = 1.0248;  free.f71_00 = 1;   units.f71_00 = '-';       label.f71_00 = 'scaled functional response for tL_71 data at 00 d'; 
par.f71_20 = 1.057;   free.f71_20 = 1;   units.f71_20 = '-';       label.f71_20 = 'scaled functional response for tL_71 data at 20 d'; 
par.f71_40 = 1.3994;  free.f71_40 = 1;   units.f71_40 = '-';       label.f71_40 = 'scaled functional response for tL_71 data at 40 d'; 
par.f71_60 = 1.2496;  free.f71_60 = 1;   units.f71_60 = '-';       label.f71_60 = 'scaled functional response for tL_71 data at 60 d'; 
par.f72_00 = 1.0276;  free.f72_00 = 1;   units.f72_00 = '-';       label.f72_00 = 'scaled functional response for tL_72 data at 00 d'; 
par.f72_20 = 1.0826;  free.f72_20 = 1;   units.f72_20 = '-';       label.f72_20 = 'scaled functional response for tL_72 data at 20 d'; 
par.f72_40 = 1.7446;  free.f72_40 = 1;   units.f72_40 = '-';       label.f72_40 = 'scaled functional response for tL_72 data at 40 d'; 
par.f72_60 = 1.5079;  free.f72_60 = 1;   units.f72_60 = '-';       label.f72_60 = 'scaled functional response for tL_72 data at 60 d'; 
par.z_m = 0.10576;    free.z_m   = 0;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
