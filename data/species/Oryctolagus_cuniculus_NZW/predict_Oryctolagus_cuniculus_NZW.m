function [prdData, info] = predict_Oryctolagus_cuniculus_NZW(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  filterChecks = k * v_Hp >= f_0154^3 || ...     % constraint required for reaching puberty with the lowest f
          ~reach_birth(g, k, v_Hb, f_0154) ||... % constraint required for reaching birth with the lowest f
          k * v_Hp >= f_0192^3 || k * v_Hp >= f_0203^3 || k * v_Hp >= f_0397^3 ||...
          k * v_Hp >= f_1085^3 ||k * v_Hp >= f_tWw1^3 || k * v_Hp >= f_tWw2^3 ||...
          k * v_Hp >= f_tWw3^3 ||k * v_Hp >= f_tWw4^3 || k * v_Hp >= f_tWw5^3 ||...
          k * v_Hp >= f_tWw6^3 ||k * v_Hp >= f_tWw7^3 || ...
          f_0154 > 1.5 || f_0192 >1.5 || f_0203 > 1.5 ||...
          f_0397 >1.5 || f_1085 > 1.5 || f_tWw1 >1.5 || ...
          f_tWw2 >1.5 || f_tWw3 > 1.5 || f_tWw4 >1.5  || ...
          f_tWw5 >1.5 || f_tWw6 > 1.5 || f_tWw7 >1.5  || ...
                E_Hb >= E_Hx||...               % maturity at weaning, birth
                z > z_m ||...                   % males are larger than females 
                E_Hp > E_Hpm ||...              % males are larger than females 
                kap_X + kap_P >= 1;             % constarint on efficiencies
            
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  

  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  

  % zero-variate data

  % life cycle
  pars_tx = [g k l_T v_Hb v_Hx v_Hp]; info = 1;
  [t_p, t_x, t_b, l_p, l_x, l_b] = get_tx(pars_tx, f);
 
  % birth --> will be calculated by the new module in the uni-variate data section
%   L_b = L_m * l_b;                      % cm, structural length at birth at f
%   Ww_b = L_b^3 * (1 + f * ome);         % g, wet weight at birth at f 
%   aT_g = t_0 + t_b/ k_M/ TC;            % d, gestation time at f and T, t_0 is at T_typical

  % weaning --> will be calculated by the new module in the uni-variate data section
%   tT_x = (t_x - t_b)/ k_M/ TC;          % d, time since birth at weaning at f and T
  
  % puberty 
  tT_p = (t_p - t_b)/ k_M/ TC;          % d, time since birth at puberty at f and T
  L_p = L_m * l_p;                      % cm, structural length at birth at f
  Ww_p = L_p^3 * (1 + f * ome);         % g, wet weight at birth at f 
 
  % ultimate
  l_i = f - l_T;                        % -, scaled ultimate length
  L_i = L_m * l_i;                      % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                    % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * ome);           % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T  
  
  % males 
  p_Am_m = z_m * p_M/ kap;              % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                    % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);              % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;          % mol/mol, reserve capacity 
  ome_m = m_Em_m * w_E/ w_V;              % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                   % cm, max struct length
  [t_pm, t_bm, l_pm, l_bm] = get_tp([g_m k l_T v_Hb v_Hpm], f);
  tT_pm = (t_pm - t_bm)/ k_M/ TC;       % d, time since birth at puberty at f and T
  L_im = f * L_mm;                      % cm, ultimate structural length
  Ww_im = L_im^3 * (1 + f * ome_m);       % g, ultimate wet weight

  % pack to output
%   prdData.tg = aT_g; --> will be calculated by the new module in the uni-variate data section
%   prdData.tx = tT_x; --> will be calculated by the new module in the uni-variate data section
  prdData.tp = tT_p;
  prdData.tp2 = tT_p;
  prdData.am = aT_m;
%   prdData.Lb = L_b/del_M; --> will be calculated by the new module in the uni-variate data section
  prdData.Li = Lw_i;
