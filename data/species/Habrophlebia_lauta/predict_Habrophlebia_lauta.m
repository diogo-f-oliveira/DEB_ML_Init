function [prdData, info] = predict_Habrophlebia_lauta(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors

%   pars_T = [T_A; T_L; T_AL];
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_aj = tempcorr(temp.aj, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_LW = tempcorr(temp.LW, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; pars_tj = [g k v_Hb v_Hp v_Rj];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj_hep(pars_tj, f);
  
  % initial
  u_E0 = get_ue0([g k v_Hb], f, l_b);   % -, scaled initial reserve
  E_0 = g * E_m * L_m^3 * u_E0;         % J, initial energy content
% Wd_0 = w_E * E_0/ mu_E;               % g, initial dry weight
% Ww_0 = (w_E * E_0/ mu_E)/d_V;         % g, initial wet weight
  Lw_0 = (E_0 * w_E/ mu_E/ d_E)^(1/3)/ del_Y;% cm, initial length
  
  % birth
  L_b = L_m * l_b;                      % cm, structural length at birth at f
  a_b = t_b/ k_M; 
  aT_b = a_b/ TC_ab;                    % d, age at birth at f and T
  
  % puberty 
%   L_p = L_m * l_p;                    % cm, structural length at puberty at f
%   Lw_p = L_p/ del_M;                  % cm, total length at puberty at f
%   Ww_p = L_p^3 *(1 + f * w);          % g, wet weight at puberty 
%   tT_p = (t_p - t_b)/ k_M/ TC_tp;     % d, time since birth at puberty at f and T
  
  % emergence
  L_j = l_j * L_m;                      % cm, structural length at emergence
  Lw_j = L_j/ del_M;                    % cm, body length nymph at emergence
  tT_j = (t_j)/ k_M/ TC_aj;             % d, time since birth at emergence  
 
  % ultimate
  Lw_i = L_j/ del_Miw;                   % cm, ultimate total length imago at f
  % Ww_j = L_j^3 *  (1 + f * w);           % g, ultimate wet weight  nymph
  Wd_j = L_j^3 *  d_V *(1 + f * w);      % g, ultimate dry weight  nymph

  % reproduction
  N_i = kap_R * (1 - kap) * v_Rj * l_j^3/ u_E0; % # of eggs at j, see section 7.8 of the comments to DEB3

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.aj = tT_j;
  prdData.am = aT_m;
  prdData.Lb = L_b;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;  
  prdData.Wdj = Wd_j;
  prdData.Ni = N_i;
  prdData.L0 = Lw_0;
  
  % uni-variate data
  % time-length
  pars_R = [kap; kap_R; g; TC_tL * k_J; TC_tL * k_M; 0; TC_tL * v; U_Hb/ TC_tL; U_Hp/ TC_tL; U_Hp/ TC_tL + 1e-8];
  [N, L] = cum_reprod_j(t_0 + tL(:,1), f_tL, pars_R);
  EL = L/ del_M;  % cm, body length females

  
  % Length-dry weight L-Wd 
  % it includes the dry weight of the eggs
  TC = TC_LW; % -, temperature correction factore
  L_p = l_p * L_m; L_i = l_i * L_m; % cm, structural lengths at puberty and ultimate at f 
  r_B = rho_B * k_M * TC; % 1/d, von Bert growth rate at f and T
  a_b = t_b/ k_M/ TC; % d, age at birth at T and f
  a_p = t_p/ k_M/ TC; % d, age at puberty at f and T
  L = LW(:,1) * del_M; % cm, structural length 
  t = 1/ r_B * log((L_i - L_p)./ (L_i - L)); % d, time since puberty
  pars_R = [kap; kap_R; g; k_J * TC; k_M * TC; 0; v * TC; U_Hb/ TC; U_Hp/ TC; U_Hp/ TC + 1e-8]; % parameters at T
  [N, Lpred, U_E0] = cum_reprod_j(t + (a_p - a_b), f, pars_R); % cum reproductive output at T
  E_0  = U_E0 * p_Am * TC; % J, energy in the egg
  Wd_0 = w_E/ mu_E * E_0; % g, dry mass of the egg
  EWd3 = L.^3 * d_V * (1 + f * w); % g, dry weight  excluding the reproduction buffer
  EWd3 = EWd3 +  N.* Wd_0; % g, dry weight including the reproduction buffer 
    


  % pack to output
  prdData.tL =EL;
  prdData.LW =  EWd3;
  