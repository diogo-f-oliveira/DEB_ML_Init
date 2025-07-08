function [data, auxData, metaData, txtData, weights] = mydata_Pomatoschistus_minutus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Pomatoschistus_minutus'; 
metaData.species_en = 'Sand goby'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jFe', 'jiMcd', 'jiMi'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww_f'; 'L-N'; 'T-JO_f'; 'T-ab'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Dina Lika', 'Vania Freitas'};    
metaData.date_subm = [2010 09 01];              
metaData.email    = {'lika@biology.uoc.gr'};            
metaData.address  = {'University of Crete'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15];


%% set data
% zero-variate data

data.ab = 12;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Fond1973';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '10 C is mean annual temperature in Atlantic estuarine waters';
data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BoucQuig1990';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 730;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'BoucQuig1990';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '2 yr BoucQuig1990';
  
data.Lb  = 0.25;units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'BoucQuig1990';  
data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'BoucQuig1990'; 
data.Li  = 8.2;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'BoucQuig1990';
  comment.Li = 'based on LW1 data';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'FondBuur1974';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm: pi/6*0.108*0.07^2';
data.Wwp = 0.4;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'BoucQuig1990';
  comment.Wwp = 'from L-W relationship at Lp';
data.Wwi = 5.72;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'BoucQuig1990';
  comment.Wwi = 'based on LW1 data';

data.Ri  = 14;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Frei2010';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = ['for 90mm female and per spawning act (which can vary from 2-12); the duration of the spawning season is 4-5 months; ' ...
      'fisbase gives a yearly fecundity of 5200-5600, which is about the same'];

% other 0-variate data
% calorific content of P.minutus tissues = 4.81 cal/mg Dry Weight (excluding guts and gonads, from Healey 1972)
% egg size: length=1.08 mm, width=0.70mm (Fonds & van Buurt 74) 
% egg size: Length= 1.15mm, width=0.68mm
% GI_Females: 13 ( %, Atlantic, values increase from December until max values in April, Hest1977)
% GI_Males: 2 ( %, Atlantic, values increase from December until max values in April, Hest1977)
% GI_2_Females: 20 (%, Mediterranean,values increase from October until max value in February; BoucQuig1990)
% GI_2_Males: 1(%, Mediterranean,values increase from November until max value in January; BoucQuig1990)

% uni-variate data
% TOR1  data from DoorTwis1987 after FondVeld1973 (Fig. 2) 
%  oxygen consumption rate at Rest [mgO2/day * W^0.8] vs Temperature 
TOR1 = [ ... %  C, mgO2 
	5	1.379;
	10	2.367;
	15	2.924;
	20	4.715;
	25	7.662];
% comment Bas Kooijman: units are not clear, individuals of unknown size
 
% TO2R data for Oxygen consumption (FondVeld1973, Fig 4)
%  oxygen consumption (mg O2 per day) at Rest vs Temperature
TOR2 = [ ... %  C, mgO2 
5	1.604;
5	1.603;
6	2.491;
7	2.166;
8	2.283;
10	2.358;
10	2.196;
10	3.167;
12	3.525;
13	3.482;
14	4.248;
15	3.233;
15	4.081;
17	5.047;
20	6.093;
21	6.533;
22	6.935;
24	8.226;
25	9.071;
25	7.331;
25	6.967;
20	4.796;
20	4.027;
10	2.196;
15	2.828;
15	3.233];
% comment Bas Kooijman: units are not clear, individuals of unknown size

% Temp - oxygen consumption (FondVeld1973, Fig 4)
%  oxygen consumption (mg O2 per day) at forced swimming, Unfed individuals vs Temperature
TOS = [ ... %  C, mgO2 
5	5.691;
6	5.891;
6	6.296;
7	6.54;
10	8.02;
10	7.42;
12	7.86;
14	9.27;
15	10.96;
15	11.33;
15	11.29;
16	11.2;
17	12.86;
17	12.49;
20	13.34;
20	14.39;
20	14.11;
21	14.63;
22	13.57;
23	15.23;
25	16.84;
25	15.02];
% comment Bas Kooijman: units are not clear, individuals of unknown size
 
% TO2 data from Penn 1969 (unpubl. report) (Fig. 10) 
%  oxygen consumption rate [mgO2/h] vs Temperature for a 1 g fish
data.TJO  = [ ... % C, mgO2 
5	0.0349;
5.7	0.0441;
10  0.0557;
15	0.0813;
20	0.1053;
25	0.1028];
data.TJO(:,2) = data.TJO(:,2) * 24;   % convert to mg/h to mg/d
units.TJO   = {'C', 'mg O2/d'};  label.TJO = {'temperature','O2 consumption'};  
bibkey.TJO = 'Penn1969';
comment.TJO = '1 g fish';

