function [data, auxData, metaData, txtData, weights] = mydata_Arenicola_marina
  
%% set metaData

metaData.phylum = 'Annelida' ;
metaData.class = 'Polychaeta' ;
metaData.order = 'Capitellida' ;
metaData.family = 'Arenicolidae' ;
metaData.species = 'Arenicola_marina' ;
metaData.species_en = 'Lugworm' ;

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'bjD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, Reference temperature
metaData.data_0     = {'ah';'ab'; 'aj'; 'ap'; 'am'; 'L0'; 'Lh'; 'Lj'; 'Lb'; 'Lp'; 'Li'; 'Ww0'}; %tags for different types of zero-variate data
metaData.data_1     = {'t-L_fT';'t-Ww_f'; 'L-Ww'; 'L-R'; 'Ww-JO_T'}; % tags for different types of uni-variate data

metaData.COMPLETE = 4.2; % using criteria of LikaKear2011  

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2009 07 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2013 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Lola De Cubber', 'Sebastien Lefebvre', 'Sylvie Gaudron'};            
metaData.date_mod_2 = [2019 04 27];                     
metaData.email_mod_2    = {'lola.de-cubber@gmail.com'};             
metaData.address_mod_2  = {'UMR8187 LOG/univ-Lille, 62930, France'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 20]; 

%%% set data

% zero-variate data;
data.atr_10 = 7 ; units.atr_10 = 'd' ; label.atr_10 = 'age at trochophore larva stage' ; bibkey.atr_10 = 'Gaud2019' ;
  temp.atr_10 = C2K(10) ; units.temp.atr_10 = 'K' ; label.temp.atr_10 = 'temperature' ; 
  comment.atr_10 ='age when trochophore larvae are first observed'; 
data.ab_10 = 30 ; units.ab_10 = 'd' ; label.ab_10 = 'age at birth' ; bibkey.ab_10 = 'FarkBerg1979' ;
  temp.ab_10 =C2K(10); units.temp.ab_10 = 'K' ; label.temp.ab_10 = 'temperature' ; 
  comment.ab_10 = 'probably before, temperature varied between 8 and 13 C : beginning of the change of shape' ; 
data.aj = 78 ;  units.aj = 'd'; label.aj = 'age at metamorphosis'; bibkey.aj = {'FarkBerg1979'}; 
  temp.aj = C2K(12);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
  comment.aj = '78 d minimum, temperature varying between 16 to 8 C, end of the change of shape';
data.ap_13 = 1.5*365 ; units.ap_13 = 'd' ;  label.ap_13= 'age at puberty' ; bibkey.ap_13 = 'DeCuLefe2018' ;
  comment.ap_13 = 'f and T are guessed' ; temp.ap_13 = C2K(13) ; units.temp.ap_13 = 'K' ; label.temp.ap_13 = 'temperature' ; 
data.am = 6*365;       units.am = 'd';      label.am = 'life span';         bibkey.am = 'BeukDeV1979'; 
  temp.am = C2K(11);     units.temp.am = 'K'; label.temp.am = 'temperature'; comment.am ='probably highly underestimated';

data.L0 = 0.02 ;       units.L0 = 'cm' ;    label.L0 = 'Egg diameter' ;                           bibkey.L0 = {'DeCuLefe2018','WatsCadm1998'} ; 
data.Ltr  = 0.025;     units.Ltr = 'cm';    label.Ltr = 'total length of the Trochophore larva';  bibkey.Ltr  = 'FarkBerg1979';  
data.Lj = 0.89;        units.Lj = 'cm';     label.Lj = 'total length at metamorphosis';           bibkey.Lj  = 'FarkBerg1979';  
data.Lb = 0.08 ;       units.Lb =  'cm' ;   label.Lb = 'total Length at birth' ;                  bibkey.Lb = 'FarkBerg1979'; 
data.TLp  = 2.5;       units.TLp = 'cm';    label.TLp = 'Trunk length at puberty';                bibkey.TLp  = 'DeCuLefe2018'; 
  comment.TLp = 'smallest mature individual' ; 
