function [prdData, info] = predict_Rudarius_ercodes(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E); s_M = 1;
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^3); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length 
  [l_p l_b]  = get_lp(pars_tp,f_tL,[]); r_B = k_M/3/(1+f_tL/g);
  L_b = L_m * l_b; L_i =  L_m * f_tL;
  [t, L] = ode45(@get_dL, [0; tL(:,1)], L_b, [], T_ref, T_A, t_0, r_B, L_i);
  L(1) = []; ELw = L/ del_M; % cm, total length
  
  % length-weight
  EWw = (LW(:,1)*del_M).^3*(1+f*ome); % g, weight
  
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
end

function dL = get_dL(t, L, T_ref, T_A, t_0, r_B, L_i)
  TC = tempcorr(C2K(15+10*sin(2*pi*(t-t_0)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
  