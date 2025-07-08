function [prdData, info] = predict_Phoca_vitulina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%   % customized filters to contrain a parameter - optional - delete if not
%   needed
%   filterChecks = f_tL>1 || ...         % f contrained to not be larger than 1
%                  f_tL <0;   % 
%   
%   if filterChecks  
%     info = 0;
%     prdData = {};
%     return;
%   end  

  % compute temperature correction factors
  TC_tg = tempcorr(temp.tg, T_ref, T_A);
  TC_tx = tempcorr(temp.tx, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ k_M/ TC_tg;     % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
%   Lw_x = L_x/ del_M;                % cm, total length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC_tx;   % d, time since birth at fledging at f and T
  
  % puberty 
%   L_p = L_m * l_p;                  % cm, structural length at puberty at f
%   Lw_p = L_p/ del_M;                % cm, total length at puberty at f
%   Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_foetus(L_i, f, pars_R);      % #/d, ultimate reproduction rate at T

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
  
  pars_tx = [g_m k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
  tT_pm = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T
  L_im = l_i * L_mm;                   % cm, ultimate struct length
  Lw_im = L_im/del_M; 
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
%   prdData.Lx = Lw_x;
%   prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
%   prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri  = RT_i;
  
  % uni-variate data
  l_b = get_lb_foetus([g k v_Hb]); L_b = L_m * l_b; 
  f = f_tL;    L_i = L_m * (f - l_T);
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tL/ ir_B;  % d, 1/von Bert growth rate
  % time-length (female)  
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, structural length  
  ELw = L/ del_M; % cm, length
  % time-weight (that data comprised males and females but we here use female parameters)
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1)); % cm, structural length
  EWw = L.^3 * (1 + w * f); % g, wet weight
  % length-weight (female)
  EWw2 = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  
  % males:
  L_i = L_mm * (f - l_T);
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_B = TC_tL/ ir_B;  % d, 1/von Bert growth rate

  % time-length (male)
  L = L_i - (L_i - L_b) * exp( - rT_B * tLm(:,1)); % cm, structural length
  ELwm = L/ del_M; % cm, length
  % time-weight (male)
  L = L_i - (L_i - L_b) * exp( - rT_B * tWm(:,1)); % cm, total length
  EWwm = L.^3 * (1 + w * f); % g, wet weight
  

  % pack to output
  prdData.tL = ELw;
  prdData.tLm = ELwm;
  prdData.tW = EWw;
  prdData.tWm = EWwm;
  prdData.LW = EWw2;