data.TLi  = 34;        units.TLi = 'cm';    label.TLi = 'Trunk maximum length';                   bibkey.TLi  = 'Gaud2019';

data.Ww0 = 4.78e-6;   units.Ww0 = 'g';     label.Ww0 = 'wet weight at fertilization';  bibkey.Ww0 = 'DeCuLefe2019';

% uni-variate data

% trunk length (cm) - wet weight (g)
TLw_vs_Ww = [0.4363    0.0062;     0.7534    0.0307;    0.9998    0.0436;
    1.3032    0.0899;    1.5990    0.1545;    1.8901    0.2298;
    2.2060    0.3396;    2.4883    0.4493;    2.7868    0.6621;
    3.1173    0.8637;    3.4177    1.0260;    3.6808    1.3352; 
    3.9892    1.4280;    4.2831    1.6344;    4.6055    1.8040;
    4.8820    1.9746;    5.2000    2.1648;    5.5091    1.9464;
    5.8025    2.6535;    6.1147    1.9274;    6.3800    1.9990;
    6.7381    2.5200;    6.9929    2.4643;    7.3067    2.6700];

data.TLw_vs_Ww=TLw_vs_Ww(:,:); units.TLw_vs_Ww= {'cm', 'g'};  label.TLw_vs_Ww = {'Physical trunk length', 'Wet Weight'}; bibkey.TLw_vs_Ww = 'DeCuLefe2019';
comment.TLw_vs_Ww = 'From in situ data (Wimereux-France)'; 

% total length (cm) - dry weight (g)
TLw_vs_Wd_dewilde = [0.75	0.0038; 0.76	0.00211; 0.82	0.00303; 0.98	0.00393; 1	    0.00208; 1.02	0.00208; 1.02	0.00347; 1.03	0.00455; 1.21	0.00684; 1.23	0.00576; 1.24	0.00453; 1.26	0.00344; 1.3	    0.00699; 1.74	0.00818; 1.9	    0.00878;
1.91	0.01094; 1.95	0.00831; 1.96	0.01247; 1.98	0.0063; 1.99	0.00923; 2	    0.0154; 2.01	0.01062; 2.01	0.01154; 2.01	0.01247; 2.01	0.00784; 2.02	0.01385; 2.04	0.00969; 2.05	0.00784; 2.2	    0.00967; 2.24	0.01245; 2.24	0.01322;
2.24	0.01044; 2.49	0.01782; 2.74	0.01918; 2.92	0.02487; 2.94	0.02255; 2.99	0.01808; 2.99	0.02548; 2.99	0.03458; 2.99	0.01499; 3	    0.02687; 3	    0.03843; 3	    0.02116; 3	    0.02332; 3	    0.03103; 3.01	0.01299; 3.03	0.02316; 3.03	0.02424;
3.03	0.02532; 3.03	0.019; 3.04	0.02131; 3.05	0.03534; 3.1 	0.02161; 3.74	0.04036; 3.74	0.0251; 3.75	0.01862; 3.76	0.04298; 3.76	0.03866; 3.82	0.03958; 3.95	0.03325; 3.97	0.0718; 4   	0.02723; 4   	0.05884; 4   	0.06455;
4   	0.04943; 4   	0.03309; 4	    0.03494; 4.01	0.03741; 4.01	0.04064; 4.01	0.04157; 4.01	0.04743; 4.01	0.05529; 4.01	0.05668; 4.01	0.03972; 4.02	0.0482; 4.25	0.04525; 4.26	0.06097; 4.75	0.0546; 4.75	0.05969; 4.75	0.06031;
4.75	0.07419; 4.77	0.06509; 4.98	0.07555; 4.99	0.07385; 4.99	0.07802; 4.99	0.08496; 5	    0.08295; 5	    0.11796; 5	    0.11981; 5	    0.09112; 5	    0.09236; 5.02	0.08156; 5.02	0.09822; 5.77	0.13916; 5.99	0.15363; 5.99	0.14546;
6	    0.16813; 6	    0.11693; 6	    0.12063; 6	    0.12803; 6	    0.13158; 6.02	0.15009; 6.26	0.13526; 6.74	0.16698; 6.75	0.17268; 6.76	0.16512; 6.98	0.12609; 6.99	0.20581; 7	    0.21074; 7.01	0.16649; 7.27	0.20594; 7.75	0.18739;
7.77	0.22532; 8.01	0.20741]; 