%   prdData.Wwb = Ww_b; --> will be calculated by the new module in the uni-variate data section
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.tp_m = tT_pm;
  prdData.Wwi_m = Ww_im;
  
  %% --------------------------------------------------------------
  % % uni-variate data
  % --------------------------------------------------------------  
 
  % NOTE: data for embryos are after the data for pregnant females!
  
 % time-weight BergChaz1976 - MALES
  f = f_tWw1; pars_lb = [g_m; k; v_Hb];                     % compose parameters
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_B = TC/ ir_B;         % d, 1/von Bert growth rate
  L_im = f * L_mm - L_T; L_bm = get_lb(pars_lb, f) * L_mm;  % cm, length at birth, ultimate
  Lm = L_im - (L_im - L_bm) * exp( - rT_B * tWw_1(:,1));    % cm, structural length at time
  EWw1 = Lm.^3 * (1 + f * ome_m);                           % g, wet weight
 
  % MasoShap1986 - FEMALES
  f = f_tWw3; pars_lb = [g; k; v_Hb];                       % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;          % d, 1/von Bert growth rate
  L_i = f * L_m - L_T; L_b = get_lb(pars_lb, f) * L_m;      % cm, length at birth, ultimate
  % time-weight
  L = L_i - (L_i - L_b) * exp( - rT_B * tWw_3(:,1));        % cm, structural length at time
  EWw3 = L.^3 * (1 + f * w);                                % g, wet weight  
  % time-length MasoShap1986 - FEMALES
  L = L_i - (L_i - L_b) * exp( - rT_B * tL(:,1));           % cm, structural length at time
  EL = L / del_M2;                                          % cm, physical length at time

  % MasoShap1986 - MALES
  f = f_tWw2; pars_lb = [g_m; k; v_Hb];                     % compose parameters
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_B = TC/ ir_B;         % d, 1/von Bert growth rate
  L_im = f * L_mm - L_T; L_bm = get_lb(pars_lb, f) * L_mm;  % cm, length at birth, ultimate
  % time-weight
  Lm2 = L_im - (L_im - L_bm) * exp( - rT_B * tWw_2(:,1));   % cm, structural length at time
  EWw2 = Lm2.^3 * (1 + f * ome_m);                          % g, wet weight
  % time-length MasoShap1986 - MALES
  L = L_im - (L_im - L_bm) * exp( - rT_B * tL2(:,1));       % cm, structural length at time
  EL2 = L / del_M2;                                         % cm, physical length at time                                      
  
  % time-weight Mahm2013 - MALES single lactation
  f = f_tWw4; pars_lb = [g_m; k; v_Hb];                     % compose parameters
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_B = TC/ ir_B;         % d, 1/von Bert growth rate
  L_im = f * L_mm - L_T; L_bm = get_lb(pars_lb, f) * L_mm;  % cm, length at birth, ultimate
  Lm4 = L_im - (L_im - L_bm) * exp( - rT_B * tWw_4(:,1));   % cm, structural length at time
  EWw4 = Lm4.^3 * (1 + f * ome_m);                          % g, wet weight
  
  % time-weight Mahm2013 - MALES double lactation
  f = f_tWw5; pars_lb = [g_m; k; v_Hb];                     % compose parameters
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_B = TC/ ir_B;         % d, 1/von Bert growth rate
  L_im = f * L_mm - L_T; L_bm = get_lb(pars_lb, f) * L_mm;  % cm, length at birth, ultimate
  Lm5 = L_im - (L_im - L_bm) * exp( - rT_B * tWw_5(:,1));   % cm, structural length at time
  EWw5 = Lm5.^3 * (1 + f * ome_m);                          % g, wet weight
  
   % time-weight Mahm2013 - FEMALES single lactation
  f = f_tWw6; pars_lb = [g; k; v_Hb];                       % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;          % d, 1/von Bert growth rate
  L_i = f * L_m - L_T; L_b = get_lb(pars_lb, f) * L_m;      % cm, length at birth, ultimate
  L = L_i - (L_i - L_b) * exp( - rT_B * tWw_6(:,1));        % cm, structural length at time
  EWw6 = L.^3 * (1 + f * w);                                % g, wet weight
  
   % time-weight Mahm2013 - FEMALES double lactation
  f = f_tWw7; pars_lb = [g; k; v_Hb];                       % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;          % d, 1/von Bert growth rate
  L_i = f * L_m - L_T; L_b = get_lb(pars_lb, f) * L_m;      % cm, length at birth, ultimate
  L = L_i - (L_i - L_b) * exp( - rT_B * tWw_7(:,1));        % cm, structural length at time
  EWw7 = L.^3 * (1 + f * w);                                % g, wet weight
   
  %% new part
   % upregulation of feeding during pregnancy (info specific for pregnancy-module)
  upreg = 0; 
   
   % temp-correct pars for AF
  pT_Am = p_Am * TC;  vT = v * TC; pT_M = p_M * TC;  kT_J = k_J * TC; pT_FAm = p_FAm *TC; vT_F = TC * v_F;
  pT_Xm = TC * p_Xm ; % extra stuff for ingestion rate
  tT_0 = t_0; % , t_0 is at T_typical; if not: tT_0 = t_0 / TC; (check also zero-var calculations!)

  %% time-weight control data  FEMALE Baye200X study number:
  
