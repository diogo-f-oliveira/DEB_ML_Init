function [prdData, info] = predict_Dicentrarchus_labrax(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%   filterChecks = E_Hh >= E_Hb || E_Hh < 0 || T_L>T_ref || T_H<T_ref; 
%   if filterChecks
%       info = 0; prdData = []; return
%   end
  
  pars_T = [T_A, T_L, T_H, T_AL, T_AH]; 

  % compute temperature correction factors
  TC_15 = tempcorr(temp.ah_15, T_ref, pars_T);
  TC_17 = tempcorr(temp.ah_17, T_ref, pars_T);
  TC_16 = tempcorr(temp.tb_16, T_ref, pars_T);
  TC_13 = tempcorr(C2K(13), T_ref, pars_T);
  TC_19 = tempcorr(temp.tb_19, T_ref, pars_T);
  TC_tj = tempcorr(temp.tj, T_ref, pars_T);
  TC_am = tempcorr(temp.am, T_ref, pars_T);
  TC_1 = tempcorr(C2K(19), T_ref, pars_T);
  TC_P = tempcorr(C2K(TJN(:,1)), T_ref, pars_T);
  TC_WwJX_T= tempcorr(temp.WwJX_T, T_ref, pars_T);

% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  s_M = l_j/ l_b;                          % -, acceleration factor
  
%   % filter 
%   if k * v_Hp >= f_F2^3 * s_M^3 || k * v_Hp >= f_Z^3 * s_M^3 || k * v_Hp >= f_P^3 * s_M^3% constraint required for reaching puberty
%     info = 0; prdData = []; return
%   end
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve

  % hatch   
  [U_H aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); aT_h_15 = a_h/ TC_15; aT_h_17 = a_h/ TC_17;% d, age at hatch at f and T
  Lw_h = aUL(2,3)/ del_M; % total length at hatch
  
  % birth
  L_b = L_m * l_b;                   % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                 % cm, total length at birth at f
  Ww_b = L_b^3 * (1 + f * w);        % g, wet weight at birth at f 
  tT_b_16 = (t_b/ k_M - a_h)/ TC_16; % d, age at birth at f and T
  tT_b_19 = (t_b/ k_M - a_h)/ TC_19; % d, age at birth at f and T

  % metam
  tT_j = (t_j/ k_M - a_h)/ TC_tj;   % d, time since hatch at metam
  L_j = l_j * L_m;                  % cm, structural length at metam at f
  Lw_j = L_j / del_M;               % cm, total length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah_15 = aT_h_15;
  prdData.ah_17 = aT_h_17;
  prdData.tb_16 = tT_b_16;
  prdData.tb_19 = tT_b_19;
  prdData.tj = tT_j;
  prdData.am = aT_m;
  prdData.Lh = Lw_h;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
%% uni-variate data  

%  Rearing in 2 m^3 tanks: t-L, t-Ww 
  ULH_h = [aUL(2,2)/ TC_1; aUL(2,3); U_Hh/ TC_1]; % state vector at h
  UT_Hb = U_Hb/ TC_1; UT_Hj = U_Hj/ TC_1;
  vT = v * TC_1; kT_J = k_J * TC_1; 
  % total length
  t = [0; tL_larv(:,1)]; % d, time since hatch
  [a, ULH_T] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, UT_Hb, UT_Hj);  
  ULH_T(1,:) = []; L = ULH_T(:,2); % cm, structural length
  ELw_larv = L ./ del_M; % cm, total length   
  % wet weight
  t = [0; tWw_larv(:,1)];    
  [a, ULH_T] = ode45(@dget_ulh_pj, t, ULH_h, [], L_b, L_j, L_m, vT, g, kT_J, kap, f, UT_Hb, UT_Hj);  
  ULH_T(1,:) = []; L = ULH_T(:,2); % cm, structural length
  EWw_larv = (1 + f * w) * L .^ 3; %g, wet weight

% Data from cages, varying temperature
  ULH_j = [L_j^3/v/TC_tj; L_j; U_Hj/ TC_tj]; % state vector at j
  UT_Hb = U_Hb/ TC_17; UT_Hj = U_Hj/ TC_tj; % temp correction for common temp at b and j
  %
  t =[t_j ; tWw(:,1)]; tT = [[t_j; tWw(:,1)], [temp.tj; temp.tWw]];    
  [a, ULH_T] = ode45(@dget_ulh_pj_T, t, ULH_j, [], L_b, L_j, L_m, v, g, k_J, kap, f_F2, T_ref, pars_T, tT, UT_Hb, UT_Hj);  
  ULH_T(1,:) = []; L = ULH_T(:,2); % cm, structural length
  EWw = (1 + f_F2 * w) * L .^ 3; % g, wet weight
  
