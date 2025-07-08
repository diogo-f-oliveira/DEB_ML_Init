function [prdData, info] = predict_Thalia_democratica(par, data, auxData)  

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  filterChecks = f_LdL < 0 || k * v_Hp >= f_LdL^3 || ...  % constraint required for reaching puberty with f_LdL
                 ~reach_birth(g, k, v_Hb, f_LdL) || ...   % constraint required for reaching birth with f_LdL
                 f_LN < 0 || k * v_Hp >= f_LN^3 || ...    % constraint required for reaching puberty with f_LN
                 ~reach_birth(g, k, v_Hb, f_LN) || ...    % constraint required for reaching birth with f_LN
                 f_LF < 0 || f_WJX < 0; 
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  

  %% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri_asex, T_ref, T_A);
  TC_LdL = tempcorr(temp.LdL, T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  TC_LF = tempcorr(temp.LF, T_ref, T_A);
  TC_WJX = tempcorr(temp.WJX, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p t_b l_p l_b info] = get_tp_foetus(pars_tp, f); 

  % birth of asexual stage
  L_b = L_m * l_b;                % cm, structural length at birth at f
  Lw_b = L_b/ del_M;              % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);     % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;         % d, age at birth at f and T

  % birth of sexual stage
  pars_lbs = [g; k; v_Hbs];       % compose parameter vector
  l_bs = get_lb(pars_lbs);        % -, scaled length and age at birth at f
  L_bs = L_m * l_bs;              % cm, structural length at birth at f
  Lw_bs = L_bs/ del_M;            % cm, physical length at birth at f

  % puberty 
  L_p = L_m * l_p;                % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;              % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);     % g, wet weight at puberty
  aT_p = t_p/ k_M/ TC_ap;         % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
 
  % reproduction of asexual stage, using U_Hbs of sexual stage
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hbs; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_foetus(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span of asexual stage
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb_sex = Lw_bs;
  prdData.Lb_asex = Lw_b;
  prdData.Lp_asex = Lw_p;
  prdData.Li_asex = Lw_i;
  prdData.Wwb_asex = Ww_b;
  prdData.Wwp_asex = Ww_p;
  prdData.Wwi_asex = Ww_i;
  prdData.Ri_asex = RT_i;
  
  %% uni-variate data
  % LdL
  f = f_LdL;           
  L_i = f * L_m - L_T; Lw_i = L_i/ del_M;
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  EdLw = TC_LdL * r_B * max(0,Lw_i - LdL(:,1)); % cm, expected change in length at L
  
  % LN
  f = f_LN;
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hbs; U_Hp]; % compose parameter vector at T
  EN = TC_LN * reprod_rate(LN(:,1) * del_M, f, pars_R) * 5/ 24; % #, offspring in 5 h at T
  
  % LF
  f = f_LF;
  EF = TC_LF * F_m * (LF(:,1) * del_M).^2 * (1 - f) * 1e3/ 24; % ml/h, filtering rate at f
  
  % WJX: weight (mug C), ingestion rate (10^6 mum^3/d/ind)
  f = f_WJX;
  % Carbon Weight (mug C) =  1.62 Length (mm)^1.93
  L = del_M * 0.1 * (WJX(:,1)/ 1.62).^(1/1.93); % cm, structural length
  EJX = 1e6 * TC_WJX * f * p_Am * L.^2/ kap_X/ mu_X/ d_X; % 10^6 mum^3/d, ingestion rate

  %% pack to output
  prdData.LdL = EdLw;
  prdData.LN = EN;
  prdData.LF = EF;
  prdData.WJX = EJX;
      