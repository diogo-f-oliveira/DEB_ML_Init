function [prdData, info] = predict_Chlidonias_leucopterus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    


  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

  % zero-variate data

  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx];  % compose parameter vector
  t_x = get_tp(pars_tx, f); % -, scaled time
  pars_tp = [g; k; l_T; v_Hb; v_Hp];  % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;      % d, age at birth at f and T
  
  % fledging
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at fledging

  % puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * ome);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.tR = t_R;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-weight  
  tf = [06 9 12 15 18 21 24; f_06 f_09 f_12 f_15 f_18 f_21 f_24]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [], tW(:,1)*kT_M);
  EWw = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  %
  tf = [06 9 12 15 18 21 24 27; f1_06 f1_09 f1_12 f1_15 f1_18 f1_21 f1_24 f1_27]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [], tW1(:,1)*kT_M);
  EWw_1 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight
  %
  tf = [06 9 12 15 18 21 24 27; f2_06 f2_09 f2_12 f2_15 f2_18 f2_21 f2_24 f2_27]'; tf(:,1) = tf(:,1) * kT_M;
  tvel = get_tp(pars_tp, tf, [], tW2(:,1)*kT_M);
  EWw_2 = (L_m * tvel(:,4)).^3 .* (1 + tvel(:,3) * ome);   % g, weight

  % pack to output
  prdData.tW = EWw;
  prdData.tW1 = EWw_1;
  prdData.tW2 = EWw_2;
end
