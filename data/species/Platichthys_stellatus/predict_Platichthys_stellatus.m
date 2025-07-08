function [prdData, info] = predict_Platichthys_stellatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
          
  if E_Hh >= E_Hb
    info = 0; prdData = []; return;
  end
  
  % compute temperature correction factors
  TC_10 = tempcorr(temp.ah10, T_ref, T_A);
  TC_12 = tempcorr(temp.ah12, T_ref, T_A);
  TC_tb = tempcorr(temp.tb, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1);                   % d, age at hatch at f and T_ref
  a10_h = a_h/ TC_10; a12_h = a_h/ TC_12; % d, age at hatch
  L_h = aUL(2,3);                   % cm, structural length at f
  Lw_h = L_h/ del_M;                % cm, total length at hatch at f

  % birth
  tT_b = t_b/ k_M/ TC_tb - a12_h;   % d, time since hatch at birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                   % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_mm = p_Am_m/ v;                    % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_mm);              % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  m_Em_m = y_E_V * E_mm/ E_G;          % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;      % d, time since birth at puberty
  Lw_pm = l_pm * L_mm/ del_M;          % cm, total length at puberty
  
  % pack to output
  prdData.ah12 = a12_h;
  prdData.ah10 = a10_h;
  prdData.tb = tT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL, [], tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL, [t_b, f_tL*z/z_m, l_b*z/z_m], tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length

  % length-weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w_m); % g, wet weight
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  
end

%  %%%%%% SUBFUNTION %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function duEl = dget_uEl_embryo(t, uEl, g) % subfunction
  
  % upack uEl
  uE = uEl(1); l = uEl(2);
    
  l3 = l^3;
  duE = - uE * l * l * (g + l)/ (uE + l3);
  dl = (g * uE - l * l3)/ 3/ (uE + l3);
    
  duEl = [duE; dl]; % pack output
end