rabbit = {'0154', '0192', '1085','0397','0203'}; 

for rr = 1 :length(rabbit)
  eval(['N_pups = Npups.tWw_', rabbit{rr}, ';'])      % number of pups
%   S_eff = del_upreg./(K_del + Npups); % effective placenta surface area coefficient, decreases with Npups
  S_eff = del_upreg;                    % does not depend on Npups
  eval(['time_Ww = tWw_', rabbit{rr},'(:,1); time_JX = tJX_', rabbit{rr}, '(:,1); '])
  t_start = time_Ww(1,1);  t_mating = t_start;     % <-- same for all females in this batch; assumed mating time!
  tspan = linspace(t_start, time_Ww(end)+70, 500); % <-- simulate longer to carry pregnancy to full term
  
  eval(['f_exp = f_', rabbit{rr}, ';'])    % f in the experiment
  eval(['V_start = Ww0.tWw_', rabbit{rr}, '/(1 + f_exp * ome) ;']) % 
  EVH_AF_0 = [f_exp * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume res reserve density of e=f
  EVH_AF_0(3) = E_R0; % put some energy into repro buffer at the beginning of pregnancy; E_R0 is a free parameter
       
  options = odeset('Events', @event_bx);
  pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, N_pups, f_exp, t_mating]; % temp-correct and pack pars for dget_EVR_AF
  [time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg); 

  aT_g(rr) = te(1)- t_mating;        % d, gestation time at f and T  
  tT_x(rr) = te(2)- te(1);           % d, time since birth at weaning at f and T  

  birth = aT_g(rr); weaning = tT_x(rr); % if we are using predictions by new module OR
%   birth = prdData.tg; weaning = prdData.tx; % if we use zero-variate predictions
 
  % time-weight 
  EWw_mother = EVH_AF(:,2) + (EVH_AF(:,1)+ EVH_AF(:,3))* w_E/d_V/mu_E;      % g, mother without foetus, expected wet weight at time
  EWw_foetkit = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;                    % g, foetus and later pup, expected wet weight at time  
  EWw_f = EWw_mother + (time < t_mating +  birth).* EWw_foetkit * N_pups;   % g, mother plus foetus, while gestation (assume same gestation as before)
  eval(['EWw_' rabbit{rr}, '= interp1(time, EWw_f, time_Ww, ''spline'');']) % g, wet weight of mother plus foetus, interpolated at time_Ww ;    %% <-----  pack predicted wet weight of female with that litter size!
  % feeding
  L2_mother = EVH_AF(:,2).^(2/3); L2_foetus = EVH_AF(:,5).^(2/3);
  L2_mother_adj = interp1(time, L2_mother, time_JX, 'spline'); % checked -- this is the same curve as when solving the ode for time_JX !
  L2_foetus_adj = interp1(time, L2_foetus, time_JX, 'spline'); % checked -- this is the same curve as when solving the ode for time_JX !
  upreg_period = (time_JX > t_mating & time_JX < t_mating +  birth +  weaning); 
  EJX_f = (pT_Xm * w_X/ mu_X/ d_X) * f_exp * (L2_mother_adj + 0 * upreg_period * S_eff .* L2_foetus_adj) ; %/d_X; % wet weight of food <-- perhaps should be DRY weight?
  eval(['EJX_', rabbit{rr}, ' = EJX_f ;'])    %% <-----  pack predicted ingestion rate of a female with that litter size! 
