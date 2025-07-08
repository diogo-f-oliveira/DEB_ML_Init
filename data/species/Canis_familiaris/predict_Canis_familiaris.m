function [prdData, info] = predict_Canis_familiaris(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  if E_Hb >= E_Hx || E_Hx >= E_Hp 
      prdData = []; info = 0; return
  end
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; 
  [t_p, t_x, t_b, l_p, l_x, l_b, info_E] = get_tx(pars_tx, f);
 
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  tT_g = t_0 + t_b/ kT_M;           % d, gestation time at f and T

  % weaning
  L_x = L_m * l_x;                  % cm, structural length at weaning
  Ww_x = L_x^3 * (1 + f * w);       % g, wet weight at weaning
  tT_x = (t_x - t_b)/ kT_M;         % d, time since birth at fledging at f and T
  
  % puberty 
  tT_pE = (t_p - t_b)/ kT_M;         % d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_iE = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % other races than E: SB, I, G, N, L, B, S, CS, M, CT, P
  p_Am_SB = z_SB * p_MSB/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_SB = p_Am_SB/ v;                 % J/cm^3, reserve capacity [E_m]
  g_SB = E_G/ (kap* E_m_SB);             % -, energy investment ratio
  m_Em_SB = y_E_V * E_m_SB/ E_G;         % mol/mol, reserve capacity 
  w_SB = m_Em_SB * w_E/ w_V;             % -, contribution of reserve to weight
  k_MSB = k_M * p_MSB/p_M; k_SB = k_J/k_MSB; kT_MSB = k_MSB * TC;% 1/d, maint rate coeff
  L_mSB = v/ k_MSB/ g_SB;                  % cm, max struct length
  L_iSB = (f - l_T) * L_mSB;             % cm, ultimate structural length
  pars_txSB = [g_SB k_SB l_T v_Hb v_Hx v_HpSB]; 
  [t_pSB, t_xSB, t_bSB, ~, l_xSB, l_bSB, info_SB] = get_tx(pars_txSB, f);
  L_bSB = L_mSB * l_bSB;      % cm, struc length at birth
  tT_pSB = (t_pSB - t_bSB)/ kT_MSB;       % d, time since birth at puberty
  Ww_iSB = L_iSB^3 * (1 + f * w_SB);      % g, ultimate wet weight 
  %
  p_Am_I = z_I * p_MI/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_I = p_Am_I/ v;                 % J/cm^3, reserve capacity [E_m]
  g_I = E_G/ (kap* E_m_I);             % -, energy investment ratio
  m_Em_I = y_E_V * E_m_I/ E_G;         % mol/mol, reserve capacity 
  w_I = m_Em_I * w_E/ w_V;             % -, contribution of reserve to weight
  k_MI = k_M * p_MI/p_M; k_I = k_J/k_MI; kT_MI = k_MI * TC;% 1/d, maint rate coeff
  L_mI = v/ k_MI/ g_I;                  % cm, max struct length
  L_iI = (f - l_T) * L_mI;             % cm, ultimate structural length
  pars_txI = [g_I k_I l_T v_Hb v_Hx v_HpI]; 
  [t_pI, t_xI, t_bI, l_pI, l_xI, l_bI, info_I] = get_tx(pars_txI, f);
  L_bI = L_mI * l_bI;      % cm, struc length at birth
  tT_pI = (t_pI - t_bI)/ kT_MI;          % d, time since birth at puberty
  Ww_iI = L_iI^3 * (1 + f * w_I);      % g, ultimate wet weight 
  %
  p_Am_G = z_G * p_MG/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_G = p_Am_G/ v;                 % J/cm^3, reserve capacity [E_m]
  g_G = E_G/ (kap* E_m_G);             % -, energy investment ratio
  m_Em_G = y_E_V * E_m_G/ E_G;         % mol/mol, reserve capacity 
  w_G = m_Em_G * w_E/ w_V;             % -, contribution of reserve to weight
  k_MG = k_M * p_MG/p_M; k_G = k_J/k_MG; kT_MG = k_MG * TC;% 1/d, maint rate coeff
  L_mG = v/ k_MG/ g_G;                  % cm, max struct length
  L_iG = (f - l_T) * L_mG;             % cm, ultimate structural length
  pars_txG = [g_G k_G l_T v_Hb v_Hx v_HpG]; 
  [t_pG, t_xG, t_bG, l_pG, l_xG, l_bG, info_G] = get_tx(pars_txG, f);
  L_bG = L_mG * l_bG;      % cm, struc length at birth
  tT_pG = (t_pG - t_bG)/ kT_MG;          % d, time since birth at puberty
  Ww_iG = L_iG^3 * (1 + f * w_G);      % g, ultimate wet weight 
  %
  p_Am_N = z_N * p_MN/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_N = p_Am_N/ v;                 % J/cm^3, reserve capacity [E_m]
  g_N = E_G/ (kap* E_m_N);             % -, energy investment ratio
  m_Em_N = y_E_V * E_m_N/ E_G;         % mol/mol, reserve capacity 
  w_N = m_Em_N * w_E/ w_V;             % -, contribution of reserve to weight
  k_MN = k_M * p_MN/p_M; k_N = k_J/k_MN; kT_MN = k_MN * TC;% 1/d, maint rate coeff
  L_mN = v/ k_MN/ g_N;                  % cm, max struct length
  L_iN = (f - l_T) * L_mN;             % cm, ultimate structural length
  pars_txN = [g_N k_N l_T v_Hb v_Hx v_HpN]; 
  [t_pN, t_xN, t_bN, l_pN, l_xN, l_bN, info_N] = get_tx(pars_txN, f);
  L_bN = L_mN * l_bN;      % cm, struc length at birth
  tT_pN = (t_pN - t_bN)/ kT_MN;          % d, time since birth at puberty
  Ww_iN = L_iN^3 * (1 + f * w_N);      % g, ultimate wet weight 
  %
  p_Am_L = z_L * p_ML/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_L = p_Am_L/ v;                 % J/cm^3, reserve capacity [E_m]
  g_L = E_G/ (kap* E_m_L);             % -, energy investment ratio
  m_Em_L = y_E_V * E_m_L/ E_G;         % mol/mol, reserve capacity 
  w_L = m_Em_L * w_E/ w_V;             % -, contribution of reserve to weight
  k_ML = k_M * p_ML/p_M; k_L = k_J/k_ML; kT_ML = k_ML * TC;% 1/d, maint rate coeff
  L_mL = v/ k_ML/ g_L;                  % cm, max struct length
  L_iL = (f - l_T) * L_mL;             % cm, ultimate structural length
  pars_txL = [g_L k_L l_T v_Hb v_Hx v_HpL]; 
  [t_pL, t_xL, t_bL, l_pL, l_xL, l_bL, info_L] = get_tx(pars_txL, f);
  L_bL = L_mL * l_bL;      % cm, struc length at birth
  tT_pL = (t_pL - t_bL)/ kT_ML;          % d, time since birth at puberty
  Ww_iL = L_iL^3 * (1 + f * w_L);      % g, ultimate wet weight 
  %
  p_Am_B = z_B * p_MB/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_B = p_Am_B/ v;                 % J/cm^3, reserve capacity [E_m]
  g_B = E_G/ (kap* E_m_B);             % -, energy investment ratio
  m_Em_B = y_E_V * E_m_B/ E_G;         % mol/mol, reserve capacity 
  w_B = m_Em_B * w_E/ w_V;             % -, contribution of reserve to weight
  k_MB = k_M * p_MB/p_M; k_B = k_J/k_MB; kT_MB = k_MB * TC;% 1/d, maint rate coeff
  L_mB = v/ k_MB/ g_B;                  % cm, max struct length
  L_iB = (f - l_T) * L_mB;             % cm, ultimate structural length
  pars_txB = [g_B k_B l_T v_Hb v_Hx v_HpB]; 
  [t_pB, t_xB, t_bB, l_pB, l_xB, l_bB, info_B] = get_tx(pars_txB, f);
  L_bB = L_mB * l_bB;      % cm, struc length at birth
  tT_pB = (t_pB - t_bB)/ kT_MB;          % d, time since birth at puberty
  Ww_iB = L_iB^3 * (1 + f * w_B);      % g, ultimate wet weight 
  %
  p_Am_S = z_S * p_MS/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_S = p_Am_S/ v;                 % J/cm^3, reserve capacity [E_m]
  g_S = E_G/ (kap* E_m_S);             % -, energy investment ratio
  m_Em_S = y_E_V * E_m_S/ E_G;         % mol/mol, reserve capacity 
  w_S = m_Em_S * w_E/ w_V;             % -, contribution of reserve to weight
  k_MS = k_M * p_MSB/p_M; k_S = k_J/k_MS; kT_MS = k_MS * TC;% 1/d, maint rate coeff
  L_mS = v/ k_MS/ g_S;                  % cm, max struct length
  L_iS = (f - l_T) * L_mS;             % cm, ultimate structural length
  pars_txS = [g_S k_S l_T v_Hb v_Hx v_HpS]; 
  [t_pS, t_xS, t_bS, l_pS, l_xS, l_bS, info_S] = get_tx(pars_txS, f);
  L_bS = L_mS * l_bS;      % cm, struc length at birth
  tT_pS = (t_pS - t_bS)/ kT_MS;          % d, time since birth at puberty
  Ww_iS = L_iS^3 * (1 + f * w_S);      % g, ultimate wet weight 
  %
  p_Am_CS = z_CS * p_MCS/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_CS = p_Am_CS/ v;                 % J/cm^3, reserve capacity [E_m]
  g_CS = E_G/ (kap* E_m_CS);             % -, energy investment ratio
  m_Em_CS = y_E_V * E_m_CS/ E_G;         % mol/mol, reserve capacity 
  w_CS = m_Em_CS * w_E/ w_V;             % -, contribution of reserve to weight
  k_MCS = k_M * p_MCS/p_M; k_CS = k_J/k_MCS; kT_MCS = k_MCS * TC;% 1/d, maint rate coeff
  L_mCS = v/ k_MCS/ g_CS;                  % cm, max struct length
  L_iCS = (f - l_T) * L_mCS;             % cm, ultimate structural length
  pars_txCS = [g_CS k_CS l_T v_Hb v_Hx v_HpCS]; 
  [t_pCS, t_xCS, t_bCS, l_pCS, l_xCS, l_bCS, info_CS] = get_tx(pars_txCS, f);
  L_bCS = L_mCS * l_bCS;      % cm, struc length at birth
  tT_pCS = (t_pCS - t_bCS)/ kT_MCS;          % d, time since birth at puberty
  Ww_iCS = L_iCS^3 * (1 + f * w_CS);      % g, ultimate wet weight 
  %
  p_Am_M = z_M * p_MM/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_M = p_Am_M/ v;                 % J/cm^3, reserve capacity [E_m]
  g_M = E_G/ (kap* E_m_M);             % -, energy investment ratio
  m_Em_M = y_E_V * E_m_M/ E_G;         % mol/mol, reserve capacity 
  w_M = m_Em_M * w_E/ w_V;             % -, contribution of reserve to weight
  k_MMS = k_M * p_MM/p_M; k_MS = k_J/k_MMS; kT_MMS = k_MMS * TC;% 1/d, maint rate coeff
  L_mM = v/ k_MMS/ g_M;                  % cm, max struct length
  L_iM = (f - l_T) * L_mM;             % cm, ultimate structural length
  pars_txM = [g_SB k_MS l_T v_Hb v_Hx v_HpM]; 
  [t_pM, t_xM, t_bM, l_pM, l_xM, l_bM, info_M] = get_tx(pars_txM, f);
  L_bM = L_mM * l_bM;      % cm, struc length at birth
  tT_pM = (t_pM - t_bM)/ kT_MMS;          % d, time since birth at puberty
  Ww_iM = L_iM^3 * (1 + f * w_M);      % g, ultimate wet weight 
  %
  p_Am_CT = z_CT * p_MCT/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_CT = p_Am_CT/ v;                 % J/cm^3, reserve capacity [E_m]
  g_CT = E_G/ (kap* E_m_CT);             % -, energy investment ratio
  m_Em_CT = y_E_V * E_m_CT/ E_G;         % mol/mol, reserve capacity 
  w_CT = m_Em_CT * w_E/ w_V;             % -, contribution of reserve to weight
  k_MCT = k_M * p_MCT/p_M; k_CT = k_J/k_MCT; kT_MCT = k_MCT * TC;% 1/d, maint rate coeff
  L_mCT = v/ k_MCT/ g_CT;                  % cm, max struct length
  L_iCT = (f - l_T) * L_mCT;             % cm, ultimate structural length
  pars_txCT = [g_CT k_CT l_T v_Hb v_Hx v_HpCT]; 
  [t_pCT, t_xCT, t_bCT, l_pCT, l_xCT, l_bCT, info_CT] = get_tx(pars_txCT, f);
  L_bCT = L_mCT * l_bCT;      % cm, struc length at birth
  tT_pCT = (t_pCT - t_bCT)/ kT_MCT;          % d, time since birth at puberty
  Ww_iCT = L_iCT^3 * (1 + f * w_CT);      % g, ultimate wet weight 
  %
  p_Am_P = z_P * p_MP/ kap;           % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_P = p_Am_P/ v;                 % J/cm^3, reserve capacity [E_m]
  g_P = E_G/ (kap* E_m_P);             % -, energy investment ratio
  m_Em_P = y_E_V * E_m_P/ E_G;         % mol/mol, reserve capacity 
  w_P = m_Em_P * w_E/ w_V;             % -, contribution of reserve to weight
  k_MP = k_M * p_MP/p_M; k_P = k_J/k_MP; kT_MP = k_MP * TC;% 1/d, maint rate coeff
  L_mP = v/ k_MP/ g_P;                  % cm, max struct length
  L_iP = (f - l_T) * L_mP;             % cm, ultimate structural length
  pars_txP = [g_P k_P l_T v_Hb v_Hx v_HpP]; 
  [t_pP, t_xP, t_bP, l_pP, l_xP, l_bP, info_P] = get_tx(pars_txP, f);
  L_bP = L_mP * l_bP;      % cm, struc length at birth
  tT_pP = (t_pP - t_bP)/ kT_MP;          % d, time since birth at puberty
  Ww_iP = L_iP^3 * (1 + f * w_P);      % g, ultimate wet weight 
  
  if any([~info_E, ~info_SB, ~info_I, ~info_G, ~info_N, ~info_L, ~info_B, ~info_S, ~info_CS, ~info_M, ~info_CT, ~info_P])
    info = 0; prdData = []; return
  else
    info = 1;
  end
  
  % pack to output
  prdData.tg = tT_g;
  prdData.tx = tT_x;
  prdData.tpE = tT_pE; % E: SB, I, G, N, L, B, S, CS, M, CT, P
  prdData.tpSB = tT_pSB;
  prdData.tpI = tT_pI;
  prdData.tpG = tT_pG;
  prdData.tpN = tT_pN;
  prdData.tpL = tT_pL;
  prdData.tpB = tT_pB;
  prdData.tpS = tT_pS;
  prdData.tpCS = tT_pCS;
  prdData.tpM = tT_pM;
  prdData.tpCT = tT_pCT;
  prdData.tpP = tT_pP;
  prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.WwiE = Ww_iE;
  prdData.WwiSB = Ww_iSB;
  prdData.WwiI = Ww_iI;
  prdData.WwiG = Ww_iG;
  prdData.WwiN = Ww_iN;
  prdData.WwiL = Ww_iL;
  prdData.WwiB = Ww_iB;
  prdData.WwiS = Ww_iS;
  prdData.WwiCS = Ww_iCS;
  prdData.WwiM = Ww_iM;
  prdData.WwiCT = Ww_iCT;
  prdData.WwiP = Ww_iP;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length/weight
  rT_BE = kT_M/ 3/ (1 + f/ g);  % 1/d, von Bert growth rate
  L = L_i - (L_i - L_b) * exp( - rT_BE * tWw_E(:,1)); % cm, struct length
  EWw_E = L.^3 * (1 + w * f) ; % g, weight
  %
  rT_BSB = kT_MSB/ 3/ (1 + f/ g_SB);  % 1/d, von Bert growth rate
  L = L_iSB - (L_iSB - L_bSB) * exp( - rT_BSB * tWw_SB(:,1)); % cm, struct length
  EWw_SB = L.^3 * (1 + w_SB * f) ; % g, weight
  %
  rT_BI = kT_MI/ 3/ (1 + f/ g_I);  % 1/d, von Bert growth rate
  L = L_iI - (L_iI - L_bI) * exp( - rT_BI * tWw_I(:,1)); % cm, struct length
  EWw_I = L.^3 * (1 + w_I * f) ; % g, weight
  %
  rT_BG = kT_MG/ 3/ (1 + f/ g_G);  % 1/d, von Bert growth rate
  L = L_iG - (L_iG - L_bG) * exp( - rT_BG * tWw_G(:,1)); % cm, struct length
  EWw_G = L.^3 * (1 + w_G * f) ; % g, weight
  %
  rT_BN = kT_MN/ 3/ (1 + f/ g_N);  % 1/d, von Bert growth rate
  L = L_iN - (L_iN - L_bN) * exp( - rT_BN * tWw_N(:,1)); % cm, struct length
  EWw_N = L.^3 * (1 + w_N * f) ; % g, weight
  %
  rT_BL = kT_ML/ 3/ (1 + f/ g_L);  % 1/d, von Bert growth rate
  L = L_iL - (L_iL - L_bL) * exp( - rT_BL * tWw_L(:,1)); % cm, struct length
  EWw_L = L.^3 * (1 + w_L * f) ; % g, weight
  %
  rT_BB = kT_MB/ 3/ (1 + f/ g_B);  % 1/d, von Bert growth rate
  L = L_iB - (L_iB - L_bB) * exp( - rT_BB * tWw_B(:,1)); % cm, struct length
  EWw_B = L.^3 * (1 + w_B * f) ; % g, weight
  %
  rT_BS = kT_MS/ 3/ (1 + f/ g_S);  % 1/d, von Bert growth rate
  L = L_iS - (L_iS - L_bS) * exp( - rT_BS * tWw_S(:,1)); % cm, struct length
  EWw_S = L.^3 * (1 + w_S * f) ; % g, weight
  %
  rT_BCS = kT_MCS/ 3/ (1 + f/ g_CS);  % 1/d, von Bert growth rate
  L = L_iCS - (L_iCS - L_bCS) * exp( - rT_BCS * tWw_CS(:,1)); % cm, struct length
  EWw_CS = L.^3 * (1 + w_CS * f) ; % g, weight
  %
  rT_BM = kT_MMS/ 3/ (1 + f/ g_M);  % 1/d, von Bert growth rate
  L = L_iM - (L_iM - L_bM) * exp( - rT_BM * tWw_M(:,1)); % cm, struct length
  EWw_M = L.^3 * (1 + w_M * f) ; % g, weight
  %
  rT_BCT = kT_MCT/ 3/ (1 + f/ g_CT);  % 1/d, von Bert growth rate
  L = L_iCT - (L_iCT - L_bCT) * exp( - rT_BCT * tWw_CT(:,1)); % cm, struct length
  EWw_CT = L.^3 * (1 + w_CT * f) ; % g, weight
  %
  rT_BP = kT_MP/ 3/ (1 + f/ g_P);  % 1/d, von Bert growth rate
  L = L_iP - (L_iP - L_bP) * exp( - rT_BP * tWw_P(:,1)); % cm, struct length
  EWw_P = L.^3 * (1 + w_P * f) ; % g, weight
  
  % pack to output
  prdData.tWw_E = EWw_E;
  prdData.tWw_SB = EWw_SB;
  prdData.tWw_I = EWw_I;
  prdData.tWw_G = EWw_G;
  prdData.tWw_N = EWw_N;
  prdData.tWw_L = EWw_L;
  prdData.tWw_B = EWw_B;
  prdData.tWw_S = EWw_S;
  prdData.tWw_CS = EWw_CS;
  prdData.tWw_M = EWw_M;
  prdData.tWw_CT = EWw_CT;
  prdData.tWw_P = EWw_P;
  