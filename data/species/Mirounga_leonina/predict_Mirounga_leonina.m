function [prdData, info] = predict_Mirounga_leonina(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; info = 1;
  [t_p, t_x, t_b, l_p, l_x, l_b] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC;      % d, time since birth at fledging at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
  % males
  L_im = L_i * z_m/ z;              % cm, ultimate struct length of male
  Lw_im = L_im/ del_M;              % cm, length of male
  Ww_im = L_im^3 * (1 + f * w * z_m/ z); % g, ultimate wet weight of male

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;

  % uni-variate data
  
  % time-weight 
  ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B; % d, 1/von Bert growth rate
  Lf = L_i - (L_i - L_b) * exp( - TC * r_B * tW_f(:,1)); % cm, structural length
  EWw_f = Lf.^3 * (1 + f * w); % g, wet weight for females
  
  [t LE] = ode45(@get_LE_male, tW_m(:,1), [L_b E_m * f], [], f, kap, TC * v, L_p, E_G, TC * p_M, TC * p_Am, TC * p_Am * z_m/ z);
  L = LE(:,1); E = LE(:,2); 
  EWw_m = L .^ 3 .* (1 + E * w_E/ mu_E/ d_V); % g, wet weight for males
  
  % pack to output
  prdData.tW_f = EWw_f;
  prdData.tW_m = EWw_m;
end

% %% subfunction

function dLE = get_LE_male (t, LE, f, kap, v, L_p, E_G, p_M, p_Am_f, p_Am_m)
 L = LE(1); E = LE(2); % [E]
 if L < L_p
   p_Am = p_Am_f;
 else
   p_Am = p_Am_m;
 end
 L_m = kap * p_Am/ p_M; 
 E_m = p_Am/ v;
 g = E_G/ kap/ E_m;
 e = E/ E_m;
 r = v * (e/ L - 1/ L_m)/ (e + g);
 dL = r * L/ 3;
 dE = (p_Am * f - E * v)/ L;
 dLE = [dL; dE]; 
 
end
  