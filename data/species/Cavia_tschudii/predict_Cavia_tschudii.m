%% predict_Cavia_tschudii
% Obtains predictions, using parameters and data

%%
function [prdData, info] = predict_Cavia_tschudii(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
 
  % zero-variate data
  
  % life cycle
  pars_tx = [g; k; l_T; v_Hb; v_Hx; v_Hp]; info = 1;
  [t_p, t_x, t_b, l_p, l_x, l_b] = get_tx(pars_tx, f); % -, scaled age at puberty

  % birth
  L_b = L_m * l_b;                % cm, struct length at birth of foetus  at f = 1
  aT_g = t_0 + t_b/ k_M/ TC;      % d, gestation time of foetus at f = 1
  Ww_b = L_b^3 * (1 + f * w);     % g, wet weight at birth

  % weaning
  tT_x = (t_x - t_b)/ k_M/ TC;    % d, time since birth at weaning
  L_x = L_m * l_x;                % cm, struct length at weaning
  Ww_x = L_x^3 * (1 + f * w);     % g, wet weight at weaning

  % puberty
  tT_p = (t_p - t_b)/ k_M/ TC;    % d, time since birth at puberty 

  % ultimate
  L_i = f * L_m - L_T;            % cm, ultimate structural length
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight

  % reprod rate
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % fast development
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R); % d^-1, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                 % d, mean life span at T
  
  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  rT_B = TC * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_B * tWw(:,1)); % cm, struct length
  EWw = L.^3 * (1 + f * w); % g, wet weight

  % pack to output
  prdData.tWw = EWw;
  