function [prdData, info] = predict_Megalobulimus_mogianensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if kap_X + kap_P > 1
    info = 0; prdData = []; return;
  end
  
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_AL];
  TC = tempcorr(temp.am, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, shell length at birth
  

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at metam at f
  Lw_p = L_p/ del_M;                % cm, shell width at puberty

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate shell width
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univariate data
  % time-length
  L_b = L_m * get_lb([g k v_Hb], f_tL); L_i = L_m * f_tL;
  r_B = k_M/ 3/ (1 + f_tL/ g);
  [t L] = ode45(@get_L, tL(:,1), L_b, [], r_B, L_i, T_ref, pars_T, t_0);
  ELw = L/ del_M;
  
  % pack to output
  prdData.tL = ELw;

end

function dL = get_L(t, L, r_B, L_i, T_ref, pars_T, t_0)
   TC = tempcorr(C2K(21+6*sin(2*pi*(t-t_0)/365)), T_ref, pars_T);
   dL = TC * r_B * (L_i - L);
end