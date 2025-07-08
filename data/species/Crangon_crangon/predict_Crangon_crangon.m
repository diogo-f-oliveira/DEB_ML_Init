function [prdData, info] = predict_Crangon_crangon(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if T_L > T_ref
      info = 0; prdData = []; return
  end
  
  % compute temperature correction factors
  pars_T = [T_A, T_L, T_AL];
  TC_tj = tempcorr(temp.tj, T_ref, pars_T);
  TC_tp = tempcorr(temp.tp, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_LN = tempcorr(temp.LN, T_ref, pars_T);
  TC_tL = tempcorr(temp.tL_f, T_ref, pars_T);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 *(1 + f * w);        % g, wet weight at birth
  a_b = t_0 + t_b/ k_M;             % d, age at birth at f and T_ref

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, age at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_mm = p_Am_m/ v;                    % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_mm);              % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i] = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m]);
  L_im = l_i * L_mm; Lw_im = L_im/ del_M;  % cm, ultimate total length

  % pack to output
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  
  % uni-variate data
   
  % length-weight females
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w);

  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];     % compose parameter vector at T
  EN = TC_LN * 365/5 * reprod_rate_j(LN(:,1) * del_M, f, pars_R); % #, fecundity fro 5 spawnings per yr
  
  % temp-incubation
  EaT_b = t_0 + a_b ./ tempcorr(C2K(Tab(:,1)), T_ref, pars_T); % d, incubation time

  % time-length
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f, [], tL_f(:,1)*k_M*TC_tL);
  ELw_f = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f, [t_b, f*z/z_m, l_b*z/z_m], tL_m(:,1)*k_M*TC_tL);
  ELw_m = L_mm * tvel(:,4)/ del_M;   % cm, length

  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  prdData.LW_f = EWw_f;
  prdData.LN = EN;
  prdData.Tab = EaT_b;
  