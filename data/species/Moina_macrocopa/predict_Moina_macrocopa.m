function [prdData, info] = predict_Moina_macrocopa(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_30 = tempcorr(C2K(30), T_ref, T_A);
  TC_25 = tempcorr(C2K(25), T_ref, T_A);
  TC_20 = tempcorr(C2K(20), T_ref, T_A);
  TC_18 = tempcorr(C2K(18), T_ref, T_A);
  TC_15 = tempcorr(C2K(15), T_ref, T_A);
  
  % zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Wd_b = L_b^3 * d_V * (1 + f * w); % g, dry weight at birth
  a_b = t_0 + t_b/ k_M; aT_b = a_b/ TC_ab; % d, age at birth at f and T_ref
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Wd_p = L_p^3 * d_V * (1 + f * w); % g, dry weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty
  
  % ultimate
  L_i = L_m * f;                    % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Wd_i = L_i^3 * d_V * (1 + f * w); % g, ultimate dry weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T
  
  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wdb = Wd_b;
  prdData.Wdp = Wd_p;
  prdData.Wdi = Wd_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  f = f_1; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f - l_T; % cm, lengths
  rT_B = TC_25 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_1 = (L_i - (L_i - L_b) * exp( - rT_B * tL1(:,1)))/ del_M; % cm, length at time
  %
  f = f_2; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f - l_T; % cm, lengths
  rT_B = TC_25 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_2 = (L_i - (L_i - L_b) * exp( - rT_B * tL2(:,1)))/ del_M; % cm, length at time
  %
  f = f_3; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f - l_T; % cm, lengths
  rT_B = TC_25 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_3 = (L_i - (L_i - L_b) * exp( - rT_B * tL3(:,1)))/ del_M; % cm, length at time
  %
  f = f_4; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f - l_T; % cm, lengths
  rT_B = TC_25 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_4 = (L_i - (L_i - L_b) * exp( - rT_B * tL4(:,1)))/ del_M; % cm, length at time
  %
  f = f_5; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f - l_T; % cm, lengths
  rT_B = TC_25 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_5 = (L_i - (L_i - L_b) * exp( - rT_B * tL5(:,1)))/ del_M; % cm, length at time
  %
  f = f_6; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f - l_T; % cm, lengths
  rT_B = TC_25 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_6 = (L_i - (L_i - L_b) * exp( - rT_B * tL6(:,1)))/ del_M; % cm, length at time
  %
  f = f_7; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f - l_T; % cm, lengths
  rT_B = TC_25 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_7 = (L_i - (L_i - L_b) * exp( - rT_B * tL7(:,1)))/ del_M; % cm, length at time
  %
  f = f_1; L_b = L_m * get_lb([g k v_Hb], f); L_i = L_m * f - l_T; % cm, lengths
  rT_B = TC_30 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_30 = (L_i - (L_i - L_b) * exp( - rT_B * tL130(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_20 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_20 = (L_i - (L_i - L_b) * exp( - rT_B * tL120(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_18 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_18 = (L_i - (L_i - L_b) * exp( - rT_B * tL118(:,1)))/ del_M; % cm, length at time
  %
  rT_B = TC_15 * k_M/ 3/ (1 + f/ g); % 1/d, von Bert growth rate       
  ELw_15 = (L_i - (L_i - L_b) * exp( - rT_B * tL115(:,1)))/ del_M; % cm, length at time
  
  % tS-data
  f = f_1; L_i = f * L_m; hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v * L_i^2/ L_m^3; 
  hGt = TC_15 * hG * tS115(:,1);
  ES_15 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_18 * hG * tS118(:,1);
  ES_18 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_20 * hG * tS120(:,1);
  ES_20 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_25 * hG * tS1(:,1);
  ES_1 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  hGt = TC_30 * hG * tS130(:,1);
  ES_30 = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2));
  
  % XLi-data (K in C-mol/l)
  X = XLi(:,1) * 1.57e-9 * d_X/ w_X; % C-mol/l
  ELw_i = L_m * X ./(K + X)/ del_M; % cm, body length 
  
  % pack to output
  prdData.tL115 = ELw_15;
  prdData.tL118 = ELw_18;
  prdData.tL120 = ELw_20;
  prdData.tL130 = ELw_30;
  prdData.tL1 = ELw_1;
  prdData.tL2 = ELw_2;
  prdData.tL3 = ELw_3;
  prdData.tL4 = ELw_4;
  prdData.tL5 = ELw_5;
  prdData.tL6 = ELw_6;
  prdData.tL7 = ELw_7;
  prdData.tS130 = ES_30;
  prdData.tS1  = ES_1;
  prdData.tS120 = ES_20;
  prdData.tS118 = ES_18;
  prdData.tS115 = ES_15;
  prdData.tS130 = ES_30;
  prdData.XLi = ELw_i;
    