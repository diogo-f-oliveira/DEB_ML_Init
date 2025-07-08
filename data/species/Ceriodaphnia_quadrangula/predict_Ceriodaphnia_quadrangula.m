function [prdData, info] = predict_Ceriodaphnia_quadrangula(par, data, auxData)
   % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
   
  if p_M > 2000; info = 0; prdData = []; return; end
  
  % compute temperature correction factors
    TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp ];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
%    % initial
%   E_0 = p_Am * initial_scaled_reserve(f, [V_Hb; g; k_J; k_M; v]);
  
   % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b / del_M;               % cm, total length at birth at f
  Wd_b = L_b^3 * d_V *(1 + f * w) ; % g, dry weight at birth at f (remove d_V for wet weight)
  aT_b = tau_b / kT_M;
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p / del_M;               % cm, total length at puberty at f  
  tT_p = (tau_p - tau_b) / kT_M;
    
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = tau_m/ k_M;                       % d, mean life span 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  
  
  % pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdi = Wd_i;

  
  % uni-variate data

  % time-length-cumrepod
  tvel = get_tp(pars_tp, f_tL, [], tLN(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M; % cm, length
  %
  EN = cum_reprod(tLN(:,1), f_tL, pars_R); % #, cum reprod

  % food density-time since birth at puberty
  f = Xtp(:,1)./(K+Xtp(:,1)); % -, scaled func response
  n =  size(Xtp,1); EtT_p = zeros(n,1);
  for i=1:n;  [tau_p, tau_b, ~, ~, info] = get_tp(pars_tp, f(i)); 
    if ~info; prdData = []; return; end
    EtT_p(i) = (tau_p - tau_b)/ kT_M;
  end

 
  % pack to output
  prdData.tLN = [ELw EN];
  prdData.Xtp = EtT_p;  

