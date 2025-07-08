function [prdData, info] = predict_Hyalella_azteca(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  TC_ab  = tempcorr(temp.ab, T_ref, T_A);
  TC_tp  = tempcorr(temp.tp, T_ref, T_A);
  TC_tpm = tempcorr(temp.tp_m, T_ref, T_A);
  TC_am  = tempcorr(temp.am, T_ref, T_A);
  TC_Ri  = tempcorr(temp.Ri, T_ref, T_A);
  TC_tWw = tempcorr(temp.tWw, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL_2 = tempcorr(temp.tL_2, T_ref, T_A);
  TC_tL_3 = tempcorr(temp.tL_3, T_ref, T_A);
  TC_tL_4 = tempcorr(temp.tL_4, T_ref, T_A);
  TC_tL_5 = tempcorr(temp.tL_5, T_ref, T_A);
  TC_tL_6 = tempcorr(temp.tL_6, T_ref, T_A);
  TC_tWd = tempcorr(temp.tWd, T_ref, T_A);
  TC_tWd_2 = tempcorr(temp.tWd_2, T_ref, T_A);
  TC_tWd_3 = tempcorr(temp.tWd_3, T_ref, T_A);
  TC_LN_1 = tempcorr(temp.LN_1, T_ref, T_A);
  TC_WdN_1 = tempcorr(temp.WdN_1, T_ref, T_A);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, T_A);
  TC_tS = tempcorr(temp.tS, T_ref, T_A);
  TC_tN = tempcorr(temp.tN, T_ref, T_A);
  TC_TJx = tempcorr(C2K(T_Jx(:,1)), T_ref, T_A);
  TC_tS4 = tempcorr(temp.tS4, T_ref, T_A);  
  TC_TJO = tempcorr(C2K(TJO(:,1)), T_ref, T_A);
  
  
  % zero-variate data
  
  TC_LN_3 = tempcorr(temp.LN_3, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  
  % birth
  L_b = L_m * l_b;                   % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                 % cm, total length at birth at f
  Ww_b =  L_b^3 * (1 + f * w);       % g, wet weight at birth
  Wd_b =  L_b^3 * (1 + f * w) * d_V; % g, dry weight at birth
  a_b = (t_0 + t_b/ k_M); 
  aT_b = a_b/ TC_ab;                 % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                   % cm, structural length at metam at f

  % puberty 
  L_p = L_m * l_p;                   % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                 % cm, total length at puberty at f
  Lw_p_h = L_p/ del_Mh;              % cm, head length at puberty at f
  Ww_p =  L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  Wd_p =  L_p^3 * (1 + f * w) * d_V; % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;    % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                   % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                 % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);        % g, ultimate wet weight 
  Wd_i = L_i^3 * (1 + f * w) * d_V;  % g, ultimate dry weight 
  L_m_f = L_i* f_Gonz/ del_M;        % cm, ultimate structural length at f
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];      % compose parameter vector at T_ref
  t_m     = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m    = t_m/ k_M/ TC_am;                % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length 
 
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  L_bm = L_mm * l_bm; L_j_m = L_mm * l_jm; L_im = l_i * L_mm;   % cm, structural lengths 
  tT_pm = (t_pm - t_bm)/ k_M/ TC_tpm;    % d, time since birth at puberty at f and T
 
  L_m_m = L_im*f_Gonz/ del_M;

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tp_m = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lp_h = Lw_p_h;
  prdData.Li = Lw_i;
  prdData.Lm_f =L_m_f;
  prdData.Lm_m =L_m_m;
  
  prdData.Wwb = Ww_b;
  prdData.Wdb = Wd_b;
  prdData.Wwp = Ww_p;
  prdData.Wdp = Wd_p;
  prdData.Wwi = Ww_i;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  prdData.Lm_f =L_m_f;
  prdData.Lm_f =L_m_f;
  
  
 % uni-variate data
  
 %time - wet weight OthmPasc2001
 f = f_OthmPasc;
 kT_M = k_M * TC_tWw; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
 %
 L_bj = L_b * exp(tWw((tWw(:,1) <= tT_j),1) * rT_j/ 3);
 L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWw((tWw(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
 EWw = [L_bj; L_jm].^3 * (1 + f * w);  % g, wet weight                    

 % time - length OthmPasc2001
 kT_M = k_M * TC_tL; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
 L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
 L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
 EL = [L_bj; L_jm]/ del_M;                              % cm, length 

 % time - dry weight OthmPasc2001  
 f = f_OthmPasc;
 kT_M = k_M * TC_tWd; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
 %
 L_bj = L_b * exp(tWd((tWd(:,1) <= tT_j),1) * rT_j/ 3);
 L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWd((tWd(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
 EWd = [L_bj; L_jm].^3 * (1 + f * w) * d_V;  % g, dry weight 

 % time - dry weight Lind1982 (15°C)
 f = f_Lind;
 kT_M = k_M * TC_tWd_2; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
 %
 L_bj = L_b * exp(tWd_2((tWd_2(:,1) <= tT_j),1) * rT_j/ 3);
 L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWd_2((tWd_2(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
 EWd_2 = [L_bj; L_jm].^3 * (1 + f * w) * d_V;  % g, dry weight 
 
 % time - dry weight Lind1982 (20°C)
 f = f_Lind;
 kT_M = k_M * TC_tWd_3; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; tT_j = (t_j - t_b)/ kT_M;
 %
 L_bj = L_b * exp(tWd_3((tWd_3(:,1) <= tT_j),1) * rT_j/ 3);
 L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tWd_3((tWd_3(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
 EWd_3 = [L_bj; L_jm].^3 * (1 + f * w) * d_V;  % g, dry weight 
 
 %Length-wet weight L-Ww OthmPasc2001
 f = f_OthmPasc;
 L    = LWw(:,1) * del_M; % cm, structural length 
 ELWw  = L.^3 * (1 + f * w); % g, wet weight 
 
 %Length-dry weight L-Wd Inge1998
 f = f_Inge;
 L    = LWd(:,1) * del_M; % cm, structural length
 ELWd  = L.^3 * (1 + f * w) * d_V; % g, dry weight 

  % length-fecundity (Inge1998: 28-d length females)
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_1 = TC_LN_1 * 14 * reprod_rate_j(LN_1(:,1) * del_M, f, pars_R); % #, fecundity

  % weight-fecundity (Inge1998, 28d length)
  EWdN_1 = TC_WdN_1 * 14 * reprod_rate_j(((WdN_1(:,1)/ d_V)/ (1 + f * w)).^(1/3), f, pars_R); % #, eggs
  
  % length-fecundity (OthmPasc2001)
  f = f_OthmPasc;
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EN_3 = TC_LN_3 * 13 * reprod_rate_j(LN_3(:,1) * del_M, f, pars_R); % #, fecundity
      
  % head length-body length (Cooper 1965)
  L    = LL(:,1) * del_Mh; % cm, structural length
  ELL  = L./del_M; % cm, body length 
   
  % time-fecundity (control 1 and 2 of Pede2013)
  f = f_Pede;
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  EtN =  cum_reprod_j(tN(:,1), f, pars_R); % cumulative reproduction over time

  
  % WdWw-data
  EWdWw = WdWw(:,1) / d_V;
 
  % flux data: dry weight - O2 consumption (Math1971)
  f = f_WdJO;
  pars_p = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose pars
  p_ref = p_Am * L_m^2; % J/d, max assimilation power at max size
  % respiration 
  L = (WdJO(:,1) / d_V/ (1 + f * w)) .^ (1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
  EJO = - 1e6 * J_M(3,:)' * TC_WdJO * 24.4/ 24;     % µl O2/h, O2 consumption   
 
  % temperature - respiration for adults
  L = (0.000402/ d_V/ (1 + f * w)).^(1/ 3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
  ETJO = - 1e6 * J_M(3,:)' .* TC_TJO* 24.4/ 24;     % µmol O2/d. g dry mass
  
  % temperature - respiration for juveniles 
  L = (0.00015/ d_V/ (1 + f * w)).^(1/ 3); % cm, structural length
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p); % J/d, powers
  J_M = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';% mol/d: J_C, J_H, J_O, J_N in rows
  ETJO2 = - 1e6 * J_M(3,:)' .* TC_TJO* 24.4/ 24;     % µmol O2/d. g dry mass
  
  % time - survival: Eq (6.5) of Kooy2010 for short growth periods, e = 1, L = L_i, 20C 
  f = f_Borg;
  hW3 = h_a * f * v/ 6/ L_i; 
  hG = s_G * f * v * L_i^2/ L_m^3; 
  hGt = TC_tS * hG * tS(:,1);
  ES = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));

  % time - survival 2
  f = f_Borg;
  hW3 = h_a * f * v/ 6/ L_i; 
  hG = s_G * f * v * L_i^2/ L_m^3; 
  hGt = TC_tS * hG * tS_2(:,1);
  ES_2 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  
  % time - survival 3
  f = f_Borg;
  hW3 = h_a * f * v/ 6/ L_i; 
  hG = s_G * f * v * L_i^2/ L_m^3; 
  hGt = TC_tS * hG * tS_3(:,1);
  ES_3 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  
  % temperature - faecel pelet production
  L = (0.00045/(1 + f * w)/d_V).^(1/3);      % Egestion measure for 450µg dry weight
  TJ_X = mu_F* p_Am* TC_TJx* L^2 / kap_X;    % number of faecal pellets per day
   
  % starvation data:
  [tt, LEHS] =  ode45(@dget_LEHS, tS4(:,1), [0.13*del_M; E_m; E_Hb; 1; L_b; E_Hb] ,[],...
   p_Am, v, p_M, E_G, kap, kap_G, k_J, s_shrink, 0, L_j,TC_tS4);   
  
  
  % pack to output
  prdData.tWw = EWw;
  prdData.tL = EL;
  prdData.tWd = EWd;
  prdData.tWd_2 = EWd_2;
  prdData.tWd_3 = EWd_3;
  prdData.LWw = ELWw;  
  prdData.LWd = ELWd; 
  prdData.WdWw = EWdWw;
  prdData.LN_1 = EN_1;
  prdData.WdN_1 = EWdN_1;
  prdData.WdJO = EJO;
  prdData.tS = ES;
  prdData.tS_2 = ES_2;
  prdData.tS_3 = ES_3;
  prdData.tN = EtN;
  prdData.LN_3 = EN_3;
  prdData.LL= ELL;
  
  % time-length  (Different years and different sites)
  prdData.tL_2 = get_Lw(f_Pery_1, TC_tL_2, tL_2,  par, cPar); %time - length Pery2005 0.1mg
  prdData.tL_3 = get_Lw(f_Pery_2, TC_tL_3, tL_3,  par, cPar); %time - length Pery2005 0.2mg
  prdData.tL_4 = get_Lw(f_Pery_3, TC_tL_4, tL_4,  par, cPar); %time - length Pery2005 0.3mg
  prdData.tL_5 = get_Lw(f_Pery_4, TC_tL_5, tL_5,  par, cPar); %time - length Pery2005 0.04mg
  prdData.tL_6 = get_Lw(f_Pery_5, TC_tL_6, tL_6,  par, cPar); %time - length Pery2005 0.06mg
   
  prdData.T_Jx  = TJ_X;
  prdData.tS4 = LEHS(:,4);
  prdData.TJO= ETJO;
  prdData.TJO2 = ETJO2;
  
end


function ELw = get_Lw(f, TC, tL,  p, c)

  pars_tj = [c.g c.k c.l_T c.v_Hb c.v_Hj c.v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  
  kT_M = c.k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = c.L_m * l_b;  L_j = c.L_m * l_j; L_i = c.L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_jm]/ p.del_M;        % cm, body length

        
end

function dLEHS = dget_LEHS(t,LEHS,...
    p_Am, v, p_M, E_G, kap, kap_G, k_J,  s_shrink, f, L_j, TC_tS4) 

% assumption: no metabolic acceleration
% the function will not handle re-growth

% unpack LEHRU
L   =  LEHS(1); % cm, volumetric structural length
E   =  LEHS(2); % J cm^{-3}, [E] reserve density
EH  =  LEHS(3); % J, E_H maturity
S   =  min(1,LEHS(4)); % survival probability
maxL = LEHS(5); % maximum length
maxEH = LEHS(6); % maximum maturity


%v_j = L/L_j*v*TC_tS4; %inlcude acceleration
v_j = v*TC_tS4;

L_m = kap * p_Am/ p_M; % cm, ultimate length
%k_M = p_M/ E_G;  % 1/d, maturity maintenance rate coefficient
E_m = p_Am/ v_j;   % J/cm^3, max reserve density
l = L/ L_m; e = E/E_m;  % -, scaled structural length and scaled res. dens.

p_C = E * (E_G * v_j/ L + p_M*TC_tS4)/ (kap * E + E_G );   % J/cm^3 (2.12, Kooy2010) specific mobilisation flux
dE =  (f * p_Am - E * v_j)/ L; % J day^{-1} cm^{-3} (2.10, Kooy2010)

% pp.42 comments DEB3 equ. 4.2
if e < l 
   r = (E * v_j/ L - p_M*TC_tS4/ kap)/ (E + E_G * kap_G/ kap);
else
  r = (E * v_j/ L - p_M*TC_tS4/ kap)/ (E + E_G/ kap);
end
dL  = L * r/ 3;



dmaxL = max(0,dL); % cm, max stuctural length
dEH = (1 - kap) * p_C * L^3 - k_J * EH; % J/d

dmaxEH = max(0,dEH); % J, max maturity

h_sh = s_shrink * p_M*TC_tS4/ E_G * max(0, maxL - L)/maxL;

dS = - S * h_sh; % 1/d, survival fraction

% pack state variables
dLEHS = [dL; dE; dEH; dS; dmaxL; dmaxEH];

end
