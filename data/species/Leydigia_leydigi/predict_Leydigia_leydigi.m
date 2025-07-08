function [prdData, info] = predict_Leydigia_leydigi(par, data, auxData)

  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_am = tempcorr(C2K(Tam(:,1)), T_ref, T_A);
  TC = tempcorr(temp.tL, T_ref, T_A); kT_M = TC * k_M;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  if ~info; prdData = []; return; end
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Wd_b = 1e6*L_b^3*d_V*(1+f*ome);   % mug, dry weight at birth
  a_b = t_0 + tau_b/ k_M;           % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = 1e6*L_p^3*d_V*(1+f*ome);   % mug, dry weight at puberty at f
  tT_p = (tau_p - tau_b)/ kT_M;     % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = 1e6 * L_i^3 * d_V * (1 + f * ome); % mug, ultimate dry weight
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R); % #/d, max reprod rate

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  tau_m = get_tm_s(pars_tm, f, l_b);    % -, scaled mean life span at T_ref
  a_m = tau_m/ k_M;                 % d, mean life span at T_ref
  
  % pack to output
  prdData.tp = tT_p;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length
  tvel = get_tp(pars_tp, f_tL,[],tL(:,1)*kT_M);
  ELw = L_m * tvel(:,4)/ del_M;
    
  % temperature-age at birth
  Eab = a_b ./ TC_ab;

  % temperature-life span
  Eam = a_m ./ TC_am;

  % pack to output
  prdData.tL = ELw;
  prdData.Tab = Eab;
  prdData.Tam = Eam;
  