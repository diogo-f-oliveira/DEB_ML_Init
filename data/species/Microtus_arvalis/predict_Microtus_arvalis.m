function [prdData, info] = predict_Microtus_arvalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
 
  E_Hx = E_Hp * 0.01;
  
  % compute temperature correction factors
  TC = tempcorr(temp.tg, T_ref, T_A);
  
  % zero-variate data

  % life cycle
%   pars_tx = [g k l_T v_Hb v_Hx v_Hp]; info = 1;
%   [t_p, t_x, t_b, l_p, l_x, l_b] = get_tx(pars_tx, f);
 
  % birth
  [t_b, l_b, info] = get_tb([g, k, v_Hb], f);
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 
  aT_g = t_0 + t_b/ k_M/ TC;        % d, gestation time at f and T

  aUL = [0; f * L_b^3/ v; L_b];
  [t, auL] = ode23s(@dget_aul,[U_Hb U_Hp], aUL,[], kap, v, k_J, g, L_m, U_Hb, f);
  
  t_p = auL(end,1);   
  tT_p = t_p/TC;
  L_p  = auL(end,3); E = p_Am * auL(end,2);
  Ww_p = L_p^3 + w_E * E/ mu_E/ d_E; 
  tT_x = tT_p; Ww_x = Ww_p; 
  
%   % puberty 
%   tT_p = (t_p - t_b)/ k_M/ TC;      % d, time since birth at puberty at f and T
%   L_p = L_m * l_p;                  % cm, structural length at puberty
%   Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

%   % weaning
%   Ww_x = Ww_p;       % g, wet weight at weaning
%   tT_x = tT_p;      % d, time since birth at weaning at f and T

  
  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate_foetus(L_i, f, pars_R);         % #/d, ultimate reproduction rate at T

%   % life span
%   pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
%   t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
%   aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.tg = aT_g;
  prdData.tx = tT_x;
  prdData.tp = tT_p;
%   prdData.am = aT_m;
  prdData.Wwb = Ww_b;
  prdData.Wwx = Ww_x;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
%   % foetal development: fast 
%   vT = TC * v;
% %   EWw_e = (1 + f * w) * (vT * max(0, tWe(:,1) - t_0)/ 3) .^ 3;
%   ELw_e = 10 * vT * max(0, tLe(:,1) - t_0)/ 3/ del_Me;   % mm, physical length
  
  % temperature correct parameters to input into the ODE for growth:
  vT = v * TC; kT_J = k_J * TC; pT_Am = p_Am * TC; UT_Hb = U_Hb/ TC; UT_Hp = U_Hp/ TC; 
  
  % initial conditions at birth:
  ULH0 = [f * L_b^3/ vT; L_b; UT_Hb; f * L_b^2];

  % time-weight
  [t, ULHA] = ode45(@dget_ulh, tW(:,1), ULH0, [], L_m, vT, g, kT_J, kap, UT_Hp, f, f);
  L = ULHA(:,2);   U = ULHA(:,1);   E = U * pT_Am; 
  EWw = L.^3  + w_E * E/ mu_E/ d_E; 

  % time-weight
   [t, ULHA] = ode45(@dget_ulh, [0;tW2(:,1)], ULH0, [], L_m, vT, g, kT_J, kap, UT_Hp, f, f);
   ULHA(1,:) = [];
   L = ULHA(:,2);   U = ULHA(:,1);   E = U * pT_Am; 
   EWw2 = L.^3  + w_E * E/ mu_E/ d_E; 

   % time-length 
   [t, ULHA] = ode45(@dget_ulh, [0;tW3(:,1)], ULH0, [], L_m, vT, g, kT_J, kap, UT_Hp, f, f_3);
    ULHA(1,:) = []; L = ULHA(:,2);   U = ULHA(:,1);   E = U * pT_Am; 
  EWw3 = L.^3  + w_E * E/ mu_E/ d_E; 

   [t, ULHA] = ode45(@dget_ulh, [0;tL3(:,1)], ULH0, [], L_m, vT, g, kT_J, kap, UT_Hp, f, f_3);
   ULHA(1,:) = []; L = ULHA(:,2);  ELw3 = 10 * L/ del_M;                            % mm, body length

  % survival
  hW3 = h_a * f * v/ 6/ L_i; hG = s_G * f * v * L_i^2/ L_m^3; 
  hGt = TC * hG * tS(:,1);
  ES = exp(6 * hW3/ hG^3 * (1 - exp(hGt) + hGt + hGt .^2/ 2)); % -, survival probability

  % growth and metabolism
  [t, ULHA] = ode45(@dget_ulh, [0;tW4(:,1)], ULH0, [], L_m, vT, g, kT_J, kap, UT_Hp, f, f_45);
  ULHA(1,:) = []; L = ULHA(:,2);   U = ULHA(:,1);   E = U * pT_Am; 
  EWw4 = L.^3  + w_E * E/ mu_E/ d_E; % g, wet weight
  
 pars_power = [kap; kap_R; g; k_J ; k_M ; L_T ; v; U_Hb; U_Hp];
 p_ref      = p_Am * L_m^2;  % J/d, max assimilation power at max size
 pACSJGRD   = p_ref * scaled_power(L, f, pars_power, l_b, L_p/ L_m);
 J_M        = - (n_M\n_O) * eta_O * pACSJGRD(:, [1 7 5])';  % mol/d: J_C, J_H, J_O, J_N in rows
 EJT_O      = - J_M(3,:)' * TC * 24.4e3/ 24;  % ml O2/h, O2 consumption 
  
 [t, ULHA] = ode45(@dget_ulh, [0;tW5(:,1)], ULH0, [], L_m, vT, g, kT_J, kap, UT_Hp, f, f_45);
 ULHA(1,:) = [];L = ULHA(:,2);   U = ULHA(:,1);   E = U * pT_Am; 
 EWw5 = L.^3 + w_E * E/ mu_E/ d_E; % g, wet weight