data.TLw_vs_Wd_dewilde=TLw_vs_Wd_dewilde(:,:); units.TLw_vs_Wd_dewilde= {'cm', 'g'};  label.TLw_vs_Wd_dewilde = {'Physical trunk length', 'Dry Weight'};
bibkey.TLw_vs_Wd_dewilde = 'DeWiBerg1979';

%----------------------------------------------------------------
% Time vs Trunk Length at several temperatures from DeWilde & berghuis
%----------------------------------------------------------------

%Fed
dewilde.tTL_20 = [0 14.38 27.64 43.83 62.51 78.15 120.42 ; 1.099 1.403 2.06 2.422 3.326 3.908 6.491]'; %time vs length 
data.tTL_20 = [dewilde.tTL_20(:,1), dewilde.tTL_20(:,2)]; units.tTL_20   = {'d', 'cm'};  label.tTL_20 = {'time', 'trunk length', '20 C, fed'};  bibkey.tTL_20 = 'DeWiBerg1979';
temp.tTL_20 = C2K(20);  units.temp.tTL_20 = 'K'; label.temp.tTL_20 = 'temperature';
t0.tTL_20 = 1.099 ; units.t0.tTL_20 = 'cm'; label.t0.tTL_20 = 'TL0_20';
comment.tTL_20 = 'Fed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment';

dewilde.tTL_5 = [0 33.89 50.08 64.81 84.66 106.88 125.22 ; 1.134 1.889 2.255 2.812 3.694 4.398 5.161]';   %time vs length 
data.tTL_5 = [dewilde.tTL_5(:,1), dewilde.tTL_5(:,2)]; units.tTL_5   = {'d', 'cm'};  label.tTL_5 = {'time', 'trunk length', '5 C, fed'};  bibkey.tTL_5 = 'DeWiBerg1979';
temp.tTL_5 = C2K(5);  units.temp.tTL_5 = 'K'; label.temp.tTL_5 = 'temperature';
t0.tTL_5 = 1.134 ; units.t0.tTL_5 = 'cm'; label.t0.tTL_5 = 'TL0_5';
comment.tTL_5 = 'Fed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment';

dewilde.tTL_10 = [0 15.23 33.84 47.93 63.5 83.94 99.84 121.65; 1.116 1.318 2.268 2.793 3.186 4.62 5.321 5.331]';  %time vs length 
data.tTL_10 = [dewilde.tTL_10(:,1), dewilde.tTL_10(:,2)];                       
units.tTL_10 = {'d', 'cm'};  label.tTL_10 = {'time', 'trunk length', '10 C, fed'};  bibkey.tTL_10 = 'DeWiBerg1979';
temp.tTL_10 = C2K(10);  units.temp.tTL_10 = 'K'; label.temp.tTL_10 = 'temperature';
t0.tTL_10 = 1.116 ; units.t0.tTL_10 = 'cm'; label.t0.tTL_10 = 'TL0_10';
comment.tTL_10 = 'Fed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment';