end 

%   % alternative version for Ww , eg for 0192
%   ir_B = 3/ k_M + 3 * f_0192 * L_m/ v; rT_B = TC/ ir_B;          % d, 1/von Bert growth rate
%   L_i = f_0192 * L_m - L_T; L_b = (Ww0.tWw_0192/(1 + f_0192 * ome))^(1/3);      % cm, length at birth, ultimate
%   L = L_i - (L_i - L_b) * exp( - rT_B * tWw_0192(:,1));        % cm, structural length at time
%   EWw_0192 = L.^3 * (1 + f_0192 * ome);                         % g, wet weight
%   

%% using new module for calculating foetal growth
N_pups = Npups.tWwe_Baye; Wwf_0 = Ww0.tWwe_Baye; % we do not know details for  ZaikDom2013  data so use the average of Bayer for both   ZaikDom2013 and Bayer data
% -------- ZaikDom2013  data  --------
t_Wwe = [0; tW_e2(:,1)];
% prepare for ODE
%   S_eff = del_upreg./(K_del + N_pups); % effective placenta surface area coefficient, decreases with N_pups (data-driven assumption, rats)
  S_eff = del_upreg; % does not depend on N_pups
  t_start = t_Wwe(1,1);  t_mating = t_start;   % <-- same for all females in this batch; assumed mating time!
  tspan = linspace(t_start, t_Wwe(end)+70, 500); % <-- simulate longer to carry pregnancy to full term

  V_start = Wwf_0/(1 + f_Wwe * ome) ; % use data-set specific f_Wwe
  EVH_AF_0 = [f_Wwe * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume reserve density of e=f
  EVH_AF_0(3) = E_R0; % put some energy into repro buffer at the beginning of pregnancy; E_R0 is a free parameter
       
  options = odeset('Events', @event_bx);
  pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, N_pups, f_Wwe, t_mating]; % temp-correct and pack pars for dget_EVR_AF
  [time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg); 
  
 % we know these experiments were terminated before pregnancy was carried out full term, so 
 % te would be empty (no event of birth and weaning). This is why simulation is run artificially for additional 70 days (see tspan in line 225)
   aT_g(rr+1) = te(1)- t_mating;         % d, gestation time at f and T  
   tT_x(rr+1) = te(2)- te(1);           % d, time since birth at weaning at f and T store for possibly later
   birth = aT_g(rr+1); weaning = tT_x(rr+1); % if we are using predictions by new module

% for embryonal development 
  EWw_foetkit = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;    % g, foetus and later kit, expected wet weight at time  
  index_foetkit = find(time >= t_mating & time < t_mating + birth + weaning); % iindices for gestation & lactation period   
  t_aux2 = time(index_foetkit); t_fp = t_aux2 - t_aux2(1); % extract time and start at 0
  Ww_foetpup = EWw_foetkit(index_foetkit);
  EWw_e = interp1(t_fp, Ww_foetpup, max(0, t_Wwe),'spline' ); % g, wet weight for values present in common time vector
  EWw_e2= EWw_e(2:end);  % pack output for ZaikDom2013, omitting the initial datapoint of t=0

 %  -------- Bayer data --------
