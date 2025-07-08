function [prdData, info] = predict_Artemia_salina(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_low < 0; prdData = []; info = 0; return; end
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  TC_tR = tempcorr(C2K(TtR(:,1)), T_ref, T_A); 
 
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, ~, ~, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled structural length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Wd_i = L_i.^3 * d_V * (1 + f * ome);    % g, ultimate dry weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tj(pars_tj, f_tL, [], tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, carapace length

  % temperature-interbrood interval
  Et_R = t_R * TC ./ TC_tR; % d, inteerbrood interval
  
  % length-weight
  EWd_high = 1e3*(LWd_high(:,1)*del_M).^3*d_V*(1 + f*ome); % mg, dry weight
  EWd_low = 1e3*(LWd_low(:,1)*del_M).^3*d_V*(1 + f_low*ome); % mg, dry weight
  
  % pack to output
  prdData.tL = ELw;
  prdData.TtR = Et_R;
  prdData.LWd_high = EWd_high;
  prdData.LWd_low = EWd_low;

