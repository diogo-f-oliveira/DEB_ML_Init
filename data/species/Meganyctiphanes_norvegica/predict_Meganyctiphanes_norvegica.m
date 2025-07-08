function [prdData, info] = predict_Meganyctiphanes_norvegica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_10 = tempcorr(temp.tL_1, T_ref, T_A);
  TC_20 = tempcorr(temp.tL_5, T_ref, T_A);
  TC_LJO = tempcorr(temp.LJO, T_ref, T_A);
  TC_LJX = tempcorr(temp.LJX, T_ref, T_A);
  TC_TJO = tempcorr(C2K(TJO_1(:,1)), T_ref, T_A);
  TC_LN = tempcorr(temp.LN, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v];                % compose parameter vector
  E_0 = p_Am * initial_scaled_reserve(f, pars_UE0); % J, initial energy in egg
  Wd_0 = 1e6 * E_0 * w_E/ mu_E; Ww_0 = Wd_0/ d_E;   % mug, initial dry, wet weight 
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Wd_b = 1e6 * L_b^3 * d_V * (1 + f * w); % mug, dry weight at birth
  aT_b = (t_0 + t_b/ k_M)/ TC_ab;   % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = 1e3 * L_p^3 * d_V * (1 + f * w);  % mg, dry weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e3 * L_i^3 * d_V * (1 + f * w); % mg, ultimate wet weight 
 
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Ww0 = Ww_0;
  prdData.Wd0 = Wd_0;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  
  % uni-variate data
  
  % time-length
  tf = [150 300 450 600 750 900 1050 1200; f_150 f_300 f_450 f_600 f_750 f_900 f_1050 f_1200]';
  [t Le] = ode45(@fndLe, tL(:,1), [Lw_0 * del_M; f_150], [], T_ref, T_A, tf, v, g, L_m);
  ELw = Le(:,1)/ del_M;
  %
  rT_B = TC_10 * k_M/ 3/ (1 + f_tL1/ g); L_i = L_m * f_tL1;
  ELw_1 = (L_i - (L_i - Lw_01 * del_M) * exp( - rT_B * tL_1(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_10 * k_M/ 3/ (1 + f_tL2/ g); L_i = L_m * f_tL2;
  ELw_2 = (L_i - (L_i - Lw_01 * del_M) * exp( - rT_B * tL_2(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_10 * k_M/ 3/ (1 + f_tL3/ g); L_i = L_m * f_tL3;
  ELw_3 = (L_i - (L_i - Lw_01 * del_M) * exp( - rT_B * tL_3(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_10 * k_M/ 3/ (1 + f_tL4/ g); L_i = L_m * f_tL4;
  ELw_4 = (L_i - (L_i - Lw_01 * del_M) * exp( - rT_B * tL_4(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_20 * k_M/ 3/ (1 + f_tL5/ g); L_i = L_m * f_tL5;
  ELw_5 = (L_i - (L_i - Lw_05 * del_M) * exp( - rT_B * tL_5(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_10 * k_M/ 3/ (1 + f_tL6/ g); L_i = L_m * f_tL6;
  ELw_6 = (L_i - (L_i - Lw_05 * del_M) * exp( - rT_B * tL_6(:,1)))/ del_M; % cm, length at time

  % T-J_O data
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp];
  L = del_M * 3;                % cm, structural length
  Wd = L.^3 * d_V * (1 + f * w); % g, dry weight 
  pACSJGRD = L_m^2 * p_Am * scaled_power(3 * del_M, f, pars_R, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJ_O = - TC_TJO .* J_M(:,3)/ 24e-6 / Wd;      % mumol/h.g, O2 flux
  
  % L-J_O data
  L = del_M * LJO(:,1);          % cm, structural length
  Wd = L.^3 * d_V * (1 + f * w); % g, dry weight 
  pACSJGRD = L_m^2 * p_Am * scaled_power(L, f, pars_R, l_b, l_p); % J/d powers
  J_M = (- n_M\n_O * eta_O * pACSJGRD(:,[1 7 5])')'; % mol/d, mineral fluxes
  EJT_O = - TC_LJO * J_M(:,3) * 32 ./ Wd;        % g/d.g, O2 flux

  % L-J_X data
  L = LJX(:,1) * del_M; Wd = L.^3 * d_V * (1 + f * w);
  EJT_X = TC_LJX * L.^2 * w_X * p_Am/ kap_X./ Wd/ mu_X; % g/d.g, specific ingestion
  
  % L-N data
  EN = TC_LN * reprod_rate (LN(:,1) * del_M, f, pars_R) * 365/ 15;  % #/d, ultimate reproduction rate at T

  % pack to output
  prdData.tL = ELw;
  prdData.tL_1 = ELw_1;
  prdData.tL_2 = ELw_2;
  prdData.tL_3 = ELw_3;
  prdData.tL_4 = ELw_4;
  prdData.tL_5 = ELw_5;
  prdData.tL_6 = ELw_6;
  prdData.TJO_1 = EJ_O;
  prdData.TJO_2 = EJ_O;
  prdData.TJO_3 = EJ_O;
  prdData.TJO_4 = EJ_O;
  prdData.TJO_5 = EJ_O;
  prdData.LJO = EJT_O;
  prdData.LJX = EJT_X;
  prdData.LN = EN;
 
end

%% subfunction
function dLe = fndLe(t, Le, T_ref, T_A, tf, v, g, L_m)
  L = Le(1); e = Le(2); % unpack state variables
  
  vT  =  v * tempcorr(C2K(6 + 2 * sin((t-90) * pi * 2/ 365)), T_ref, T_A); % cm/d, energy conductance
  f = spline(t, tf);                  % -, scaled functional response
  r = vT * (e/ L - 1/ L_m)/ (e + g);  % 1/d, specific growth rate
  
  de = (f - e) * vT/ L; % 1/d, change in scaled reserve density
  dL = r * L/ 3;        % 1/d, chnage in structural length
  
  dLe = [dL; de];
  
end