function [prdData, info] = predict_Girella_punctata(par, data, auxData)

% unpack par, data, auxData
cPar = parscomp_st(par); vars_pull(par);
vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

%% compute temperature correction factors
TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;

%% zero-variate data   
% life cycle
pars_tj = [g k l_T v_Hb v_Hj v_Hp];
[tau_j, tau_p, tau_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);


% birth
L_b = L_m * l_b;                  % cm, structural length at birth of foetus  at f = 1
Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

% puberty
L_p = L_m * l_p;                  % cm, structural length at puberty at f
Lw_p = L_p/ del_M;                % cm, total length at puberty at f
Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

% ultimate
L_i = L_m * l_i;                  % cm, ultimate structural length at f
Lw_i = L_i/ del_M;                % cm, ultimate total length at f
Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight

% reproduction
pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
RT_i = TC * reprod_rate_j(L_i, f, pars_R); % #/d, max reproduction rate 

% life span
pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
aT_m = t_m/ kT_M;                     % d, mean life span at T

  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hp];
  L_im = f * L_mm; Lw_im = L_im/ del_M;% cm, ultimate struct length
  Ww_im = L_im^3*(1+f*ome_m);           % g, wet weight


% pack to output
prdData.am = aT_m;
prdData.Lp = Lw_p;
prdData.Li = Lw_i; 
prdData.Wwb = Ww_b;
prdData.Wwp = Ww_p;
prdData.Wwi = Ww_i;
prdData.Ri = RT_i;

%% uni-variate data

% time-length
tvel = get_tj(pars_tj,f_tL,[],tL_fm(:,1)*kT_M); 
ELw_f = L_m*tvel(:,4)/ del_M; % cm, fork length
%
tvel = get_tj(pars_tjm,f_tL,[],tL_fm(:,1)*kT_M); 
ELw_m = L_mm*tvel(:,4)/ del_M; % cm, fork length

% length-weight
EWw = (LW(:,1)*del_M).^3 * (1+f_tL*ome); % g, weight

% pack predictions:
prdData.tL_fm = [ELw_f ELw_m];
prdData.LW = EWw;

