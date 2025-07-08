function [prdData, info] = predict_Simocephalus_serrulatus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
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

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e6 * L_i^3 * d_V * (1 + f * w); % mug, ultimate dry weight
   
  % pack to output
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % tL-data LemkBenk2003
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  %
  ELw_15 = Lw_i - (Lw_i - Lw_b) * exp( - TC_15 * r_B * tL_15(:,1)); % cm, expected length at time
  ELw_20 = Lw_i - (Lw_i - Lw_b) * exp( - TC_20 * r_B * tL_20(:,1)); % cm, expected length at time
  ELw_25 = Lw_i - (Lw_i - Lw_b) * exp( - TC_25 * r_B * tL_25(:,1)); % cm, expected length at time
  
  % tN-data
  pars_R = [kap; kap_R; g; TC_15 * k_J; TC_15 * k_M; L_T; TC_15 * v; U_Hb/ TC_15; U_Hp/ TC_15]; % compose parameter vector at T
  EN_15 = cum_reprod(tN_15(:,1), f, pars_R); % #/d, ultimate reproduction rate at T
  pars_R = [kap; kap_R; g; TC_20 * k_J; TC_20 * k_M; L_T; TC_20 * v; U_Hb/ TC_20; U_Hp/ TC_20]; % compose parameter vector at T
  EN_20 = cum_reprod(tN_20(:,1), f, pars_R); % #/d, ultimate reproduction rate at T
  pars_R = [kap; kap_R; g; TC_25 * k_J; TC_25 * k_M; L_T; TC_25 * v; U_Hb/ TC_25; U_Hp/ TC_25]; % compose parameter vector at T
  EN_25 = cum_reprod(tN_25(:,1), f, pars_R); % #/d, ultimate reproduction rate at T

  % tS-data
  hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v * L_i^2/ L_m^3; 
  hGt = TC_15 * hG * tS_15(:,1);
  ES_15 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_20 * hG * tS_20(:,1);
  ES_20 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_25 * hG * tS_25(:,1);
  ES_25 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  
  % Ttp-data
  TC = tempcorr(C2K(Ttp(:,1)), T_ref, T_A); % -, Temperature Correction factor for a_m; ONLY WORK WITH T_A
  Et_p = (t_p - t_b)/ k_M ./ TC; 
  
  % pack to output
  prdData.tL_15 = ELw_15;
  prdData.tL_20 = ELw_20;
  prdData.tL_25 = ELw_25;
  prdData.tN_15 = EN_15;
  prdData.tN_20 = EN_20;
  prdData.tN_25 = EN_25;
  prdData.tS_15 = ES_15;
  prdData.tS_20 = ES_20;
  prdData.tS_25 = ES_25;
  prdData.Ttp = Et_p;