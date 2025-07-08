function [par, metaPar, txtPar] = pars_init_Ctenophorus_adelaidensis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 9677.4014;  free.T_A   = 1;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 1.429;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.017183;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.90838;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 157.7638;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7838.7028;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 2.476e+02; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.572e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.139e-08;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.del_M = 0.24937;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient'; 
par.f = 0.87611;      free.f     = 1;   units.f = '-';            label.f = 'scaled functional response for 0-var (wild) data'; 
par.f_Lab = 1;        free.f_Lab = 0;   units.f_Lab = '-';        label.f_Lab = 'scaled functional response for 1-var data'; 
par.f_wild = 0.69165;  free.f_wild = 1;   units.f_wild = '-';       label.f_wild = 'scaled functional response for wild 1-var data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.mu_N = 0;         free.mu_N  = 0;   units.mu_N = 'J/ mol';    label.mu_N = 'chemical potential of N-waste'; 
par.n_CN = 0;         free.n_CN  = 0;   units.n_CN = '-';         label.n_CN = 'chem. index of carbon in N-waste'; 
par.n_HN = 3;         free.n_HN  = 0;   units.n_HN = '-';         label.n_HN = 'chem. index of hydrogen in N-waste'; 
par.n_ON = 0;         free.n_ON  = 0;   units.n_ON = '-';         label.n_ON = 'chem. index of oxygen in N-waste'; 
par.n_NN = 1;         free.n_NN  = 0;   units.n_NN = '-';         label.n_NN = 'chem. index of nitrogen in N-waste'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
