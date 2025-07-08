function [prdData, info] = predict_Excirolana_armata(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  % customized filters to contrain additional parameter 
  filterChecks = f_br > 1.2 ; % f for brazil population. shouldn't be too high
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_br = tempcorr(temp.LN_br, T_ref, T_A); % brazil
  TC_ur = tempcorr(temp.LN_ur, T_ref, T_A); % uruguay
  
  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Wd_i = L_i^3 * (1 + f * ome) * d_V; % g, ultimate dry weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f_ur, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T


  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  % time-length  
  r_B = k_M/ 3/ (1 + f_br/ g);  L_i = L_m * f_br; L_b = L_m * get_lb([g; k; v_Hb], f_br);   
  [t, L] = ode45(@get_L, tL_br(:,1), L_b, [], r_B, L_i, T_ref, T_A, temp.tL_br); % cm, structural length 
  ELw_br = L/ del_M;                       % g, total length

  % length-fecundity
  % Brazil
  EN_br = TC_br * reprod_rate (LN_br(:,1) * del_M, f_br, pars_R) * 365/ 5;  % #/d, clutch size for spawning five times per yr (every two months)
  % Uruguai
  EN_ur = TC_ur * reprod_rate (LN_ur(:,1) * del_M, f_ur, pars_R) * 365/ 5;  % #/d, clutch size for spawning five times per yr (every two months)
  

  %% pack to output  prdData.tL_br = ELw;  
  prdData.tL_br = ELw_br;
  prdData.LN_br = EN_br;
  prdData.LN_ur = EN_ur;
  
end

function dL = get_L(t, L, r_B, L_i, T_ref, T_A, T_tL)
TC = tempcorr(T_tL+4*sin(2*pi*(t+10)/365), T_ref, T_A); 
  dL = TC * r_B * (L_i - L);
end 