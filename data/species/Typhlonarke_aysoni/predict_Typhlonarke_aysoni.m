function [prdData, info] = predict_Typhlonarke_aysoni(par, data, auxData)  
    
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 

  if E_Hpm < E_Hb
    info = 0; prdData = []; return
  end

  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  %% zero-variate data

  % life cycle
  pars_lp = [g; k; l_T; v_Hb; v_Hp];     % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_lp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  aT_b = t_b/ kT_M;                 % d, age at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males
  pars_tpm = [g; k; l_T; v_Hb; v_Hpm]; % compose parameter vector
  [t_pm, t_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % -, scaled times & lengths at f
  L_pm = l_pm * L_m; Lw_pm = L_pm/ del_M;

  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % time-length
  L_b = L_m * get_lb([g; k; v_Hb], f_tL); L_i = L_m * f_tL;
  rT_B = kT_M/ 3/ (1 + f_tL/ g); % 1/d, von Bert growth rate 
  L = L_i - (L_i - L_b) * exp(-rT_B * tL_f(:,1)); % cm, struct length
  ELw_f = L/ del_M; % cm, total length
  %
  L = L_i - (L_i - L_b) * exp(-rT_B * tL_m(:,1)); % cm, struct length
  ELw_m = L/ del_M; % cm, total length

  %% pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  
end
  