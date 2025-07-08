function [prdData, info] = predict_Macropus_giganteus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_tg = tempcorr(temp.tg, T_ref, T_A);
  TC_tx = tempcorr(temp.tx, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_pL = tempcorr(temp.pL, T_ref, T_A);
  TC_JO = tempcorr(temp.JO, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; info = 1;
  [t_p, t_x, t_b, l_p, l_x, l_b] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ k_M/ TC_tg;     % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Lw_x = L_x/ del_M;                % cm, total length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC_tx;   % d, time since birth at fledging at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % milk production at ultimate size (r = 0) as mean
  % fraction kap_F of pT_R that is allocated to milk, the rest to offspring
  pT_C = TC_pL * f * E_m * L_i^2 * v; % J/d, mobilisation flux
  pT_J = TC_pL * k_J * E_Hp;          % J/d, maturity maintenance
  pT_R = (1 - kap) * pT_C - pT_J;  % J/d, flux to reproduction plus milk
  pT_L = kap_RL * kap_Lm * pT_R;    % J/d, milk production

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];           % compose parameter vector at T
  RT_i = TC_Ri * (1 - kap_Lm) * reprod_rate_foetus(L_i, f, pars_R); % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % repiration
  pT_ref =  TC_JO * p_Am * L_m^2;             % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  L = (26.4e3/ (1 + w * f)).^(1/3); % cm, structural length
  l = L/ L_m;  % -, scaled structural length
  H = maturity (L, f, pars_power);  % d.cm^2, scaled maturities E_H/ {p_Am}
  uH = H *  g^2 * k_M^3/ v^2;       % -, scaled maturities
  pA = f .* l.^2; % +pL;                       % -, assim
  pC = f .* l.^2 .* (g + l + l_T) ./ (g + f);% -, mobilisation
  pS = kap * l.^2 .* (l + l_T);              % -, somatic  maint
  pJ = k * uH;                               % -, maturity maint
  pG = kap * pC - pS;                        % -, growth
  pR = ((1 - kap) * pC - pJ);                % -, maturation/reproduction
  pD = pS + pJ + (1 - (l > L_p) * kap_R) .* pR; % -, dissipation
  pT_ADG = pT_ref * [pA pD pG]';    % J/d, temp corrected assim, dissip, growth
  J_O = eta_O * pT_ADG;             % J_X, J_V, J_E, J_P in rows, A, D, G in cols
  J_M = - (n_M\n_O) * J_O;          % J_C, J_H, J_O, J_N in rows, A, D, G in cols
  X_gas = 1/ 22.4;                  % M, mol of gas per litre at 0 C and 1 bar (Frappell 2008) 
  EJT_O = - 1e3 * J_M(3,:)'/ (24 * 60 * X_gas);  % ml/min, dioxygen use 

  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lx = Lw_x;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.pL = pT_L;
  prdData.JO = EJT_O;
  
  % uni-variate data
  
  % time-weight 
  f = f_tW; pars_lb = [g; k; v_Hb];                    % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tW/ ir_B;  % d, 1/von Bert growth rate
  L_i = f * L_m - L_T; L_b = get_lb(pars_lb, f) * L_m; % cm, length at birth, ultimate
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1));      % cm, structural length at time
  EWw = L.^3 * (1 + f * w);                            % g, wet weight
  %
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1));      % cm, structural length at time
  ELw = L/ del_M;                                      % cm, head length

 
  % pack to output
  prdData.tW = EWw;
  prdData.tL = ELw;
  