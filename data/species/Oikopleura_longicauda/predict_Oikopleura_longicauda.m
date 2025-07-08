function [prdData, info] = predict_Oikopleura_longicauda(par, data, auxData)  

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_NR = tempcorr(temp.NR, T_ref, T_A);
  TC_aL = tempcorr(temp.aL, T_ref, T_A);
  TC_aLR = tempcorr(temp.aLR, T_ref, T_A);
  TC_aWd = tempcorr(temp.aWd, T_ref, T_A);

  %% zero-variate data

  % birth
  pars_lb = [g; k; v_Hb];        % compose parameter vector
  [t_b, l_b, info] = get_tb(pars_lb); % -, scaled and length at birth at f
  if info ~= 1 % numerical procedure failed
    fprintf('warning: invalid parameter value combination for get_tb \n')
  end
  L_b = L_m * l_b;     % cm, structural length at birth at f
  %W_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth at f
  kT_M = k_M * TC_ab;  % 1/d, correct k_M for temperature
  aT_b = t_b/ kT_M;     % d, age at birth at f
 
  % ultimate
  L_i = (f - l_T) * L_m;           % cm, ultimate structural length
  
  % reproduction: cumulative number of eggs
  kT_J = k_J * TC_NR; kT_M = k_M * TC_NR; vT = v * TC_NR; UT_Hb = U_Hb/ TC_NR; % correct for temperature
  pars_R = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hb+1e-12]; % compose parameter vector
  NT_R = cum_reprod(8, f, pars_R, L_b); % #, cumulative number of eggs at 8 d at T
  % this assumes that structure is not (partially) converted to eggs upon death (which is unlikely)

  % life span
  pars_tm = [g; k; l_T; v_Hb; v_Hb+1e-12; h_a/ k_M^2; s_G]; % compose parameter vector
  kT_M = k_M * TC_am;       % 1/d, correct k_M for temperature
  t_m = get_tm(pars_tm, f); % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;         % d, mean life span
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.NR = NT_R;
  
  %% uni-variate data
  % trunc length
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate at T_ref
  ELw = (L_i - (L_i - L_b) * exp( - r_B * aL(:,1)))/ del_M; % cm, trunc length

  % total trunc length
  L = (L_i - (L_i - L_b) * exp( - r_B * aLR(:,1))); % cm, structural length
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hb+1e-12]; % compose parameter vector at T_ref
  [N L UE0] = cum_reprod(aL(:,1), f, pars_R, L_b); % #, cumulative number of eggs, UE0 
  ELR = L/ del_M + v_R * UE0 * N ./ L .^ 2; % cm, total trunc length
  % the cumulative reproductive material is deposited on (a fixed fraction of) body surface
  % so it contributes to length proportional to N/ L^2
  % dim(UE0) = time * length^2; dim(v_R) = length/ time

  % dry weight
  L = L_i - (L_i - L_b) * exp( - r_B * aWd(:,1)); % cm, structural length
  [N, L, UE0] = cum_reprod(aWd(:,1), f, pars_R, L_b); % #, cumulative number of eggs, UE0 
  % U_E^0 = E_0/ {p_Am}; e = E/ L^3/ [E_m] = v * E/ L^3/ {p_Am} = v * U_E/ L^3
  eR = v * UE0 * N/ kap_R ./ L .^ 3; % -, scaled cumulative reproduction buffer density
  EWd = L.^3 * d_V .* (1 + (f + eR) * w); % g, dry weight including reprod buffer and T and f
  % This assumes that reproduction overheads are paid at the conversion of the buffer to eggs
  EWd = EWd * 1e6; % convert g to mug
  
  %% pack to output
  prdData.aL = ELw;
  prdData.aLR = ELR;
  prdData.aWd = EWd;
    