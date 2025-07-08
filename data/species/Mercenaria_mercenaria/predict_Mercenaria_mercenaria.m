
function [prdData, info] = predict_Mercenaria_mercenaria(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); vars_pull(cPar); vars_pull(data); vars_pull(auxData);
  
  % compute temperature correction factors
  Tpars          = [T_A; T_L; T_H; T_AL; T_AH];
  TC_ab           = tempcorr(temp.ab, T_ref, Tpars);
  TC_aj           = tempcorr(temp.aj, T_ref, Tpars);
  TC_ap           = tempcorr(temp.ap, T_ref, Tpars);
  TC_am           = tempcorr(temp.am, T_ref, Tpars);
  TC_Ri           = tempcorr(temp.Ri, T_ref, Tpars);
  TC_RigwRich2011 = tempcorr(temp.tL_RigwRich2011, T_ref, Tpars);
  TC_RiceHick1989 = tempcorr(temp.tL_RiceHick1989, T_ref, Tpars);
  TC_BrowHeil2010 = tempcorr(temp.WdJO_BrowHeil2010, T_ref, Tpars);

 % zero-variate data

  % life cycle
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b  = L_m * l_b;                 % cm, structural length at birth
  Lw_b = L_b / del_Mb;              % cm, physical length at birth
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
  aT_b = t_b / k_M / TC_ab;         % d, age at birth

  % metamorphosis
  L_j  = L_m * l_j;                 % cm, structural length at metamorphosis
  Lw_j = L_j / del_Mb;              % cm, physical length at metamorphosis
  Wd_j = L_j^3 * d_V * (1 + f * w); % g, dry weight at metamorphosis
  aT_j = t_j / k_M / TC_aj;         % d, age at metamorphosis

  % puberty 
  L_p  = L_m * l_p;                 % cm, structural length at puberty
  Lw_p = L_p / del_Mj;              % cm, physical length at puberty
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty
  aT_p = t_p / k_M / TC_ap;         % d, age at puberty

  % ultimate
  L_i  = L_m * l_i;                 % cm, ultimate structural length
  Lw_i = L_i / del_Mj;              % cm, ultimate physical length
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  RT_i   = TC_Ri * reprod_rate_j(L_i, f, pars_R); % #/d, ultimate reproduction rate

  % life span
  pars_tm = [g; l_T; h_a/k_M^2; s_G];
  t_m     = get_tm_s(pars_tm, f, l_b); % -, scaled mean life span
  aT_m    = t_m / k_M / TC_am;         % d, mean life span
  
  % pack to output
  prdData.ab  = aT_b;
  prdData.aj  = aT_j;
  prdData.ap  = aT_p;
  prdData.am  = aT_m;
  prdData.Lb  = Lw_b;
  prdData.Lj  = Lw_j;
  prdData.Lp  = Lw_p;
  prdData.Li  = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdj = Wd_j;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri  = RT_i;
  
 % uni-variate data
 
  % tL data from RigwRich2011
  f  = f_RigwRich2011;
  TC = TC_RigwRich2011;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_j = r_j * kT_M; rT_B = r_B * kT_M; tT_j = (t_j - t_b) / kT_M; 
  L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; 
  L_bj = L_b * exp(tL_RigwRich2011((tL_RigwRich2011(:,1) <= tT_j),1) * rT_j / 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_RigwRich2011((tL_RigwRich2011(:,1) > tT_j),1) - tT_j));
  EL_RigwRich2011 = [L_bj; L_jm] / del_Mj; % cm, shell length

  % tL data from RiceHick1989
  f  = f_RiceHick1989;
  TC = TC_RiceHick1989;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_j = r_j * kT_M; rT_B = r_B * kT_M; tT_j = (t_j - t_b) / kT_M; 
  L_b  = l_b * L_m; L_j = l_j * L_m; L_i = l_i * L_m; 
  L_bj = L_b * exp(tL_RiceHick1989((tL_RiceHick1989(:,1) <= tT_j),1) * rT_j / 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL_RiceHick1989((tL_RiceHick1989(:,1) > tT_j),1) - tT_j));
  EL_RiceHick1989 = [L_bj; L_jm] / del_Mj; % cm, shell length
  % LWw
  EWw_RiceHick1989 = (LWw_RiceHick1989(:,1) * del_Mj) .^3 * (1 + w * f); % g, wet weight

  % LWd data from CharShri2004
  f = f_CharShri2004;
  EWd_CharShri2004 = (LWd_CharShri2004(:,1) * del_Mj) .^3 * (1 + w * f) * d_V; % g, dry weight

  % WdJO data from BrowHeil2010
  f        = 1;
  TC       = TC_BrowHeil2010;
  p_ref    = p_Am * L_m^2;                               % J/d,   max assimilation power at max size and T_ref
  L        = (WdJO_BrowHeil2010(:,1) / d_V / (1 + f * w)).^(1/3);
  pars_p   = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  pACSJGRD = p_ref * scaled_power_j(L, f, pars_p, l_b, l_j, l_p);
  pADG     = pACSJGRD(:,[1 7 5]);  %pADG(:,1) = 0;       %        starved animals (for 3 days), no assimilation
  O2M      = (- n_M \ n_O)';                             % -,     matrix that converts organic to mineral fluxes. O2M is prepared for post-multiplication (eq. 4.35)
  J_M      = pADG * eta_O' * O2M;                        %        mineral fluxes
  X_gas    = 1/ 24.4;                                    % mol/L, mol of gas per litre at 20 C and 1 bar
  EJO_BrowHeil2010 = - TC * J_M(:,3) * 1e3/ 24/ X_gas;   % mL/h,  oxygen consumption rate

  % pack to output
  prdData.tL_RigwRich2011   = EL_RigwRich2011;
  prdData.tL_RiceHick1989   = EL_RiceHick1989;
  prdData.LWw_RiceHick1989  = EWw_RiceHick1989;
  prdData.LWd_CharShri2004  = EWd_CharShri2004;
  prdData.WdJO_BrowHeil2010 = EJO_BrowHeil2010;


