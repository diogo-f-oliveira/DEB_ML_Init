function [prdData, info] = predict_Asterias_rubens(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if kap_X + kap_P > 1
    info = 0; prdData = [];
    return;
  end
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_WdW = tempcorr(temp.WdW, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Me;               % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, total length at metam at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb;U_Hj;  U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);                 % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f_LWd);
  rT_B = rho_B * k_M * TC_WdW; s_M = l_j/ l_b;  L_i = L_m * l_i; 
  % LWd
  EWd = (LWd(:,1) * del_M) .^ 3 * d_V * (1 + f_LWd * w);   % g, dry weight
  % LdL
  EdLw = rT_B * (L_i/ del_M - LdL(:,1)); % cm/d, growth in length after j
  % WdW
  L = (WdW(:,1)/ (1 + f * w)).^(1/3);  % cm, structural length
  dL = rT_B * (L_i - L);               % cm/d, change in length after j
  EdWw = (1 + w * f) * 3 * L.^2 .* dL; % g/d, change in wet weight after j
  % WdJO
  L = (WdJO(:,1)/ (1 + f * w)/ d_V).^(1/3); % cm, structural length
  l = L/ L_m;                       % -, scaled length
  pT_ref = TC_WdW * s_M * p_Am * L_m^2;  % J/d, max assimilation power at L_m
  pA = l .^2;                       % -, scaled assimilation power  (page 78 DEB book)
  pD = kap * l .^3  + (1 - kap) * f .* l .^2 .* (g + l) ./ (g + f); % scaled dissapating power (page 78 DEB book)
  pG = kap * l.^2.* (f - l)./(1 + f/ g); % -, scaled growth power
  pADG = pT_ref * [pA, pD, pG];     % J/d, basic powers
  JM = - (n_M\n_O) * eta_O * pADG'; % mol/d, mineral fluxes
  JO = - 1e6/ 24 * JM(3,:)';        % mumol O2/h, O2-consumption after j
  EJO = JO ./ WdJO(:,1);            % mumol O2/h.g, specific O2-consumption after j
  % WwJX
  L = (WwJX(:,1)/ (1 + f * w)).^(1/3); % cm, structural length
  EJX =  TC_WdW * w_X * s_M * p_Am/ kap_X/ mu_X/ d_X * L.^2; % g/d, ingestion rate after j in wet weight


  % pack to output
  prdData.LWd = EWd;
  prdData.WdW = EdWw;
  prdData.LdL = EdLw;
  prdData.WdJO = EJO;
  prdData.WwJX = EJX;
  