% reproduction at f
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
  ER = TC_13 * reprod_rate_j((WwR(:,1)/(1 + f * w)) .^ (1/3), f, pars_R);             % #/d, ultimate reproduction rate at T

% ammonia nitrogen excretion rate
% JN data at f_P
  p_ref = p_Am * L_m^2;        % max assimilation power at max size
  O2M = (- n_M\n_O)'; % -, matrix that converts organic to mineral fluxes  O2M is prepared for post-multiplication eq. 4.35
  pars_pow = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];
  Ww = weight.TJN; % wet weights passed through auxData for the TJN data
  L_N = (Ww/ (1 + f_P * w)) .^ (1/3); % structural length  
  [L_sort, iL, iL_sort] = unique(L_N,'sorted'); % returns the unique values in t in sorted order
  pACSJGRD = p_ref * scaled_power_j(L_sort, f_P, pars_pow, l_b, l_j, l_p);
  if isempty(pACSJGRD); info = 0; prdData = []; return; end
  pADG = pACSJGRD(:, [1 7 5]);  
    JO = pADG * eta_O';        % organic fluxes
    JM = JO * O2M;             % mineral fluxes
  EJN = 14 * (JM(iL_sort,4)./Ww) .* TC_P;   % g/g/d, nitrogen excretion rate at temp T
  
% Feeding 
  Ww = WwJX_T(:,1); % g, wet weight 
  L_F = (Ww / (1 + f_Z * w)) .^ (1/3); % structural length
  pACSJGRD = p_ref * scaled_power_j(L_F, f_Z, pars_pow, l_b, l_j, l_p);
  pADG = pACSJGRD(:, [1 7 5]);  
    JO = pADG * eta_O';        % organic fluxes
  EWwJX_T = - (w_X/d_X) * JO(:,1).* TC_WwJX_T;  % g/d, ingested food
 
% pack to output
  prdData.tL_larv = ELw_larv;
  prdData.tWw_larv = EWw_larv;
  prdData.tWw = EWw;
  prdData.WwR = ER;
  prdData.TJN = EJN;
  prdData.WwJX_T = EWwJX_T;   
end

%   %% sub subfuctions

function dULH = dget_ulh_pj(t, ULH, Lb, Lj, Lm, v, g, kJ, kap, f, Hb, Hj)
  % change in state variables during juvenile stage
  % dULH = dget_ulh_p_pj(t, ULH)
  % ULH: 3-vector
  %  U: scaled reserve M_E/ {J_{EAm}}; reference is at embryo value at T
  %  L: structural length
  %  H: scaled maturity M_H/ {J_{EAm}}; reference is at embryo value at T
  % dULH: change in scaled reserve, length, scaled maturity
 
  % unpack variables
  U = ULH(1); L = ULH(2); H = ULH(3); 

  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  e = v * U/ L^3; % -, scaled reserve density
  r = s * v * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  SC = U * (s * v/ L - r); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * SC - kJ * H;
  dU = (L > Lb) * s * f * L^2 - SC;
  dL = r * L/3;

  % pack derivatives
  dULH = [dU; dL; dH];
end
%  
function dULH_T = dget_ulh_pj_T(t, ULH, Lb, Lj, Lm, v, g, kJ, kap, f, T_ref, pars_T, tT, Hb, Hj)
  % change in state variables, all stages, variable temperature
  % dULH = dget_ulh_p_pj(t, ULH)
  % ULH: 3-vector
  %  U: scaled reserve M_E/ {J_{EAm}}; reference is at embryo value at T
  %  L: structural length
  %  H: scaled maturity M_H/ {J_{EAm}}; reference is at embryo value at T
  % dULH: change in scaled reserve, length, scaled maturity
 
  % unpack variables
  U = ULH(1); L = ULH(2); H = ULH(3); 

  time = tT(:,1); Temp = tT(:,2);
  T_1 = interp1(time, Temp, t, 'pchip');  
  TC = tempcorr(T_1, T_ref, pars_T);    % -, Temperature Correction factor
  vT = v * TC; kT_J = kJ * TC; 
  
  if H < Hb 
    s = 1; 
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  e = vT * U/ L^3; % -, scaled reserve density
  r = s * vT * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  SC = U * (s * vT/ L - r); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * SC - kT_J * H;
  dU = (L > Lb) * s * f * L^2 - SC;
  dL = r * L/3;

  % pack derivatives
  dULH_T = [dU; dL; dH];
end