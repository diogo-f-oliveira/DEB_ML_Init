function [prdData, info] = predict_Aedes_aegypti(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);     % most data at 28 C
  TC_WJO = tempcorr(temp.WJO, T_ref, T_A);
  
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
  [t_b, l_b] = get_tb([g k v_Hb], f);
  aT_b = t_0 + t_b/ k_M/ TC;          % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                    % cm, structural length at pupation
  Ww_j = L_j^3 * (1 + f * w);         % g, wet weight at pupation, excluding reprod buffer at pupation
  Ww_Rj = E_Rj * L_j^3 * w_E/ mu_E/ d_E; % g, wet weight repod buffer at pupation
  Ww_j = Ww_j + Ww_Rj;                % g, wet weight including reprod buffer
  tT_j = (t_j - t_b)/ k_M/ TC;        % d, time since birth at metam
  
  % emergence
  L_e = L_m * l_e;                    % cm, structural length at emergence
  Ww_e = L_e^3 + Ww_Rj + u_Ee * g * E_m * L_m^3 * w_E/ mu_E/ d_E; % g, wet weight including reprod buffer
  tT_e = (t_e - t_j)/ k_M/ TC;        % d, time since pupation at emergence  

  % reproduction
  NT_i = kap_R * E_Rj * L_j^3/ E_0; % #, total number of eggs 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.te = tT_e;
  prdData.am = aT_m;
  prdData.Ww0 = Ww_0;
  prdData.Wwj = Ww_j;
  prdData.Wwe = Ww_e;
  prdData.E0 = E_0;
  prdData.Ni = NT_i;
  
  % uni-variate data
  
  % time-length
  pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; 0; TC*v; U_Hb/TC; U_Hp/TC; U_Hp/TC + 1e-8];
  [N, L] = cum_reprod_j(tL(:,1), f_tW, pars_R);
  ELw  = L/ del_M;  % cm, head length
  
  % time-weight 
  [N, L] = cum_reprod_j(tW(:,1), f_tW, pars_R);
  EWw  = L.^3 * (1 + f_tW * w) + Ww_0 * N;  % g, wet weight (Ww_0 in mg)
  
  % weight - respiration
  pars = [kap kap_V kap_R g k_J k_M v U_Hb U_Hp U_He];
  L = (WJO(:,1)/ (1 + f_tW * ome)).^(1/3); % cm, struc length, this ignores contribution of eggs
  try
    pACSJGRD = scaled_power_hax(L, f, pars, l_b, l_p, l_j, l_e, t_j);
  catch
    info = 0; prdData = []; return;
  end
  JM = - (n_M\n_O) * eta_O * pACSJGRD(:,[1 7 5])'; % mol/d, mineral fluxes
  JO = - JM(3,:)'/ 24;       % mol O2/h, O2-consumption 
  EJT_O = TC_WJO .* JO * 24.4 ./ WJO(:,1); % ml^3/h.g, specific O2 consumption 
  
  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.WJO = EJT_O;
  
end

