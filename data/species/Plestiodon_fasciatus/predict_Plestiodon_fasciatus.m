function [prdData, info] = predict_Plestiodon_fasciatus(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH];  
  TC = tempcorr(temp.am, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp_foetus(pars_tp, f);
  
  % birth
  L_b = L_m * l_b; Lw_b = L_b/del_M;% cm,  length at birth at f
  Wd_b = L_b^3 * (1 + f * w) * d_V; % g, dry weight at birth
  aT_b = t_b/ k_M/ TC;              % d, age at birth

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = L_m * l_p;                  % cm, struc length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, SVL
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  
  % univar data
  
  % univariate data
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  r_B = k_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate
  [t, L] = ode45(@get_L, tL(:,1), L_b, [], T_ref, pars_T, t_0, L_i, r_B); % EL: {J/cm^3, cm}, with {[E], L}
  ELw = L/ del_M; % cm, SVL

  % length-weight
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, weight
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN = 365 * TC * reprod_rate_foetus(LN(:,1)*del_M, f, pars_R); % #, fecundity
  
  % pack to output
  prdData.tL = ELw;
  prdData.LW = EWw;
  prdData.LN = EN;

end

function dL = get_L(t, L, T_ref, pars_T, t_0, L_i, r_B)
  TC = tempcorr(C2K(25*sin(2*pi*(t+t_0)/365)), T_ref, pars_T); % -, TC at t
  dL = TC * r_B * (L_i - L); % cm/d, change in structural length d/dt L
end