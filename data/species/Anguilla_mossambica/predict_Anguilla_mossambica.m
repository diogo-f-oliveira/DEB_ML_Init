function [prdData, info] = predict_Anguilla_mossambica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  vars_pull(par); vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % life cycle
  pars_ts = [g k l_T v_Hb v_Hs];
  [t_s, t_b, l_s, l_b] = get_tp(pars_ts, f);
  pars_tp = [g k l_T v_Hs v_Hp];
  [t_p, t_ss, l_p, l_ss, info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % metam: for leptocephus to glass eel
  L_s = L_m * l_s;                  % cm, structural length at birth 
  %Lw_s = L_s/ del_Ml;               % cm, total length at end of leptocephalus stage
  %tT_s = (t_s - t_b)/ k_M/ TC;      % d, time since birth at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);% #/d, max repord rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  %% pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % time-length
  [t_p, t_ss, l_p, l_ss] = get_tp(pars_tp, f_tL);
  L_s = l_ss * L_m; L_i = f_tL * L_m; 
  kT_M = TC * k_M; rT_B = kT_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_s) * exp( - rT_B * (tL(:,1) - t_sj)); % cm, struct length 
  ELw = L/ del_M; % cm, total length
  

  %% pack to output
  prdData.tL = ELw;
     