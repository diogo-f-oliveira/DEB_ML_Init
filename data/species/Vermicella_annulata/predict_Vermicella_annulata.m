function [prdData, info] = predict_Vermicella_annulata(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVLh
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth
  
  % puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_m^3 * (1 + f * ome);     % g, ultimate wet weight
    
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;           % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  Lw_im = f * L_mm/ del_M;             % cm, ultimate SVL length                      
  Ww_im = L_mm^3 * (1 + f * ome_m);    % g, ultimate wet weight
  pars_tpm = [g_m k l_T v_Hb v_Hpm];
  Lw_pm = L_mm * get_lp(pars_tpm, f)/ del_M;  % cm, SVL at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  
  % uni-variate data
  
  % time-length 
  L_i = L_m * f_tL; L_b = L_m * get_lb([g k v_Hb], f_tL);
  rT_B = TC * k_M/ 3/ (1 + f_tL/ g);
  ELw = (L_i - (L_i - L_b) * exp(- rT_B * tL(:,1)))/ del_M; % cm, SVL
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = 365 * TC * reprod_rate(LN(:,1)*del_M, f, pars_R);  % #, yearly fecundity

  % pack to output
  prdData.tL = ELw;
  prdData.LN = EN;
