function [prdData, info] = predict_Lithobates_septentrionalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);
  TC_A    = tempcorr(temp.tL_Afm, T_ref, T_A);
  TC_M    = tempcorr(temp.tL_Mfm, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f

%   % metam
%   L_j = L_m * l_j;                  % cm, structural length at metam at f
%   Lw_j = L_j/ del_M;                % cm, SVL at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hpm];    % pars for toad
  [t_pm, t_bm, l_pm, l_bm, info] = get_tp(pars_tpm, f);
  if ~info; prdData=[]; return; end
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, time since metam at puberty
  L_pm = l_pm * L_mm; Lw_pm = L_pm/ del_M; % cm, struc, SVL
  Ww_pm = L_pm^3 * (1 + f * w_m);      % g, wet weight at puberty

  
  % pack to output
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length
  L_b = L_m * get_lb([g; k; v_Hb], f_A); L_i = L_m * f_A; 
  rT_B = TC_A * k_M/ 3/ (1 + f_A/ g); % 1/d, von Bert growth rate
  ELw_Af = (L_i - (L_i - L_b) * exp(-rT_B * tL_Afm(:,1)))/ del_M;  % cm, SVL
  %
  L_bm = L_mm * get_lb([g_m; k; v_Hb], f_A); L_im = L_mm * f_A; 
  rT_Bm = TC_A * k_M/ 3/ (1 + f_A/ g_m); % 1/d, von Bert growth rate
  ELw_Am = (L_im - (L_im - L_bm) * exp(-rT_Bm * tL_Afm(:,1)))/ del_M;  % cm, SVL
  %
  L_b = L_m * get_lb([g; k; v_Hb], f_M); L_i = L_m * f_M; 
  rT_B = TC_M * k_M/ 3/ (1 + f_M/ g); % 1/d, von Bert growth rate
  ELw_Mf = (L_i - (L_i - L_b) * exp(-rT_B * tL_Mfm(:,1)))/ del_M;  % cm, SVL
  %
  L_bm = L_mm * get_lb([g_m; k; v_Hb], f_M); L_im = L_mm * f_M; 
  rT_Bm = TC_M * k_M/ 3/ (1 + f_M/ g_m); % 1/d, von Bert growth rate
  ELw_Mm = (L_im - (L_im - L_bm) * exp(-rT_Bm * tL_Mfm(:,1)))/ del_M;  % cm, SVL

  % pack to output
  prdData.tL_Afm = [ELw_Af ELw_Am];
  prdData.tL_Mfm = [ELw_Mf ELw_Mm];
end

