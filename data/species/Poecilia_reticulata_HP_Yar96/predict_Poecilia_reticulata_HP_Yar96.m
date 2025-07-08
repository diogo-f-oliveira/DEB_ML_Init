function [prdData, info] = predict_Poecilia_reticulata_HP_Yar96 (par, data, auxData)
  
  % unpack par, data, auxData
   cPar = parscomp_st(par); vars_pull(par);
   vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

   % compute temperature correction factors (N.B. all temps were 26C)
   TC = tempcorr(temp.ab_f1, T_ref, T_A);
   vT = v * TC; kT_J = k_J * TC; kT_M = k_M * TC; hT_a = h_a * TC;
   
   %% zero-variate data
   
   % life cycle
   pars_tp = [g k l_T v_Hb v_Hp];
   [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f1);
   
   % birth
   L_b = L_m * l_b;                  % cm, structural length at birth at f
   Lw_b = L_b/ del_M;                % cm, physical length at birth at f
   %
   [tau_b1, l_b1] = get_tb([g k v_Hb], f1);
   L_b1 = L_m * l_b1;                % cm, structural length at birth at f1
   Wd_b1 = L_b1^3 * (1 + f1 * ome) * d_V;  % g, dry weight at birth at f1
   a_b1 = (TC*t_0) + tau_b1/ kT_M;         % d, age at birth at f1
   
   %
   [tau_b2, l_b2] = get_tb([g k v_Hb], f2);
   L_b2 = L_m * l_b2;                 % cm, structural length at birth at f2
   Wd_b2 = L_b2^3 * (1 + f2 * ome) * d_V; % g, dry weight at birth at f2
   a_b2 = (TC*t_0) + tau_b2/ kT_M;         % d, age at birth at f2
   
   % maximum length at ad lib food
   L_i = L_m * f/ del_M;

   % pack to output
   prdData.ab_f1 = a_b1;   % d, age at birth, high food
   prdData.ab_f2 = a_b2;   % d, age at birth, low food
   prdData.Li = L_i;       % cm, maximum somatic length

   % univariate data

  % tL data at high food
   % time-length
   pars_lb = [g; k; v_Hb];                          % compose parameters
   ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
   Lw_i = (f1 * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
   Lw_b = get_lb(pars_lb, f1) * L_m/ del_M;                    % cm, physical length at birth at f
   EL_f1 = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tL_f1(:,1)); % cm, expected physical length at time

  % tL data at low food
   pars_lb = [g; k; v_Hb];                          % compose parameters
   ir_B = 3/ k_M + 3 * f2 * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
   Lw_i = (f2 * L_m - L_T)/ del_M;                             % cm, ultimate physical length at f
   Lw_b = get_lb(pars_lb, f2) * L_m/ del_M;                    % cm, physical length at birth at f
   EL_f2 = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tL_f2(:,1)); % cm, expected physical length at time

  % time-wet weight data at multiple f (LWw_f)
  % tWw at high food
   pars_lb = [g; k; v_Hb];                          % compose parameters
   ir_B = 3/ k_M + 3 * f * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
   Lw_i = (f1 * L_m - L_T);                             % cm, ultimate structural length at f
   Lw_b = get_lb(pars_lb, f1) * L_m ;                    % cm, physical structural at birth at f
   L_f1 = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tWw_f1(:,1)); % cm, expected structural length at time
   EWw_f1 = L_f1.^3 * (1 + w * f1); % g, wet weight
   
    % tWw at low food
   pars_lb = [g; k; v_Hb];                          % compose parameters
   ir_B = 3/ k_M + 3 * f2 * L_m/ v; r_B = 1/ ir_B;             % d, 1/von Bert growth rate
   Lw_i = (f2 * L_m - L_T);                             % cm, ultimate structural length at f
   Lw_b = get_lb(pars_lb, f2) * L_m ;                    % cm, physical structural at birth at f
   L_f2 = Lw_i - (Lw_i - Lw_b) * exp( - TC * r_B * tWw_f2(:,1)); % cm, expected structural length at time
   EWw_f2 = L_f2.^3 * (1 + w * f2); % g, wet weight
   
    % length - wet weight data at multiple f (L-Ww_f data)
    % LWw at high food
   ELWw1_f1 = (LWw_f1(:,1) * del_M) .^3 * (1 + w * f1); % g, wet weight
   
  % LWw at low food
   ELWw1_f2 = (LWw_f2(:,1) * del_M) .^3 * (1 + w * f2); % g, wet weight

   % time - cumulative # of offspring data at multiple f (t-N_f data)
   % tN at high food
   pars_R = [kap; kap_R; g; TC*k_J; TC*k_M; L_T; TC*v; U_Hb/TC; U_Hp/TC]; % pars for cum_reprod
   EN_f1 = cum_reprod(tN_f1(:,1), f1, pars_R);
   
   % tN at low food
   EN_f2 = cum_reprod(tN_f2(:,1), f2, pars_R);
   
   % pack to output
   prdData.tL_f1  = EL_f1; % cm, expected standard length at high food, (time/length data)
   prdData.tL_f2  = EL_f2; % cm, expected standard length at low food, (time/length data)
   prdData.tWw_f1 = EWw_f1; % g, expected wet weight at f1, (time/weight data)
   prdData.tWw_f2 = EWw_f2; % g, expected wet weight at f2, (time/weight data)
   prdData.tN_f1  = EN_f1;  % #, expected cumulative N offspring at f1, (time/#offspring data)
   prdData.tN_f2  = EN_f2;  % #, expected cumulative N offspring at f2, (time/#offspring data)
   prdData.LWw_f1 = ELWw1_f1; % g, expected weight given length at f1
   prdData.LWw_f2 = ELWw1_f2; % g, expected weight given length at f2
   end



