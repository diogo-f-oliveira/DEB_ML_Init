function [par, metaPar, txtPar] = pars_init_Procambarus_virginalis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 8000;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 2.2363;       free.z     = 1;   units.z = '-';            label.z = 'zoom factor'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.016734;     free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.85855;    free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma'; 
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 71.1561;    free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 4496.8609;  free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 1.339e+00; free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 5.465e+02; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 3.711e-07;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
par.E_Hh = 3.039e-02; free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.T_AH = 21000;     free.T_AH  = 0;   units.T_AH = 'K';         label.T_AH = 'Arrhenius temperature for high end of range'; 
par.T_AL = 18000;     free.T_AL  = 0;   units.T_AL = 'K';         label.T_AL = 'Arrhenius temperature for low end of range'; 
par.T_H = 305.15;     free.T_H   = 0;   units.T_H = 'K';          label.T_H = 'temperature for high end of range'; 
par.T_L = 288.15;     free.T_L   = 0;   units.T_L = 'K';          label.T_L = 'temperature for low end of range'; 
par.del_M = 0.18216;  free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for total length'; 
par.del_Mcl = 0.42845;  free.del_Mcl = 1;   units.del_Mcl = '-';      label.del_Mcl = 'shape coefficient for carapace length'; 
par.del_Mh = 0.1;     free.del_Mh = 1;   units.del_Mh = '-';       label.del_Mh = 'shape coefficient at hatching'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_Seit = 0.98199;  free.f_Seit = 1;   units.f_Seit = '-';       label.f_Seit = 'scaled functional response for SeitVilp2005 data'; 
par.f_tL1 = 1.5;      free.f_tL1 = 1;   units.f_tL1 = '-';        label.f_tL1 = 'scaled functional response for t-L data'; 
par.f_tL2 = 0.62233;  free.f_tL2 = 1;   units.f_tL2 = '-';        label.f_tL2 = 'scaled functional response for t-L data, second part'; 
par.f_tW = 0.4805;    free.f_tW  = 1;   units.f_tW = '-';         label.f_tW = 'scaled functional response for t-Ww data'; 
par.t_0 = 15.4739;    free.t_0   = 1;   units.t_0 = 'd';          label.t_0 = 'time at start development at T_ref'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
