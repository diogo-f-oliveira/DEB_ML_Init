function [prdData, info] = predict_Liopsetta_glacialis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
            
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC; 
  TC_D = tempcorr(temp.tL_Dfm, T_ref, T_A); 
  TC_O = tempcorr(temp.tL_Ofm, T_ref, T_A); 
  TC_V = tempcorr(temp.tL_Vfm, T_ref, T_A); 
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);


  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

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
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  tvel = get_tj(pars_tj, f_D, [], tL_Dfm(:,1)*k_M*TC_D); 
  ELw_Df = L_m * tvel(:,4)/ del_M; % cm, total length
  %
  tvel = get_tj(pars_tjm, f_D, [0 z/z_m l_b*z/z_m], tL_Dfm(:,1)*k_M*TC_D); 
  ELw_Dm = L_m * tvel(:,4)/ del_M; % cm, total length
  %
  %
  tvel = get_tj(pars_tj, f_O, [], tL_Ofm(:,1)*k_M*TC_O); 
  ELw_Of = L_m * tvel(:,4)/ del_M; % cm, total length
  %
  tvel = get_tj(pars_tjm, f_O, [0 z/z_m l_b*z/z_m], tL_Ofm(:,1)*k_M*TC_O); 
  ELw_Om = L_m * tvel(:,4)/ del_M; % cm, total length
  %
  %
  tvel = get_tj(pars_tj, f_V, [], tL_Vfm(:,1)*k_M*TC_V); 
  ELw_Vf = L_m * tvel(:,4)/ del_M; % cm, total length
  %
  tvel = get_tj(pars_tjm, f_V, [0 z/z_m l_b*z/z_m], tL_Vfm(:,1)*k_M*TC_V); 
  ELw_Vm = L_m * tvel(:,4)/ del_M; % cm, total length

  % time-length 
  
  % pack to output
  prdData.tL_Dfm = [ELw_Df ELw_Dm];
  prdData.tL_Ofm = [ELw_Of ELw_Om];
  prdData.tL_Vfm = [ELw_Vf ELw_Vm];
  
end
