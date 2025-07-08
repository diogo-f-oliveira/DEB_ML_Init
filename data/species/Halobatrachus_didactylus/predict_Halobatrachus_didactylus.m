function [prdData, info] = predict_Halobatrachus_didactylus(par, data, auxData)
 
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p t_b l_p l_b info] = get_tp(pars_tp, f);

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Lw_b = L_b/ del_M;                % cm, total length at birth
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth of foetus at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;

  %% uni-variate data
    
  % L-N and W-N data
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN_L = 365 * TC_LN * reprod_rate(LN(:,1) * del_M, f, pars_R); % #/d, ultimate reproduction rate at T
  EN_W = 365 * TC_LN * reprod_rate((WN(:,1)/ (1 + w * f)).^(1/3), f, pars_R); % #/d, ultimate reproduction rate at T
  
  % L-W data
  EWw = (LW(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.LW = EWw;
  prdData.LN = EN_L;
  prdData.WN = EN_W;
     