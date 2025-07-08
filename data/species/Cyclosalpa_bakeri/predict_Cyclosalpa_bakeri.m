function [prdData, info] = predict_Cyclosalpa_bakeri(par, data, auxData)  

  % unpack par, chem, cpar and data
  par.d_E = par.d_V; % overwrite d_E
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 
   
  if E_Hx < E_Hb || E_Hx > E_Hp
      info = 0; prdData = []; return
  end
  
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
  
  % release
  L_x = L_m * l_x;                  % cm, structural length at release
  Lw_x = L_x/ del_M;                % cm, body length ar release of oozoid
  WC_x = L_b^3 * (1 + f * w) * d_V * 12/w_E; % g, C-weight at release of oozoid
  aT_x = tau_x/ k_M/ TC;            % d, age at release 

  % puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC;      % d, time since birth at puberty
  L_p = L_m * l_p;                  % cm, structural length at puberty
  Lw_p = L_p/ del_M;                % cm, oozoid length at puberty
  WC_p = L_p^3 * (1 + f * ome) * d_V * 12/w_V; % g, C-weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate oozoid length
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight of oozooid
  WC_i = Ww_i * d_V * 12/w_V;       % g, ultimate C weight of zooid
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  %% pack to output
  prdData.ax = aT_x;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lx = Lw_x;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.WCx = WC_x;
  prdData.WCp = WC_p;
  prdData.WCi = WC_i;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  %% uni-variate data
  
  % length - wet weight
  EV = (LV(:,1) * del_M).^3 * (1 + f * ome);
  
  % length - dry weight
  EWd = (LWd(:,1) * del_M).^3 * (1 + f * ome) * d_V;

  % length - C weight
  EWC = (LWC(:,1) * del_M).^3 * (1 + f * ome) * d_V * 12/ w_E;
  
  % length-respiration
  L = LJO(:,1) * del_M;  % cm, structural length
  L3 = L.^3; M_E = f * E_m * L3/ mu_E; r = v * (f ./ L - 1/ L_m) ./ (f + g); 
  pC = (v ./ L - r) .* M_E * mu_E; 
  pM = p_M * L3; pG = kap * pC - pM; pD = pM + (1 - kap) * pC;
  eta_VG = d_V/ E_G/ w_V; eta = [0 0; 0 eta_VG; [-1 -1]/ mu_E; 0 0];
  J_M = (- n_M\n_O * eta * [pD pG]')'; % mol/d, mineral fluxes
  EJO = - TC * J_M(:,3) * 1e6; % mumol/d

  % length - spec growth
  L = Lr(:,1) * del_M; % cm, structural length
  Er = TC * v * (f_Lr ./ L - 1/ L_m)/ (f_Lr + g); % 1/d, spec growth rate
  
  % time-length
  rT_B = TC * k_M/ 3/ (1 + f_Lr/ g); % 1/d, von Bert growth rate, factor 10 is used to match data  
  L_b = L_m * get_lb([g; k; v_Hb], f_Lr); L_i = L_m * f_Lr;
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1)); % cm, structural length
  ELw = L/ del_M; % cm, oozoid length
  
  % length - filtering rate
  EF = TC * F_m * (LF(:,1)*del_M).^2; % l/d, filtering rate (at low food)
    
  %% pack to output               
  prdData.LV = EV;
  prdData.LWd = EWd;
  prdData.LWC = EWC;
  prdData.LJO = EJO;
  prdData.Lr = Er;
  prdData.tL = ELw;
  prdData.LF = EF;

end
