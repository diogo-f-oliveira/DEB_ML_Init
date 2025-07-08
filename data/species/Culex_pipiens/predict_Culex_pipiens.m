function [prdData, info] = predict_Culex_pipiens(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if s_1<1 || s_2<1 || s_3<1 || s_4<1
    info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);  
  TC_ae = tempcorr(C2K(Tae(:,1)), T_ref, T_A);  
  TC_aeS = tempcorr(C2K(Tae_S(:,1)), T_ref, T_A);  
  TC_te = tempcorr(C2K(Tte(:,1)), T_ref, T_A);  
  TC_am = tempcorr(C2K(Tam(:,1)), T_ref, T_A);  
  TC_tW = tempcorr(temp.tW, T_ref, T_A);  
  TC_a = tempcorr(C2K(Ta(:,1)), T_ref, T_A);  
  
  % zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; % -, scaled reprod buffer density at pupation
  pars_tj_hax = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f);
  if ~info
    prdData = []; return
  end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial energy content
  Ww_0 = w_E * E_0/ mu_E/ d_E;                      % g, initial wet weight
    
  % birth
  a_b = t_0 + t_b/ k_M;              % d, age at birth at f and T
  
  % pupation
  tT_j = (t_j - t_b)/ k_M/ TC_tj;     % d, time since birth at pupation
  L_j = L_m * l_j;                    % cm structural length at pupation
  Wd_Rj = E_Rj * L_j^3 * w_E/ mu_E;   % g, dry weight repod buffer at pupation
  Wd_j = Wd_Rj + L_j^3 * d_V * (1 + f * ome); % g, dry weight at pupation
  Ww_j = Wd_Rj/ d_E + L_j^3 * (1 + f * ome); % g, wet weight at pupation
  
  % emergence

  % reproduction
  NT_i = kap_R * E_Rj * L_j^3/ E_0; % #, total number of eggs 
  
  % pack to output
  prdData.tj = tT_j;
  prdData.Wdj = Wd_j;
  prdData.Wwj = Ww_j;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-weight of larva
  pars_R = [kap; kap_R; g; TC_tW*k_J; TC_tW*k_M; 0; TC_tW*v; U_Hb/TC_tW; U_Hp/TC_tW; U_Hp/TC_tW + 1e-8];  
  [N, L] = cum_reprod_j(tW(:,1), f_tW, pars_R);
  EWw    = L.^3 * (1 + f_tW * w) + Ww_0 * N;  % g, wet weight 
  %
  [N, L] = cum_reprod_j(tW1(:,1), f_tW1, pars_R);
  EWw_1  = L.^3 * (1 + f_tW1 * w) + Ww_0 * N;  % g, wet weight 
  %
  [N, L] = cum_reprod_j(tW2(:,1), f_tW2, pars_R);
  EWw_2  = L.^3 * (1 + f_tW2 * w) + Ww_0 * N;  % g, wet weight 
  
  % temp - age at birth
  Eab = a_b/ k_M ./ TC_ab; % d, age at birth

  % temperature - age at emergence
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f_Tae);
  if ~info
    prdData = []; return;
  end
  EaT_e = (t_e - t_b)/ k_M ./ TC_ae; % d, age at emergence
  EaT_eS = (t_e - t_b)/ k_M ./ TC_aeS; % d, age at emergence
  
  % temperature - time since birth emergence
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f_Tte);
  if ~info
    prdData = []; return;
  end
  EtT_e = (t_e - t_b)/ k_M ./ TC_te; % d, time since birth at emergence

  % temperature - age at instar 1 2 3 4 pupation emergence
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f_Ta);
  if ~info
    prdData = []; return
  end
  l_1 = l_b * s_1^0.5; l_2 = l_1 * s_2^0.5; l_3 = l_2 * s_3^0.5; l_4 = l_2 * s_4^0.5; % -, scaled structural length of instar 1-4
  options = odeset('Events', @instars);
  [t, l, t_i, l_i] = ode45(@dget_tj_hax, [0; 10*t_j], l_b, options, f_Ta, g, l_b, l_p, l_1, l_2, l_3, l_4);
  EtT_a = [t_i'+t_b, t_p, t_e]/ k_M ./ TC_a; % d, age at instar 1 2 3 4 pupation emergence

  % life span as imago
  % females
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M ./ TC_am;             % d, mean life span as imago
  % males
  pars_tmm = [g; l_T; h_am/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_mm = get_tm_s(pars_tmm, f, l_b);     % -, scaled mean life span at T_ref
  aT_mm = t_mm/ k_M ./ TC_am;            % d, mean life span as imago
  EaT_m = [aT_m, aT_mm];


  % pack to output
  prdData.tW  = EWw;
  prdData.tW1 = EWw_1;
  prdData.tW2 = EWw_2;
  prdData.Tab = Eab;
  prdData.Tae = EaT_e;
  prdData.Tae_S = EaT_eS;
  prdData.Tte = EtT_e;
  prdData.Ta = EtT_a;
  prdData.Tam = EaT_m;
end

function dl = dget_tj_hax(t, l, f, g, l_b, l_p, l_1, l_2, l_3, l_4)
  s_M = min(l, l_p)/ l_b; % acceleration between b and p, pupation at j
  r = (f * s_M/ l - 1)/ (1 + f/ g); % -, scaled specific growth rate, see comm 7.8.2
  dl = l * r/ 3; % -, change in scaled length in scaled time
end

function [value,isterminal,direction] = instars(t, l, f, g, l_b, l_p, l_1, l_2, l_3, l_4)
 value = l - [l_1, l_2, l_3, l_4]; 
 isterminal = [0 0 0 0];
 direction = [0 0 0 0];
end