dewilde.tTL_15 = [0 15.21 31.18 44.93 63.58 83.42 98.59 121.95 ; 1.127 1.549 2.322 2.333 3.105 3.789 5.133 5.48]';  %time vs length 
data.tTL_15 = [dewilde.tTL_15(:,1), dewilde.tTL_15(:,2)];         
units.tTL_15 = {'d', 'cm'};  label.tTL_15 = {'time', 'trunk length', '15 C, fed'};  bibkey.tTL_15 = 'DeWiBerg1979';
temp.tTL_15 = C2K(15);  units.temp.tTL_15 = 'K'; label.temp.tTL_15 = 'temperature';
t0.tTL_15 = 1.127 ; units.t0.tTL_15 = 'cm'; label.t0.tTL_15 = 'TL0_15';
comment.tTL_15 = 'Fed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment';

% Unfed
dewilde.tTL2_20 = [0 15.79 29.40 44.88 62.24 80.32 99.01 ; 1.173 1.653 1.209 1.102 1.458 1.813 1.511]';  %time vs length         
data.tTL2_20 = [dewilde.tTL2_20(:,1), dewilde.tTL2_20(:,2)];         
units.tTL2_20 = {'d', 'cm'};  label.tTL2_20 = {'time', 'trunk length', '20 C, starved'};  bibkey.tTL2_20 = 'DeWiBerg1979';
temp.tTL2_20 = C2K(20);  units.temp.tTL2_20 = 'K'; label.temp.tTL2_20 = 'temperature';
t0.tTL2_20 = 1.173 ; units.t0.tTL2_20 = 'cm'; label.t0.tTL2_20 = 'TL0_2_20';
comment.tTL2_20 = 'Unfed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment';
 
dewilde.tTL2_5 = [0 34.91 50.68 65.15 84.93 108 127.08 ; 1.125 1.768 1.268 1.571 1.375 1.429 1.286]';  %time vs length 
data.tTL2_5 = [dewilde.tTL2_5(:,1), dewilde.tTL2_5(:,2)];         
units.tTL2_5 = {'d', 'cm'};  label.tTL2_5 = {'time', 'trunk length', '5 C, starved'};  bibkey.tTL2_5 = 'DeWiBerg1979';
temp.tTL2_5 = C2K(5);  units.temp.tTL2_5 = 'K'; label.temp.tTL2_5 = 'temperature';
t0.tTL2_5 = 1.125 ; units.t0.tTL2_5 = 'cm'; label.t0.tTL2_5 = 'TL0_2_5';
comment.tTL2_5 = 'Unfed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment';
 
dewilde.tTL2_10 = [0 16.05 35.18 49.6 64 107.63; 1.191 1.12 1.28 1.32 1.262 1.422]';  %time vs length 
data.tTL2_10 = [dewilde.tTL2_10(:,1), dewilde.tTL2_10(:,2)];     
units.tTL2_10 = {'d', 'cm'};  label.tTL2_10 = {'time', 'trunk length', '10 C, starved'};  bibkey.tTL2_10 = 'DeWiBerg1979';
temp.tTL2_10 = C2K(10);  units.temp.tTL2_10 = 'K'; label.temp.tTL2_10 = 'temperature';
t0.tTL2_10 = 1.191 ; units.t0.tTL2_10 = 'cm'; label.t0.tTL2_10 = 'TL0_2_10';
comment.tTL2_10 = 'Unfed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment';
 
dewilde.tTL2_15 = [0 15.35  34.06  45.22  62.90  83.47  99.05; 1.186 1.31   1.15   1.062  1.221  1.345  1.858]';  %time vs length 
data.tTL2_15 = [dewilde.tTL2_15(:,1), dewilde.tTL2_15(:,2)]; 
units.tTL2_15 = {'d', 'cm'};  label.tTL2_15 = {'time', 'trunk length', '15 C, starved'};  bibkey.tTL2_15 = 'DeWiBerg1979';
temp.tTL2_15 = C2K(15);  units.temp.tTL2_15 = 'K'; label.temp.tTL2_15 = 'temperature';
t0.tTL2_15 = 1.186 ; units.t0.tTL2_15 = 'cm'; label.t0.tTL2_15 = 'TL0_2_15';
comment.tTL2_15 = 'Unfed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment';
 
