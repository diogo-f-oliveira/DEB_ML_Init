function [prdData, info] = predict_Procambarus_virginalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
filterChecks = k * v_Hp >= f_tL1^3 || ...              % constraint required for reaching puberty with f_Lab
                 ~reach_birth(g, k, v_Hb, f_tL1) ||... % constraint required for reaching birth with f_Lab
                E_Hh >= E_Hb ||...                     % maturity at hatching, birth
              del_Mh < 0.1 || del_M < 0.1 || del_Mcl < 0.3 || ...  % shape coeff
                f_tL1 > 1.5;                % shape coefficient
 
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  

  pars_T = [T_A, T_L, T_H, T_AL, T_AH]; 
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL1 = tempcorr(temp.tL1, T_ref, pars_T);
  TC_tL2 = tempcorr(temp.tL2, T_ref, pars_T);
  TC_tCL30 = tempcorr(temp.tCL30, T_ref, pars_T);
  TC_tCL25 = tempcorr(temp.tCL25, T_ref, pars_T);
  TC_tCL20 = tempcorr(temp.tCL20, T_ref, pars_T);
  TC_tCL15 = tempcorr(temp.tCL15, T_ref, pars_T);
  TC_tW = tempcorr(temp.tW, T_ref, pars_T);
  TC_LN_Vogt = tempcorr(temp.LN_Vogt, T_ref, pars_T);
  TC_LN_HossKoub2019 = tempcorr(temp.LN_HossKoub2019, T_ref, pars_T);
  TC_WN = tempcorr(temp.WN, T_ref, pars_T);
  
 %% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0 = J_E_Am * U_E0 * mu_E; % J
  
  % hatch   
  [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = t_0 + aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_Mh;               % cm, S-V length at hatch at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f 
  aT_b = (t_0 + tau_b/ k_M)/ TC_ab;         % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);      % g, wet weight at puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp;% d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  LCw_i = L_i / del_Mcl;            % cm, ultimate carapace length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight 
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T * reprod_rate_j(2 * del_M, f, pars_R);          % #/d, ultimate reproduction rate at T

  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h; 
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.LCi = LCw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.E0 = E0;
  
  
 %% uni-variate data
  
  % time-length  VogtHube2008
  F = f_tL1; 
  L_b = L_m * get_lb([g k v_Hb], F); Lw_b = L_b / del_M;
  Lw_i = L_m * (F - l_T)/ del_M;
  ir_B = 3/ k_M + 3 * F * L_m/ v; rT_B = TC_tL1/ ir_B;  % d, 1/von Bert growth rate
  ELw1 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL1(:,1)); % cm, total length
  
  F = f_tL2; % larger ones
  L_b = L_m * get_lb([g k v_Hb], F); Lw_b = L_b / del_M;
  Lw_i = L_m * (F - l_T)/ del_M;
  ir_B = 3/ k_M + 3 * F * L_m/ v; rT_B = TC_tL2/ ir_B;  % d, 1/von Bert growth rate
