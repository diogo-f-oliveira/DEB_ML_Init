function [prdData, info] = predict_Ichthyomyzon_fossor(par, data, auxData)  

  % unpack par, data, auxData
  cPar = parscomp_st(par);
  v2struct(par); v2struct(cPar); v2struct(data); v2struct(auxData); 

  %% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;

  %% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at birth at f
  Lw_p = L_p/ del_M;                % cm, physical length at birth at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % life span
  pars_tm = [pars_tp; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm(pars_tm, f);             % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T

  % reproduction
  kT_J = k_J * TC; vT= v * TC; UT_Hb = U_Hb/ TC; UT_Hp = U_Hp/ TC; 
  pars_NR = [kap; kap_R; g; kT_J; kT_M; L_T; vT; UT_Hb; UT_Hp];
  N_R = cum_reprod(aT_m, f, pars_NR, L_b); N_R= N_R(end);

  %% pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.NR = N_R;
  
  %% uni-variate data
  % time - length
  L_i = f_1960; r_B = k_M/ 3/ (1 + f_1960/ g);
  [t,L] = ode45(@get_dL,[0;tL(:,1)],L_b,[],T_ref,T_A,t_T,r_B,L_i);
  L(1)=[]; ELw_1960 = L/ del_M; % cm, total length
  %
  L_i = f_1963; r_B = k_M/ 3/ (1 + f_1963/ g);
  [t,L] = ode45(@get_dL,[0;tL(:,1)],L_b,[],T_ref,T_A,t_T,r_B,L_i);
  L(1)=[]; ELw_1963 = L/ del_M; % cm, total length

  %% pack to output
  prdData.tL = [ELw_1960 ELw_1963];
end

function dL = get_dL(t,L,T_ref,T_A,t_T,r_B,L_i)
  TC = tempcorr(C2K(16.5 + 10*sin(2*pi*(t+t_T)/365)),T_ref, T_A);
  dL = TC * r_B * (L_i - L);
end
