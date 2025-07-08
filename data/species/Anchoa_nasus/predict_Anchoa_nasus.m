function [prdData, info] = predict_Anchoa_nasus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [tau_j tau_p tau_b l_j l_p l_b l_i rho_j rho_B info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth 
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = tau_b/ k_M/ TC_ab;         % d, age at birth of foetus at f and T
  
  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, standard length at puberty at f
  Ww_p = L_p^3*(1 + f * ome);       % g, weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate standard length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  aT_m = tau_m/ kT_M;                   % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp= Ww_p;
  prdData.Wwi = Ww_i;

  %% uni-variate data
  
  % time-length data
  t = linspace(0,10000,1000)'; 
  tvel = get_tj(pars_tj, f_tL, [], t*kT_M);
  Lw = L_m * tvel(:,4)/del_M; tL = spline1(LL(:,1),[Lw,t]);
  ELw = spline(tL+365,[t,Lw]); % total length

  % length-weight
  EWw = (LW(:,1)*del_M).^3*(1+f*ome);

  % length-fecundity
  EN = TC * 365 * reprod_rate_j(LN(:,1)*del_M, f, pars_R); % #, fecundity

  % pack to output
  prdData.LL = ELw;
  prdData.LW = EWw;
  prdData.LN = EN;
end