[t_sort_B, it, it_sort_B] = unique(tWwe_Baye(:,1),'sorted'); % returns the unique values in t in sorted order and remember duplicate times in Bayer data in it_sort_B
t_Wwe_B = sort([ 0; t_sort_B]);  %  d, time since fertilization
f_Wwe_B = mean([f_0154, f_0192, f_0203, f_0397, f_1085]); 
t_unique = unique(t_Wwe_B);      % find unique values
pos_vectorB = ismember(t_unique, tWwe_Baye(:,1)); % find which positions fit to specific time vector
pos_B = find(pos_vectorB);      % make specific time vectors for Bayer data (no duplicate times)

% prepare for ODE
%   S_eff = del_upreg./(K_del + N_pups); % effective placenta surface area coefficient, decreases with N_pups (data-driven assumption, rats)
  S_eff = del_upreg; % does not depend on N_pups
  t_start = t_Wwe_B(1,1);  t_mating = t_start;   % <-- same for all females in this batch; assumed mating time!
  tspan = linspace(t_start, t_Wwe_B(end)+70, 500); % <-- simulate longer to carry pregnancy to full term

  V_start = Wwf_0/(1 + f_Wwe_B * ome) ;
  EVH_AF_0 = [f_Wwe_B * E_m * V_start, V_start, 0, 0, 1e-8, 0]; % initial conditions [E, V, E_R, E_F, V_F, EH_F], assume reserve density of e=f
  EVH_AF_0(3) = E_R0; % put some energy into repro buffer at the beginning of pregnancy; E_R0 is a free parameter
       
  options = odeset('Events', @event_bx);
  pars_AF = [pT_Am, pT_FAm, vT, vT_F, kap, kap_R, kap_RL, pT_M, kT_J, E_G, E_Hb, E_Hx, E_Hp, E_m, tT_0, S_eff, N_pups, f_Wwe_B, t_mating]; % temp-correct and pack pars for dget_EVR_AF
  [time, EVH_AF, te, ye, ie] = ode23s(@dget_EVH_AF, tspan, EVH_AF_0, options, pars_AF, upreg); 
  
 % we know these experiments were terminated before pregnancy was carried out full term, so 
 % te would be empty (no event of birth and weaning). This is why simulation is run artificially for additional 70 days (see tspan in line 225)
   aT_g(rr+2) = te(1)- t_mating;         % d, gestation time at f and T  
   tT_x(rr+2) = te(2)- te(1);           % d, time since birth at weaning at f and T store for possibly later
   birth = aT_g(rr+2); weaning = tT_x(rr+2); % if we are using predictions by new module

% for embryonal development 
  EWw_foetkit = EVH_AF(:,5) + EVH_AF(:,4)* w_E/d_V/mu_E;    % g, foetus and later kit, expected wet weight at time  
  index_foetkit = find(time >= t_mating & time < t_mating + birth + weaning); % iindices for gestation & lactation period
  t_aux2 = time(index_foetkit); t_fp = t_aux2 - t_aux2(1); % extract time and start at 0
  Ww_foetpup = EWw_foetkit(index_foetkit);
  EWw_e = interp1(t_fp, Ww_foetpup, max(0, t_Wwe_B),'spline' ); % g, wet weight for values present in common time vector

  
  EWw_Baye = EWw_e(pos_B(it_sort_B));  % pack output for Bayer data, by selecting those positions in predictions that match positions in the time vector
  

  
  % for zero-variate data
  index_foet = find(time >= t_mating & time < t_mating + birth );
   %t_aux2 = time(index_foet); t_foet = t_aux2 - t_aux2(1); % extract time and start at 0
  Ww_foet = EWw_foetkit(index_foet); L_foet = EVH_AF(:,5).^(1/3) ; L_foet = L_foet(index_foet);

% pack for zero-var data
prdData.tg = mean(aT_g);
prdData.tx = mean(tT_x);
prdData.Lb = L_foet(end)/del_M; % crown-rump length
prdData.Wwb =  Ww_foet(end); % wet weight