%---------------------------
% Time vs Wet weight from Patent US7.004.109B2 figure 6
%------------------------

% tWw_f
patent_tWw1_fed = [0 0.53; 0   0.62; 0   0.47; 30  1.96; 30  1.81; 30  1.89; 60  2.57; 60  2.41; 60  2.46; 90  3.07; 90  2.78; 90  2.54; 120 3.79; 120 3.75; 120 3.71];
data.tWw1 = [patent_tWw1_fed(:,1) patent_tWw1_fed(:,2)]; units.tWw1   = {'d', 'g'};  label.tWw1 = {'time since the beginning of the experiment', 'wet weight', 'fed'};  bibkey.tWw1 = 'OlivCrai2006';
temp.tWw1 = C2K(19.5);  units.temp.tWw1 = 'K'; label.temp.tWw1 = 'temperature';
t0.tWw1 = 0.54; units.t0.tWw1 = 'g'; label.t0.tWw1 = 'Ww0';
comment.tWw1= 'Fed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment, temperature between 12 and 20 C but probably closer to 20';

patent_tWw2_unfed = [0 0.50; 0   0.44; 0   0.35; 30  0.89; 30  0.73; 30  0.62; 60  1.02; 60  0.82; 60  0.70; 90  1.06; 90  0.92; 90  0.88; 120 0.96; 120 1.01; 120 0.81];
data.tWw2 = [patent_tWw2_unfed(:,1) patent_tWw2_unfed(:,2)]; units.tWw2   = {'d', 'g'};  label.tWw2 = {'time since the beginning of the experiment', 'wet weight', 'starved'}; bibkey.tWw2 = 'OlivCrai2006';
temp.tWw2 = C2K(19.5);  units.temp.tWw2 = 'K'; label.temp.tWw2 = 'temperature';
t0.tWw2 = 0.43; units.t0.tWw2 = 'g'; label.t0.tWw2 = 'Ww0';
comment.tWw2= 'Unfed experiment, the beginning of the experiment is after metamorphosis, level of reserve not known before the experiment, temperature between 12 and 20 C but probably closer to 20';

%------------------------------
% Oxygen consumption exp 2018 JOvsWw at different temperatures
%------------------------------

% % sable l1 - 18, eau sinon
Ww_JO_12 = [0.73	2.10115251;3.27	4.710704971;0.85	2.982353901;2.72	1.69450653;1.19	1.948511454;1.29	2.406305324;2.29	2.541712522;2.06	1.592901464;0.62	2.050473387;
2.76	2.084120883;1.02	1.77916526;0.81	1.33860861;1.55	2.880736503;0.59	1.355548423;2.22	3.37216479;0.0045	0.094851047;0.0023	0.131068403;0.0171	0.153654888;1.22	2.473983807;
3.11	7.998109657;1.20	2.304358758;2.68	5.524016914;3.73	5.896750492;1.13	2.406051544;1.05	1.491340342;0.93	1.220078455;1.62	2.202671545;0.84	1.626710879;1.56	3.389057871;
0.52	1.389427604;1.44	1.931832083;0.60	1.152336694;1.52	1.89800134;0.79	1.389753691;0.42	0.576144737;0.15	0.338903785;0.0122	0.128837288;0.0193	0.027091178;0.0092	0.006712114;
0.0138	0.074538938;0.0412	0.088073416;0.011	0.081328699;0.016	0.033859367];

data.Ww_JO_12=[Ww_JO_12(:,1) Ww_JO_12(:,2)];
data.Ww_JO_12 = sortrows(data.Ww_JO_12,1);
temp.Ww_JO_12= C2K(12) ;units.Ww_JO_12 = {'g', 'mumol O2/h'};  label.Ww_JO_12 = {'Wet weight', 'O2 consumption rate', 'sal 12 %%'}; 
units.temp.Ww_JO_12 = {'K'}; label.temp.Ww_JO_12= {'Temperature'};bibkey.Ww_JO_12 = 'DeCuLefe2019';
comment.Ww_JO_12 = 'Data for salitiny 12 promille';

