function [par, metaPar, txtPar] = pars_init_Eubranchipus_grubii(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.11721;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.020888;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.97505;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 9950.8794;  free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4444.9977;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.528e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.147e-04; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 2.363e-02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 2.729e-03;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.057186;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f0_05 = 0.10627;  free.f0_05 = 1;   units.f0_05 = '-';        label.f0_05 = 'scaled functional response for tL data high food at 05 d'; 
par.f0_10 = 1.6264;   free.f0_10 = 1;   units.f0_10 = '-';        label.f0_10 = 'scaled functional response for tL data high food at 10 d'; 
par.f0_20 = 1.4664;   free.f0_20 = 1;   units.f0_20 = '-';        label.f0_20 = 'scaled functional response for tL data high food at 20 d'; 
par.f0_40 = 0.3181;   free.f0_40 = 1;   units.f0_40 = '-';        label.f0_40 = 'scaled functional response for tL data high food at 40 d'; 
par.f1_05 = 0.068897;  free.f1_05 = 1;   units.f1_05 = '-';        label.f1_05 = 'scaled functional response for tL data low food at 05 d'; 
par.f1_10 = 0.63451;  free.f1_10 = 1;   units.f1_10 = '-';        label.f1_10 = 'scaled functional response for tL data low food at 10 d'; 
par.f1_20 = 0.99847;  free.f1_20 = 1;   units.f1_20 = '-';        label.f1_20 = 'scaled functional response for tL data low food at 20 d'; 
par.f1_40 = 0.32958;  free.f1_40 = 1;   units.f1_40 = '-';        label.f1_40 = 'scaled functional response for tL data low food at 40 d'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
