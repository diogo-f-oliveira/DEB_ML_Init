function [par, metaPar, txtPar] = pars_init_Pinctada_margaritifera(metaData)

metaPar.model = 'abj'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 5523;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temp'; 
par.z = 0.22735;      free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 94.383;     free.F_m   = 1;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_M}, spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'defecation efficiency'; 
par.v = 0.0101504;    free.v     = 0;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.73848;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 6.1133;     free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec som maintenance'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surface area-spec som maint'; 
par.k_J = 0.00087479;  free.k_J   = 1;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 2424.3092;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.648e-05; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hj = 1.573e-02; free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at end of acceleration'; 
par.E_Hp = 2.184e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 5.248e-11;  free.h_a   = 0;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gomperts stress coefficient'; 

%% other parameters 
par.F_m_amph = 0.03895;  free.F_m_amph = 1;   units.F_m_amph = 'l.mg/d.mol';  label.F_m_amph = 'max spec searching rate'; 
par.F_m_isoc = 0.010196;  free.F_m_isoc = 1;   units.F_m_isoc = 'l.mg/d.mol';  label.F_m_isoc = 'max spec searching rate'; 
par.F_m_nitz = 0.4722;  free.F_m_nitz = 1;   units.F_m_nitz = 'l.mg/d.mol';  label.F_m_nitz = 'max spec searching rate'; 
par.F_mb = 1.4956;    free.F_mb  = 1;   units.F_mb = 'l/d.cm^2';  label.F_mb = '{F_mb}, max spec searching rate a larvae stage'; 
par.T_AH = 161000;    free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature for upper boundary'; 
par.T_AL = 139.7;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature for lower boundary'; 
par.T_H = 307.7;      free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'Upper temp boundary'; 
par.T_L = 286.2;      free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'Lower temp boundary'; 
par.del_M = 0.27564;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for shell height'; 
par.del_Mb = 0.98629;  free.del_Mb = 1;   units.del_Mb = '-';       label.del_Mb = 'shape coefficient shell diameter'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_WdJO = 2.2137;  free.f_WdJO = 1;   units.f_WdJO = '-';       label.f_WdJO = 'scaled functional response for WdJO data'; 
par.f_WdJO1 = 1.9969;  free.f_WdJO1 = 1;   units.f_WdJO1 = '-';      label.f_WdJO1 = 'scaled functional response for WdJO1 data'; 
par.f_lagoon = 0.28473;  free.f_lagoon = 1;   units.f_lagoon = '-';     label.f_lagoon = 'scaled functional response for S. Pouvreau in situ data'; 
par.f_tL = 1.061;     free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL1 data'; 
par.f_tL3 = 1.2977;   free.f_tL3 = 1;   units.f_tL3 = '-';        label.f_tL3 = 'scaled functional response for tL3 data'; 
par.f_tLC1 = 0.21768;  free.f_tLC1 = 1;   units.f_tLC1 = '-';       label.f_tLC1 = 'scaled functional response for tLC1 data'; 
par.f_tLC2 = 0.31161;  free.f_tLC2 = 1;   units.f_tLC2 = '-';       label.f_tLC2 = 'scaled functional response for tLC2 data'; 
par.f_tLC3 = 0.3485;  free.f_tLC3 = 1;   units.f_tLC3 = '-';       label.f_tLC3 = 'scaled functional response for tLC3 data'; 
par.f_tLC4 = 0.47262;  free.f_tLC4 = 1;   units.f_tLC4 = '-';       label.f_tLC4 = 'scaled functional response for tLC4 data'; 
par.p_Xm_amph = 158.6797;  free.p_Xm_amph = 1;   units.p_Xm_amph = 'J/d.cm^2';  label.p_Xm_amph = 'max spec ingestion rate'; 
par.p_Xm_isoc = 376.2518;  free.p_Xm_isoc = 1;   units.p_Xm_isoc = 'J/d.cm^2';  label.p_Xm_isoc = 'max spec ingestion rate'; 
par.p_Xm_nitz = 11.1193;  free.p_Xm_nitz = 1;   units.p_Xm_nitz = 'J/d.cm^2';  label.p_Xm_nitz = 'max spec ingestion rate'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
