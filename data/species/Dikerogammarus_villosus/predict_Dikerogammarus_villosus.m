function [prdData, info] = predict_Dikerogammarus_villosus(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
    filterChecks = f_tW > 1 || f_tW <=0 || ...         % f contrained to not be larger than 1
                 f_tL2 > 1  || f_tL2 <=0  ||  f_tL2 < f_tL3 ||  ...
                 f_tL3 > 1  || f_tL3 <=0 ||    f_tL3 < f_tL4 ||     ...
                 f_tL4 > 1  || f_tL4 <= 0  || ...
                 f_tL5 > 1  || f_tL5  <=0 ; % 
  
  if filterChecks  
    info = 0;
    prdData = {};
    return;
  end  

%   pars_T = T_A;
  pars_T = [T_A; T_L; T_AL]; 
  TC_ab  = tempcorr(temp.ab, T_ref, pars_T);
  TC_tp  = tempcorr(temp.tp, T_ref, pars_T);
  TC_am  = tempcorr(temp.am, T_ref, pars_T);
%   TC_Ri  = tempcorr(temp.Ri, T_ref, pars_T);
  TC_tW  = tempcorr(temp.tWd, T_ref, pars_T);
  TC_tL2 = tempcorr(temp.tL2, T_ref, pars_T);
  TC_tL3 = tempcorr(temp.tL3, T_ref, pars_T);
  TC_tL4 = tempcorr(temp.tL4, T_ref, pars_T);
  TC_tL5 = tempcorr(temp.tL5, T_ref, pars_T);
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, pars_T);
  TC_WR  = tempcorr(temp.WR, T_ref, pars_T);  
 
  
  % zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, total length at birth at f
  Ww_b = 1e3 * L_b^3 * (1 + f * w); % mg, wet weight at birth
  a_b = (t_0 + t_b/ k_M); aT_b = a_b/ TC_ab;% d, age at birth at f and T

  % metam
  L_j = L_m * l_j;                  % cm, structural length at metam at f

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, total length at puberty at f
  Ww_p = 1e3 * L_p^3 * (1 + f * w); % mg, wet weight at puberty 
  tT_p = (t_p - t_b)/ k_M/ TC_tp;   % d, time since birth at puberty at f and T

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate total length at f
  Ww_i = 1e3 * L_i^3 * (1 + f * w); % mg, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector at T
%     RT_i = TC_Ri * reprod_rate_j(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m     = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m    = t_m/ k_M/ TC_am;               % d, mean life span at T

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;

  
  % uni-variate data
  
  %time-weight, time-length Gabel2011
  TC = TC_tW; % -, temperature correction
%   L_0 = (W_0tW/d_V/1e3/ (1 + f_tW * w))^(1/3); %initial Length/weight  
  L_0 = Lwinit.tL * del_M; % cm, initial structural length
  [EL, EWd] = get_LW(tWd, L_0, f_tW, TC, par, cPar);
  EWd = EWd * 1e3; % mg, dry weight
  
 
  % time-length for different three food types: 
  TC   = TC_tL2; % -, temperature correction
  L_0 = Lwinit.tL2 * del_M; % cm, initial structural length
  EL2 = get_LW(tL2, L_0, f_tL2, TC, par, cPar);
  %
  TC   = TC_tL3; % -, temperature correction
  L_0 = Lwinit.tL3 * del_M; % cm, initial structural length
  EL3 = get_LW(tL3, L_0, f_tL3, TC, par, cPar);
  %
  TC   = TC_tL4; % -, temperature correction
  L_0 = Lwinit.tL4 * del_M; % cm, initial structural length
  EL4 = get_LW(tL4, L_0, f_tL4, TC, par, cPar);

  % time-length from another study:
  TC   = TC_tL5; % -, temperature correction
  L_0  = Lwinit.tL5 * del_M; % cm, initial structural length
  EL5  = get_LW(tL5, L_0, f_tL5, TC, par, cPar);
  
  %weight-reproduction
  EN = t_R * reprod_rate_j( (WR(:,1)/1e3/ (1 + f * w)).^(1/3) , f, pars_R)/ TC_WR; % #/d, clutch size
  
  %Length-dry weight L-Wd 
  L    = LW(:,1) * del_M; % cm, structural length at time t
  ELW  = L.^3 * (1 + f * w) * 1e3; % mg, wet weight 
  
  L    = LW2(:,1) * del_M; % cm, structural length at time t
  ELW2 = L.^3 * (1 + f * w) * 1e3; % mg, wet weight
  
  % Tap data
  Ea_b = (t_0 + t_b)/ k_M./ TC_Tab; % d, age at birt
  
  % pack to output
  prdData.tWd = EWd;
  prdData.tL = EL;
  prdData.tL2 = EL2;
  prdData.tL3 = EL3;
  prdData.tL4 = EL4;
  prdData.tL5 = EL5;
  prdData.LW2 = ELW2;
  prdData.LW = ELW;  
  prdData.Tab = Ea_b;
  prdData.WR = EN; 
  
end

function [ELw, EWd] = get_LW(t, L_0, f, TC, p, c)
% obtains physical length (cm) and dry weight (g) for an organism of
% unknown age but known initial size

 pars_tj = [c.g; c.k; c.l_T; c.v_Hb; c.v_Hj; c.v_Hp];
 [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
 kT_M = c.k_M * TC; rT_j = rho_j * kT_M; rT_B = rho_B * kT_M; 
 L_j = l_j * c.L_m; % cm, structural length at metamorphosis
 L_i = l_i * c.L_m; % cm, ultimate structural length
   
   if L_0 < L_j
    tj = log(L_j/ L_0) * 3/ rT_j; % d, time since beginning of experiment that metamorphosis occurs
    t_bj = t(t(:,1) < tj,1); % select times between birth & metamorphosis
    L_bj = L_0 * exp(t_bj * rT_j/3); % exponential growth as V1-morph
    t_ji = t(t(:,1) >= tj,1); % selects times after metamorphosis
    L_ji = L_i - (L_i - L_j) * exp( - rT_B * (t_ji - tj)); % cm, expected length at time
    L = [L_bj; L_ji]; % catenate lengths
   else 
    L = L_i - (L_i - L_0) * exp( - rT_B * t(:,1)); % cm, expected length at time
   end
   
  ELw = L/ p.del_M; 
  EWd = p.d_V * L.^3 * (1 + c.w * f);

end
