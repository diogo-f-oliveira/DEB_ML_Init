function [prdData, info] = predict_Asellus_aquaticus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, [T_A; T_L; T_AL]); % instar 0, embryo
  TC_Tab2 = tempcorr(C2K(Tab2(:,1)), T_ref, [T_A; T_L; T_AL]); % instar 0, embryo
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL2 = tempcorr(temp.tL2, T_ref, T_A);
  TC_tS = tempcorr(temp.tS, T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);
  
  % zero-variate data
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  a_b = (t_0 + t_b/ k_M); aT_b = a_b/ TC_ab;% d, age at birth at f and T
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m]);  
  L_bm = L_mm * l_b; Lw_bm = L_bm/ del_M; L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty  
  Ww_bm = L_bm.^3 * (1 + f * w_m);     % g, wet weight at birth
  Ww_pm = L_pm.^3 * (1 + f * w_m);     % g, wet weight at puberty
  L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight 
  

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lbm = Lw_bm;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwbm = Ww_bm;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  
  % uni-variate data
  
  % time-weight 
  tvel = get_tj(pars_tj,f,[],tW(:,1)*k_M*TC_tW);
  EWw =  (L_m*tvel(:,4)).^3 * (1 + f * w);  % g, wet weight females   
  
  % length-weight  
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w);
  
  % time-length
  tvel = get_tj(pars_tj,f,[],tL(:,1)*k_M*TC_tL);
  ELw = L_m * tvel(:,4)/ del_M; % cm, physical length 
  %
  tvel = get_tj(pars_tj,f,[],tL2(:,1)*k_M*TC_tL2);
  ELw_2 = L_m * tvel(:,4)/ del_M; % cm, physical length 
  
  % starvation 
  L= (0.0159/(1 + f * w))^(1/3);
  s_M  = L_j/ L_b; % -, acceleration factor
  [tt, LEHS] =  ode45(@dget_LEHS, tS(:,1), [L; E_m; E_Hb; 1; L; E_Hp] ,[],...
     p_Am*s_M*TC_tS, v*s_M*TC_tS, p_M*TC_tS, E_G, kap, kap_G, k_J/TC_tS, s_shrink, 0); 
 
  % length-fecundity  
  EN = 365/4 * reprod_rate_j(LN(:,1) * del_M, f, pars_R); % #, fecundity during one year and 4 broods, see comment.Ri  
  EN2 = 365/4 * reprod_rate_j(LN2(:,1) * del_M, f, pars_R); % #, fecundity during one year and 4 broods, see comment.Ri

  % flux data: dry weight - O2 consumption 
  f = 1;
  %females
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  L = (WdJO(:,1) / d_V/ (1 + f * w)) .^ (1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows  
  EJO = -1e6 *  J_M(3,:)' * TC_WdJO * 24.4;     % mul O2/d, O2 consumption   
  %males
  pars_p = [kap; kap_R; g_m; k_J; k_M; L_T; v; E_Hb/p_Am_m; E_Hj/p_Am_m; E_Hp/p_Am_m]; % compose pars
  p_ref = p_Am_m * L_mm^2; % J/d, max assimilation power at max size
  L = (WdJOm(:,1) / d_V/ (1 + f * w)) .^ (1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows  
  EJOm = -1e6 *  J_M(3,:)' * TC_WdJO * 24.4;     % mul O2/d, O2 consumption 
  
  %temperature - age of birth
  EaT_b = a_b ./ TC_Tab;
  EaT_b2 = (t_b/ k_M) ./ TC_Tab2;
   
  % pack to output
  prdData.tW = EWw;
  prdData.LW = EWw_L;
  prdData.tL = ELw;
  prdData.tL2 = ELw_2;
  prdData.tS = LEHS(:,4);
  prdData.LN = EN;
  prdData.LN2 = EN2;
  prdData.WdJO = EJO;
  prdData.WdJOm = EJOm;
  prdData.Tab = EaT_b;
  prdData.Tab2 = EaT_b2;
  
end

function dLEHS = dget_LEHS(t,LEHS,...
    p_Am, v, p_M, E_G, kap, kap_G, k_J,  s_shrink, f) 

% assumption: no during growth metabolic acceleration
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
