function [prdData, info] = predict_Dolioletta_gegenbauri(par, data, auxData)  

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 

  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p t_b l_p l_b info] = get_tp(pars_tp, f); 
  pars_tpasex = [g; k; l_T; v_Hba; v_Hpa]; % compose parameter vector
  [t_pasex t_basex l_pasex l_basex] = get_tp_foetus(pars_tpasex, f); 

  % birth of sexual stage
  L_b = L_m * l_b;                % cm, structural length at birth at f
  Lw_bsex = L_b/ del_M;           % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC;            % d, age at birth at f and T

  % birth of asexual stage
  L_basex = L_m * l_basex;        % cm, structural length at birth of sex stage
  Lw_basex = L_basex/ del_M;      % cm, physical length at birth of asex stage

  % puberty 
  L_p = L_m * l_p;                % cm, structural length at puberty at f
  Lw_psex = L_p/ del_M;           % cm, physical length at puberty at f
  L_pasex = L_m * l_pasex;        % cm, structural length at puberty of sex stage
  Lw_pasex = L_pasex/ del_M;      % cm, physical length at puberty of asex stage
  tT_pasex = (t_pasex - t_basex)/ k_M/ TC;  % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate physical length at f
 
  % reproduction of asexual stage, using U_Hbs of sexual stage
  pars_Rsex = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_Rsex); % #/d, ultimate reproduction rate at T
  pars_Rasex = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hba; U_Hpa]; % compose parameter vector at T
  RT_iasex = TC * reprod_rate_foetus(L_i, f, pars_Rasex); % #/d, ultimate asex reproduction rate at T

  % life span of asexual stage
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.tp_asex = tT_pasex;
  prdData.am = aT_m;
  prdData.Lb_sex = Lw_bsex;
  prdData.Lb_asex = Lw_basex;
  prdData.Lp_sex  = Lw_psex;
  prdData.Lp_asex = Lw_pasex;
  prdData.Li_asex = Lw_i;
  prdData.Ri_sex = RT_i;
  prdData.Ri_asex = RT_iasex;
 
  %% uni- and bi-variate data
  
  % units(K) = C-mol/l; 1 C-mol <=> 12e6 mug
  % units(J_X_Am) = mol/d.cm^2
  % units(F_m) = l/d.cm^2 
  f_TF = food.TF/ (K * 12e6 + food.TF); % -, scaled functional response; the same for TX, Tr, LW
  
  % food density - clearance rate (XF)
  L = (treat.XF{2}(:)'/ d_V/ (1 + f_TF * ome)/ 12e6 * w_V ).^(1/3); % cm, structural length
  X_XF = XF(:,1)/12e6;  % mol/l, food density 
  f_XF = X_XF ./ (X_XF + K); % - scaled functional response
  EF = TC * (1 - f_XF) ./ f_XF * L.^2 * F_m * 1e3; % ml/d, clearance rate
  
  % temperature - clearance rate (TF)
  L = (treat.TF{2}(:)'/ d_V/ (1 + f_TF * ome)/ 12e6 * w_V ).^(1/3); % cm, structural length
  TC_TF = tempcorr(C2K(TF(:,1)), T_ref, T_A); 
  EF_T = TC_TF * (1 - f_TF)/ f_TF * L.^2 * F_m * 1e3; % ml/d, clearance rate
  
  % food density - ingestion rate (XJX)
  f = XJX(:,1) ./ (K * 12e3 + XJX(:,1)); % -, scaled functional response f
  L = (treat.XJX{2}(:)'/ d_V/ (1 + f_TF * ome)/ 12e6 * w_V ).^(1/3); % cm, structural length
  EJX = TC * f * J_X_Am * 12e6 * L.^2; % mug C/d, ingestion rate
  
  % temperature - ingestion rate (TJX)
  L = (treat.TJX{2}(:)'/ d_V/ (1 + f_TF * ome)/ 12e6 * w_V ).^(1/3); % cm, structural length
  TC_TJX = tempcorr(C2K(TJX(:,1)), T_ref, T_A); 
  EJX_T = TC_TJX * J_X_Am * 12e6 * f_TF * L.^2; % mug C/d, ingestion rate

  % food density - growth rate (Xr)
  f = Xr(:,1) ./ (K * 12e3 + Xr(:,1)); n_f = length(f); % -, scaled functional response f
  L = (treat.Xr{2}(:)'/ d_V/ (1 + f_TF * ome)/ 12e6 * w_V ).^(1/3); n_L = length(L); % cm, structural length
  f = f(:,ones(1,n_L)); L = L(ones(n_f,1),:);
  Er = TC * v * (f .* (1./L) - 1/ L_m) ./ (f + g); % 1/d, spec growth rate
  
  % temperature - growth rate (Tr)
  L = (treat.Tr{2}(:)'/ d_V/ (1 + f_TF * ome)/ 12e6 * w_V ).^(1/3); % cm, structural length
  TC_Tr = tempcorr(C2K(Tr(:,1)), T_ref, T_A); 
  Er_T = TC_Tr * v * (f_TF ./ L - 1/ L_m) / (f_TF + g); % 1/d, spec growth rate

  % length-carbon weight (LW)
  EWC = (LW(:,1) * del_M).^3 * d_V * (1 + f_TF * ome) * 12e6/ w_V; % mug, C-weight

  %% pack to output
  prdData.XF = EF;
  prdData.TF = EF_T;
  prdData.XJX = EJX;
  prdData.TJX = EJX_T;
  prdData.Xr = Er;
  prdData.Tr = Er_T;
  prdData.LW = EWC;
      