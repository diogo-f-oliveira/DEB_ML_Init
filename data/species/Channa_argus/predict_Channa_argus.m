function [prdData, info] = predict_Channa_argus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if T_L > T_ref || T_H < T_ref
    info = 0; prdData = []; return
  end


  % compute temperature correction factors
  pars_T = [T_A T_L T_H T_AL T_AH];
  TC = tempcorr(temp.am, T_ref, pars_T);
  TC_10 = tempcorr(temp.WJX10, T_ref, pars_T);
  TC_15 = tempcorr(temp.WJX15, T_ref, pars_T);
  TC_20 = tempcorr(temp.WJX20, T_ref, pars_T);
  TC_25 = tempcorr(temp.WJX25, T_ref, pars_T);
  TC_30 = tempcorr(temp.WJX30, T_ref, pars_T);
  TC_35 = tempcorr(temp.WJX35, T_ref, pars_T);
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % metam
  s_M = l_j/ l_b;                   % -, acceleration factor

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  % univariate data
  % weight-feeding rate
  EJX_10 = TC_10 * p_Am * s_M * f * ((WJX10(:,1)/(1 + f * w)).^(1/3)).^2/ kap_X/ mu_X * w_X/ d_X; % g/d
  EJX_15 = TC_15 * p_Am * s_M * f * ((WJX15(:,1)/(1 + f * w)).^(1/3)).^2/ kap_X/ mu_X * w_X/ d_X; % g/d
  EJX_20 = TC_20 * p_Am * s_M * f * ((WJX20(:,1)/(1 + f * w)).^(1/3)).^2/ kap_X/ mu_X * w_X/ d_X; % g/d
  EJX_25 = TC_25 * p_Am * s_M * f * ((WJX25(:,1)/(1 + f * w)).^(1/3)).^2/ kap_X/ mu_X * w_X/ d_X; % g/d
  EJX_30 = TC_30 * p_Am * s_M * f * ((WJX30(:,1)/(1 + f * w)).^(1/3)).^2/ kap_X/ mu_X * w_X/ d_X; % g/d
  EJX_35 = TC_35 * p_Am * s_M * f * ((WJX35(:,1)/(1 + f * w)).^(1/3)).^2/ kap_X/ mu_X * w_X/ d_X; % g/d
  
  % weight-spec growth rate in %/d
  Er_10 = 100 * TC_10 * v * s_M *(f./ ((Wr10(:,1)/(1 + f * w)).^(1/3)) - 1/L_m/ s_M)/ (f + g); % %/d
  Er_15 = 100 * TC_15 * v * s_M *(f./ ((Wr15(:,1)/(1 + f * w)).^(1/3)) - 1/L_m/ s_M)/ (f + g); % %/d
  Er_20 = 100 * TC_20 * v * s_M *(f./ ((Wr20(:,1)/(1 + f * w)).^(1/3)) - 1/L_m/ s_M)/ (f + g); % %/d
  Er_25 = 100 * TC_25 * v * s_M *(f./ ((Wr25(:,1)/(1 + f * w)).^(1/3)) - 1/L_m/ s_M)/ (f + g); % %/d
  Er_30 = 100 * TC_30 * v * s_M *(f./ ((Wr30(:,1)/(1 + f * w)).^(1/3)) - 1/L_m/ s_M)/ (f + g); % %/d
  Er_35 = 100 * TC_35 * v * s_M *(f./ ((Wr35(:,1)/(1 + f * w)).^(1/3)) - 1/L_m/ s_M)/ (f + g); % %/d

  % pack to output
  prdData.WJX10 = EJX_10;
  prdData.WJX15 = EJX_15;  
  prdData.WJX20 = EJX_20;  
  prdData.WJX25 = EJX_25;  
  prdData.WJX30 = EJX_30;  
  prdData.WJX35 = EJX_35;
  prdData.Wr10 = Er_10;
  prdData.Wr15 = Er_15;  
  prdData.Wr20 = Er_20;  
  prdData.Wr25 = Er_25;  
  prdData.Wr30 = Er_30;  
  prdData.Wr35 = Er_35;
