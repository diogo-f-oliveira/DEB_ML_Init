function [prdData, info] = predict_Hyas_coarctatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  TC_tj = tempcorr(C2K(Ttj(:,1)), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  E_b = L_b^3 * (M_V * mu_V + E_m * f); % J, energy content at birth 

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Wd_j = L_j^3 * d_V * (1 + f * w); % g, dry weight at metam
  E_j = L_j^3 * (M_V * mu_V + E_m * f); % J, energy content at metam 
  
  % puberty 
  tT_p = (t_p - t_j)/ k_M/ TC;      % d, time since metam at puberty at f and T
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, carapace length at puberty
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate carapace length
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  pars_tjm = [g k l_T v_Hb v_Hj v_Hpm];
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  tT_pm = (t_pm - t_jm)/ k_M/ TC;        % d, time since metam at puberty
  L_pm = L_m * l_pm; Lw_pm = L_pm/ del_M; % cm, carapace width at puberty
  Ww_pm = L_pm.^3 * (1 + f * w);     % g, wet weight at puberty

  % pack to output
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Lim = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdj = Wd_j;
  prdData.Wwp = Ww_p;
  prdData.Wwpm = Ww_pm;
  prdData.Wwim = Ww_i;
  prdData.Eb = E_b;
  prdData.Ej = E_j;
  prdData.Ri = RT_i;
  
  % univariate data
  
  % time-length post metam
  % females
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_tL);
  rT_B = TC * rho_B * k_M; L_j = l_j * L_m; L_i = l_i * L_m;
  ELw_f = (L_i - (L_i - L_j) * exp( - rT_B * tL_f(:,1)))/ del_M; % cm, carapace length at time
  % males
  [t_jm, t_pm, t_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f_tL);
  rT_Bm = TC * rho_Bm * k_M; L_jm = l_jm * L_m; L_im = l_im * L_m;
  ELw_m = (L_im - (L_im - L_jm) * exp( - rT_Bm * tL_m(:,1)))/ del_M; % cm, carapace length at time
  
  % T-tj
  EtT_j = (t_j - t_b)/ k_M ./ TC_tj;
  
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.Ttj = EtT_j;

    