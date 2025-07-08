function [prdData, info] = predict_Daphnia_magna(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); kT_M = TC * k_M; % allmost all data at T_ref
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  TC_Tap = tempcorr(C2K(Tap(:,1)), T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b,  info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  Wd_0 = 1e6 * U_E0 * p_Am * w_E/ mu_E; % mug, initial dry weight

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Wd_b = 1e6 * L_b^3 * d_V * (1 + f * w); % mug, dry weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % weight at 37 mm
  Wd_37 = 1e6 * (0.37 * del_M)^3 * d_V * (1 + f * w); % mug, dry weight at 37 mm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T
  
  % males (used in ELw_m)
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap * E_m_m);            % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Wd0 = Wd_0;
  prdData.Wdb = Wd_b;
  prdData.Wd37 = Wd_37;
  
  % uni-variate data
  
  % LpX data
  Ep_X = p_Am/ kap_X * (del_M * LpX(:,1)) .^ 2;  
  
  
  % LJO data
  f=f_LJO;
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  pACSJGRD = L_m^2 * p_Am * scaled_power(del_M * LJO(:,1), f, pars_power, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJ_O = - J_M(:,3) * 32e6/ 24;       % mug/h, O2 flux
  %
  pACSJGRD = L_m^2 * p_Am * scaled_power(del_M * LJO_extra(:,1), f, pars_power, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJ_O_extra = - J_M(:,3) * 32e6/ 24; % mug/h, O2 flux

  
  % time-fecundity
  f = f_tN;
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % pars for cum_reprod
  EN = cum_reprod(tN(:,1), f, pars_R);

  % time-length
  % female  at f_tL
  f = f_tL; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; rT_B = TC_tL * k_M/ 3/ (1 + f/ g);
  ELw_f = (L_i - (L_i - L_b) * exp(- rT_B * tL_f(:,1)))/ del_M;
  % male  at f_tL
  tvel = get_tpm(pars_tpm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M; L_bm = L_mm * l_b*z/z_m; % cm, dorsal mantle length at time
  %L_bm = L_m * get_lb([g_m k v_Hb], f); L_im = L_mm * f; rT_Bm = TC_tL * k_M/ 3/ (1 + f/ g_m);
  %ELw_m = (L_im - (L_im - L_bm) * exp(- rT_Bm * tL_m(:,1)))/ del_M;
  % female  at f_tL1
  f = f_tL1; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; r_B = k_M/ 3/ (1 + f/ g);
  ELw_1 = (L_i - (L_i - L_b) * exp(- r_B * tL1(:,1)))/ del_M;
  % female at f_tL2
  f = f_tL2; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; r_B = k_M/ 3/ (1 + f/ g);
  ELw_2 = (L_i - (L_i - L_b) * exp(- r_B * tL2(:,1)))/ del_M;
  % female at f_tL3
  f = f_tL3; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; r_B = k_M/ 3/ (1 + f/ g);
  ELw_3 = (L_i - (L_i - L_b) * exp(- r_B * tL3(:,1)))/ del_M;
  % female at f_tL4
  f = f_tL4; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; r_B = k_M/ 3/ (1 + f/ g);
  ELw_4 = (L_i - (L_i - L_b) * exp(- r_B * tL4(:,1)))/ del_M;
  % female at f_tL5
  f = f_tL5; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; r_B = k_M/ 3/ (1 + f/ g);
  ELw_5 = (L_i - (L_i - L_b) * exp(- r_B * tL5(:,1)))/ del_M;
     
  % tS data
  [a LS] = ode23(@dbertLS_fm, [-1e-6; tS_f(:,1)], [L_b; 0.92; 0; 0], [], k_M, v, g, h_a, s_G);
  ES_f = LS(:,2); ES_f(1) = [];
  %
  [a LS] = ode23(@dbertLS_fm, [-1e-6; tS_m(:,1)], [L_bm; 1; 0; 0], [], k_M, v, g_m, h_a, s_Gm);
  ES_m = LS(:,2); ES_m(1) = [];

  % starvation data from Elen89
  %  situation is complicated by young in brood pouch, apart from reprod buffer
  %  present expectation does not account for this
  t3 = 0.0501; t4 = 2.0101; % times of brood 3 and 4
  ts  = sort([t3; t4; tWd(:,1)]); it3 = find(ts == t3); it4 = find(ts == t4);
  [ts LeeR] = ode23(@dget_LeeR, ts, [.37 * del_M; 1; eR0], [], v, g, L_T, k_M, kap_R, kap, k, u_Hp);
  eR3 = LeeR(it3,3); LeeR(:,3) = LeeR(:,3) - eR3 * (ts >= t3); 
  eR4 = LeeR(it4,3); LeeR(:,3) = LeeR(:,3) - eR4 * (ts >= t4); 
  LeeR([it3 it4],:) = []; 
  Ls = LeeR(:,1); es = sum(LeeR(:,[2 3]),2);
  %
  % assumption: 200 mug carapax has 
  %   50 mug Prot, 10 mug Carbo, 13 mug Lipid
  Wd_V = 1e6 * Ls.^3 * d_V; 
  EWd = 200 + Wd_V .* (1 + es * w); % mug
  EProt = 50 + Wd_V .* (n_Prot_V + es * w * n_Prot_E); % mug
  ECarb = 10 + Wd_V .* (n_Carb_V + es * w * n_Carb_E); % mug
  EGlyc = .2 + Wd_V .* (n_Glyc_V + es * w * n_Glyc_E); % mug
  ELipi = 13 + Wd_V .* (n_Lipi_V + es * w * n_Lipi_E); % mug
  ETrig = .1 + Wd_V .* (n_Trig_V + es * w * n_Trig_E); % mug
  
  
  % functional response data
  L= 0.275; %size reported for the incipient limiting experiment (Sokull-Kluettgen B. (1998) PhD Thesis, RWTH Aachen. p. 56). 
  xK = p_Am/ kap_X / (F_m*1000)  ;% half saturation constant, density given in mL 
  J_XL = p_Am/ kap_X * (del_M * L) .^ 2;  %maximum ingestion of a 2 mm daphnid
  Exf = mu_x2*J_XL* xf(:,1)./(xK * mu_x2+ xf(:,1));

  
  % tL-data and tN data from static experiment by Coors 
   % data at 0.2 mgC/d
   tX=0.2/mu_x2/80; %food density: 0.2 mgC/ added daily to 80mL of medium
   L0= L_01*del_M; 
   [t eL] = ode45(@dget_eL, tL_C1(:,1), [1; L0], [], xK, v, g, L_T, L_m, tX, p_Am, kap_X);  
   EL_C1 = eL(:,2)/del_M;    
   f= mean(eL(:,1)); %get calculated f (constant f=e is assumed)
   EN_C1 = cum_reprod(tN_C1(:,1), f, pars_R);  %reproduction
   
  
  % data at 0.075 mgC/d
  tX=0.075/mu_x2/80; %food density: 0.2 mgC/ added daily to 80mL of medium
  L0= L_02*del_M; 
  [t eL] = ode45(@dget_eL, tL_C2(:,1), [1; L0], [], xK, v, g, L_T, L_m, tX, p_Am, kap_X);
  EL_C2 = eL(:,2)/del_M;    
  f= mean(eL(:,1)); %get calculated f (constant f=e is assumed)  
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % pars for cum_reprod
  EN_C2 = cum_reprod(tN_C2(:,1), f, pars_R);  %reproduction
  
  % data at 0.05 mgC/d
  tX=0.05/mu_x2/80; %food density: 0.2 mgC/ added daily to 80mL of medium
  L0= L_03*del_M; 
  %[t eL] = ode45(@dget_eL, tL_C3(:,1), [1; L0], [], xK, v, g, L_T, L_m, tX, p_Am, kap_X); 
  %daphnids are assumed to increase their filtration rate at prolonged
  %conditons of low food availablity (see Lampert W. Limnol. Oceanogr., 39(5), 1994,997-1006):
  ff = fF_m; xK = p_Am/ kap_X / (F_m*1000) /fF_m; 
  [t eL] = ode45(@dget_eL1, tL_C3(:,1), [1; L0], [], xK, v, g, L_T, L_m, tX, p_Am, kap_X, F_m, ff); 
  EL_C3 = eL(:,2)/del_M; 
  f= mean(eL(:,1)); %get calculated f (constant f=e is assumed)
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % pars for cum_reprod
  EN_C3 = cum_reprod(tN_C3(:,1), f, pars_R);  %reproduction
 
 % tL-data and tN data from flow-through experiment by Sokull-Kluetgen 
  % data at 0.002 mgC/mL
  f = f_SK1; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; rT_B = TC_tL * k_M/ 3/ (1 + f/ g);
  ELw_SK1 = (L_i - (L_i - L_b) * exp(- rT_B * tL_SK1(:,1)))/ del_M; %growth  
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % pars for cum_reprod
  EN_SK1 = cum_reprod(tN_SK1(:,1), f, pars_R);  %reproduction

  % data at 0.0005 mgC/mL
  f = f_SK2; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; rT_B = TC_tL * k_M/ 3/ (1 + f/ g);
  ELw_SK2 = (L_i - (L_i - L_b) * exp(- rT_B * tL_SK2(:,1)))/ del_M; %growth  
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % pars for cum_reprod
  EN_SK2 = cum_reprod(tN_SK2(:,1), f, pars_R);  %reproduction
  
  
  % data at 0.0001 mgC/mL
  f = f_SK3; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; rT_B = TC_tL * k_M/ 3/ (1 + f/ g);
  ELw_SK3 = (L_i - (L_i - L_b) * exp(- rT_B * tL_SK3(:,1)))/ del_M; %growth  
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % pars for cum_reprod
  EN_SK3 = cum_reprod(tN_SK3(:,1), f, pars_R);  %reproduction
  
  % data at 0.00002 mgC/mL  
  f = f_SK4; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f; rT_B = TC_tL * k_M/ 3/ (1 + f/ g);  
  ELw_SK4 = (L_i - (L_i - L_b) * exp(- rT_B * tL_SK4(:,1)))/ del_M; %growth  
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % pars for cum_reprod
  EN_SK4 = cum_reprod(tN_SK4(:,1), f, pars_R);  %reproduction 
  
  % LFx data
  EL_X = F_m * (del_M * LFx(:,1)) .^ 2;
  
  %Length-dry weight L-Wd
  f=f_LW;
  L = LDw(:,1)* del_M; %structural length at time t 
  LWd = L.^3 *d_V*  (1 + f * w) ; % g, dry weight for juveniles   
  N=25; %number of offspring per brood increases with body size, however 25 might be good estimate (see e.g. Barata & Baird, Funct.Ecol. 1998, 12, 442-452)
  L = LDwA(:,1)* del_M;   
  LWdA = L.^3 *d_V*  (1 + f * w) +N*Wd_0/ 1e6; % g, dry weight for adults   Wd_0 
  
  % starvation data; here, starvation initiated at an assumed physical size of 0.13 cm:
  [tt, LEHS] =  ode45(@dget_LEHS, tS(:,1), [0.13*del_M; E_m; E_Hb; 1; L_b; E_Hb] ,[],...
    p_Am, v, p_M, E_G, kap, kap_G, k_J, s_shrink, 0);   
  
  % temperature-age at puberty 
  f=f_ap;   
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b,  info] = get_tp(pars_tp, f);
  Ea_p =  t_p/ k_M ./ TC_Tap; %
  % temperature-age at birth 
  Ea_b =  t_b/ k_M ./ TC_Tab + t_0./ TC_Tab; %time between broods = time till birth + time for egg production

  
  % pack to output
  prdData.LpX = Ep_X;
  prdData.LJO = EJ_O;
  prdData.LJO_extra = EJ_O_extra;
  prdData.tN = EN;
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.tL1 = ELw_1;
  prdData.tL2 = ELw_2;
  prdData.tL3 = ELw_3;
  prdData.tL4 = ELw_4;
  prdData.tL5 = ELw_5;
  prdData.tWd = EWd;
  prdData.tProt = EProt;
  prdData.tCarb = ECarb;
  prdData.tGlyc = EGlyc;
  prdData.tLipi = ELipi;
  prdData.tTrig = ETrig;
  prdData.tS_f = ES_f;
  prdData.tS_m = ES_m;  
  prdData.tL_SK1 = ELw_SK1;
  prdData.tN_SK1 = EN_SK1;
  prdData.tL_SK2 = ELw_SK2;
  prdData.tN_SK2 = EN_SK2;
  prdData.tL_SK3 = ELw_SK3;
  prdData.tN_SK3 = EN_SK3;
  prdData.tL_SK4 = ELw_SK4;
  prdData.tN_SK4 = EN_SK4;  
  prdData.tL_C1 = EL_C1 ; 
  prdData.tN_C1 = EN_C1;
  prdData.tL_C2 = EL_C2; 
  prdData.tN_C2 = EN_C2;
  prdData.tL_C3 = EL_C3; 
  prdData.tN_C3 = EN_C3;  
  prdData.LFx = EL_X;
  prdData.LDw = LWd;
  prdData.LDwA = LWdA;  
  prdData.tS = LEHS(:,4);
  prdData.Tab =  Ea_b;
  prdData.Tap =  Ea_p; 
  prdData.xf = Exf;

end

%% % SUBFUNCTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function LW = dget_LW(d_V,Wd_0) 


  L = LDw(:,1)* del_M;
  LWd = L.^3 *d_V*  (1 + f * w) +10*Wd_0/ 1e6; % g, dry weight 
  
end

function dLeeR = dget_LeeR (t, LeeR, v, g, L_T, k_M, kap_R, kap, k, u_Hp)
% starvation conditions; called by predict_Daphnia_magna
% unpack state variables
L = LeeR(1); L_m = v/ k_M/ g; l = L/ L_m; l_T = L_T/ L_m;
e = LeeR(2);  % [E]/ [E_m]
eR = LeeR(3); % [E_R]/ [E_m]

r = k_M * g * (e/ l - (1 + l_T/ l))/ (e + g); % spec growth rate
dL = L * r/ 3;
de = - e * v/ L; % starvation, assimilation = 0
deR = kap_R * g * k_M * ((1 - kap) * e * l^2 * (g + l + l_T)/ (g + e) - k * u_Hp)/ l^3;

dLeeR = [dL; de; deR];
  
end

function dLShq = dbertLS_fm(t, LShq, kM, v, g, ha, sG)
  
  L = LShq(1); S = LShq(2); h = LShq(3); q = LShq(4);
  ee = 1; LT = 0; Lm = v/ (kM * g);
  rB = 1/ (3/ kM + 3 * Lm/ v);
  r = v * (ee/ L - (1 + LT/ L)/ Lm)/ (ee + g);  
  dL = rB * (Lm - L);
  dq = (q * (L/ Lm)^3 * sG + ha) * (v/ L - r) - r * q;
  dh = q - h * r;
  dS = - S * h;
  dLShq = [dL; dS; dh; dq];
end


function dLEHS = dget_LEHS(t,LEHS,...
    p_Am, v, p_M, E_G, kap, kap_G, k_J,  s_shrink, f) 

% assumption: no metabolic acceleration
% the function will not handle re-growth

% unpack LEHRU
L   =  LEHS(1); % cm, volumetric structural length
E   =  LEHS(2); % J cm^{-3}, [E] reserve density
EH  =  LEHS(3); % J, E_H maturity
S   =  min(1,LEHS(4)); % survival probability
maxL = LEHS(5); % maximum length
maxEH = LEHS(6); % maximum maturity

L_m = kap * p_Am/ p_M; % cm, ultimate length
k_M = p_M/ E_G;  % 1/d, maturity maintenance rate coefficient
E_m = p_Am/ v;   % J/cm^3, max reserve density
l = L/ L_m; e = E/E_m;  % -, scaled structural length and scaled res. dens.

p_C = E * (E_G * v/ L + p_M)/ (kap * E + E_G );   % J/cm^3 (2.12, Kooy2010) specific mobilisation flux
dE =  (f * p_Am - E * v)/ L; % J day^{-1} cm^{-3} (2.10, Kooy2010)

% pp.42 comments DEB3 equ. 4.2
if e < l 
   r = (E * v/ L - p_M/ kap)/ (E + E_G * kap_G/ kap);
else
  r = (E * v/ L - p_M/ kap)/ (E + E_G/ kap);
end
dL  = L * r/ 3;

dmaxL = max(0,dL); % cm, max stuctural length
dEH = (1 - kap) * p_C * L^3 - k_J * EH; % J/d

dmaxEH = max(0,dEH); % J, max maturity

h_sh = s_shrink * k_M * max(0, maxL - L)/maxL;

dS = - S * h_sh; % 1/d, survival fraction

% pack state variables
dLEHS = [dL; dE; dEH; dS; dmaxL; dmaxEH];

end

function deL = dget_eL(t, eL, xK, v, g, L_T, L_m, tX, p_Am, kap_X)

  ee = eL(1); L = eL(2); % unpack variables
  r = v * (ee/L - (1 + L_T/ L)/ L_m)/ (ee + g); % 1/d, spec growth rate   
  f = (L.^2 * p_Am / kap_X * tX/(xK + tX))/(p_Am*L.^2);
  de = (f - ee) * v/ L; % 1/d, change in scaled reserve density e
  dL = L * r/ 3; % cm/d, change in structural length L
  
  deL = [de; dL]; % pack output
  
end

function deL = dget_eL1(t, eL, xK, v, g, L_T, L_m, tX, p_Am, kap_X, F_m, ff)

  ee = eL(1); L = eL(2); % unpack variables
  r = v * (ee/L - (1 + L_T/ L)/ L_m)/ (ee + g); % 1/d, spec growth rate   

  %at low densities food is limited in the experimental setup. Depending on
  %body size, the daphnid is able to filter the volume the test vessel more
  %than once during a day. As a result, the available food adoes not last
  %for the entire day. As an approximation, here, the food density is
  %reduced to account for this effect, by the exxedance of clearance time:
  t_C= 80 / (ff *F_m *1000 * L^ 2); %time to clearance (d) based on filtration rate in mL/d and a test vessel of 80 mL
  
  if t_C < 1  
     X = tX*t_C;   
  end;
  
  if t_C >= 1  
     X = tX;   
  end;   
     
     
  f = (L.^2 * p_Am / kap_X *1.5 * X/(xK + X))/(p_Am*L.^2);
  de = (f - ee) * v/ L; % 1/d, change in scaled reserve density e
  dL = L * r/ 3; % cm/d, change in structural length L
  
  deL = [de; dL]; % pack output
  
end
