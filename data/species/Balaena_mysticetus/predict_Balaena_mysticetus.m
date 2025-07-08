function [prdData, info] = predict_Balaena_mysticetus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = k_M * TC;

  % zero-variate data

   % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_x t_b l_x l_b info] = get_tp_foetus([g k l_T v_Hb v_Hx], f_bx); % high intake during lactation
  [t_p tbx l_p lbx]      = get_tp_foetus(pars_tp, f, [l_x v_Hx]);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  % the minus sign in tT_g is just to avoid that the wrong prediction of tT_g affects other par values
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Lw_x = L_x/ del_M;                % cm, total length at weaning   
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at weaning at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);      % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
 
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m; L_im = f * L_mm; % cm, max struct length
  [t_xm t_bm l_xm l_bm] = get_tp_foetus([g_m k l_T v_Hb v_Hx], f_bx); % high intake during lactation
  [t_pm txm l_pm lxm]   = get_tp_foetus([g_m k l_T v_Hx v_Hp], f); t_pm = t_pm + t_xm - t_bm; 
  tT_xm = (t_xm - t_bm)/ k_M/ TC;     % d, time since birth at weaning
  Lw_im = L_im/ del_M;                % cm, length of male
  L_xm = l_x * L_mm;                  % cm, structural length at weaning
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lx = Lw_x;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri  = RT_i;

  % univariate data
  
  % time-length
  % female
  [t, vel] = ode45(@dget_vel, tL_f(:,1)*kT_M, [v_Hb, f, l_b], [], f_bx, f, v_Hx, g, k, l_T, v_Hp);
  ELw_f = L_m * vel(:,3)/ del_M ;          % cm, length 
  % male
  [t, vel] = ode45(@dget_vel, tL_m(:,1)*kT_M, [v_Hb, f, l_b], [], f_bx, f, v_Hx, g_m, k, l_T, v_Hp);
  ELw_m = L_mm * vel(:,3)/ del_M;          % cm, length 
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
end

function dvel = dget_vel(~, vel, f_bx, f_xi, v_Hx, g, k, l_T, v_Hp)
  % unpack vel
  v_H = vel(1); % -, scaled maturity 
  e = vel(2);   % -, scaled reserve density
  l = vel(3);   % -, scaled structural length
  
  if v_H < v_Hx
    de = (f_bx - e) * g/ l;  % d/dtau e
  else
    de = (f_xi - e) * g/ l;  % d/dtau e
  end
  rho = g * (e/ l - (1 + l_T/ l))/ (e + g); % scaled specific growth rate
  dl = rho * l/ 3; % d/dtau l
  if v_H < v_Hp % juvenile
    dv_H = e * l^3 * (1/ l - rho/ g) - k * v_H; % d/dtau v_H
  else % adult
    dv_H = 0;
  end
  dvel = [dv_H; de; dl]; % d/dtau vel 
end