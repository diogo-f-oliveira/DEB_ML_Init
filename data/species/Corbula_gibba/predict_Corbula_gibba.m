function [prdData, info] = predict_Corbula_gibba(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
          
            
  pars_T=[T_A,T_L,T_H,T_AL,T_AH];
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, pars_T);
  TC_aj = tempcorr(temp.aj, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr(temp.Ri, T_ref, pars_T);
  tTC = [temp.tL(:,1) tempcorr(C2K(temp.tL(:,2)), T_ref, pars_T)];
  % compose f-spline based on temperature
  tf = temp.tL; tf(:,2) = 5 * K * tf(:,2)/10; tf(:,2) = max(0, min(1,  tf(:,2) ./ (K + tf(:,2)))); 

  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metamorphosis
  aT_j = t_j/ k_M/ TC_aj;           % d, age at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, shell length at metam

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell length at puberty at f
  
  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate shell length at f
  Wd_i = L_i^3 * (1 + f * w) * d_V; % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
    
  % pack to output
  prdData.ab = aT_b;
  prdData.aj = aT_j;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
   
  % uni-variate data
  
  % time - length,  post metam
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i] = get_tj(pars_tj, 1);
  s_M = l_j/ l_b; L_j = l_j * L_m; L_i = l_i * L_m; 
  [t, eL] = ode45(@get_eL, tL(:,1), [1, L_j], [], tTC, tf, L_i, s_M * v, g);  
  ELw = eL(:,2)/ del_M; % cm, shell length
  
  % pack to output
  prdData.tL = ELw;
end

function deL = get_eL(t, eL, tTC, tf, L_i, v, g)
  e = eL(1); L = eL(2);
  
  f = spline1(t, tf); TC = spline1(t, tTC);
  de = (f - e) * TC * v/ L;
  r = TC * v * (e/L - 1/ L_i)/ (e + g);
  dL = L * r/ 3;
  
  deL = [de; dL];
end
  