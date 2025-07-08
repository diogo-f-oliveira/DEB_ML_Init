function [prdData, info] = predict_Eubalaena_australis(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if t_0<0 
      prdData = []; info = 0; return;
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = TC * k_M;

  % foetal development
  pars_tp = [g; k; l_T; v_Hb; v_Hp];        % compose pars vector
  pars_tx = [g; k; l_T; v_Hb; v_Hx; v_Hp];  % compose pars vector
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f); % -, scaled age at puberty

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at weaning at f and T

  % puberty 
  tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate length
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
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  Lw_im = L_mm/ del_M;                 % cm, max length

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  g_bx = g * v_bx/ v; % -, energy investment ratio in period bx
  [t, vel] = ode45(@dget_vel, tL(:,1)*kT_M, [v_Hb, f_bx, l_b], [], f_bx, f_tL, v_Hx, g_bx, k, l_T, v_Hp);
  ELw = L_m * vel(:,3)/ del_M ;          % cm, length 

  EV = (LV(:,1) * del_M).^3 * (1 + w)/ 1e6; % m^3, volume
  
  % pack to output
  prdData.tL = ELw;
  prdData.LV = EV;
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