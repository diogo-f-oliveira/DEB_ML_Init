function [prdData, info] = predict_Metamysidopsis_elongata(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

%% zero-variate data  
% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);

% birth
L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
Lw_b = L_b/ del_M;                % cm, total length at birth
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth
aT_b = t_0 + t_b/ TC;             % d, age at birth

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
tT_p = (t_p - t_b)/ kT_M;         % d, time since birth at release of first brood at f and T
Lw_p = L_p / del_M;               % cm, measured length at puberty at f 

% ultimate
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, female ultimate total length at f
Wd_i = L_i^3 * d_V * (1 + f * w);      % g, ulimate dry weight 

% reproduction 
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj;  U_Hp]; % compose parameter vector at T


% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
aT_m = t_m/ kT_M;                    % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_bm = l_b * L_mm; L_im = f * L_mm;  % cm, struct length, birth & ultimate
  Ww_im = L_im^3 * (1 + f * ome_m);      % g, ultimate wet weight
  pars_tjm = [g_m; k; l_T; v_Hb; v_Hj; v_Hpm];% compose parameter vector
  [tau_jm, tau_pm, tau_bm, l_jm, l_pm, l_bm, l_im, rho_jm, rho_Bm] = get_tj(pars_tjm, f);
  Lw_pm = L_mm * l_pm/ del_M;

% pack to output
prdData.ab = aT_b;
prdData.tp = tT_p;
prdData.am = aT_m;
prdData.Lb = Lw_b;
prdData.Lp = Lw_p;
prdData.Lpm = Lw_pm;
prdData.Li = Lw_i;

%% uni-variate data

  % time-length
  tvel = get_tj(pars_tj, f_tL,[],tL_f(:,1)*kT_M);
  ELw_f = L_m * tvel(:,4)/ del_M; % cm, length
  %
  tvel = get_tj(pars_tjm, f_tL,[0 f_tL l_b*z/z_m],tL_m(:,1)*kT_M);
  ELw_m = L_mm * tvel(:,4)/ del_M; % cm, length
    
  % length-fecundity
  EN = 10 * TC * reprod_rate_j(LN(:,1)*del_M, f_tL, pars_R); % #, fecundity
 
  % length-weight
  EWd = 1e3*(LWd(:,1)*del_M).^3*d_V*(1+f_tL*ome); % mg, dry weight
  
  % pack to output
  prdData.tL_f = ELw_f; 
  prdData.tL_m = ELw_m; 
  prdData.LWd = EWd; 
  prdData.LN = EN; 
  