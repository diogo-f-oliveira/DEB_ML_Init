function [prdData, info] = predict_Notonecta_maculata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % customized filters for allowable parameters of the standard DEB model (std)
  % for other models consult the appropriate filter function.
  filterChecks = k * v_Hp >= f_tL^3 || ...         % constraint required for reaching puberty with f_tL
                 ~reach_birth(g, k, v_Hb, f_tL);   % constraint required for reaching birth with f_tL
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
%   TC_Ni = tempcorr(temp.Ni, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A);
  TC_tS = tempcorr(temp.tS, T_ref, T_A);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_Tap = tempcorr(C2K(Tap(:,1)), T_ref, T_A);

% zero-variate data

  % life cycle 
  pars_tj = [g k l_T v_Hb v_Hp ];
  [t_p, t_pp, t_b, l_p, l_pp, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); 
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth at f (remove d_V for wet weight)
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty (remove d_V for wet weight)
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T
  s_M = l_p/ l_b;                   % -, acceleration factor 
  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight (remove d_V for wet weight)
   
  % reproduction (no kappa-rule)
  R_i = kap_R * ((1 - kap) * p_Am * s_M * L_p^2 - k_J * E_Hp)/ E_0; % #/d, ultimate reproduction rate at T
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = (t_m - t_p)/ k_M/ TC_am;       % d, mean life span at T
  
  % pack to output
  prdData.ab  = aT_b;
  prdData.ap  = aT_p;
  prdData.am  = aT_m;
  prdData.Lb  = Lw_b;
  prdData.Li  = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdi = Wd_i;
  prdData.Ri  = R_i;
  
  % uni-variate data 
 
  % time-length
  L_b = L_m * l_b; L_p = L_m * l_p; rT_j = TC_tL * v * (f_tL/ L_b - 1/ L_m)/ (f_tL + g);        
  ELw = min(L_p, L_b * exp(tL(:,1) * rT_j/ 3))/ del_M;% cm, length  
  
  % length-weight
  EWw = (LW(:,1) * del_M).^3 * d_V * (1 + f_tL * w); % g, expected wet weight at time  
  
  % time-weight 
  EWd = min(L_p, L_b * exp(tW(:,1) * k_M * rho_j/ 3)).^3 * d_V * (1 + f_tW * w); % mg, dry weight
  
  % time - survival: Eq (6.5) of Kooy2010 for short growth periods, e = 1, L = L_i, 15C
  hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v * L_i^2/ L_m^3; 
  hGt = TC_tS * hG * tS(:,1);
  ES = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt.^2/ 2) - h_Bbi * tS(:,1));
  
  % temperature-age at birth
  Ea_b = aT_b ./ TC_Tab;
    
  % temperature-age at puberty
  Ea_p =  t_p/ k_M ./ TC_Tap; %

  % pack to output
  % the names of the fields in the structure must be the same as the data names in the mydata file
  prdData.tL  = ELw;
  prdData.LW  = EWw;
  prdData.tW  = EWd;
  prdData.tS  = ES;
  prdData.Tab = Ea_b;
  prdData.Tap = Ea_p;
  
  
  
  
  
  
  
  
  
  
  
  
  