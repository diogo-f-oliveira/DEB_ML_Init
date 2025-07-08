function [prdData, info] = predict_Etmopterus_perryi(par, data, auxData)  
  
  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
  
  %% compute temperature correction factors
  TC = tempcorr(temp.Ri, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_lp = [g; k; l_T; v_Hb; v_Hp];     % compose parameter vector
  [l_p, l_b, info] = get_lp(pars_lp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f

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

  % males
  v_Hp = v_Hp * E_Hpm/ E_Hp;
  pars_lp = [g; k; l_T; v_Hb; v_Hp];     % compose parameter vector
  [l_pm, l_b, info] = get_lp(pars_lp, f); % -, scaled times & lengths at f
  L_pm = L_m * l_pm;                  % cm, structural length at puberty at f
  Lw_pm = L_pm/ del_M;                % cm, total length at puberty at f

  %% pack to output
  prdData.Lb = Lw_b;
  prdData.Lp_f = Lw_p;
  prdData.Lp_m = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  