function [prdData, info] = predict_Laevilacunaria_antarctica(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  if f_0 > 1 || f_1 > 1 || f_2 > 1 || f_3 > 1 || f_4 > 1 || f_5 > 1 || f_6 > 1 || f_7 > 1  
    info = 0; prdData = []; return
  end
      
  % compute temperature correction factors
  pars_T = [T_A; T_L; T_AL];
  TC = tempcorr(temp.am, T_ref, pars_T); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
    
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth
  Lw_b = L_b/ del_M;                % cm, shell diameter length at birth
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, length at puberty at f

  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3*(1 + f * ome) * d_V; % g, ulitmate dry weight
  
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
      
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % pack to output
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data 

  tf = [0 100 200 300 400 500 600 700; f_0 f_1 f_2 f_3 f_4 f_5 f_6 f_7]';
  % time-length 
  [t eL] = ode45(@get_eL, tL(:,1), [1; L_b], [], tf, v, g, L_m, T_ref, pars_T);
  ELw = eL(:,2)/ del_M; % cm, shell doameter
  
  % pack to output
  prdData.tL = ELw;
end

function deL = get_eL(t, eL, tf, v, g, L_m, T_ref, pars_T)
  e = eL(1); L = eL(2);
  TC = tempcorr(C2K(3+3*sin(2*pi*(t-160)/365)), T_ref, pars_T);
  f = spline1(t,tf);
  de = TC * (f - e) * v/ L;
  r = TC * v * (e/ L - 1/ L_m)/ (e + g);
  dL = L * r/ 3;
  deL = [de; dL];
end
  
