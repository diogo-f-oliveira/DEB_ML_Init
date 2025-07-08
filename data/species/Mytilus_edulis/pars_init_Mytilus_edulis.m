function [par, metaPar, txtPar] = pars_init_Mytilus_edulis(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 7022;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 4.8258;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 105.6;      free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.9485;   free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.0493;   free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.086596;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.99771;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 3.8361;     free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.00048254;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2348;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.455e-07; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.455e-07; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.E_Hp = 3.966e-01; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.591e-09;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.K_Y = 0.73597;    free.K_Y   = 1;   units.K_Y = 'mg/l';       label.K_Y = 'half sat constant for inorg matter'; 
par.T_AH = 31376;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature at upper boundary'; 
par.T_AL = 45430;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature at lower boundary'; 
par.T_H = 296;        free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'upper boundary'; 
par.T_L = 275;        free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'lower boundary'; 
par.del_M = 0.37506;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient after metam'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_0 = 0.47094;    free.f_0   = 1;   units.f_0 = '-';          label.f_0 = 'initial scaled functional response for tdL data'; 
par.f_tL = 1;         free.f_tL  = 0;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 
par.y_Ch_X = 0.7398;  free.y_Ch_X = 1;   units.y_Ch_X = 'mol/mol';  label.y_Ch_X = 'mol Chlorophyll per Cmol food'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
