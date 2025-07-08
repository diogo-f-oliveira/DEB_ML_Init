function [prdData, info] = predict_Diaphanosoma_brachyurum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
  filterChecks = k * v_Hp >= f_tL^3 || ...         % constraint required for reaching puberty with f_tWw
                 ~reach_birth(g, k, v_Hb, f_tL) ;   
             
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  
  % compute temperature correction factors
  TC_ab20 = tempcorr(temp.ab_20, T_ref, T_A);
  TC_ab28 = tempcorr(temp.ab_28, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_10 = tempcorr(temp.tL_10, T_ref, T_A);
  TC_15 = tempcorr(temp.tL_15, T_ref, T_A);
  TC_20 = tempcorr(temp.tL_20, T_ref, T_A);
  TC_25 = tempcorr(temp.tL_25, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  a_b = t_b/ k_M;                   % d, age at birth at f and T
  a20_b = a_b/ TC_ab20; a28_b = a_b/ TC_ab28;
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T
  
  % pack to output
  prdData.ab_20 = a20_b;
  prdData.ab_28 = a28_b;
  prdData.tp = tT_p;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % tL-data Vijv1980
  Lw_b = L_m * get_lb([g; k; v_Hb], f_tL)/ del_M; % cm, length at birth 
  Lw_i = L_m * f_tL/ del_M;                       % cm, ultimate length
  rT_B = TC_tL * k_M/ 3/ (1 + + f_tL/ g);         % 1/d, von Bert growth rate
  ELw = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL(:,1)); % cm, expected length at time
  
  % tL-data LemkBenk2003
  Lw_i = L_m * f_tLT/ del_M;              % cm, ultimate length
  Lw_b = L_m * get_lb([g; k; v_Hb], f_tLT)/ del_M; % cm, length at birth 
  r_B = k_M/ 3/ (1 + f_tLT/ g);  % 1/d, von Bert growth rate
  %
  ELw_10 = Lw_i - (Lw_i - Lw_b) * exp( - TC_10 * r_B * tL_10(:,1)); % cm, expected length at time
  ELw_15 = Lw_i - (Lw_i - Lw_b) * exp( - TC_15 * r_B * tL_15(:,1)); % cm, expected length at time
  ELw_20 = Lw_i - (Lw_i - Lw_b) * exp( - TC_20 * r_B * tL_20(:,1)); % cm, expected length at time
  ELw_25 = Lw_i - (Lw_i - Lw_b) * exp( - TC_25 * r_B * tL_25(:,1)); % cm, expected length at time
  
  % tN-data
  pars_R = [kap; kap_R; g; TC_10 * k_J; TC_10 * k_M; L_T; TC_10 * v; U_Hb/ TC_10; U_Hp/ TC_10]; % compose parameter vector at T
  EN_10 = cum_reprod(tN_10(:,1), f_tLT, pars_R); % #/d, ultimate reproduction rate at T
  pars_R = [kap; kap_R; g; TC_15 * k_J; TC_15 * k_M; L_T; TC_15 * v; U_Hb/ TC_15; U_Hp/ TC_15]; % compose parameter vector at T
  EN_15 = cum_reprod(tN_15(:,1), f_tLT, pars_R); % #/d, ultimate reproduction rate at T
  pars_R = [kap; kap_R; g; TC_20 * k_J; TC_20 * k_M; L_T; TC_20 * v; U_Hb/ TC_20; U_Hp/ TC_20]; % compose parameter vector at T
  EN_20 = cum_reprod(tN_20(:,1), f_tLT, pars_R); % #/d, ultimate reproduction rate at T
  pars_R = [kap; kap_R; g; TC_25 * k_J; TC_25 * k_M; L_T; TC_25 * v; U_Hb/ TC_25; U_Hp/ TC_25]; % compose parameter vector at T
  EN_25 = cum_reprod(tN_25(:,1), f_tLT, pars_R); % #/d, ultimate reproduction rate at T

  % tS-data
  hW3 = h_a * f_tLT * v/ 6/ L_i; hG = s_G * f_tLT * v * L_i^2/ L_m^3; 
  hGt = TC_10 * hG * tS_10(:,1);
  ES_10 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_15 * hG * tS_15(:,1);
  ES_15 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_20 * hG * tS_20(:,1);
  ES_20 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_25 * hG * tS_25(:,1);
  ES_25 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));

  % Tab-data
  TC = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  Ea_b =  (t_0 + a_b) ./ TC; 
  
  % Ttp-data
  [t_p t_b] = get_tp(pars_tp, f, l_b); % -, scaled length at birth at f
  TC = tempcorr(C2K(Ttp(:,1)), T_ref, T_A); % -, Temperature Correction factor for a_m; ONLY WORK WITH T_A
  Et_p = (t_p - t_b)/ k_M ./ TC; 
  
  % pack to output
  prdData.tL = ELw;
  prdData.tL_10 = ELw_10;
  prdData.tL_15 = ELw_15;
  prdData.tL_20 = ELw_20;
  prdData.tL_25 = ELw_25;
  prdData.tN_10 = EN_10;
  prdData.tN_15 = EN_15;
  prdData.tN_20 = EN_20;
  prdData.tN_25 = EN_25;
  prdData.tS_10 = ES_10;
  prdData.tS_15 = ES_15;
  prdData.tS_20 = ES_20;
  prdData.tS_25 = ES_25;
  prdData.Tab = Ea_b;
  prdData.Ttp = Et_p;