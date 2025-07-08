function [prdData, info] = predict_Coptodon_guineensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par);   vars_pull(cPar);          
  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC     = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];                        % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);          % -, scaled times & lengths at f
  if ~info; prdData = []; return; end
    
  % birth
  L_b = L_m * l_b;                                    % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);                       % g, weight at birth
  aT_b = t_b/ kT_M;                                   % d, age at birth at f and T
  
  % puberty  
  L_p = L_m * l_p;                                    % cm, structural length at puberty
  Lw_p = L_p/ del_M;                                  % cm, total length at puberty
  tT_p = (t_p - t_b)/ kT_M;                           % d, time since birth at puberty 
 
  % ultimate
  l_i = f - l_T;                                      % -, scaled ultimate length at f
  L_i = L_m * l_i;                                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                                  % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);                         % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];   % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);           % #/d, max reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];               % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);                   % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                                  % d, mean life span at T
  
  % males
  pars_lpm = [g; k; l_T; v_Hb; v_Hpm]; % compose parameter vector
  Lw_pm = L_m * get_lp(pars_lpm, f)/ del_M; % cm, total length at puberty 

  % pack to output  
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-weight 
  L_0 = (W0/(1 + f_tW * ome))^(1/3); L_i = L_m * f_tW;
  rT_B = kT_M/ 3/ ( 1 + f_tW/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_0) * exp(- rT_B * tW(:,1)); % cm, structural length
  EWw = L.^3*(1 + f_tW * ome);                  % g, wet weight

  % time-length
  L_b = L_m * get_lb([g; k; v_Hb], f_tL); L_i = L_m * f_tL;
  rT_B = kT_M/ 3/ ( 1 + f_tL/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tL(:,1)); % cm, structural length
  ELw = L/ del_M;                 % cm, total length
   
  % pack to output  
  prdData.tL = ELw;
  prdData.tW = EWw;
  
end
