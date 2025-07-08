function [prdData, info] = predict_Hypomesus_nipponensis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp]; % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled length at birth at f

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
  Ww_b = L_b^3*(1 + f *w);          % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty 

  % ultimate
  L_i = L_m * (f - l_T);            % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 

  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % ultimate reproduction rate

  % life span
  pars_tm = [pars_tp; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm(pars_tm, f);             % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;

  %% uni-variate data
  
  % time - length
  L_b = L_m * get_lb([g; k; v_Hb], mean([f_ts,f_tw])); % cm, struc length at birth
  tf = [0 80 100 150 160 365; f_tw f_tw f_ts f_ts f_tw f_tw]';
  tf = [0 80 100 150 160 365; f_tw f_tw f_ts f_ts f_tw f_tw]';
  [t, eL] = ode45(@get_deL, tL(:,1), [1;L_b], [], tf, T_ref, T_A, v, g, L_m);
  ELw = eL(:,2)/ del_M; % cm, total length
  %
  L_b = L_m * get_lb([g; k; v_Hb], mean([f_ts1,f_tw1])); % cm, struc length at birth
  tf = [0 80 100 150 160 365; f_tw1 f_tw1 f_ts1 f_ts1 f_tw1 f_tw1]';
  [t, eL] = ode45(@get_deL, tL1(:,1), [1;L_b], [], tf, T_ref, T_A, v, g, L_m);
  ELw_1 = eL(:,2)/ del_M; % cm, total length

  % pack to output
  prdData.tL = ELw;
  prdData.tL1 = ELw_1;
end

function deL = get_deL(t, eL, tf, T_ref, T_A, v, g, L_m)
  e = eL(1); L = eL(2);
  TC = tempcorr(C2K(12+8*sin(2*pi*(t-40)/365)), T_ref, T_A);
  f = spline1(t, tf);
  de = TC * v * (f - e)/ L;
  r = TC * v * (e/ L - 1/ L_m)/ (e + g);
  dL = L * r/ 3;
  deL = [de; dL];
end
     