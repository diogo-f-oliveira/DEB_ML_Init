function [par, metaPar, txtPar] = pars_init_Xenopus_laevis(metaData)

metaPar.model = 'std'; 

%% reference parameter (not to be changed) 
par.T_ref = 293.15;   free.T_ref = 0;   units.T_ref = 'K';        label.T_ref = 'Reference temperature'; 

%% core primary parameters 
par.T_A = 7315;       free.T_A   = 0;   units.T_A = 'K';          label.T_A = 'Arrhenius temperature'; 
par.z = 4.516;        free.z     = 1;   units.z = '-';            label.z = 'zoom factor for females'; 
par.F_m = 6.5;        free.F_m   = 0;   units.F_m = 'l/d.cm^2';   label.F_m = '{F_m}, max spec searching rate'; 
par.kap_X = 0.8;      free.kap_X = 0;   units.kap_X = '-';        label.kap_X = 'digestion efficiency of food to reserve'; 
par.kap_P = 0.1;      free.kap_P = 0;   units.kap_P = '-';        label.kap_P = 'faecation efficiency of food to faeces'; 
par.v = 0.1056;       free.v     = 1;   units.v = 'cm/d';         label.v = 'energy conductance'; 
par.kap = 0.7712;     free.kap   = 1;   units.kap = '-';          label.kap = 'allocation fraction to soma';
par.kap_R = 0.95;     free.kap_R = 0;   units.kap_R = '-';        label.kap_R = 'reproduction efficiency'; 
par.p_M = 152.8;      free.p_M   = 1;   units.p_M = 'J/d.cm^3';   label.p_M = '[p_M], vol-spec somatic maint'; 
par.p_T = 0;          free.p_T   = 0;   units.p_T = 'J/d.cm^2';   label.p_T = '{p_T}, surf-spec somatic maint'; 
par.k_J = 0.002;      free.k_J   = 0;   units.k_J = '1/d';        label.k_J = 'maturity maint rate coefficient'; 
par.E_G = 7330;       free.E_G   = 1;   units.E_G = 'J/cm^3';     label.E_G = '[E_G], spec cost for structure'; 
par.E_Hb = 9.482;     free.E_Hb  = 1;   units.E_Hb = 'J';         label.E_Hb = 'maturity at birth'; 
par.E_Hp = 4.821e+05; free.E_Hp  = 1;   units.E_Hp = 'J';         label.E_Hp = 'maturity at puberty'; 
par.h_a = 6.461e-11;  free.h_a   = 1;   units.h_a = '1/d^2';      label.h_a = 'Weibull aging acceleration'; 
par.s_G = 0.0001;     free.s_G   = 0;   units.s_G = '-';          label.s_G = 'Gompertz stress coefficient'; 

%% other parameters 
parV = [129.3 175.7 299 421.5 519.1 897.5 1421 1744 2111 2243 2381 2672 2826]; %parameter vector maturity at stages NF50 - NF62
for i = 1:13  
   E_Hx = ['E_H',num2str(i+49)];
   par.(E_Hx) = parV(i);
   free.(E_Hx)  = 1;   units.(E_Hx) = 'J';    label.(E_Hx) = ['maturity at stage NF',num2str(i+49)];    
end

par.E_Hh = 1.54;      free.E_Hh  = 1;   units.E_Hh = 'J';         label.E_Hh = 'maturity at hatch'; 
par.E_Hj = 3726;      free.E_Hj  = 1;   units.E_Hj = 'J';         label.E_Hj = 'maturity at metam'; 
par.del_M = 0.4411;   free.del_M = 1;   units.del_M = '-';        label.del_M = 'shape coefficient for frog'; 
par.del_Me = 0.2962;  free.del_Me = 1;  units.del_Me = '-';       label.del_Me = 'shape coefficient for SVL length for tadpole'; 
par.del_Meh = 0.2535; free.del_Meh = 1; units.del_Meh = '-';      label.del_Meh = 'shape coefficient for hind limp length of tadpole';
par.del_Mt = 0.1021;  free.del_Mt = 1;  units.del_Mt = '-';       label.del_Mt = 'shape coefficient for tadpole'; 
par.f = 1;            free.f     = 0;   units.f = '-';            label.f = 'scaled functional response for 0-var data'; 
par.f_tL = 0.8211;    free.f_tL  = 1;   units.f_tL = '-';         label.f_tL = 'scaled functional response for tL,tW data'; 
par.f_tad = 0.7526;   free.f_tad = 1;   units.f_tad = '-';        label.f_tad = 'scaled functional response for tadpole data'; 
par.f_tad1 = 0.9453;  free.f_tad1 = 1;  units.f_tad1 = '-';       label.f_tad1 = 'scaled functional response for tadpole data set 1'; 
par.f_tad2 = 0.9718;  free.f_tad2 = 1;  units.f_tad2 = '-';       label.f_tad2 = 'scaled functional response for tadpole data set 2'; 
par.f_tad3 = 1.239;   free.f_tad3 = 1;  units.f_tad3 = '-';       label.f_tad3 = 'scaled functional response for tadpole data set 3'; 
par.f_tad4 = 1.123;   free.f_tad4 = 1;  units.f_tad4 = '-';       label.f_tad4 = 'scaled functional response for tadpole data set 4'; 
par.f_tad5 = 1.248;   free.f_tad5 = 1;  units.f_tad5 = '-';       label.f_tad5 = 'scaled functional response for tadpole data set 5'; 
par.f_tad6 = 1.725;   free.f_tad6 = 1;  units.f_tad6 = '-';       label.f_tad6 = 'scaled functional response for tadpole data set 6'; 
par.f_tad7 = 2.537;   free.f_tad7 = 1;  units.f_tad7 = '-';       label.f_tad7 = 'scaled functional response for tadpole length weight data'; 

par.z_m = 3.103;      free.z_m   = 1;   units.z_m = '-';          label.z_m = 'zoom factor for males'; 

%% set chemical parameters from Kooy2010 
[par, units, label, free] = addchem(par, units, label, free, metaData.phylum, metaData.class); 

%% Pack output: 
txtPar.units = units; txtPar.label = label; par.free = free; 
