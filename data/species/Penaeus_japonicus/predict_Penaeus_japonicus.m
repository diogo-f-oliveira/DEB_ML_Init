function [prdData, info] = predict_Penaeus_japonicus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_tL3 < 0.02; info = 0; prdData = []; return; end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);  
  TC_tL_f1 = tempcorr(temp.tL_f1, T_ref, T_A);
  TC_tL_f2 = tempcorr(temp.tL_f2, T_ref, T_A);
  TC_tL_f3 = tempcorr(temp.tL_f3, T_ref, T_A);
  TC_tW_f = tempcorr(temp.tW_f, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  if ~info; prdData = []; return; end
    
  % birth
  a_b = t_0 + t_b/ k_M/ TC_ab;    % d, age at birth
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T   

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight   
 
  % reproduction 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj; U_Hp]; % compose parameter vector at T
  R_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                    % #/d, ultimate reproduction rate at T 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  a_m = t_m/ k_M; aT_m = a_m/ TC_am;       % d, mean life span at T
  
%   % males  
%   p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
%   E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
%   g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
%   L_mm = v/ k_M/ g_m;                  % cm, max struct length
%   L_im = l_i * L_mm; Lw_im = L_im/ del_M; % cm, ultimate total length  
%   pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  L_mm = L_m; z_m = z; pars_tjm = pars_tj; tel_b = [t_b, f_tL2*z/z_m, l_b*z/z_m]; tel_b = [];
  
  % pack to output
  prdData.tp = tT_p;           
  prdData.ab = a_b;            
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_i;         
  prdData.Wwi = Ww_i;
  prdData.Ri = R_i;           
  
  % uni-variate data
  % time-length  Guzhenkou Bay
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL1, [], tL_f1(:,1)*k_M*TC_tL_f1);
  ELw_f1 = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL1, tel_b, tL_m1(:,1)*k_M*TC_tL_f1);
  ELw_m1 = L_mm * tvel(:,4)/ del_M;   % cm, length
  
  % time-length  Laoshan Bay
  % female
  [tvel, t_j, t_p, t_b, l_j, l_p, l_b] = get_tj(pars_tj, f_tL2, [], tL_f2(:,1)*k_M*TC_tL_f2);
  ELw_f2 = L_m * tvel(:,4)/ del_M;   % cm, length
  % male
  tvel = get_tj(pars_tjm, f_tL2, tel_b, tL_m2(:,1)*k_M*TC_tL_f2);
  ELw_m2 = L_mm * tvel(:,4)/ del_M;   % cm, length
  
  % time-length Intensive ponds
  tvel = get_tj(pars_tj, f_tL3, [], tL_f3(:,1)*k_M*TC_tL_f3);
  ELw_f3 = L_m * tvel(:,4)/ del_MC;   % cm, length
  % time-weight Intensive ponds 
  tvel = get_tj(pars_tj, f_tL3, [], tW_f(:,1)*k_M*TC_tW_f);
  EWw_f = (L_m * tvel(:,4)).^3 * (1 + f_tL3 * w); % g, wet weight
  
  % pack to output
  prdData.tL_f1 = ELw_f1;
  prdData.tL_m1 = ELw_m1;
  prdData.tL_f2 = ELw_f2;
  prdData.tL_m2 = ELw_m2;  
  prdData.tL_f3 = ELw_f3;  
  prdData.tW_f = EWw_f;  
  