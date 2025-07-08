function [prdData, info] = predict_Arctica_islandica(par, data, auxData)
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  filterChecks = ( ~reach_birth(g, k, v_Hb, f_tL) || f3 > 1 || f3 < 0 || ...
      f_tL > 1 || f_tL < 0 || ...
     f_tL2 > 1 || f_tL2 < 0 || ...
     f_tL3 > 1 || f_tL3 < 0 || ...
     f_tL4 > 1 || f_tL4 < 0 || ...
     f_tL5 > 1 || f_tL5 < 0 || ...
     f_tL6 > 1 || f_tL6 < 0 || ...
     f_tL7 > 1 || f_tL7 < 0 || ...
     f_tL8 > 1 || f_tL8 < 0 );   

  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end   

  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tj = tempcorr(temp.tj, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  %TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_RL = tempcorr(temp.RL, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tL2 = tempcorr(temp.tL2, T_ref, T_A);
  TC_tL3 = tempcorr(temp.tL3, T_ref, T_A);
  TC_tL4 = tempcorr(temp.tL4, T_ref, T_A);
  TC_tL5 = tempcorr(temp.tL5, T_ref, T_A);
  TC_tL6 = tempcorr(temp.tL6, T_ref, T_A);
  TC_tL7 = tempcorr(temp.tL7, T_ref, T_A);
  TC_tL8 = tempcorr(temp.tL8, T_ref, T_A);
 
  TC_3 = tempcorr(C2K(3), T_ref, T_A); % temp correction for 3 deg experiment
  TC_8 = tempcorr(C2K(8), T_ref, T_A); % temp correction for 8 deg experiment
  TC_13 = tempcorr(C2K(13), T_ref, T_A); % temp correction for 13 deg experiment
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
   
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector   
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % start 
  Ww_0 = 1e3 *  w_E/ mu_E * U_E0 * p_Am/ d_E; % g, wet weight of egg

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_Mb;               % cm, shell height at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam
  Lw_j = L_j/ del_M;                % cm, shell height at metam
  tT_j = (t_j - t_b)/ k_M/ TC_tj;   % d, time since birth at metam
%   s_M = L_j/ L_b;                   % -, acceleration factor
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, shell height at puberty at f
  Wd_p =  d_V * L_p^3 * (1 + f * w); % g, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f #considere acceleration
  Lw_i = L_i/ del_M;                % cm, ultimate shell height at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  RT_L = TC_RL * reprod_rate_j(5 * del_M, f, pars_R);                 % #/d, ultimate reproduction rate at T
  % gonado somatic index in dry weight per cm^3 for Ingoya data
%   Wd_b = d_V * L_b^3 * (1 + f * w); % g, dry weight at birth
  %GI = TC_GSI * reprod_rate_j(f_tL * L_m, f_tL, pars_R) * 365 * Wd_b/ (f_tL * L_m/ del_M)^3; 
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref 
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Ww0 = Ww_0;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdp = Wd_p;
  prdData.RL = RT_L;
  %prdData.GSI = GI;

% uni-variate data
    
s_M = l_j/ l_b;

% time-length  (Different years and different sites)
  prdData.tL = get_Lw(f_tL, TC_tL, tL,  par, cPar);
  prdData.tL2 = get_Lw(f_tL2, TC_tL2, tL2,  par, cPar);
  prdData.tL3 = get_Lw(f_tL3, TC_tL3, tL3,  par, cPar);
  prdData.tL4 = get_Lw(f_tL4, TC_tL4, tL4,  par, cPar);
  prdData.tL5 = get_Lw(f_tL5, TC_tL5, tL5,  par, cPar);
  prdData.tL6 = get_Lw(f_tL6, TC_tL6, tL6,  par, cPar);
  prdData.tL7 = get_Lw(f_tL7, TC_tL7, tL7,  par, cPar);
  prdData.tL8 = get_Lw(f_tL8, TC_tL8, tL8,  par, cPar);
  
% weight-length  
  EWd = d_V * (LW(:,1) * del_M).^3 * (1 + f_tL * w); % g, dry weight
  prdData.LW = EWd;

% Experimental growth data at one food level and three temperatures
% T = 3 deg C; 
  expLength = 93;  
  [ELw93_3F3, EWd93_3F3] = get_LW(f3, TC_3, s_M, expLength, tL93_3F3, LWd93_3F3, par, cPar);
 
  prdData.tL93_3F3  = ELw93_3F3;
  prdData.LWd93_3F3 = EWd93_3F3;
   
% T = 8 deg C; 
  expLength = 93;  
  [ELw93_8F3, EWd93_8F3] = get_LW(f3, TC_8, s_M, expLength, tL93_8F3, LWd93_8F3, par, cPar);
    
  prdData.tL93_8F3  = ELw93_8F3;
  prdData.LWd93_8F3 = EWd93_8F3;

% T = 13 deg C; 
  expLength = 93;  
  [ELw93_13F3, EWd93_13F3] = get_LW(f3, TC_13, s_M, expLength, tL93_13F3, LWd93_13F3, par, cPar);
    
  prdData.tL93_13F3  = ELw93_13F3;
  prdData.LWd93_13F3 = EWd93_13F3;
   
end


function ELw = get_Lw(f, TC, tL,  p, c)

  pars_tj = [c.g c.k c.l_T c.v_Hb c.v_Hj c.v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  
  kT_M = c.k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M;        
  L_b = c.L_m * l_b;  L_j = c.L_m * l_j; L_i = c.L_m * l_i; tT_j = (t_j - t_b)/ kT_M;
  L_bj = L_b * exp(tL((tL(:,1) <= tT_j),1) * rT_j/ 3);
  L_jm = L_i - (L_i - L_j) * exp( - rT_B * (tL((tL(:,1) > tT_j),1) - tT_j)); % cm, expected length at time
  ELw = [L_bj; L_jm]/ p.del_M;        % cm, shell length

        
end


function [ELw, EWd] = get_LW(f, TC, s_M, expLength, tL, LWd, p, c)
 
rho_B = 1/ 3/ (1 + f/ c.g);  % -, scaled functional response    
rT_B  = rho_B * c.k_M * TC; % 1/d, von bert growth
L_i   = f * c.L_m * s_M; 
  
L_0   = tL(:,1) * 1e-1 * p.del_Mb; % cm, structural lengths at t = 0 
L     = L_i - (L_i - L_0) .* exp( - rT_B * expLength); % cm, expected structural lengths at time
ELw   = 10 * L/ p.del_Mb; % mm, expected shell length at time
  
L_0   = LWd(:,1) * 1e-1 * p.del_Mb; % cm, structural lengths at t = 0 
L     = L_i - (L_i - L_0) .* exp( - rT_B * expLength); % cm, expected structural lengths at time
EWd   = p.d_V * L.^3 * (1 + c.w * f) * 1e3; % mg, dry weight
        
end

