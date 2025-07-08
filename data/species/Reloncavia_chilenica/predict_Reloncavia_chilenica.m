function [prdData, info] = predict_Reloncavia_chilenica(par, data, auxData)
    
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, length at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  L_i = L_m * f;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  
  % uni-variate data
  
  % time-length post metam
  [t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_tL);
  L_b = L_m * l_b; L_i = L_m * f_tL; r_B = k_M/ 3/ (1 + f_tL/ g);  
  [t L] = ode45(@get_L, tL(:,1), L_b, [], r_B, L_i, T_ref, T_A);
  ELw = L/ del_M; % cm, shell length

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = 365 * TC * reprod_rate(LN(:,1)*del_M, f_tL, pars_R); % #, fecundity
  
  % length-weight
  EWd = (LWd(:,1)*del_M).^3 * (1 + f * ome) * d_V; % g, tissue dry weight

  % pack to output
  prdData.tL = ELw;
  prdData.LN = EN;
  prdData.LWd = EWd;
end

function dL = get_L(t, L, r_B, L_i, T_ref, T_A)
  TC = tempcorr(C2K(14+8*sin(2*pi*(t-180)/365)), T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