% % sable l1 - 31, eau sinon
Ww_JO_15 = [0.38	0.870810727;0.54	1.438687751;0.3	    1.245628741;2.39	4.019198209;2.78	0.8389614;4.81	4.791887883;0.53	1.127263502;3.07	3.791414684;3.98	4.721650199;
2.27	3.452451914;4.45	4.8544734;5.7	    2.908422917;2.43	2.232096743;2.85	4.079309659;2.35	3.914290188;2.65	2.545395407;0.251	0.269268396;0.16	0.356229641;0.22	0.312341422;
0.26	0.58949857;0.132	0.312335135;0.15	0.167229971;0.02	0.176005524;0.18	0.360752583;0.13	0.224336889;0.12	0.215543119;0.27	0.501471183;0.081	0.255055013;0.11	0.303456336;
0.061	0.241917748;0.1	    0.180397586;3.78	8.698841332;4.8	    8.968728842;4.47	9.170962419;3.71	5.226230586;3.44	7.72097707;3.01	7.653623483;0.37	0.573198059;1.16	2.124066422;
1.32	2.427680299;2.77	6.439879638;5.4	    8.766280474;3.52	10.08133548;0.351	0.505611594;0.31	0.43840603;0.36	1.078996956;4.2	    6.30510411;3.41	7.013128643;2.81	6.912273615;0.28	0.559708425;
0.141	0.317005681;0.06	0.148341659;0.051	0.175265271;0.63	1.15305034;0.07	0.175407481;0.031	0.087666379;0.03	0.074257465;0.17	0.289953656;0.24	0.539498084;0.09	0.229225885;
0.131	0.128177383;0.041	0.303445914;0.121	0.316918732;0.19	0.357499973;0.08	0.20900078;0.04	0.141628815;0.231	0.391117275;0.05	0.202343094];

data.Ww_JO_15=[Ww_JO_15(:,1) Ww_JO_15(:,2)];
data.Ww_JO_15 = sortrows(data.Ww_JO_15,1);
temp.Ww_JO_15= C2K(15) ;units.Ww_JO_15 = {'g', 'mumol O2/h'};  label.Ww_JO_15 = {'Wet weight', 'O2 consumption rate', 'sal 15 %%'}; 
units.temp.Ww_JO_15 = {'K'}; label.temp.Ww_JO_15= {'Temperature'};bibkey.Ww_JO_15 = 'DeCuLefe2019';
comment.Ww_JO_15 = 'Data for salitiny 15 promille';

% % sable l1 - 25, eau sinon
Ww_JO_205 = [5.91	5.524006569;0.71	2.350508306;2.13	4.710540918;0.23	0.909887653;0.63	1.497425659;0.34	1.834216692;5.08	2.379721017;1.93	5.426193786;0.58	1.631899015;
0.5	    1.998293361;1.04	3.651907226;0.69	2.14899464;3.42	6.197376717;4.23	5.577894146;0.18	0.362251567;0.0391	0.200642479;0.039	0.194532583;0.064	0.371225245;0.131	0.482001903;
0.068	0.330923138;0.031	0.10934083;0.035	0.262941858;0.049	0.292496702;0.141	0.301273961;0.25	0.62642882;1.95	9.50753022;2.18	7.512144607;0.581	2.044745983;1.88	6.494691519;
0.54	1.694174002;0.331	1.155886764;0.323	1.585363956;1.23	5.032728942;3.62	8.880133426;2.69	8.238134455;2.47	8.875264445;0.31	1.37313592;2.37	7.591068403;0.32	1.239588117;
0.052	0.160665146;0.13	0.421134477;0.094	0.276397325;0.11	0.573860469;0.16	0.650226539;0.24	0.987084451;0.33	0.742067163;0.321	0.610611595;0.41	0.852697541;0.12	0.32901439;
0.037	0.192041965;0.15	0.444747676;0.17	0.444747676;0.14	0.389528366;0.22	0.442021243;0.231	0.655302577;0.27	0.813162022;0.322	0.684241238];
    
