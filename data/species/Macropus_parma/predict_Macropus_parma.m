function [prdData, info] = predict_Macropus_parma(par, data, auxData)
  
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
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp];
  [t_p, t_x, t_b, l_p, l_x, l_b, info] = get_tx(pars_tx, f);
  if ~info
     prdData = []; return
  end
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ k_M/ TC_tg;     % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ k_M/ TC_tx;   % d, time since birth at fledging at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
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
  
  % males
  pars_txm = [g k l_T v_Hb v_Hx v_Hpm];
  [t_pm, t_xm, t_bm, l_pm, l_xm, l_bm, info] = get_tx(pars_txm, f);
  if ~info
     prdData = []; return
  end
  tT_pm = (t_pm - t_bm)/ k_M/ TC_am; % d, time since birth at puberty
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tpm = tT_pm;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.pL = pT_L;
  
  % uni-variate data
  
  % time-weight
  rT_B = TC_am * k_M/ 3/ (1 + f_tW/ g);  % 1/d, von Bert growth rate
  L_b = L_m * get_lb([g k v_Hb], f_tW); L_i = L_m * f_tW;
  L = L_i - (L_i - L_b) * exp(- rT_B * tWw(:,1));  % cm, structural length at time
  EWw = L.^3 * (1 + f_tW * w);                       % g, wet weight females
  
  % pack to output
  prdData.tWw = EWw;
end

