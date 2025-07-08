function [par, metaPar, txtPar] = pars_init_Pelagia_noctiluca(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 11270;      free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.5728;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 18.73;      free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.018466;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.56812;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 161.4144;   free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 261.2661;   free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 9.840e-04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 3.887e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 4.383e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.269e-14;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.W0A = 3.8;        free.W0A   = 0;   units.W0A = 'g';          label.W0A = 'initial wet weight for tWwA data'; 
par.W0B = 4.1;        free.W0B   = 0;   units.W0B = 'g';          label.W0B = 'initial wet weight for tWwB data'; 
par.W0C = 2.6;        free.W0C   = 0;   units.W0C = 'g';          label.W0C = 'initial wet weight for tWwC data'; 
par.Wd0 = 1.1;        free.Wd0   = 0;   units.Wd0 = 'g';          label.Wd0 = 'dry weight for TJO and TJN data'; 
par.d_VC = 0.003;     free.d_VC  = 0;   units.d_VC = 'g/cm^3';    label.d_VC = 'carbon density of structure'; 
par.d_VN = 0.001;     free.d_VN  = 0;   units.d_VN = 'g/cm^3';    label.d_VN = 'nitrogen density of structure'; 
par.del_M1 = 0.16277;  free.del_M1 = 1;   units.del_M1 = '-';       label.del_M1 = 'shape coefficient for bell diameter rhopalia to rhopalia'; 
par.del_M2 = 0.08676;  free.del_M2 = 1;   units.del_M2 = '-';       label.del_M2 = 'shape coefficient for bell diameter lappet to lappet'; 
par.del_W = 3.8246;   free.del_W = 1;   units.del_W = '-';        label.del_W = 'dry - ash free dry weight ratio'; 
par.del_Y = 1.7555;   free.del_Y = 1;   units.del_Y = '-';        label.del_Y = 'shape coefficient for egg'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_A = 0.46;       free.f_A   = 0;   units.f_A = '-';          label.f_A = 'scaled functional response for tWwA data'; 
par.f_B = 0.42;       free.f_B   = 0;   units.f_B = '-';          label.f_B = 'scaled functional response for tWwB data'; 
par.f_C = 0.45;       free.f_C   = 0;   units.f_C = '-';          label.f_C = 'scaled functional response for tWwC data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 
par.d_V = 0.01;       free.d_V   = 0;   units.d_V = 'g/cm^3';     label.d_V = 'specific density of structure'; 
par.d_E = 0.01;       free.d_E   = 0;   units.d_E = 'g/cm^3';     label.d_E = 'specific density of reserve'; 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
