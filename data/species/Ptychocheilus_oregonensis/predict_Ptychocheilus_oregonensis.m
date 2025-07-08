function [prdData, info] = predict_Ptychocheilus_oregonensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  
%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);  kT_M = k_M * TC; 
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;               % d, age at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length 
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];  % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univariate data
  % time - length
  pars_tj = [g k l_T v_Hb v_Hj v_Hj+1e-3];
 [tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f_tL);
  if ~info; prdData = []; return; end
  r_j = k_M * rho_j; r_B = k_M * rho_B; % 1/d, growth rates
  L_b = L_m * l_b; L_j = L_m * l_j; L_i = L_m * l_i;
  [t, L] = ode45(@dget_L, tL(:,1), L_b, [], T_ref, T_A, L_j, L_i, r_j, r_B);
  ELw = L/del_M;
  
  % pack to output
  prdData.tL = ELw;

end

function dL = dget_L(t, L, T_ref, T_A, L_j, L_i, r_j, r_B)
  TC = tempcorr(C2K(11+9*cos(t*2*pi/365)), T_ref, T_A);
  if L<L_j
    dL = L * r_j * TC/3;
  else
    dL = TC * r_B * (L_i - L);
  end
end
