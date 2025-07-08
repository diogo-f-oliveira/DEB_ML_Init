function [prdData, info] = predict_Salmo_trutta(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
if E_Hh >= E_Hb
  info = 0; prdData = [];
  return
end

%% compute temperature correction factors
  TC_ab_4 = tempcorr(temp.ab_4, T_ref, T_A);
  TC_ab_8 = tempcorr(temp.ab_8, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j t_p t_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1);                   % d, age at hatch at f and T_ref
  L_h = aUL(2,3);                   % cm, structural length at f
  Lw_h = L_h/ del_M;                % cm, length at hatch

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Lw_b = L_b/ del_M;                % cm, total length at birth
  %Wd_b = L_b^3 * d_V *(1 + f * w); % g, dry weight at birth
  aT_b_4 = t_b/ k_M/ TC_ab_4;       % d, age at birth 
  aT_b_8 = t_b/ k_M/ TC_ab_8;       % d, age at birth 

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  %Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  %Wd_i = L_i^3 * d_V * (1 + f * w);% g, ultimate dry weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ab_4 = aT_b_4;
  prdData.ab_8 = aT_b_8;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  EWw = (LW(:,1) * del_M).^3 * (1 + w * f);
  
  TC = tempcorr(Tah(:,1), T_ref, T_A);
  Eah = a_h./ TC;
  
  % pack to output
  prdData.LW = EWw;
  prdData.Tah = Eah;
     