function [prdData, info] = predict_Strangomera_bentincki(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); 
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j tau_p tau_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;      % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3*(1 + f * ome);       % g, weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC;               % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp= Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % time-length data
  [tau_j tau_p tau_b l_j l_p l_b l_i rho_j rho_B] = get_tj(pars_tj, f_tL);
  r_B = rho_B * k_M; L_i = L_m * l_i; 
  [t, L] = ode45( @get_L,tL(:,1), Lw_0 * del_M,[], T_ref, T_A, t_0, r_B, L_i);
  ELw = L/del_M;

  % pack to output
  prdData.tL = ELw;
end

function dL = get_L(t, L, T_ref, T_A, t_0, r_B, L_i)
TC = tempcorr(C2K(12+9*sin(2*pi*(t-t_0)/365)), T_ref, T_A); 
dL = TC * r_B * (L_i - L);
end
