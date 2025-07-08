function [prdData, info] = predict_Sphaerium_corneum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ax = tempcorr(temp.ax, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
  
  % initial
  u_E0 = get_ue0([g k v_Hb], f, l_b);   % -, scaled initial reserve
  E_0 = g * E_m * L_m^3 * u_E0;         % J, initial energy content
  Ww_0 = E_0 * w_E/ mu_E/ d_E;          % g, initial wet weight
  % Ww_0 = (pi/6) Lw_0^3, so Lw_0 = (Ww_0 * 6/ pi)^(1/3)
  Lw_0 = (Ww_0 * 6/ pi)^(1/3);          % cm, egg diameter
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, shell length at birth at f
  aT_b = t_b/ k_M/ TC_ax;           % d, age at birth at f and T
  
  % emergence
  L_x = L_m * l_x;                  % cm, structural length at emergence
  Lw_x = L_x/ del_M;                % cm, shell length at emergence
  aT_x = t_x/ k_M/ TC_ax;           % d, age at emergence at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell length at puberty at f
  tT_p = (t_p - t_x)/ k_M/ TC_tp;   % d, time since emergence at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate shell length at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ax = aT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.L0 = Lw_0;
  prdData.Lx = Lw_x;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % length-weight 
  EWd = (LW(:,1)* del_M).^3 * d_V * (1 + f * w); % g dry weight

  % time-length
  L_i = L_m * (f_tL - l_T);rT_B = TC_tL * k_M/ 3/ (1 + f_tL/ g);  % 1/d, von Bert growth rate  
  L = L_i - (L_i - L_0) * exp(- rT_B * tL(:,1));
  ELw = (L/ del_M); % cm, total shell length
  
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWd;
  