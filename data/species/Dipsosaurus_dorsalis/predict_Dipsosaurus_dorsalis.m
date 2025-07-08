function [prdData, info] = predict_Dipsosaurus_dorsalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_H; T_AL; T_AH];  
  TC_ab = tempcorr2(temp.ab, T_ref, pars_T);
  TC_tp = tempcorr2(temp.tp, T_ref, pars_T);
  TC_am = tempcorr2(temp.am, T_ref, pars_T);
  TC_Ri = tempcorr2(temp.Ri, T_ref, pars_T);
  
%% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, SVL at birth
  a_b = t_b/ k_M;                   % d, age at birth
  aT_b = a_b / TC_ab;               % d, age at birth at f and T
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, SVL at puberty
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate SVL
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight at f

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap; % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v; % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m); % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G; % mol/mol, reserve capacity
  ome_m = m_Em_m * w_E/ w_V; % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m; L_im = f * L_mm; Lw_im = L_im/ del_M; % cm, max ultimate length
  pars_tpm = [g_m k l_T v_Hb v_Hpm]; % pars for males
  [tau_pm, tau_bm, l_pm, l_bm] = get_tp(pars_tpm, f); % - , scaled time, length
  L_bm = L_mm * l_bm; L_pm = L_mm * l_pm; Lw_pm = L_pm/ del_M;  % cm, lengths
  Ww_im = L_im^3 * (1 + f * ome_m); % g, ultimate wet weight

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
%% univar data
 
  % SLV - wet weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w); % g, wet weight
  EWw_j = (LW_j(:,1) * del_M).^3 * (1 + f * w); % g, wet weight

  % temperature - age at birth
  Eab = (t_b/ k_M) ./ tempcorr2(C2K(Tab(:,1)), T_ref, pars_T); 

  % temperature - O2 consumption rate in ml/h.g
  n_M(:,4)=[1, 4/5, 3/5, 4/5];
  o2Ww = 69.2; % mean wet weight of experimental animals
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  p_ref = p_Am * L_m^2;               % J/d, max assimilation power at max size
  pars_power = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  L = (o2Ww / (1 + f * w)).^(1/3); % cm, structural length
  pACSJGRD = p_ref * scaled_power(L, f, pars_power, l_b, l_p);
  pADG = pACSJGRD(:, [1 7 5]); % pADG(:,1) = 0; % DON'T exclude assim contribution (8-24h fasting... I guess it's not enough to reach SMR)
  JM = pADG * eta_O' * O2M;                     % mol/d, mineral fluxes
  X_gas = 24.06;  % gas correction factor
  EO = (- 1 * (JM(:,3) * X_gas) .* tempcorr(C2K(TO(:,1)), T_ref, pars_T(1)))/24*1000/o2Ww; % L/day to ml/h/g

  % pack to output
  prdData.LW_f = EWw_f;
  prdData.LW_m = EWw_m;
  prdData.LW_j = EWw_j;
  prdData.Tab = Eab;
  prdData.TO = EO;
end
 
  function TC = tempcorr2 (T, T_ref, pars_T)
    T_A = pars_T(1); % Arrhenius temperature
    T_L  = pars_T(2);  % Lower temp boundary
    T_H  = pars_T(3);  % Upper temp boundary
    T_AL = pars_T(4);  % Arrh. temp for lower boundary
    T_AH = pars_T(5);  % Arrh. temp for upper boundary  
    TC = exp(T_A * (1 / T_ref - 1 ./ T)) ./ (1 + exp(T_AL * (1 ./ T - 1 / T_L)) + exp(T_AH * (1 / T_H - 1 ./ T)));
  end
  
  
  