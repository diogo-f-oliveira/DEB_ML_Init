function [par, metaPar, txtPar] = pars_init_Sterechinus_neumayeri(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 0.20235;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.004732;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.64955;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.85;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 37.4;       free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2351.7749;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 7.622e-06; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 5.776e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metamorphosis'; 
par.E_Hp = 2.296e+03; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 1.493e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.T_AH = 18224.075;  free.T_AH  = 1;   units.T_AH = 'K';         label.T_AH = 'Arrh. temp for upper boundary'; 
par.T_AL = 20000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrh. temp for lower boundary'; 
par.T_H = 293.5;      free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'Upper temp boundary'; 
par.T_L = 269.65;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'Lower temp boundary'; 
par.Ww_JO = 5;        free.Ww_JO = 0;   units.Ww_JO = 'g';        label.Ww_JO = 'wet weight for TJO data'; 
par.del_M = 0.5363;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for adult'; 
par.del_M_emb = 0.039183;  free.del_M_emb = 1;   units.del_M_emb = '-';    label.del_M_emb = 'shape coefficient for embryos'; 
par.del_M_lrv = 0.067424;  free.del_M_lrv = 1;   units.del_M_lrv = '-';    label.del_M_lrv = 'shape coefficient pluteus'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tL = 1;         free.f_tL  = 0;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL data'; 
par.f_tLf0 = 0.33521;  free.f_tLf0 = 1;   units.f_tLf0 = '-';       label.f_tLf0 = 'scaled functional response for tL_f0 data'; 
par.f_tLfa = 0.52796;  free.f_tLfa = 1;   units.f_tLfa = '-';       label.f_tLfa = 'scaled functional response for tL_fa data'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