%%
%   
%   % wet weight at becoming pregnant -> number of pups
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  Nlitter = Nlitters.Ri; % number of litters per year
  
  L_struct = ( WwN_0154(:,1)/ (1 + f_0154 * ome) ).^(1/3) ;
  [R, UE0, ~, ~] = reprod_rate_foetus (L_struct, f_0154, pars_R) ; 
  EN_0154 = TC * R * 365/Nlitter; % to go from "per day" to repro events roughly 2.5 times per year (less than assumed for max!)--> does not include costs of lactation or input from upregulation
% 
  L_struct = ( WwN_0192(:,1)/ (1 + f_0192 * ome) ).^(1/3) ;
  [R, UE0, ~, ~] = reprod_rate_foetus (L_struct, f_0192, pars_R) ; 
  EN_0192 = TC * R * 365/Nlitter; % to go from "per day" to repro events roughly 2.5 times per year (less than assumed for max!)
  
  L_struct = ( WwN_1085(:,1)/ (1 + f_1085 * ome) ).^(1/3) ;
  [R, UE0, ~, ~] = reprod_rate_foetus (L_struct, f_1085, pars_R) ; 
  EN_1085 = TC * R * 365/Nlitter; % to go from "per day" to repro events roughly 2.5 times per year (less than assumed for max!)
  
    
  % pack to output
  prdData.tWw_1 = EWw1;
  prdData.tWw_2 = EWw2;
  prdData.tL    = EL;
  prdData.tWw_3 = EWw3;
  prdData.tL2   = EL2;
  prdData.tWw_4 = EWw4;
  prdData.tWw_5 = EWw5;
  prdData.tWw_6 = EWw6;
  prdData.tWw_7 = EWw7;
  prdData.tW_e2 = EWw_e2;
  prdData.tWwe_Baye = EWw_Baye;
  for rr = 1 :length(rabbit)
      eval(['prdData.tWw_', rabbit{rr}, ' = EWw_', rabbit{rr}, ';'])
      eval(['prdData.tJX_', rabbit{rr}, ' = EJX_', rabbit{rr}, ';'])
  end
  prdData.WwN_0154 = EN_0154;
  prdData.WwN_0192 = EN_0192;
  prdData.WwN_1085 = EN_1085;

end 

 function [value,isterminal,direction] = event_bx(t, AF, pars_AF, upreg)
  % AF: 6-vector
  E_Hb = pars_AF(11); E_Hx = pars_AF(12);
  value = [E_Hb; E_Hx] - AF(6);
  isterminal = [0; 1]; % modified to NOT stop at weaning!
  direction = [0; 0]; 
end 

function dAF = dget_EVH_AF(t, EVH_AF, p, upreg)
  % ode specification for get_EVH_AF
  
  % created by Dina Lika & Nina Marn 2019/06/11, modified by Nina Marn 2019/10/14
  % Acknowledgment: This development was financially supported by Bayer AG
  
  % unpack state variables
  E  = EVH_AF(1); V  = EVH_AF(2); E_R  = EVH_AF(3);       % mother, energy in reserve, structural volume, energy in reproductive reserve
  E_F  = EVH_AF(4); V_F  = EVH_AF(5); EH_F  = EVH_AF(6);  % foetus, energy in reserve, structural volume, energy invested to maturation

  % unpack p
  p_Am = p(1);       % J/d.cm^2, max surface-spec assimilation flux
  p_FAm = p(2);      % J/d.cm^2, foetal-specific assimilation parameter
  v = p(3);          % cm/d, energy conductance
  v_F = p(4);        % cm/d, foetal energy conductance
  kap = p(5);        % -, allocation fraction to soma
  kap_R = p(6);      % -, reproduction efficiency of the mother, and repro reserve assimilation efficiency of the foetus
  kap_RL = p(7);     % -, milk production efficiency of the mother, and milk assimilation efficiency of the foetus
  p_M = p(8);        % J/d.cm^3, vol-spec somatic maint
  k_J = p(9);        % 1/d, maturity maint rate coefficient
  E_G = p(10);       % J/cm^3, spec cost for structure
  E_Hb = p(11);      % J, maturity at birth
  E_Hx = p(12);      % J, maturity at weaning
  E_Hp = p(13);      % J, maturity at puberty
  E_m = p(14);       % J/cm^3, reserve capacity 
  t_0 = p(15);       % d, time at start development (since mating) 
  S_eff = p(16);     % -, effective placenta surface area coefficient
  Npups = p(17);     % -, number of foetuses
  f = p(18);         % -, scaled functional response
  t_mate = p(19) ;   % d, age of mother at mating
  % upreg = 1 or 0,  -, (logical) whether or not upregulation of feeding is observed
  
  L = V^(1/3);     % cm, structural length
  L_F = V_F^(1/3); % cm, structural length of foetus
  e_R = E_R/V/E_m; % -, scaled reserve density, e_R = [E_R] / [E_m]
  