% Tab data from Fond1973 (Fig. x)
% Egg development time at various temperatures
data.Tab =[ ... % C, d
		      10	20;
		      10	18;
		      10	14;
		      12	11;
		      12	12;
		      12	13;
		      14	9;
		      15	9;
		      16	8;
		      16	7;
		      18	8;
		      18	8;
		      18	7;
		      18	6;
		      20	6;
		      20	5;
		      21	5;
		      22	4;
		      22	7];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature','age at birth'};  
bibkey.Tab = 'Fond1973';
 
% LW1 data from BoucQuig1989 (Fig. 13)
% Lenght-weight relationships for P. minutus, sexes combined
data.LW1 = [ ... % cm, g
		      2.5	0.08;
		      3.0	0.17;
		      3.5	0.30;
		      4.0	0.49;
		      4.6	0.71;
		      5.0	1.05;
		      5.5	1.41;
		      6.0	1.90;
		      6.5	2.50;
		      7.0	3.20;
		      7.5	4.09;
		      7.9	5.08;
		      8.2	5.72];
units.LW1 = {'cm', 'g'};     label.LW1 = {'total length', 'wet weight', 'BoucQuig1989'};  
bibkey.LW1 = 'BoucQuig1989';

% LW2 data from Norway (own data, 2005 and 2006)
% Lenght-(wet)weight relationships for P. minutus, sexes combined
data.LW2 =[ ... % mm, g
52	0.944;
50	0.862;
27	0.126;
22	0.056;
29	0.156;
21	0.059;
21	0.109;
19	0.035;
21	0.048;
26	0.097;
23	0.066;
22	0.058;
27	0.123;
27	0.116;
24	0.08;
28	0.126;
22	0.056;
23	0.059;
24	0.083;
24	0.073;
22	0.062;
21	0.048;
23	0.067;
21	0.044;
21	0.048;
27	0.127;
25	0.092;
22	0.057;
19	0.029;
25	0.071;
27	0.108;
28	0.121;
25	0.08;
25	0.084;
25	0.066;
24	0.067;
23	0.061;
26	0.096;
25	0.077;
22	0.053;
24	0.071;
23	0.069;
25	0.077;
24	0.075;
16	0.015;
20	0.038;
61	1.413;
53	1.013;
55	1.099;
59	1.372;
63	1.769;
49	0.872;
20	0.043;
54	0.839;
47	0.653;
27	0.116;
25	0.074;
21	0.041;
23	0.063;
24	0.069;
22	0.057;
24	0.073;
22	0.054;
20	0.049;
51	0.952;
57	1.274;
25	0.073;
27	0.115;
22	0.054;
23	0.052;
23	0.05;
20	0.035;
23	0.073;
23	0.049;
23	0.063;
31	0.151;
62	1.588;
19	0.038;
33	0.199;
24	0.07;
25	0.083;
22	0.05;
23	0.068;
29	0.142;
27	0.075;
26	0.092;
25	0.081;
20	0.026;
25	0.035;
23	0.065;
27	0.11;
21	0.047;
26	0.091;
27	0.131;
27	0.124;
25	0.055;
19	0.028;
31	0.118;
22	0.042;
33	0.186;
21	0.05;
25	0.078;
28	0.102;
24	0.063;
30	0.123;
26	0.098;
24	0.127;
34	0.149;
35	0.24;
27	0.078;
25	0.049;
32	0.181;
24	0.053;
21	0.032;
27	0.07;
26	0.094;
27	0.085;
32	0.108;
30	0.122;
34	0.262;
35	0.231;
35	0.163;
29	0.105;
28	0.095;
21	0.037;
22	0.035;
25	0.059;
23	0.045;
21	0.205;
32	0.141;
28	0.152;
29	0.062;
36	0.148;
20	0.042;
25	0.085;
23	0.052;
24	0.061;
25	0.076;
27	0.087;
30	0.159;
23	0.065;
31	0.147;
25	0.083;
21	0.043;
35	0.256;
26	0.102;
55	1.056;
59	1.59;
31	0.143;
32	0.211;
34	0.267;
20	0.036;
53	1.154;
35	0.277;
23	0.052;
30	0.089;
27	0.078;
35	0.269;
21	0.041;
31	0.165;
32	0.162;
32	0.17;
32	0.157;
33	0.256;
32	0.156;
62	2.151;
21	0.034;
21	0.046;
21	0.036;
27	0.083;
22	0.085;
23	0.056;
28	0.082;
23	0.05;
27	0.063;
20	0.034;
25	0.049;
26	0.064;
30	0.141;
28	0.075;
29	0.104;
26	0.088;
27	0.091;
28	0.103;
32	0.186;
30	0.145;
32	0.107;
34	0.209;
32	0.153;
31	0.144;
28	0.088;
31	0.146;
30	0.158;
35	0.273;
31	0.168;
42	0.243;
38	0.321;
35	0.213;
35	0.24;
35	0.228;
42	0.537;
41	0.455;
37	0.296;
40	0.317;
39	0.369;
34	0.221;
41	0.442;
41	0.475;
28	0.334;
20	0.036;
24	0.039;
27	0.099;
26	0.102;
29	0.125;
31	0.179;
28	0.122;
30	0.17;
33	0.221;
30	0.163;
32	0.206;
32	0.2;
36	0.285;
37	0.309;
37	0.309;
35	0.263;
37	0.365;
44	0.543;
38	0.36;
36	0.279;
36	0.24;
38	0.346;
36	0.302;
41	0.478;
41	0.479;
42	0.549;
46	0.709;
33	0.179;
35	0.178;
38	0.374;
39	0.34;
40	0.424;
40	0.418;
35	0.188;
24	0.078;
34	0.239;
37	0.316;
42	0.401;
33	0.2;
37	0.252;
38	0.317;
29	0.089;
31	0.151;
27	0.106;
36	0.262;
25	0.076;
25	0.056;
25	0.052;
26	0.067;
29	0.117;
25	0.06;
25	0.051;
26	0.082;
26	0.081;
30	0.131;
22	0.034;
31	0.102;
21	0.051;
32	0.11;
34	0.2;
34	0.217;
41	0.369;
38	0.356;
37	0.31;
41	0.372;
41	0.441;
23	0.062;
26	0.089;
31	0.168;
31	0.153;
31	0.203;
30	0.162;
30	0.132;
31	0.176;
37	0.264;
38	0.32;
37	0.344;
40	0.397;
37	0.321;
39	0.383;
39	0.312;
35	0.241;
40	0.453;
47	0.624;
47	0.706;
33	0.208;
35	0.241;
34	0.262;
37	0.306;
37	0.337;
42	0.496;
42	0.514;
27	0.088;
31	0.145;
30	0.163;
36	0.296;
39	0.313;
42	0.471;
42	0.513;
42	0.45;
40	0.391;
46	0.811;
24	0.072;
27	0.105;
29	0.131;
24	0.082;
30	0.16;
30	0.144;
22	0.065;
26	0.097;
26	0.088;
32	0.18;
32	0.208;
30	0.16;
35	0.262;
37	0.372;
32	0.222;
30	0.18;
39	0.335;
40	0.365;
42	0.472;
33	0.202;
39	0.388;
35	0.29;
30	0.206;
28	0.131;
29	0.154;
36	0.303;
34	0.25;
29	0.14;
28	0.129;
29	0.15;
32	0.181;
29	0.15;
32	0.237;
28	0.151;
42	0.368;
41	0.432;
25	0.092;
33	0.204;
37	0.297;
35	0.294;
40	0.407;
34	0.248;
38	0.301;
37	0.254;
34	0.23;
43	0.48;
37	0.353;
35	0.282;
37	0.333;
21	0.068;
30	0.187;
40	0.485;
47	0.802;
25	0.086;
26	0.089;
28	0.102;
28	0.111;
29	0.129;
28	0.118;
37	0.339;
25	0.078;
42	0.477;
34	0.254;
45	0.615;
35	0.256;
44	0.583;
34	0.234;
33	0.194;
43	0.505;
51	0.876;
33	0.246;
60	1.788;
54	1.182;
46	0.727;
42	0.395;
46	0.725;
37	0.321;
67	1.615;
51	0.73;
53	0.99;
66	2.04;
47	0.43;
42	0.49;
37	0.27;
64	1.81;
65	2.65;
72	3.08;
36	0.26;
42	0.48;
48	0.78;
55	0.99;
72	2.88;
72	2.88;
39	0.479;
32	0.217;
41	0.505;
60	1.865;
58	1.542;
35	0.262;
41	0.399;
36	0.265;
40	0.4;
37	0.37;
41	0.39;
39	0.33;
67	1.91;
51	0.93;
40	0.33;
48	0.65;
36	0.27;
42	0.48;
71	2.24;
43	0.55;
42	0.48;
69	1.96;
70	2.96;
50	0.65;
47	0.69;
41	0.44;
64	1.803;
58	1.476;
56	1.17;
22	0.059;
47	0.751;
40	0.487;
48	0.761;
57	1.232;
45	0.678;
43	0.594;
44	0.566;
44	0.71;
42	0.53;
49	0.815;
47	0.686;
67	2.17;
52	0.962;
48	0.776;
44	0.622;
63	2.083;
44	0.573;
44	0.658;
44	0.623;
49	0.849;
43	0.521;
51	0.919;
49	0.759;
52	0.949;
46	0.66;
68	1.548;
54	1.08;
48	0.741;
42	0.518];
data.LW2(:,1) = data.LW2(:,1)/ 10; % convert mm to cm
units.LW2 = {'cm', 'g'};     label.LW2 = {'total length', 'wet weight', 'Frei2010'};  
bibkey.LW2 = 'Frei2010';

