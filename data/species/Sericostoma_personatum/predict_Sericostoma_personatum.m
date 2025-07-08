function [prdData, info] = predict_Sericostoma_personatum(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
    
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A); 
  TC_Tab = tempcorr(C2K(Tab(:,1)), T_ref, T_A);
  TC_Taj = tempcorr(C2K(Taj(:,1)), T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A); 
  TC_tj = tempcorr(temp.tj, T_ref, T_A); 
  TC_tTj_10 = tempcorr(temp.tTj_10, T_ref, T_A); 
  TC_tTj_6 = tempcorr(temp.tTj_6, T_ref, T_A); 
  TC_te = tempcorr(temp.te, T_ref, T_A);
  TC14  = tempcorr(temp.tL14, T_ref, T_A);
  TC10 = tempcorr(temp.tL10, T_ref, T_A);
  TC6  = tempcorr(temp.tL6, T_ref, T_A);
    
  % zero-variate data

  % life cycle
  v_Rj = kap/ (1 - kap) * E_Rj/ E_G; 
  pars_tj_hax = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V];
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f);
  if ~info
    prdData = []; return
  end
          
  % initial
  u_E0 = get_ue0([g, k, v_Hb], f);    % -, scaled initial reserve
  E_0 = u_E0 * g * E_m * L_m^3;       % J, initial energy content
  Wd_0 = E_0/ mu_E * w_E;             % g, initial dry weight
  V_0 = Wd_0/ d_E * 1e3;              % cm^3, egg volume
    
  % birth
  aT_b = t_b/ k_M/ TC_ab;             % d, age at birth at f and T
  a_b = t_b/ k_M; 
  L_b = L_m * l_b;                    % cm, structural length at birth
  Lw_b = L_b/ del_Mh;                 % cm, head-capsule length at birth
 
  % pupation 
  tT_j = (t_j - t_b)/ k_M/ TC_tj;       % d, time since birth at pupation
  a_j = (t_j - t_b)/ k_M;
  tT_j10 = (t_j - t_b)/ k_M/ TC_tTj_10; % d, time since birth at pupation
  tT_j6 = (t_j - t_b)/ k_M/ TC_tTj_6;   % d, time since birth at pupation

  L_j = L_m * l_j;                    % cm, structural length at pupation
  Lw_j = L_j/ del_Mh;                 % cm, head-capsule width
  Lw_jl = L_j/ del_M;                 % cm, larval length
  Ww_j = L_j^3 * (1 + f * w);         % g, wet weight at pupation, excluding reprod buffer at pupation
  Ww_Rj = E_Rj * L_j^3 * w_E/ mu_E/ d_E;      % g, wet weight repod buffer at pupation
  Ww_j = Ww_j + Ww_Rj;                % g, wet weight including reprod buffer
   
  % emergence
  L_e = L_m * l_e;                    % cm, structural length at emergence
  Wd_e = d_V * L_e^3 + d_E * Ww_Rj + u_Ee * g * E_m * L_m^3 * w_E/ mu_E; % g, dry weight including reprod buffer
  tT_e = (t_e - t_j)/ k_M/ TC_te;            % d, time since pupation at emergence

  % reproduction
  N_i = kap_R * E_Rj * L_j^3/ E_0;             % #/d, ultimate reproduction rate at T
    
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G]; % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);     % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;      % d, mean life span as imago
    
  % pack to output
  prdData.ab = aT_b;
  prdData.tj = tT_j; 
  prdData.tTj_10 = tT_j10; 
  prdData.tTj_6 = tT_j6; 
  prdData.te = tT_e; 
  prdData.am = aT_m;
  prdData.V0 = V_0;
  prdData.Lb = Lw_b;
  prdData.Lj = Lw_j;
  prdData.Ljl = Lw_jl;
  prdData.Ni = N_i;
  
% uni-variate data

 % temperature-age at birth
    Eab = a_b./ TC_Tab;   
 % temperature-age at pupation
    Eaj = a_j./ TC_Taj;   
  
 % Wagn1990 time-head-capsule width
   EL14  = get_L(tL14(:,1), L_m, k_M, g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V, del_Mh, TC14, f1);  % females
   EL10 = get_L(tL10(:,1), L_m, k_M, g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V, del_Mh, TC10, f1);  % females
   EL6  = get_L(tL6(:,1), L_m, k_M, g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kap_V, del_Mh, TC6, f1);  % females

  % pack to output
  prdData.Tab = Eab;
  prdData.Taj = Eaj;
  prdData.tL14  = EL14;
  prdData.tL10  = EL10;
  prdData.tL6  = EL6;
 
end

function EL = get_L(time, L_m, k_M, g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kapV, del_Mh, TC, f) % del_M replaced by del_Mh because of head-capsule width data

  pars_tj_hax = [g, k, v_Hb, v_Hp, v_Rj, v_He, kap, kapV];
  [t_j, t_e, t_p, t_b, l_j, l_e, l_p, l_b, l_i, rho_j, rho_B, u_Ee, info] = get_tj_hax(pars_tj_hax, f);

  aT_p = (t_p - t_b)/ k_M/ TC; % d, time since birth at puberty
  aT_j = (t_j - t_b)/ k_M/ TC; % d, time since birth at pupation
  
  L_b = l_b * L_m; L_p = l_p * L_m;  L_j = l_j * L_m; L_i = l_i * L_m;
  if time(1) > 0
      t = [0; time];
  else
      t = time;
  end
  % V1- before puberty
  t_bp = t(t <= aT_p);
  rT_j = rho_j * k_M * TC; % 1/d, V1 morphic growth rate
  Lbp = L_b * exp(rT_j/3 * t_bp);
  
  % von Bert after puberty:
  rT_B = rho_B * k_M * TC; % 1/d, von Bert growth rate
  t_pj = t(t > aT_p & t <=aT_j);
  Lpj = L_i - (L_i - L_p) * exp(- rT_B * (t_pj - aT_p));

  
  % after pubation the observed physical length is no longer revealing
  % changes in structure -
  t_je = [aT_j;t(t>aT_j)];
  if ~isempty(t_je)
  Lje = L_j * ones(length(t_je),1);
  Lje = Lje(2:end);
  else
  Lje = [];
  end
  EL = [Lbp;Lpj;Lje]./ del_Mh;  % cm, head-capsule length larvae

  if length(t) > length(time)
      EL = EL(2:end);
  end

end 
 

