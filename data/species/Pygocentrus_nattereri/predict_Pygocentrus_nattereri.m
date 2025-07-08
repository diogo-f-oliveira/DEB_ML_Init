function [prdData, info] = predict_Pygocentrus_nattereri(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); % all rates/times at same temp
  kT_M = k_M * TC; % 1/d, maintenance rate coefficient

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info
    prdData = []; return
  end

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth 
  
  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, total length at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);  % 1/d, max reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  Ww_im = L_mm^3 * (1 + f*w_m);        % g, max weight
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp]; % pars for males

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  
  % time-length 
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_M);
  if ~info
    prdData = []; return
  end
  rT_j = rho_j * kT_M;  rT_B = rho_B * kT_M; tT_j = (t_j - t_b) / kT_M; % d, time since birth at puberty        
  L_b = L_m * l_b;  L_j = L_m * l_j;  L_i = L_m * l_i;
  L_bj = L_b * exp(tL_Mf((tL_Mf(:, 1) <= tT_j), 1) * rT_j / 3); % cm, struct length
  L_jm = L_i - (L_i - L_j) * exp(-rT_B * (tL_Mf((tL_Mf(:, 1) > tT_j), 1) - tT_j)); % cm, struct length
  ELw_Mf = [L_bj; L_jm]/ del_M;  % cm, std length     
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_M);
  rT_jm = rho_jm * kT_M;  rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm) / kT_M; % d, time since birth at puberty        
  L_bm = L_mm * l_bm;  L_jm = L_mm * l_jm;  L_im = L_mm * l_im;
  L_bj = L_bm * exp(tL_Mm((tL_Mm(:, 1) <= tT_jm), 1) * rT_jm / 3); % cm, struct length
  L_jm = L_im - (L_im - L_jm) * exp(-rT_Bm * (tL_Mm((tL_Mm(:, 1) > tT_jm), 1) - tT_jm)); % cm, struct length
  ELw_Mm = [L_bj; L_jm]/ del_M;  % cm, std length 
  %
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_I);
  if ~info
    prdData = []; return
  end
  rT_j = rho_j * kT_M;  rT_B = rho_B * kT_M; tT_j = (t_j - t_b) / kT_M; % d, time since birth at puberty        
  L_b = L_m * l_b;  L_j = L_m * l_j;  L_i = L_m * l_i;
  L_bj = L_b * exp(tL_If((tL_If(:,1) <= tT_j), 1) * rT_j / 3); % cm, struct length
  L_jm = L_i - (L_i - L_j) * exp(-rT_B * (tL_If((tL_If(:,1) > tT_j), 1) - tT_j)); % cm, struct length
  ELw_If = [L_bj; L_jm]/ del_M;  % cm, std length     
  %
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_I);
  rT_jm = rho_jm * kT_M;  rT_Bm = rho_Bm * kT_M; tT_jm = (t_jm - t_bm) / kT_M; % d, time since birth at puberty        
  L_bm = L_mm * l_bm;  L_jm = L_mm * l_jm;  L_im = L_mm * l_im;
  L_bj = L_bm * exp(tL_Im((tL_Im(:,1) <= tT_jm), 1) * rT_jm / 3); % cm, struct length
  L_jm = L_im - (L_im - L_jm) * exp(-rT_Bm * (tL_Im((tL_Im(:,1) > tT_jm), 1) - tT_jm)); % cm, struct length
  ELw_Im = [L_bj; L_jm]/ del_M;  % cm, std length     

  % weight - fecundity
  EN_M = 365 * TC * reprod_rate_j((WwN_M(:,1)/ (1+f_M*w)).^(1/3), f_M, pars_R);  % #, yearly fecundity for M
  EN_I = 365 * TC * reprod_rate_j((WwN_I(:,1)/ (1+f_I*w)).^(1/3), f_I, pars_R);  % #, yearly fecundity for I

  % pack to output
  prdData.tL_Mf = ELw_Mf;
  prdData.tL_Mm = ELw_Mm;
  prdData.tL_If = ELw_If;
  prdData.tL_Im = ELw_Im;
  prdData.WwN_M = EN_M;
  prdData.WwN_I = EN_I;

end
