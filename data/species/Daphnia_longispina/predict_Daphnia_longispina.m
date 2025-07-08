function [prdData, info] = predict_Daphnia_longispina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A); 
  kT_M = k_M * TC; kT_J = k_J * TC; vT = v * TC; UT_Hb = U_Hb/ TC; UT_Hp = U_Hp/ TC;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b l_p, l_b, info] = get_tp(pars_tp, f);
  [t_p0, t_b0 l_p0, l_b0] = get_tp(pars_tp, f_tL);
   
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, body length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  aT_b = t_b/ kT_M;                 % d, age at birth at f and T, well fed
  aT_b0 = t_b0/ kT_M;               % d, age at birth at f and T, starved
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, body length at puberty at f, well fed
  Lw_p0 = L_m * l_p0/ del_M;        % cm, body length at puberty at f, starved
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T, well fed
  tT_p0 = (t_p0 - t_b0)/ kT_M;      % d, time since birth at puberty at f and T, starved

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate body length at f, well-fed
  Lw_i0 = L_m * (f_tL - l_T)/ del_M;% cm, ultimate body length at f, starved
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];         % compose parameter vector at T_ref
  aT_m = get_tm_s(pars_tm, f, l_b)/ kT_M;      % d, mean life span at T, well fed
  aT_m0 = get_tm_s(pars_tm, f_tL, l_b0)/ kT_M; % d, mean life span at T, starved

  % reproduction
  pars_R = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hp]; % compose parameter vector at T
  NT_i = cum_reprod(aT_m, f, pars_R);             % #/d, ultimate reproduction rate at T
  NT_i0 = cum_reprod(aT_m0, f_tL, pars_R);             % #/d, ultimate reproduction rate at T

  % pack to output
  prdData.ab = aT_b;
  prdData.ab0 = aT_b0;
  prdData.tp = tT_p;
  prdData.tp0 = tT_p0;
  prdData.am = aT_m;
  prdData.am0 = aT_m0;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lp0 = Lw_p0;
  prdData.Li = Lw_i;
  prdData.Li0 = Lw_i0;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ni = NT_i;
  prdData.Ni0 = NT_i0;
  
  % uni-variate data
  
  % time-length
  rT_B = kT_M/ 3/ (1 + f/ g); % 1/d, von Bert growth raste        
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1)); % cm, body length
  %
  rT_B0 = kT_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth raste        
  ELw_0 = Lw_i0 - (Lw_i0 - Lw_b) * exp( - rT_B0 * tL0(:,1)); % cm, body length

  % pack to output
  prdData.tL = ELw;
  prdData.tL0 = ELw_0;
  