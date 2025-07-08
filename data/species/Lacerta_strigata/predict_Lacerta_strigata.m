function [prdData, info] = predict_Lacerta_strigata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_Ko = tempcorr(temp.tL_fKo, T_ref, T_A);
  TC_Se = tempcorr(temp.tL_fSe, T_ref, T_A);
  TC_Kh = tempcorr(temp.tL_fKh, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tpm = [g_m k l_T v_Hb v_Hp];

  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % univar data
  
  % time-length
  % female Ko
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_Ko, [], tL_fKo(:,1)*k_M*TC_Ko);
  ELw_fKo = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male Ko
  tvel = get_tpm(pars_tpm, f_Ko, [t_b, f_Ko*z/z_m, l_b*z/z_m], tL_mKo(:,1)*k_M*TC_Ko);
  ELw_mKo = L_mm * tvel(:,4)/ del_M;   % cm, length 
  % 
  % female Se
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_Se, [], tL_fSe(:,1)*k_M*TC_Se);
  ELw_fSe = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male Se
  tvel = get_tpm(pars_tpm, f_Se, [t_b, f_Se*z/z_m, l_b*z/z_m], tL_mSe(:,1)*k_M*TC_Se);
  ELw_mSe = L_mm * tvel(:,4)/ del_M;   % cm, length 
  % 
  % female Kh
  [tvel, t_p, t_b, l_p, l_b] = get_tp(pars_tp, f_Kh, [], tL_fKh(:,1)*k_M*TC_Kh);
  ELw_fKh = L_m * tvel(:,4)/ del_M;   % cm, length 
  % male Kh
  tvel = get_tpm(pars_tpm, f_Kh, [t_b, f_Kh*z/z_m, l_b*z/z_m], tL_mKh(:,1)*k_M*TC_Kh);
  ELw_mKh = L_mm * tvel(:,4)/ del_M;   % cm, length 

  % pack to output
  prdData.tL_fKo = ELw_fKo;
  prdData.tL_mKo = ELw_mKo;
  prdData.tL_fSe = ELw_fSe;
  prdData.tL_mSe = ELw_mSe;  
  prdData.tL_fKh = ELw_fKh;
  prdData.tL_mKh = ELw_mKh;  
