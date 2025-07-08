function [prdData, info] = predict_Fritillaria_pellucida(par, data, auxData)  

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 

  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  %% zero-variate data

  pars_tp = [g; k; 0; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp); % -, scaled and length at birth
 
  % birth
  L_b = L_m * l_b;     % cm, structural length at birth
  Lw_b = L_b/ del_M;   % cm, trunc length at birth 
  Ww_b = L_b^3 * (1 + f * w); % g, wet weight at birth
  Wd_b = Ww_b * d_V;   % g, dry weight at birth 
  
  % puberty
  L_p = L_m * l_p;    % cm, structural length at puberty
  Lw_p = L_p/ del_M;  % cm, trunc length at puberty
 
  % ultimate (death 1t 16 d)
  L_i = (f - l_T) * L_m; % cm, ultimate structural length
  rT_B = kT_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L_d = L_i - (L_i - L_b) * exp( - rT_B * 16); % cm, struc length at death
  Lw_i = L_i/ del_M; % cm, asymptotic trunc length
  Ww_i = L_d^3 * (1 + f * w); % g, wet weight at death
  Wd_i = Ww_i * d_V; % g, dry weight at death
    
  % weight and reproduction at death at t = 16 d
  kT_J = k_J * TC; vT = v * TC; UT_Hb = U_Hb/ TC; UT_Hp = U_Hp/ TC; % correct for temperature
  pars_R = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hp]; % compose parameter vector at T
  NT_i = cum_reprod(16, f, pars_R); % #, cumulative number of eggs at death
  
  % life span 
  pars_tm = [g; k; l_T; v_Hb; v_Hp; h_a/ k_M^2; s_G]; % compose parameter vector
  t_m = get_tm(pars_tm, f); % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;         % d, mean life span
  
  %% pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wdb = Wd_b;
  prdData.Wdi = Wd_i;
  prdData.Ni = NT_i;
  
  %% uni-variate data

  % trunc length
  L = (L_i - (L_i - L_b) * exp( - rT_B * tL(:,1))); % cm, structural length
  ELw = L/ del_M; % cm, trunc length
  EWd = L.^3 * (1 + f * w) * d_V; % g, dry weight
  EWd_L  = (LWd(:,1)*del_M).^3 * d_V * (1 + f * w); % g, dry weight

  %% pack to output
  prdData.tL = ELw;
  prdData.tWd = EWd;
  prdData.LWd = EWd_L;
    