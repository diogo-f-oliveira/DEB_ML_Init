function [prdData, info] = predict_Xenopus_laevis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  
  % compute temperature correction factors
  TC = tempcorr(temp.ab, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL = tempcorr(temp.tL, T_ref, T_A);
  TC_tLtad = tempcorr(temp.tLtad, T_ref, T_A);
  TC_tAMA = tempcorr(temp.tLtad1, T_ref, T_A);
  TC_tAMA2= tempcorr(temp.tLtad2, T_ref, T_A);
  TC_tAMA3= tempcorr(temp.tLtad3, T_ref, T_A);
  TC_tAMA4= tempcorr(temp.tLtad4, T_ref, T_A);
  TC_tAMA5= tempcorr(temp.tLtad5, T_ref, T_A);
  TC_tAMA6= tempcorr(temp.tLtad6, T_ref, T_A);
  
 
  % zero-variate data
  
  % life cycle for tadpole
  pars_tpj = [g k l_T v_Hb v_Hj]; % for tadpole
  [t_j, t_b, l_j, l_b, info] = get_tp(pars_tpj, f);
  pars_tp = [g k l_T v_Hb v_Hp]; % for frog
  [t_p, t_b, l_p, l_b] = get_tp(pars_tp, f);
  
  % hatch
  % initial 
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve  
  E_0 = U_E0 * p_Am;     % J, initial reserve
  Wd0 = E_0 * w_E/ mu_E ; % g, egg dry weight 
  [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  aT_h = aUL(2,1)/ TC;              % d, age at hatch at f and T
  

  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_b = t_b/ k_M/ TC;              % d, age at birth at f and T

  % begin of metamorphosis climax
%   [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
%   aT_h = aUL(2,1)/ TC;              % d, age at hatch at f and T

 %development times stages NF50 to stage NF62
  for i = 1:13 
   stri = num2str(i+49); 
   aNF = ['aNF',stri];       
   cPar.(['V_H', stri]) = cPar.(['U_H', stri])/ (1 - kap);         % cm^2 d, scaled maturity at level i
   cPar.(['v_H', stri]) = cPar.(['V_H', stri]) * g^2 * k_M^3/ v^2; % -, scaled maturity density at level i
   
   pars_tNF = [g k l_T v_Hb cPar.(['v_H', stri])]; % for tadpoles
   [t_NF, t_b, l_j, l_b, info] = get_tp(pars_tNF, f);
   
   tT_sNF = t_NF/ k_M/ TC;  % d, age at stage NF i+49 at f and T   
   prdData.(aNF) = tT_sNF; %pack to output   
  end

  % metam
  tT_j = (t_j - t_b)/ k_M/ TC;  % d, time since birth at metamorphosis at f and T
  
  % puberty for frog
  tT_p = (t_p - t_j)/ k_M/ TC;   % d, time time metam at puberty at f and T
  
  % ultimate for toad
  l_i = f - l_T;                  % -, scaled ultimate length at f
  L_i = L_m * l_i;                % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;              % cm, ultimate total length at f
  Ww_i = L_i^3 * (1 + f * w);     % g, ultimate wet weight 
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);               % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;              % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate structural, body length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tj = tT_j;
  prdData.tj2 = tT_j;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data

  % time - length for frogs
  rT_B = TC_tL * k_M/ 3/ (1 + f_tL/ g); % d 1/von Bert growth rate
  L_i = f_tL * L_m;  [t_j, t_b, l_j, l_b] = get_tp(pars_tpj, f_tL); L_j = L_m * l_j;
  ELw = (L_i - (L_i - L_b) * exp( - rT_B * (tL(:,1) + tT_j)))/ del_M; % cm, body length at time
  EWw = (L_i - (L_i - L_b) * exp( - rT_B * (tWw(:,1) + tT_j))).^3 * (1 + f_tL * w); % g, wet weight

  % data for the tadpoles
  % need growth expression for the tadpole case (simple case before met. climax)
  [t_j, t_b, l_j, l_b] = get_tp(pars_tpj, f_tad);
  pT_Am = TC_tLtad * p_Am; vT = TC_tLtad * v; pT_M = TC_tLtad * p_M; kT_J = TC_tLtad * k_J; 
  E_0 = J_E_Am * U_E0 * mu_E; % J, initial reserve
  [t, LEH, ~] = ode45(@dget_LEH, tLtad(:,1), [1e-5, E_0, 0], [], ...
      pT_Am, kap, vT, kT_J, pT_M, E_G, E_Hb, f);
  ELw_tad = LEH(:,1) / del_Mt; % total length
  
  % time - SVL/weight 1
  aT_b = t_b/ k_M/ TC_tAMA;               % d, age at birth at f and T
  rT_B = TC_tAMA * k_M/ 3/ (1 + f_tad1/ g); % d 1/von Bert growth rate
  L_i = f_tad1 * L_m;  [t_j, t_b, l_j, l_b] = get_tp(pars_tpj, f_tad1); L_b = L_m * l_b;
  L = L_i - (L_i - L_b) * exp( - rT_B * (tLtad1(:,1)-aT_b)); % cm, struc length
  ELw_1 = L/ del_Me;
  EWw_1 = L.^3 * (1 + f_tad1 * w); % g, wet weight

  % time - SVL/weight 2
  aT_b = t_b/ k_M/ TC_tAMA2;               % d, age at birth at f and T
  rT_B = TC_tAMA2 * k_M/ 3/ (1 + f_tad2/ g); % d 1/von Bert growth rate
  L_i = f_tad2 * L_m;  [t_j, t_b, l_j, l_b] = get_tp(pars_tpj, f_tad2); L_b = L_m * l_b;
  L = L_i - (L_i - L_b) * exp( - rT_B * (tLtad2(:,1)-aT_b)); % cm, struc length
  ELw_2 = L/ del_Me;
  EWw_2 = L.^3 * (1 + f_tad2 * w); % g, wet weight

  % time - SVL/weight 3
  aT_b = t_b/ k_M/ TC_tAMA3;               % d, age at birth at f and T
  rT_B = TC_tAMA3 * k_M/ 3/ (1 + f_tad3/ g); % d 1/von Bert growth rate
  L_i = f_tad3 * L_m;  [t_j, t_b, l_j, l_b] = get_tp(pars_tpj, f_tad3); L_b = L_m * l_b;
  L = L_i - (L_i - L_b) * exp( - rT_B * (tLtad3(:,1)-aT_b)); % cm, struc length
  ELw_3 = L/ del_Me;
  EWw_3 = L.^3 * (1 + f_tad3 * w); % g, wet weight

  % time - SVL/weight 4
  aT_b = t_b/ k_M/ TC_tAMA4;               % d, age at birth at f and T
  rT_B = TC_tAMA4 * k_M/ 3/ (1 + f_tad4/ g); % d 1/von Bert growth rate
  L_i = f_tad4 * L_m;  [t_j, t_b, l_j, l_b] = get_tp(pars_tpj, f_tad4); L_b = L_m * l_b;
  L = L_i - (L_i - L_b) * exp( - rT_B * (tLtad4(:,1)-aT_b)); % cm, struc length
  ELw_4 = L/ del_Me;
  EWw_4 = L.^3 * (1 + f_tad4 * w); % g, wet weight

  % time - SVL/weight 5
  aT_b = t_b/ k_M/ TC_tAMA5;               % d, age at birth at f and T
  rT_B = TC_tAMA5 * k_M/ 3/ (1 + f_tad5/ g); % d 1/von Bert growth rate
  L_i = f_tad5 * L_m;  [t_j, t_b, l_j, l_b] = get_tp(pars_tpj, f_tad5); L_b = L_m * l_b;
  L = L_i - (L_i - L_b) * exp( - rT_B * (tLtad5(:,1)-aT_b)); % cm, struc length
  ELw_5 = L/ del_Me;
  EWw_5 = L.^3 * (1 + f_tad5 * w); % g, wet weight

  % time - SVL/weight 6
  aT_b = t_b/ k_M/ TC_tAMA6;               % d, age at birth at f and T
  rT_B = TC_tAMA6 * k_M/ 3/ (1 + f_tad6/ g); % d 1/von Bert growth rate
  L_i = f_tad6 * L_m;  [t_j, t_b, l_j, l_b] = get_tp(pars_tpj, f_tad6); L_b = L_m * l_b;
  L = L_i - (L_i - L_b) * exp( - rT_B * (tLtad6(:,1)-aT_b)); % cm, struc length
  ELw_6 = L/ del_Me;
  EWw_6 = L.^3 * (1 + f_tad6 * w); % g, wet weight
  
  % SVL - weight
  EWw_tad = (LWtad(:,1) * del_Me).^3 * (1 + f_tad * w);  % g, wet weight
  EWw_tad1 = (LWtad1(:,1) * del_Me).^3 * (1 + f_tad7 * w);  % g, wet weight
  
  % Hind Limb Length - weight
  EWw_tad2 = (LWtad2(:,1) * del_Meh).^3 * (1 + f_tad7 * w);  % g, wet weight
  
  % Temperature - time
  ETt = 1 ./ tempcorr(C2K(data.Tt(:,1)), C2K(25), T_A); %does not work, why?

  
 
  % pack to output
  prdData.tL = ELw;
  prdData.tWw = EWw;
  prdData.tLtad = ELw_tad;
  prdData.LWtad = EWw_tad;
  prdData.LWtad1 = EWw_tad1;
  prdData.LWtad2 = EWw_tad2;
  prdData.tLtad1 = ELw_1;
  prdData.tLtad2 = ELw_2;
  prdData.tLtad3 = ELw_3;
  prdData.tLtad4 = ELw_4;
  prdData.tLtad5 = ELw_5;
  prdData.tLtad6 = ELw_6;
  prdData.tWtad1 = EWw_1;
  prdData.tWtad2 = EWw_2;
  prdData.tWtad3 = EWw_3;
  prdData.tWtad4 = EWw_4;
  prdData.tWtad5 = EWw_5;
  prdData.tWtad6 = EWw_6;
  prdData.LWtad  = EWw_tad;
  prdData.Tt = ETt;
  
end


function dLEH = dget_LEH(a, LEH, p_Am, kap, v, k_J, p_M, E_G, E_Hb, f)
  % a: scalar with age
  % LEH: 3-vector with (L, E, H = E_H) of embryo
  % dLEH: 3-vector with (dL/dt, dE/dt, dH/dt)
  
  L = LEH(1);     % cm, structural length
  E = LEH(2);     % J, reserve E
  E_H = LEH(3);   % J, maturity E_H
  
  L2 = L * L; L3 = L2 * L; L4 = L3 * L;
  pA = f * p_Am * L2 *  (E_H > E_Hb);
  r = (E * v/ L4 - p_M/ kap)/ (E/ L3 + E_G/ kap);
  pC = E * (v/ L - r);
  
  % generate dH/da, dE/da, dL/da
  dE_H = (1 - kap) * pC - k_J * E_H;
  dE = pA - pC;
  dL = L * r/ 3;
  dLEH = [dL; dE; dE_H]; % pack output 
end


