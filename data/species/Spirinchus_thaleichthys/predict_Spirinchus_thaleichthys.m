function [prdData, info] = predict_Spirinchus_thaleichthys(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3*(1 + f *w);          % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 

  % ultimate
  L_i = L_m * (f - l_T);            % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 


  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;

  %% uni-variate data
  
  % time - length/weigth
  L_b = L_m * get_lb([g; k; v_Hb], f_tL); L_i = L_m * f_tL; rT_B = kT_M/ 3/ (1 + f_tL/ g);
  L = L_i - (L_i - L_b) * exp (-rT_B * tL(:,1)); ELw = L/ del_M;
  L = L_i - (L_i - L_b) * exp (-rT_B * tWw(:,1)); EWw = L.^3 * (1 + f_tL * ome);
  %
  L_b = L_m * get_lb([g; k; v_Hb], f_tL1); L_i = L_m * f_tL1; rT_B = kT_M/ 3/ (1 + f_tL1/ g);
  L = L_i - (L_i - L_b) * exp (-rT_B * tL1(:,1)); ELw_1 = L/ del_M;
  L = L_i - (L_i - L_b) * exp (-rT_B * tWw1(:,1)); EWw_1 = L.^3 * (1 + f_tL1 * ome);

  % length - fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  EN = 365 * TC * reprod_rate(LN(:,1)*del_M, f, pars_R);    % #, fecundity

  % pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw_1;
  prdData.tWw = EWw;
  prdData.tWw1 = EWw_1;
  prdData.LN = EN;
end

 