data.Ww_JO_205=[Ww_JO_205(:,1) Ww_JO_205(:,2)];
data.Ww_JO_205 = sortrows(data.Ww_JO_205,1);
temp.Ww_JO_205= C2K(20.5) ;units.Ww_JO_205 = {'g', 'mumol O2/h'};  label.Ww_JO_205 = {'Wet weight', 'O2 consumption rate', 'sal 20.5 %%'}; 
units.temp.Ww_JO_205= {'K'}; label.temp.Ww_JO_205= {'Temperature'};bibkey.Ww_JO_205 = 'DeCuLefe2019';
comment.Ww_JO_205 = 'Data for salitiny 20.5 promille';

%-------------
% Reproduction rate vs Trunk length
%-------------

TL_R = [4.2  55300;         11   663750;          6.5  427500;          10.5 516375;         13   561750;         11.5 696000];
data.TL_R = [TL_R(:,1) TL_R(:,2)./365];
temp.TL_R= C2K(13) ;units.TL_R = {'cm', '#/d'};  label.TL_R = {'Trunk length', 'Number of eggs per day'}; 
units.temp.TL_R = {'K'}; label.temp.TL_R= {'Temperature'};bibkey.TL_R = 'DeCuLefe2019';

%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights (remove these remarks after editing the file)
% the weights were set automatically with the function setweigths,
% if one wants to ovewrite one of the weights it should always present an explanation example:
% ages data based on FarkBerg1979 might not be completely reliable, as well as age data estimated based
% on lengths
weights.ab_10 = 0.5 .* weights.ab_10;
weights.aj = 0.5 .* weights.aj;
weights.ap_13 = 0.5 .* weights.ap_13;
weights.am = 0.5 .* weights.am;

% growth dewilde1979
weights.tTL2_5 = 0.1 .* weights.tTL2_5;% unfed data might not be reliable
weights.tTL2_10 = 0.1 .* weights.tTL2_10;
weights.tTL2_15 = 0.1 .* weights.tTL2_15;
weights.tTL2_20 = 0.1 .* weights.tTL2_20;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weights.psd)
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% Group plots
set1 = {'tTL_20','tTL2_20','tTL_15','tTL2_15','tTL2_10','tTL_10','tTL_5','tTL2_5',}; subtitle1 = {'Data for 20, 15, 10, 5 C, fed and starved'};
set2 = {'tWw1','tWw2'}; subtitle2 = {'OlivCrai2006: fed, starved'};
set3= {'Ww_JO_12','Ww_JO_15','Ww_JO_205'}; subtitle3 = {'DeCuLefe2019: data for salinity 12, 15, 20.5 promille'};
metaData.grp.sets = {set1;set2;set3};
metaData.grp.subtitle = {subtitle1;subtitle2;subtitle3};

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.t0 = t0;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points

D1 = 'Mod_2: the version of the entry is discussed in DeCuLefe2019';
D2 = 'Trunk length data more reliable because of possible tail-eating';
D3 = 'Measurements might be done on the lugworm "extended" or "contracted" which leads to different shape coefficients according to the authors';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Sexes separated';
metaData.bibkey.F1 = 'WatsCadm1998'; 
F2 = 'Trochophora short living in mothers burrow without feeding, then dispersed in the water column. The metatrochophore larva settles on a temporary habitat where it starts feeding and engage metamorphosis. Second dispersal phase after metamorphosis';
metaData.bibkey.F2 = 'FarkBerg1979'; 
F3 = 'Spawning early Oct; Recruitment observed in April-May';
metaData.bibkey.F3 = 'BeukDeV1979'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);