% Length-time curves from the field (Dutch wadden sea) for 0-group (Van der Gaas 1977, internal NIOZ report, Fig 15)
% Lt length (cm), time (day of the year), July to beg November, 16 C average temp for this period
data.tL = [... %  day of the yr (#), total length (cm)
	180 2.33 ;
    240 4.41 ;
	270 5.28;
    300 5.60 ;
	330 5.61];
data.tL(:,1) = data.tL(:,1) - 120; % convert time of the year to time since birth at 1st of May
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gaas1977';
comment.tL = 'Although mean water temp from July to early Nov is 16 C, the actual temp is taken higher, since these fish occur in very shallow water';

% Absolute (mean) Fecundity as function of body length from BoucQuig1990 (Table5, in Mediterranean)
% LR length [cm], total fecundity (number ovocytes)
data.LN =[... % cm, # ovocytes
4.7	1173;
4.9	1314;
5.1	1762;
5.3	2073;
5.5	2526;
5.7	2637;
5.9	2599;
6.1	2862;
6.3	3217;
6.5	3263;
6.7	3374;
6.9	3514;
7.1	4541;
7.3	5100];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN    = C2K(17);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BoucQuig1990';
comment.LN = 'Temp is guessed';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tp = 0 * weights.tp;
weights.Lb = 0 * weights.Lb;
weights.Wwi = 10 * weights.Wwi;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW1','LW2'}; subtitle1 = {'Data from BoucQuig1989, Frei2010'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Bas Kooijman: The 0-var data point (ap, Lp) = (365,4) is inconsistent with dataset tL';
D2 = 'mod_1: Wwb data changed, ap and lb data ignorned, temp for tL data is taken higher';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4LQXK'; % Cat of Life
metaData.links.id_ITIS = '171978'; % ITIS
metaData.links.id_EoL = '46575291'; % Ency of Life
metaData.links.id_Wiki = 'Pomatoschistus_minutus'; % Wikipedia
metaData.links.id_ADW = 'Pomatoschistus_minutus'; % ADW
metaData.links.id_Taxo = '46609'; % Taxonomicon
metaData.links.id_WoRMS = '126928'; % WoRMS
metaData.links.id_fishbase = 'Pomatoschistus-minutus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomatoschistus_minutus}}';
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
bibkey = 'BoucJoye1989'; type = 'Article'; bib = [ ... 
'author = {Bouchereau, J. L. and Joyeux, J. C. and Tomasini, J. A. and Quignard, J. P.}, ' ... 
'year = {1989}, ' ...
'title = {Cycle sexual, f\''{e}condit\''{e}s et condition de \emph{Pomatoschistus microps} ({K}royer, 1938) ({G}obiides) dans la {L}agune de {M}auguio - {F}rance}, ' ...
'journal = {Bulletin de ecologie}, ' ...
'volume = {20}, ' ...
'pages = {193--202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoucQuig1990'; type = 'Article'; bib = [ ... 
'author = {Bouchereau, J. L. and Quignard, J. P. and Tomansi, J. A. and Capape, C.}, ' ... 
'year = {1990}, ' ...
'title = {Sexual cycle, condition, fecundity and spawning of \emph{Pomatoschistus minutus} ({P}allas, 1770) ({G}obiidae), from the {G}ulf of {L}ion, {F}rance}, ' ...
'journal = {Cybium}, ' ...
'volume = {14}, ' ...
'pages = {251--267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoucQuig1989'; type = 'Article'; bib = [ ... 
'author = {Bouchereau, J. L. and Quignard, J. P. and Tomansi, J. A. and Joyeux, J. C. and Capape, C.}, ' ... 
'year = {1989}, ' ...
'title = {La population de \emph{Pomatoschistus minutus} ({P}allas, 1770) de la {L}agune de {M}auguio, {F}rance.}, ' ...
'journal = {Cah. Biol. Mar.}, ' ...
'volume = {30}, ' ...
'pages = {487--514}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DoorTwis1987'; type = 'Article'; bib = [ ... 
'author = {Doornbos, G. and Twisk, F.}, ' ... 
'year = {1987}, ' ...
'title = {Density, growth and annual food consumption of gobiid fish in the saline {L}ake {G}revelingen, the {N}etherlands.}, ' ...
'journal = {Netherlands Journal of Sea Research}, ' ...
'volume = {21}, ' ...
'pages = {45--74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FondBuur1974'; type = 'Article'; bib = [ ... 
'author = {Fonds, M. and van Buurt, G.}, ' ... 
'year = {1974}, ' ...
'title = {The influence of temperature and salinity on the development and survival of goby eggs ({P}isces, {G}obiidae)}, ' ...
'journal = {Hydrobiological Bulleting (Amsterdam)}, ' ...
'volume = {8}, ' ...
'pages = {110--116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FondVeld1973'; type = 'Article'; bib = [ ... 
'author = {Fonds, M. and Veldhuis, C.}, ' ... 
'year = {1973}, ' ...
'title = {The oxygen consumption of four \emph{Pomatoschistus} species ({P}isces, {G}obiidae) in relation to water temperature}, ' ...
'journal = {Netherlands Journal of Sea Research}, ' ...
'volume = {7}, ' ...
'pages = {376--386}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fond1973'; type = 'Article'; bib = [ ... 
'author = {Fonds, M.}, ' ... 
'year = {1973}, ' ...
'title = {Sand gobies in the {D}utch {W}adden {S}ea (\emph{Pomatoschistus}, {G}obiidae, {P}isces)}, ' ...
'journal = {Netherlands Journal of Sea Research}, ' ...
'volume = {6}, ' ...
'pages = {417--478}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Heal1972'; type = 'Article'; bib = [ ... 
'author = {Healey, M. C.}, ' ... 
'year = {1972}, ' ...
'title = {On the population ecology of the common goby in the {Y}than estuary.}, ' ...
'journal = {Journal of Natural History}, ' ...
'volume = {6}, ' ...
'pages = {133-145}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hest1977'; type = 'Article'; bib = [ ... 
'author = {Hesthagen, I. H.}, ' ... 
'year = {1977}, ' ...
'title = {Migration, breeding, and growth in \emph{Pomatoschistus minutus} ({P}ALLAS) ({P}isces, {G}obiidae) in {O}slofjorden}, ' ...
'journal = {Sarsia}, ' ...
'volume = {63}, ' ...
'pages = {17--26}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PampBouc2000'; type = 'Article'; bib = [ ... 
'author = {Pampoulie, C. and Bouchereau, J. L. and Rosecchi, E. and Poizat, G. and Crivelli, A. J.}, ' ... 
'year = {2000}, ' ...
'title = {Annual variations in the reproductive traits of \emph{Pomatoschistus microps} in a {M}editerranean lagoon undergoing environmental changes: evidence of phenotypic plasticity}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {57}, ' ...
'pages = {1441--1452}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Penn1969'; type = 'Article'; bib = [ ... 
'author = {Penning de Vries, F. W. T.}, ' ... 
'year = {1969}, ' ...
'title = {Enige metingen over het standaard metabolism en het actief metabolism bij {G}obiidae}, ' ...
'journal = {Int. Rep. Neth. Inst. Sea Res.}, ' ...
'number = {2}, '...
'volume = {1969}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Beek1976'; type = 'Article'; bib = [ ... 
'author = {Van Beek, F. A.}, ' ... 
'year = {1976}, ' ...
'title = {Aantallen, verdeling, groei en voedselopname van twee grondelsoorten op het {B}algzand in 1975 en 1976}, ' ...
'journal = {Int. Rep. Neth. Inst. Sea Res.}, ' ...
'volume = {1976}, ' ...
'number = {9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gaas1977'; type = 'Techreport'; bib = [ ... 
'author = {Gaas, van der}, ' ... 
'year = {1977}, ' ...
'Institution = {NIOZ}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Frei2010'; type = 'Misc'; bib = [ ...
'author = {Vania Freitas}, ' ...
'year = {2010}, ' ...
'note = {own data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Penn1969a'; type = 'Misc'; bib = [...
'author = {Penn}, ' ... 
'year = {1969}, ' ...
'note = {unpublished report}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
