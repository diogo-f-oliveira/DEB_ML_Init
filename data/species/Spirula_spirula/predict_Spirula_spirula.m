function [prdData, info] = predict_Spirula_spirula(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  r_B = rho_B * k_M; r_j = rho_j * k_M; % 1/d, exponential growth rate
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, mantle length at birth
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam 
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, mantle length at puberty

  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- TC * r_B * (aT_m - t_j/ kT_M));  
  Lw_i = L_am/ del_M;              % cm, mantle length at death
  Ww_i = L_am^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction: GSI at death
  pars_R = [kap; kap_R; g; TC*k_J; kT_M; L_T; TC*v; U_Hb/TC; U_Hj/TC; U_Hp/TC]; % compose parameter vector
  GSI = (Ww_b/ Ww_i) * cum_reprod_j(aT_m, f, pars_R); % -, GSI
    
  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length
  [t, L] = ode45(@get_L, tL(:,1), L_b, [], L_j, L_i, r_j, r_B, T_ref, T_A);
  ELw = L/ del_M;   % cm, dorsal mantle length at time

  % pack to output
  prdData.tL = ELw;
end

function dL = get_L(t, L, L_j, L_i, r_j, r_B, T_ref, T_A)
    TC = tempcorr(C2K(9+4*sin(2*pi*(t-125)/500)), T_ref, T_A);
    if L<L_j
      dL = TC*r_j*L/3;
    else
      dL = TC*r_B*(L_i-L);
    end
end
