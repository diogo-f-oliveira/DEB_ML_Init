function [prdData, info] = predict_Acanthophis_antarcticus(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, carpace length
  Ww_b = L_b^3 * (1 + f * w);       % g, weight at birth
  
  % puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carpace length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carpace length
    
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_tpm = [g k l_T v_Hb v_Hpm];
  Lw_pm = L_m * get_lp(pars_tpm, f)/ del_M;

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length * length-change in length
  L_i = L_m * f_tL; L_b = L_m * get_lb([g k v_Hb], f_tL);
  rT_B = TC * k_M/ 3/ (1 + f_tL/ g);
  ELw = (L_i - (L_i - L_b) * exp(- rT_B * tL(:,1)))/ del_M; % cm, total length
  EWw = (L_i - (L_i - L_b) * exp(- rT_B * tW(:,1))).^3 * (1 + f_tL * w); % g, weight
  
  
  % pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
    