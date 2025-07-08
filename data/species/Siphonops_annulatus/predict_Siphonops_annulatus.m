function [prdData, info] = predict_Siphonops_annulatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hj < E_Hb || E_Hj > E_Hp
    prdData = []; info = 0; return
  end
  
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj];
  [t_j, t_b, l_j, l_b] = get_tp(pars_tj, f);
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b; Lw_b = L_b/ del_M;  % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f

  % metamorphosis
  L_j = l_j * L_m; Lw_j= L_j/ del_M;   % cm, structural, total length at metam
  Ww_j = L_j^3 * (1 + f * w);          % g, wet weight at metam
  tT_j = (t_j - t_b)/ k_M/ TC;         % d, time since birth at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * f;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                   % d, mean life span at T
  

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwj = Ww_j;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-length 
  L_i = L_m * f_tL; L_b = L_m * get_tb([g k v_Hb], f_tL); rT_B = TC * k_M/ 3/ (1 + f_tL/ g);
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, expected length at time
  ELw = L/ del_M; % cm, total length     

  % time-weight
  EWw = L.^3 * (1 + f_tL * w); % g, wet weight                                            % cm, total length     
  
  % length-weight
  LW = (LW(:,1) * del_M).^3 * (1 + f_tL * w);  % g, wet weight 

  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.LW = LW;

