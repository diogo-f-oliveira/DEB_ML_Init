function [prdData, info] = predict_Oncorhynchus_clarkii_stomias(par, data, auxData)
  % control prdData avec mydata
 
  cPar = parscomp_st(par);%cpar : compound param scaled param
  vars_pull(par);  % unpack par, data, auxData
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
% notice that the knot-abscissa for the scaled functional response
% trajectory is passed as a global here
% the knot-abscissa are in a 1-n vector and is defined in the run file
% global tf 

%% customized filters for allowable parameters of the standard DEB model (std)
%   % for other models consult the appropriate filter function.

  filterChecks = E_Hh >= 0.99 *E_Hb || E_Hj >= 0.99 *E_Hp || E_Hh <= 0 || del_M <= 0;         % constraint required for reaching puberty with f_tL
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  
  
%     filterChecks = kap_G >= mu_V / mu_E;         % constraint required for reaching puberty with f_tL
%   if filterChecks  
%     info = 0;
%     prdData = {};
%     return;
%   end 


%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tW = tempcorr(temp.tW, T_ref, T_A); %correction temperature for my weight data


              %% zero-variate data
  pars_tj = [g; k; l_T; v_Hb; v_Hj; v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f); 
  % rho_j = rj: scaled exponential growth rate between b and j
  % rho_B = rB: scaled von Bertalanffy growth rate between b and s and between j and i
%   Gets scaled age at metamorphosis  to estimate life cycle with metamorphosis

   if info ~= 1 % numerical procedure failed
      %info: indicator equals 1 if successful, 0 otherwise
     fprintf('warning: invalid parameter value combination for get_tj \n')
    end

  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
%   E_0 = U_E0  *p_Am;  % J, initial energy in the egg
%   Ww_0 = w_E/mu_E*E_0/d_E ; %g, wet weight of egg

  % hatch   
  [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = aUL(2,1); 
  aT_h = a_h/ TC_ah; % d, age at hatch at f and T
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

% metamorphosis
   L_j = L_m * l_j;                  % cm, structural length at metam
%   Lw_j = L_j/ del_M;                % cm, physical length at metam at f
%   Ww_j = L_j^3 * (1 + f * w);       % g, wet weight at metam
%   aT_j = t_j / k_M/ TC_aj;          % d, time since birth at metam
%   a_j = t_j/ k_M;                   % d, age at metam at T_ref

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap, kap_R, g, k_J, k_M, L_T, v, U_Hb, U_Hj, U_Hp];
  [R_i, UE0, Lb, Lp, info]  =  reprod_rate_j(L_i, f, pars_R);
  RT_i = TC_Ri * R_i;% #/d, max reprod rate
  
  % life span
  pars_tm = [pars_tj; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_j(pars_tm, f);           % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
 %% uni-variate data

% -------- time-weight 
  kT_M = k_M * TC_tW;
  rT_B = rho_B * kT_M;     

  aT_j = t_j / k_M/ TC_tW;  
  
  filterChecks = tW(1,1) < aT_j      ;  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end 
  
  %    L_bj = L_b * exp(tW((tW(:,1) <= aT_j),1) * rT_j/ 3); % exponential growth for first part metamorphosis-->birth
  %commented part since data for 0-->1 age available (no data of
  %metamorphosis)
 L_jm = L_i - (L_i - l_j) * exp( - rT_B .* (tW((tW(:,1) > aT_j),1) - aT_j)); % cm, expected length at time
 EWw  = L_jm.^3 * (1 + f * w); % g, wet weight

 % pack to output
 prdData.tW = EWw;
       
% -------- time weight length Temp
   
% L0 = initL.tL_1 * del_M; 
L0 = L_b; E0 = L0^3 * p_Am/ v; H0 = E_Hb; f1  = f; %% state vector at start, birth
ELH0 = [f1 * E0; L0; H0]; 

% ELH_1 = [f1 * E0; L0; H0]; 
  
  [a, ELH] = ode45(@dget_ELH_pj, [tL_1(:,1)], ELH0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_1, T_A, T_ref); 
  E = ELH(:,1); L = ELH(:,2); ELw_tL_1 = L/ del_M;  
  EWw_tW_1 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight

%   L0 = initL.tL_2 * del_M; E0 = L0^3 * p_Am/ v; H0 = E_Hb; %% state vector at start, birth
%   ELH_2 = [f1 * E0; L0; H0]; 
  [a, ELH] = ode45(@dget_ELH_pj, [tL_2(:,1)], ELH0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_2, T_A, T_ref); 
  E = ELH(:,1); L = ELH(:,2); ELw_tL_2 = L/ del_M;  
  EWw_tW_2 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight
 
%   L0 = initL.tL_3 * del_M; E0 = L0^3 * p_Am/ v; H0 = E_Hb; %% state vector at start, birth
%   ELH_3 = [f1 * E0; L0; H0]; 
  [a, ELH] = ode45(@dget_ELH_pj, [tL_3(:,1)], ELH0, [], L_b, L_j, L_m, p_Am, v, g, k_J, kap, f1, E_Hb, E_Hj, tT.tL_3, T_A, T_ref); 
  E = ELH(:,1); L = ELH(:,2); ELw_tL_3 = L/ del_M;  
  EWw_tW_3 = L.^3 + E * w_E/ mu_E/ d_E;  % g, wet weight

prdData.tL_1 = (ELw_tL_1);
prdData.tL_2 = ELw_tL_2;
prdData.tL_3 = ELw_tL_3;
prdData.tW_1 = EWw_tW_1;
prdData.tW_2 = EWw_tW_2;
prdData.tW_3 = EWw_tW_3;

end


%% sub subfuctions

function dELH = dget_ELH_pj(t, ELH, Lb, Lj, Lm, p_Am, v, g, kJ, kap, f, Hb, Hj, tT, T_A, T_ref)
  %  change in state variables during juvenile stage
  %  dELH = dget_ELH_p_pj(t, ELH)
  %  ELH: 3-vector
  %   E: reserve E
  %   L: structural length
  %   H: maturity E_H
  %  dELH: change in reserve, length, scaled maturity
  
  %  unpack variables
  E = ELH(1); L = ELH(2); H = ELH(3);
  % compute temperature correction factors
  TC = tempcorr(C2K(spline1(t, tT)), T_ref, T_A);
  vT = v * TC; kT_J = kJ * TC; pT_Am = p_Am * TC;
 
  if H < Hb 
    s = 1; % -, multiplication factor for v and {p_Am}
  elseif H < Hj
    s = L/ Lb;
  else
    s = Lj/ Lb;
  end
  e = vT * E/ L^3/ pT_Am; % -, scaled reserve density; 
  rT = s * vT * (e/ L - 1/ Lm/ s)/ (e + g); % 1/d, spec growth rate
  pT_C = E * (s * vT/ L - rT); % cm^2, scaled mobilisation
  
  % generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * pT_C - kT_J * H;
  dE = (L > Lb) * s * pT_Am * f * L^2 - pT_C;
  dL = rT * L/3;

  % pack derivatives
  dELH = [dE; dL; dH];
end