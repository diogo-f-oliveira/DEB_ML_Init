function [prdData, info] = predict_Teredo_navalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if E_Hh > E_Hb
    prdData = []; info = 0; return
  end
  
  % compute temperature correction factors
  pars_T = [T_A, T_L, T_AL];
  TC_ah = tempcorr(temp.ah, T_ref, pars_T);
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_tj = tempcorr(temp.tj, T_ref, pars_T);
  TC_tp = tempcorr(temp.tp, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_am11 = tempcorr(temp.am11, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  tTC = temp.tL;
  tTC(:,2) = tempcorr(C2K(tTC(:,2)), T_ref, pars_T);
  TC_tL_1 = tempcorr(temp.tL_1, T_ref, pars_T);
  TC_tL_2 = tempcorr(temp.tL_2, T_ref, pars_T);
  TC_tL_4 = tempcorr(temp.tL_4, T_ref, pars_T);
  TC_WdJO = tempcorr(temp.WdJO, T_ref, pars_T);

  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % initial scales reserves
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch (trochophora stage)  
  [~, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1);  % d, age at hatch at f and T
  aT_h = a_h/ TC_ah;
  L_h = aUL(2,3);                  % cm, structural length at trochophore larva at f
  Lw_h = L_h/ del_Me;              % cm, physical length at trochophore larva at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;               % cm, physical length at birth (veliger larva) at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth (veliger larva) at f and T

  % metamorphosis
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_Ms;               % cm, physical length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 .* (1 + f * w);       % g, wet weight at puberty  
  Wd_p = Ww_p * d_V;                % g, dry weight at puberty 
  Lw_p = (L_p^3/ L_M/ del_M/ del_s^2)^(1/2); % cm, body length at puberty
  tT_p = (t_p - t_j)/ k_M/ TC_tp;   % d, time since metam at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  Lw_i = (L_i^3/ L_M/ del_M/ del_s^2)^(1/2); % cm, ultimate body length

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  a11_m = t_m/ k_M/ TC_am11;             % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.am11 = a11_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdp = Wd_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % body length - shell length
  ELw_s = (LL(:,1) * L_M) .^ 0.5;
  
  % time-length
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  L_j = l_j * L_m; r_B = rho_B * k_M; L_i = l_i * L_m;
  [t, L] = ode45(@get_dL, tL(:,1), L_j, [], tTC, r_B, L_i);
  ELw = (L .^ 3/ L_M/ del_M/ del_s^2) .^ (1/2);  % cm, body length
  % tL_1 data post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL_1);
  L_0 = (Lw_0^2 * L_M * del_M^2 * del_s)^(1/3); L_i = l_i * L_m; % cm, structural length 
  rT_B = TC_tL_1 * rho_B * k_M;  % 1/d, von Bert growth rate   
  L = L_i - (L_i - L_0) * exp( - rT_B * tL_1(:,1)); % cm, length
  ELw_1 = (L .^ 3/ L_M/ del_M/ del_s^2) .^ (1/2);  % cm, body length
  % tL_2 data post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL_2);
  L_i = l_i * L_m; % cm, structural length
  L = L_i - (L_i - L_0) * exp( - rT_B * tL_2(:,1)); % cm, length
  ELw_2 = (L .^ 3/ L_M/ del_M/ del_s^2) .^ (1/2);  % cm, body length
  % tL_4 data post hatch, starting before birth before metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL_4);
  L_j = L_m * l_j; L_b = L_m * l_b; E_b = f_tL_4 * E_m * L_b^3;
  ELH_0 = [E_b; Lw_04 * del_Me; E_Hb; 0];
  [~, ELHR] = ode45(@dget_ELHR_pj, tL_4(:,1), ELH_0, [], L_b, L_j, L_m, TC_tL_4 * p_Am, TC_tL_4 * v, g, TC_tL_4 * k_J, kap, kap_R, E_Hb, E_Hj, E_Hp, f_tL_4);
  L = ELHR(:,2);  w_1 = min(1, max(0, (L - L_b)./ (L_j - L_b))); % dynamic shape
  shape_b_to_j = (del_Me * (1 - w_1) + del_Ms * w_1); % del_Me before b linear change to del_M between b and j del_M after j
  ELw_4 = L ./ shape_b_to_j; % length from fertilisation

  % tube length-weight
  EWd_1 = LWd_1(:,1) .^2 * L_M * del_M  * del_s^2 * (1 + f_u * ome) * d_V; % g, dry weight (from juvenile to adult)
  % shell length-weight for larvae
  w_2 = min(1, max(0, (LWd_2(:,1) - L_m * l_b/ del_Me) ./ (L_m * l_j/ del_Ms - L_m * l_b/ del_Me))); % dynamic shape
  shape_b_to_j = del_Me * (1 - w_2) + del_Ms * w_2;%
  EWd_2 = (LWd_2(:,1) .* shape_b_to_j).^3 .* (1 + f_u * w) * d_V; % g, dry weight (during veliger larvae stage)
  
  % weight-respiration
  p_ref = p_Am * L_m^2; % J/d, reference assimilation power
  O2M = (- n_M\n_O)';
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  [~, ~, ~, l_j, l_p, l_b, ~, ~, ~, ~] = get_tj(pars_tj, f_u);
  L_O = (WdJO(:,1)/ d_V/ (1 + f_u * ome)) .^ (1/3); % structural length from physical length
  pACSJGRD = p_ref * scaled_power_j(L_O, f_u, pars_pow, l_b, l_j, l_p);
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:, [1 7 5]);  
  JO = pADG * eta_O';        % mol/d, organic fluxes
  JM = JO * O2M;             % mol/d, mineral fluxes
  EJ_O = -JM(:,3) .* TC_WdJO;% mol/d, dioxygen consumption rate at temp T

  % pack to output
  prdData.tL = ELw;
  prdData.tL_1 = ELw_1;
  prdData.tL_2 = ELw_2;
  prdData.tL_4 = ELw_4;
  prdData.LL = ELw_s;
  prdData.LWd_1 = EWd_1;
  prdData.LWd_2 = EWd_2;
  prdData.WdJO = EJ_O;
  
end

function dELHR = dget_ELHR_pj(t,ELHR, Lb, Lj, Lm, p_Am, v, g, k_J, kap, kap_R, Hb, Hj, Hp, f)
  %  ELHR: 4-vector
  %   E: reserve E in J
  %   L: structural length in cm
  %   H: maturity E_H in J
  %   R: reproduction buffer E_R in j
  %  dELHR: change in reserve, length, maturity and reproduction buffer
 
  %  unpack variables
  E = ELHR(1); L = ELHR(2); H = ELHR(3); R = ELHR(4);
   
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
      
  e = v * E/ L^3/ p_Am; % -, scaled reserve density; 
  r = s * v * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  p_C = E * (s * v/ L - r); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt, dR/dt
  if H<Hp
    dH = (1 - kap) * p_C - k_J * H;  
    dR = 0;
  else
    dH = 0;
    dR = kap_R * (1 - kap) * p_C - k_J * Hp;
  end
  
  dE = (L > Lb) * s * p_Am * f * L^2 - p_C;
  dL = r * L/3;

  % pack derivatives
  dELHR = [dE; dL; dH; dR];
end

function dL = get_dL(t, L, tTC, r_B, L_i)
  TC = spline1(t, tTC);
  dL = TC * r_B * (L_i - L);
end

  