%   ULH0(end) = f * ULH0(2)^2;
 [t, ULHA] = ode45(@dget_ulh, [0;tJX(:,1)], ULH0, [], L_m, vT, g, kT_J, kap, UT_Hp, f, f_45);
 ULHA(1,:) = [];
 pA    = ULHA(:,end); % J, cumulated energy assimilated
 EJT_X = pA * pT_Am/ kap_X  * 0.239 * 1e-3; % kcal, cumulated energy ingested 


  % pack to output
%   prdData.tLe = ELw_e;
  prdData.tL3 = ELw3;
  prdData.tW = EWw;
  prdData.tW2 = EWw2;
  prdData.tW3 = EWw3;
  prdData.tW4 = EWw4;
  prdData.tW5 = EWw5;
  prdData.tJO = EJT_O;
  prdData.tJX = EJT_X;
  prdData.tS = ES;
  
end

function dULHA = dget_ulh(t, ULH, Lm, v, g, kJ, kap, Hx, fmilk, f)
  %  change in state variables during juvenile stage
  %  dULH = dget_ulh_p(ULH)
  %  ULH: 3-vector
  %   U: scaled reserve E/ {p_Am}}
  %   L: structural length
  %   H: scaled maturity E_H/ {p_{Am}
  %  dULH: change in scaled reserve, length, scaled maturity
  
%   global Li Lm v g kJ kap f

  %  unpack variables
  U = ULH(1); L = ULH(2); H = ULH(3);
  
    if H <= Hx 
        f = fmilk;
    end
     
  eL3 = U * v; % eL3 = L^3 * m_E/ m_Em
  gL3 = g * L^3; 
  SC = L^2 * (1 + L/ (g * Lm)) * g * eL3/ (gL3 + eL3); % J_EC/{J_EAm}
  dU = f * L^2 - SC; % difference with dget_ulh: assimilation f * L^2
  dL = v * (eL3 - L^4/ Lm)/ (3 * (eL3 + gL3));
  dH = (1 - kap) * SC - kJ * H;
  dA = f * L^2; % 
  
  %  pack derivatives
  dULHA = [dU; dL; dH; dA];
  
end



function dx = dget_aul(H, aUL, kap, v, kJ, g, Lm, Hb, f)

  % dx = dget_aul(H, aUL, kap, kJ, g, Lm)
  % H: scalar with M_H/{J_EAm} (cum invest in mat.)
  % aUH: 3-vector with (a, U, L) of embryo
  %  a = age, U= M_E/{J_EAm}, L = structural length
  % dx: 3-vector with (da/dH, dU/dH, dL/dH)
  
  % a = aUL(1); % age
  U = aUL(2); % scaled reserve M_E/{J_EAm}
  L = aUL(3); % structural length
  
  eL3 = U * v; % eL3 = L^3 * m_E/ m_Em
  gL3 = g * L^3;
  SC = L^2 * (1 + L/ (g * Lm)) * g * eL3/ (gL3 + eL3); % J_EC/{J_EAm}
  
  % first generate dH/dt, dE/dt, dL/dt
  dH = (1 - kap) * SC - kJ * H;
  dU = f * L^2 * (H>=Hb) - SC;
  dL = v * (eL3 - L^4/ Lm)/ (3 * (eL3 + gL3));
  
  % then obtain dt/dH, dU/dH, dL/dH, 
  dx = [1/dH; dU/dH; dL/dH];
  
end


% von Bert growth - in case we like to put it back instead of the dynamic
% calculations:

%   ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;     % d, 1/von Bert growth rate
%   L = L_i - (L_i - L_b) * exp( - rT_B * tW2(:,1));      % cm, structural length at time
%   EWw2 = L.^3 * (1 + f * w);                            % g, wet weigh
  
