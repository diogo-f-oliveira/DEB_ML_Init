function [prdData, info] = predict_Scotophilus_kuhlii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
  filterChecks = k * v_Hp >= f_mt^3 || ...         % constraint required for reaching puberty with f_tL
                 k * v_Hp >= f_hr^3 ;        % constraint required for reaching puberty with f_tL
           
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  

  % compute temperature correction factors
  TC_tg = tempcorr(temp.tg, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tLW = TC_am;
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp];
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
 
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ k_M/ TC_tg;           % d, gestation time at f and T
  
  % weaning
  tT_x = (t_x - t_b)/ k_M/ TC_tg;      % d, time since birth at fledging at f and T
  L_x = L_m * l_x;                  % cm, structural length at weaning at f
  Lw_x = L_x/ del_M;                % cm, physical length at weaning at f
  Ww_x = L_x^3 *(1 + f * w);        % g, wet weight at weaning 
  
  % puberty 
  tT_p = (t_p-t_b)/ k_M / TC_tp;          % d, age at puberty at f and T
    
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
 
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lx = Lw_x;
  prdData.Li = Lw_i;
  prdData.Wwx = Ww_x;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  f = f_mt; % maternally fed
  % time-length 
  L_b = L_m * get_lb([g k v_Hb], f); L_i = f * L_m;  
  rT_B = TC_tLW * k_M/ 3/ (1 + f/ g);                  % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tWw_mt(:,1));  % cm, structural length at time
%   ELw_mt = L/ del_M; % cm, forearm length
  % time- mass
  EWw_mt = L.^3 * (1 + f * w); % g, wet weight
  % length-weight
  EWw_mt2 = (LW_mt(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  f = f_hr; % hand-reared
  % time-length 
  L_b = L_m * get_lb([g k v_Hb], f); L_i = f * L_m;  
  rT_B = TC_tLW * k_M/ 3/ (1 + f/ g);                  % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tWw_hr(:,1));  % cm, structural length at time
%   ELw_hr = L/ del_M; % cm, forearm length
  % time- mass
  EWw_hr = L.^3 * (1 + f * w); % g, wet weight
  % length-weight
  EWw_hr2 = (LW_hr(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  
  % pack to output
%   prdData.tL_mt = ELw_mt;
%   prdData.tL_hr = ELw_hr;
  prdData.tWw_mt = EWw_mt;
  prdData.tWw_hr = EWw_hr;
  prdData.LW_mt = EWw_mt2;
  prdData.LW_hr = EWw_hr2;