%  ELw2 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL2(:,1)); % cm, total length
  ELw2 = Lw_i - (Lw_i - L0.tL2) * exp( - rT_B * (tL2(:,1)- tL2(1,1))); % cm, total length

 % time-length and time wet-weight from SeitVilp2005
 F = f_Seit;
 L_b = L_m * get_lb([g k v_Hb], F);  L_i = L_m * (F - l_T); % cm, structural length 
 
 % at 30C
 ir_B = 3/ k_M + 3 * F * L_m/ v; rT_B = TC_tCL30/ ir_B;  % d, 1/von Bert growth rate // % 1/d, von Bert growth rate
 % tL30
 EL = L_i - (L_i - L_b) * exp( - rT_B * tCL30(:,1)); % cm, carapace length at 30°C
 ELw30 = EL/del_Mcl;
 % tWw30
 L = L_i - (L_i - L_b) * exp( - rT_B * tWw30(:,1));           % cm, structural length at time
 EWw30 = L.^3 * (1 + F * ome);                                 % g, wet weight

 % at 25 C
 rT_B = TC_tCL25/ ir_B;  
 % tL25
 EL = L_i - (L_i - L_b) * exp( - rT_B * tCL25(:,1)); % cm, carapace length at 25°C
 ELw25 = EL/del_Mcl;
 % tWw25
 L = L_i - (L_i - L_b) * exp( - rT_B * tWw25(:,1));           % cm, structural length at time
 EWw25 = L.^3 * (1 + F * ome);                                 % g, wet weight

 % at 20C 
 rT_B = TC_tCL20/ ir_B;  
 % tL20
 EL = L_i - (L_i - L_b) * exp( - rT_B * tCL20(:,1)); % cm, carapace length at 20°C
 ELw20 = EL/del_Mcl;
 % tWw20
  L = L_i - (L_i - L_b) * exp( - rT_B * tWw20(:,1));           % cm, structural length at time
  EWw20 = L.^3 * (1 + F * ome);                                 % g, wet weight

  % at 15C
 rT_B = TC_tCL15/ ir_B;  
 % tL15
 EL = L_i - (L_i - L_b) * exp( - rT_B * tCL15(:,1)); % cm, carapace length at 15°C
 ELw15 = EL/del_Mcl;
 % tWw15
 L = L_i - (L_i - L_b) * exp( - rT_B * tWw15(:,1));           % cm, structural length at time
 EWw15 = L.^3 * (1 + F * ome);                                 % g, wet weight
 
 % time-wet weight
  F = f_tW; ir_B = 3/ k_M + 3 * F * L_m/ v; rT_B = TC_tW/ ir_B;  % d, 1/von Bert growth rate
  L_i = L_m * (F - l_T); L_b = L_m * get_lb([g k v_Hb], F); % cm, structural length
  L = L_i - (L_i - L_b) * exp( - rT_B * tW(:,1));           % cm, structural length at time
  EWw = L.^3 * (1 + F * ome);                                 % g, wet weight
 
 % length-weight
  EWw_Vogt2010 = (LW_Vogt2010(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight;
  EWw_ParvTogo2017 = (LW_ParvTogo2017(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight;
  EWw_Ziza2015 = (LW_Ziza2015(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight;
  EWw_HossKoub2019 = (LW_HossKoub2019(:,1) * del_M).^3 * (1 + f * ome);  % g, wet weight;


% length-fecundity & weight-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  EN_Vogt = TC_LN_Vogt * 365 * reprod_rate(LN_Vogt(:,1)* del_M, f, pars_R);  % #/d, ultimate reproduction rate at T
  EN_HossKoub2019 = TC_LN_HossKoub2019 * 365 * reprod_rate(LN_HossKoub2019(:,1)* del_M, f, pars_R);  % #/d, ultimate reproduction rate at T
  EN_W = TC_WN * 365 * reprod_rate((WN(:,1)/ (1 + f * ome)).^(1/3), f, pars_R);  % #/d, ultimate reproduction rate at T

 
 % pack to output
  prdData.tL1 = ELw1;
  prdData.tL2 = ELw2;
  prdData.tCL30 = ELw30;
  prdData.tCL25 = ELw25;
  prdData.tCL20 = ELw20;
  prdData.tCL15 = ELw15;
  prdData.tW = EWw;
  prdData.tWw30 = EWw30;
  prdData.tWw25 = EWw25;
  prdData.tWw20 = EWw20;
  prdData.tWw15 = EWw15;
  prdData.LW_Vogt2010 = EWw_Vogt2010;
  prdData.LW_ParvTogo2017 = EWw_ParvTogo2017;
  prdData.LW_Ziza2015 = EWw_Ziza2015;
  prdData.LW_HossKoub2019 = EWw_HossKoub2019;
  prdData.LN_Vogt = EN_Vogt;
  prdData.LN_HossKoub2019 = EN_HossKoub2019;
  prdData.WN = EN_W;