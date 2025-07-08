function [prdData, info] = predict_Octopus_vulgaris(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_22 = tempcorr(temp.ab_22, T_ref, T_A);
  TC_18 = tempcorr(temp.ab_18, T_ref, T_A);
  TC_ts = tempcorr(temp.ts, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ni = tempcorr(temp.Ni, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  TC_para1 = tempcorr(temp.tWd_para1, T_ref, T_A);
  TC_para2 = tempcorr(temp.tWd_para2, T_ref, T_A);
  
  % zero-variate data
  
  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, mantle length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  a_b = t_b/ k_M; a22_b = a_b/ TC_22; a18_b = a_b/ TC_18; 
 
  % settle
  pars_ts = [g k l_T v_Hb v_Hs v_Hs+1];
  [t_s, t_ps, t_bs, l_s] = get_tj(pars_ts, f);
  tT_s = (t_s - t_bs)/ k_M/ TC_ts;  % d, time since birth at settlement
  Wd_s = (l_s * L_m)^3 * d_V * (1 + f * w); % g, dry weight at settlement

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  tj = (t_j - t_b)/ k_M;            % d, time since birth at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_ts;   % d, time since birth at puberty

  % life span
  pars_tm = [pars_tj; s_G; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_j(pars_tm, f);        % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M/ TC_am;            % d, mean life span at T

  % ultimate
  L_i = L_m * l_i; r_B = rho_B * k_M;  % cm, ultimate structural length at f
  L_am = L_i - (L_i - L_j) * exp(- TC_am * r_B * (aT_m  - t_j/ k_M/ TC_am));  
  Ww_am = L_am^3 * (1 + f * w);     % g, wet weight at death
 
  % reproduction
  pars_R = [kap; kap_R; g; TC_Ni*k_J; TC_Ni*k_M; L_T; TC_Ni*v; U_Hb/TC_Ni; U_Hj/TC_Ni; U_Hp/TC_Ni]; % compose parameter vector
  NT_am = cum_reprod_j(aT_m, f, pars_R); % #, cum no of eggs at L

  
  % pack to output
  prdData.ab_22 = a22_b;
  prdData.ab_18 = a18_b;
  prdData.ts = tT_s;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Wdb = Wd_b;
  prdData.Wds = Wd_s;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_am;
  prdData.Ni = NT_am;
  
  % uni-variate data
  
  % time-weight,length
  tvel = get_tj(pars_tj, f, [], tWd_para1(:,1) * k_M * TC_para1);
  EWd_para1 = (L_m * tvel(:,4)).^3 * d_V * (1 + f * w);   % g, dry weight
  %
  tvel = get_tj(pars_tj, f, [], tWd_para2(:,1) * k_M * TC_para2);
  EWd_para2 = (L_m * tvel(:,4)).^3 * d_V * (1 + f * w);   % g, dry weight
  %
  tvel = get_tj(pars_tj, f, [], tL_para2(:,1) * k_M * TC_para2);
  ELw_para2 = L_m * tvel(:,4)/ del_M; % cm, mantle length
  %
  tvel = get_tj(pars_tj, f_tW, [], tW(:,1) * k_M * TC_tW);
  EWw = (L_m * tvel(:,4)).^3 * (1 + f_tW * w);   % g, dry weight

  % pack to output
  prdData.tW = EWw;
  prdData.tWd_para1 = EWd_para1;
  prdData.tWd_para2 = EWd_para2;
  prdData.tL_para2 = ELw_para2;
