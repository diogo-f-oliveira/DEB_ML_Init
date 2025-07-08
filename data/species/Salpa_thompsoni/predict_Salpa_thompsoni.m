function [prdData, info] = predict_Salpa_thompsoni(par, data, auxData)  

  % unpack par, chem, cpar and data
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
    
  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hx; v_Hp];         % compose parameter vector
  [tau_p, tau_x, tau_b, l_p, l_x, l_b, info] = get_tx(pars_tp, f); % -, scaled times & lengths at f
  if ~info
      prdData = []; return
  end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                % cm, body length ar release of oozoid
  aT_b = tau_b/ k_M/ TC;              % d, age at birth at f and T
  
  % puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, oozoid length at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate oozoid length
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight of oozooid
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  %% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % length - spec growth
  L = Lr(:,1) * del_M; % cm, structural length
  Er = TC * v * (f_Lr ./ L - 1/ L_m)/ (f_Lr + g); % 1/d, spec growth rate
  
    
  %% pack to output               
  prdData.Lr = Er;

end