%% Links
metaData.links.id_CoL = 'GFJ9'; % Cat of Life
metaData.links.id_ITIS = '67511'; % ITIS
metaData.links.id_EoL = '486136'; % Ency of Life
metaData.links.id_Wiki = 'Arenicola_marina'; % Wikipedia
metaData.links.id_ADW = 'Arenicola_marina'; % ADW
metaData.links.id_Taxo = '15271'; % Taxonomicon
metaData.links.id_WoRMS = '129868'; % WoRMS


%% References

bibkey = 'Gaud2019'; type = 'Misc'; bib = [...
'year = {2019}, ' ...   
'author = {Gaudron, S.}, ' ...    
'howpublished = {pers. comm.}']; % section 4.2.3.
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FarkBerg1979'; type = 'Article'; bib = [ ... 
'author = {Farke, H. and Berghuis, E. M.}, ' ... 
'year = {1979}, ' ...
'title = {Spawning, larval development and migration behaviour of \emph{Arenicola marina} in the laboratory}, ' ...
'journal = {Netherlands Journal of Sea Research}, ' ...
'volume = {13}, ' ...
'number = {3/4}, '...
'pages = {512-528}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeWiBerg1979'; type = 'Article'; bib = [ ...
'author = {De Wilde, P. A. W. J. and Berghuis, E. M.}, ' ... 
'year = {1979}, ' ...
'title = {Laboratory experiments on growth of juvenile lugworms, \emph{Arenicola marina}}, ' ...
'journal = {Netherlands Journal of Sea Research}, ' ...
'volume = {13}, ' ...
'number = {3/4}, '...
'pages = {487-502}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BeukDeV1979'; type = 'Article'; bib = [ ...
'author = {Beukema, J. J. and De Vlas, J.}, ' ... 
'year = {1979}, ' ...
'title = {Population parameters of the lugworm \emph{Arenicola marina} living on tidal flats in the {D}utch {W}adden {S}ea}, ' ...
'journal = {Netherlands Journal of Sea Research}, ' ...
'volume = {13}, ' ...
'number = {3/4}, '...
'pages = {331-353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OlivCrai2006'; type = 'techreport'; bib = [ ... 
'author = {Olive, P.J.W. and Craig, S. and Cowin, P.B.D.},'...
'institution = {Seabait Limited},'...
'pages = {18},'...
'title = {Aquaculture of marine worms},'...
'year = {2006}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WatsCadm1998'; type = 'Article'; bib = [ ... 
'author = {Watson, G. J. and Cadman, P. S. and Paterson, L. A. and Bentley, M. G. and Auckland, M. F.}, ' ... 
'year = {1998}, ' ...
'title = {Control of oocyte maturation, sperm activation and spawning in two lugworm species: \emph{Arenicola marina} and \emph{A. defodiens}}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {175}, ' ...
'pages = {167-176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeCuLefe2018'; type = 'Article'; bib = [ ... 
'author = {De Cubber, L. and Lefebvre, S. and Fisseau, C. and Cornille, V. and Gaudron, S. M.}, ' ... 
'year = {2018}, ' ...
'title = {Linking life-history traits, spatial distribution and abundance of two species of lugworms to bait collection: {A} case study for sustainable management plan}, ' ...
'journal = {Marine Environmental Research}, ' ...
'volume = {140}, ' ...
'pages = {433-443}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DeCuLefe2019'; type = 'Article'; bib = [ ... 
'author = {De Cubber, L. and Lefebvre, S. and Lancelot, T. and Denis, L. and Gaudron, S. M.}, ' ... 
'year = {2019}, ' ...
'title = {Annelid polychaetes experience metabolic acceleration as other {L}ophotrochozoans: inferences on the life cycle of \emph{Arenicola marina} with a {D}ynamic {E}nergy {B}udget model}, ' ...
'journal = {Ecological modelling}, ' ...
'volume = {}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