% Fluxes (mother)
  pA = p_Am * f * L^2; % J/d, assimilation
  if upreg
      pAR = (t > t_0 + t_mate & EH_F <= E_Hx) * S_eff * Npups * p_Am * f * L_F^2; % upregulated assimilation
  else
      pAR = 0; 
  end
  pS = p_M * V;                                        % J/d, somatic maintenance
  pJ = k_J * E_Hp;                                     % J/d, maturity maintenance for adults
  pC = E * (E_G * v * L^2 + pS) / (kap * E + E_G * V); % J/d, mobilization
  pG = kap * pC - pS;                                  % J/d, growth
  pR = (1 - kap) * pC - pJ + pAR;                      % J/d, allocation to reproduction
   
  if EH_F < E_Hb  % gestation
     pFL = (t > t_0 + t_mate)* S_eff * e_R * p_FAm * L_F^2/kap_R;  % from mother allocation to each foetus
     pA_F = kap_R * pFL;                                             % foetal assimilation 
     pC_F = (p_M * V_F + E_G * v_F * V_F^(2/3)) / kap;               % demand dynamics, foetus mobilization rate
  elseif  EH_F >= E_Hb && EH_F < E_Hx  % lactation
     pFL = S_eff * e_R * p_FAm * L_F^2/kap_RL;                       % from mother allocation to each foetus
     pA_F = kap_RL * pFL;                                            % foetal assimilation 
     pC_F = (p_M * V_F + E_G * v * V_F^(2/3)) / kap;                 % demand dynamics, but with mother's v
  else
     pFL = 0;
     pA_F = p_Am * f * L_F^2; % assimilation;
     pC_F = E_F * (E_G * v * L_F^2 + p_M * V_F) / (kap * E_F + E_G * V_F); % v of the mother
  end
  
  % Differential equations for the adults
  dE = pA - pC;        % J/d, dE/dt
  dV = pG / E_G;       % cm^3/d, dV/dt
  dR = (pR - Npups * pFL); % J/d, dE_R/dt
                    
  % Differential equations for foetus/newborn
  if EH_F < E_Hb
      dE_F = (t> t_0 + t_mate) * (pA_F - pC_F);  
      dV_F = (t> t_0 + t_mate) * v_F * V_F^(2/3);
      dH_F = (t> t_0 + t_mate) * ((1 - kap) * pC_F - k_J * EH_F); 
  elseif EH_F >=E_Hb && EH_F < E_Hx 
      dE_F = pA_F - pC_F; 
      dV_F = v* V_F^(2/3); % exponential growth; v of the mother
      dH_F = (1 - kap) * pC_F - k_J * EH_F;       
  else
      dE_F = pA_F - pC_F; 
      dV_F = kap * pC_F - p_M * V_F; % von B growth!
      dH_F = (1 - kap) * pC_F - k_J * EH_F; 
  end
  
% pack derivatives
  dAF = [dE; dV; dR; dE_F; dV_F; dH_F]; 
  end
