function [prdData, info] = predict_Poecilia_reticulata(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_Ursi1967 = tempcorr(temp.tL_Ursi1967, T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % Comf1963 data
  vT = v * TC_tL; hT_a = h_a * TC_tL^2; eLqhS0 = [f_tL; L_b; 0; 0; 1];
  % ad libitum
  [a eLqhSt] = ode45(@deLqhS, [-1e-6; tL(:,1)], eLqhS0, [], L_m, vT, g, hT_a, s_G, f_tL, f_tL);
  ELw = eLqhSt(:,2)/ del_M; ELw(1) = [];
  [a eLqhSt] = ode45(@deLqhS, [-1e-6; tS(:,1)], eLqhS0, [], L_m, vT, g, hT_a, s_G, f_tL, f_tL);
  ES = eLqhSt(:,5); ES(1) = [];
  % food restricted
  [a eLqhSt] = ode45(@deLqhS, [-1e-6; tLf(:,1)], eLqhS0, [], L_m, vT, g, hT_a, s_G, f_tL, f_0);
  ELw_f = eLqhSt(:,2)/ del_M; ELw_f(1) = [];
  [a eLqhSt] = ode45(@deLqhS, [-1e-6; tSf(:,1)], eLqhS0, [], L_m, vT, g, hT_a, s_G, f_tL, f_0);
  ES_f = eLqhSt(:,5); ES_f(1) = [];

  % Ursi1967 data
  f = f_Ursi1967; pars_tb = [g; k; v_Hb];
  L_b = L_m * get_lb(pars_tb, f); L_i = f * L_m; rT_B = TC_Ursi1967 * k_M/ (3 + 3 * f/ g);
  ELw_Ursi1967 = (L_i - (L_i - L_b) * exp(- rT_B * tL_Ursi1967(:,1)))/ del_M;

  % pack to output
  prdData.tS = ES;
  prdData.tSf = ES_f;
  prdData.tL = ELw;
  prdData.tLf = ELw_f;
  prdData.tL_Ursi1967 = ELw_Ursi1967;
  
end

 function d = deLqhS(t, eLqhS, Lm, v, g, ha, sG, f1, f0)

  ee = eLqhS(1); L = eLqhS(2); q = eLqhS(3); h = eLqhS(4); S = max(0,eLqhS(5));
    
  r = v * (ee/ L - 1/ Lm)/ (ee + g);

  if t > 100 && t < 600
    f = f0;
  else
    f = f1;
  end

  de = (f - ee) * v/ L;
  dL = r * L/ 3;
  dq = (q * (L/ Lm)^3 * sG + ha) * ee * (v/ L - r) - r * q;
  dh = q - h * r;
  dS = - S * h;
  
  d = [de; dL; dq; dh; dS];

 end