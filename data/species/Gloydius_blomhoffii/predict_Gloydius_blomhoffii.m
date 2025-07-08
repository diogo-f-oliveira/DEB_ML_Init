function [prdData, info] = predict_Gloydius_blomhoffii(par, data, auxData)
  
  global tJX_f tJX_m

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);
    
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth     

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f);
  L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M; % cm, total length at puberty
  L_im = f * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length
  L_bm = L_mm * l_bm; Ww_im = L_im^3 * (1 + f * w_m);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % time since birth at puberty 

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;

  % univar data
  
  % time-length/weight
  Ww_b = L_b^3 * (1 + 1  * w);    % g, wet weight at birth
  J_Xm = w_X * p_Am/ kap_X/ mu_X/ d_X; % g/d.cm^2, {J_Xm}, max spec feeding rate in g wet food
  [t, LW] = ode45(@Bert, tL_f(:,1), [L_b, Ww_b], [], tJX_f, TC * J_Xm, TC * v, g, L_m, w);
  tLw_f = LW(:,1)/ del_M; % cm, total length
  tWw_f = LW(:,2); % g, wet weight
  %
  Ww_bm = L_bm^3 * (1 + 1  * w_m);      % g, wet weight at birth
  J_Xmm = w_X * p_Am_m/ kap_X/ mu_X/ d_X; % g/d.cm^2, {J_Xm}, max spec feeding rate in g wet food
  [t, LW] = ode45(@Bert, tL_m(:,1), [L_b, Ww_b], [], tJX_m, TC * J_Xmm, TC * v, g_m, L_mm, w_m);
  tLw_m = LW(:,1)/ del_M; % cm, total length
  tWw_m = LW(:,2); % g, wet weight
  
  % length-weight
  LWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w);
  LWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w_m);

 % pack to output
  prdData.tL_f = tLw_f;
  prdData.tL_m = tLw_m;
  prdData.tW_f = tWw_f;
  prdData.tW_m = tWw_m;
  prdData.LW_f = LWw_f;
  prdData.LW_m = LWw_m;  
end

function dLW = Bert(t, LW, tJX, J_Xm, v, g, L_m, ome)
   L = LW(1); W = LW(2);
   J_X = spline1(t, tJX); f = J_X/ J_Xm/ L^2; 
   r = v * (f/ L - 1/ L_m)/ (f + g);
   dL = r * L/ 3;
   dW = r * W; 
   dLW = [dL; dW];
end
