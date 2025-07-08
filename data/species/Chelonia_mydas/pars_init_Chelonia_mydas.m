function [par, metaPar, txtPar] = pars_init_Chelonia_mydas(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 7680;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 50.4458;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.10569;      free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.72448;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 12.1377;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.0010805;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7845;       free.E_G   = 0;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 3.699e+04; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 2.359e+08; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 4.175e-11;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 3.384e+04; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatching'; 
par.T_AH = 95000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'high temp boundary'; 
par.T_H = 308.15;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'high Arrhenius temperature'; 
par.d_Y = 0.44;       free.d_Y   = 0;   units.d_Y = 'd';          label.d_Y = 'yolk dry to wet mass ratio'; 
par.del_MC = 0.39161;  free.del_MC = 1;   units.del_MC = '-';       label.del_MC = 'shape coefficient CCL'; 
par.del_MS = 0.49055;  free.del_MS = 1;   units.del_MS = '-';       label.del_MS = 'shape coefficient SCL'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for Li_ref data'; 
par.fB = 0.91863;     free.fB    = 1;   units.fB = '-';           label.fB = 'scaled functional response for clutch B'; 
par.fF = 1;           free.fF    = 1;   units.fF = '-';           label.fF = 'scaled functional response for clutch F'; 
par.fH = 0.70144;     free.fH    = 1;   units.fH = '-';           label.fH = 'scaled functional response for clutch H'; 
par.fN = 0.8;         free.fN    = 0;   units.fN = '-';           label.fN = 'scaled functional response for Ningaloo juvenile and adult data'; 
par.fX = 0.73524;     free.fX    = 1;   units.fX = '-';           label.fX = 'scaled functional response for clutch X'; 
par.t_0 = 35.2954;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time growth phase starts for embryo data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
