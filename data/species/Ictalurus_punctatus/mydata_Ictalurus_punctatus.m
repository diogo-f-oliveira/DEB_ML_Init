function [data, auxData, metaData, txtData, weights] = mydata_Ictalurus_punctatus 

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Ictalurus_punctatus'; 
metaData.species_en = 'Channel catfish'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-JO'; 'T-dWw_f'; 'Ww-JO'; 'Ww-JO'; 't-N'; 'L-Ww'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Vaskar Nepal'};   
metaData.date_subm = [2017 04 20];  
metaData.email    = {'vnepalkc@vims.edu'}; 
metaData.address  = {'Virginia Institute of Marine Science, 23062, USA'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.vl'}; 
metaData.date_acc    = [2017 07 05]; 

%% set data
% zero-variate data;

data.ab = 13 + 5;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = {'Pawi2004','SakaIrwi2008'};
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.tp = 2.5 * 365;     units.tp = 'd';    label.tp = 'time since bith at puberty'; bibkey.tp = 'Grah1999'; 
  temp.tp = C2K(14.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'the earliest observed';
data.am = 24*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(14.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Reports of upto 40 year olds (Chapman: Farm-raised channel catfish); Grah1999 reports upto 23 years old from colder waters';

data.Lb  = 1.1;   units.Lb  = 'cm';	label.Lb  = 'total length at birth';    bibkey.Lb  = {'SakaIrwi2008'}; 
  comment.Lb = 'SakaIrwi2008: Linear regression of first three data points for pond';
data.Lp  = 33.8;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Grah1999';
  comment.Lp = 'Lots of variation';
data.Li  = 132;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 
  comment.Li = 'Might be too high; Hubert reports 90.2 cm';
  
data.Wwb = 0.004; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'TyusNiki1990'; 
  comment.Wwb = 'W at L = 1.1 cm';
data.Wwp = 527;   units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'TyusNiki1990'; 
  comment.Wwp = 'W at L = 33.8 cm';
data.Wwi = 26300; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

data.Ri = 64629/365;	units.Ri  = '#/d';    label.Ri  = 'maximum reprod rate';	bibkey.Ri  = 'JearBrow1971';   
temp.Ri = C2K(20);      units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'Hubert says 60000';
 
% uni-variate data


% time-length; Look at the catfish culture handbook figure 2.1; Also see chapter 3; especially fig. 3.1
data.tL = [ ...
  1	1	1	2	2	1	1	1	2	1	3	1	1	4	2	3	2	2	3	5	5	3	6	2	2	4	2	4	4	3	3	4	2	2	5	3	4	2	4	2	7	4	6	6	3	5	3	4	6	4	5	4	6	6	5	5	3	3	8	3	7	4	4	4	5	3	5	6	6	4	5	6	6	3	3	4	4	6	4	4	6	2	5	5	5	4	4	7	4	3	4	4	5	5	5	4	4	5	3	4	5	4	7	7	4	4	4	7	3	4	6	5	4	4	5	5	7	4	9	5	4	4	5	5	7	5	5	6	5	5	5	6	6	5	7	4	5	5	6	7	10	6	6	6	5	5	6	5	4	6	5	7	5	8	10	5	5	8	6	5	6	9	3	6	4	8	4	7	7	5	6	7	4	5	6	6	6	4	5	6	4	5	5	6	8	7	8	5	4	4	5	6	6	6	7	5	7	5	3	5	6	5	10	5	5	5	5	6	5	4	6	8	4	5	6	6	4	5	6	7	8	6	4	5	7	9	4	6	6	6	6	6	9	6	7	6	5	6	7	6	8	6	5	9	9	10	6	8	5	6	7	7	8	6	7	8	7	8	6	6	6	8	4	9	6	6	8	9	5	5	10	9	7	7	10	6	6	6	7	8	9	10	8	8	6	7	8	9	12	11	9	6	8	7	8	8	10	6	8	8	8	7	11	6	8	9;    % year, time since birth
  10.1	14.7	17	18.6	19.1	19.3	19.3	20.3	22.3	22.6	23	23.7	25.4	25.5	26.3	26.7	27.1	28.6	29.2	29.2	29.4	29.5	30.5	31	31.6	31.6	33	33.5	33.6	34	34	34.1	34.6	35	35	35.5	35.7	36	36	36.1	36.4	36.5	36.5	36.5	36.8	36.8	36.9	37	37.2	37.5	37.5	38	38	38	38.1	38.2	38.4	38.5	38.7	38.9	38.9	39	39	39.1	39.4	39.6	39.6	39.6	39.6	40	40	40	40.1	40.3	40.5	40.5	40.5	40.5	40.6	40.6	40.6	40.7	41	41	41	41.1	41.2	41.2	41.5	42	42	42	42	42.3	42.4	42.5	42.5	42.8	43	43	43	43.1	43.1	43.2	43.3	43.5	43.5	43.5	43.6	43.6	43.7	43.8	44	44	44	44.2	44.3	44.4	44.6	44.8	45	45	45	45	45	45.1	45.1	45.1	45.3	45.5	45.5	45.5	45.5	45.6	45.6	45.7	45.7	46	46	46	46	46.2	46.2	46.2	46.5	46.5	46.6	46.7	46.8	46.9	47	47	47.1	47.2	47.4	47.5	47.5	47.5	47.6	47.7	47.9	48	48.1	48.2	48.3	48.5	48.6	48.6	48.6	48.7	48.7	48.8	48.9	49	49	49	49.1	49.2	49.3	49.3	49.5	49.5	49.5	49.5	49.5	49.6	49.6	49.8	50	50	50	50	50	50	50	50.2	50.2	50.3	50.5	50.6	50.6	50.7	50.9	51	51	51	51	51.1	51.2	51.4	51.4	51.4	51.5	51.5	51.5	51.5	51.6	51.6	51.7	51.8	51.8	52	52.1	52.2	52.2	52.2	52.3	52.4	52.4	52.5	52.8	52.8	52.9	53	53	53.2	53.3	53.4	53.4	53.5	53.5	53.9	54	54	54	54	54.1	54.1	54.2	54.5	54.6	54.7	54.9	55	55	55	55.2	55.4	55.8	55.9	56	56	56.3	56.4	56.5	56.6	56.7	56.8	57	57.2	57.5	57.6	58	58	58	58.5	58.5	58.5	58.8	59	59.4	59.5	60	60.2	60.3	60.4	60.4	60.5	60.9	61	61.5	61.6	61.8	62	62.1	62.1	62.1	62.2	62.2	62.5	62.6	63.2	63.6	64	65.2	65.4]';  % cm, total length at age
data.tL(:, 1) = data.tL(:, 1) * 365; % Age in days
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  bibkey.tL = 'MoodMitc2015';
temp.tL    = C2K(14.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'time zero is start experiment; L(0) is a fixed parameter';

% length-weight
data.LWw = [ ...
  5	7.6	8.2	10	10.1	11.7	14.3	14.7	17	18.6	19.1	19.3	19.3	20.3	22.3	22.6	23	23.7	25.4	25.5	26.3	26.7	27.1	28.6	29.2	29.2	29.4	29.5	30.5	31	31.6	31.6	33	33.5	33.6	34	34	34.1	34.6	35	35	35.5	35.7	36	36	36.1	36.4	36.5	36.5	36.5	36.8	36.8	36.9	37	37.2	37.5	37.5	38	38	38	38.1	38.2	38.4	38.5	38.7	38.9	38.9	39	39	39.1	39.4	39.6	39.6	39.6	39.6	40	40	40	40.1	40.3	40.5	40.5	40.5	40.5	40.6	40.6	40.6	40.7	41	41	41	41.1	41.2	41.2	41.5	42	42	42	42	42.3	42.4	42.5	42.5	42.8	43	43	43	43.1	43.1	43.2	43.3	43.5	43.5	43.5	43.6	43.6	43.7	43.8	44	44	44	44.2	44.3	44.4	44.6	44.8	45	45	45	45	45	45.1	45.1	45.1	45.3	45.5	45.5	45.5	45.5	45.6	45.6	45.7	45.7	46	46	46	46	46.2	46.2	46.2	46.5	46.5	46.6	46.7	46.8	46.9	47	47	47.1	47.2	47.4	47.5	47.5	47.5	47.6	47.7	47.9	48	48.1	48.2	48.3	48.5	48.6	48.6	48.6	48.7	48.7	48.8	48.9	49	49	49	49.1	49.2	49.3	49.3	49.5	49.5	49.5	49.5	49.5	49.6	49.6	49.8	50	50	50	50	50	50	50	50.2	50.2	50.3	50.5	50.6	50.6	50.7	50.9	51	51	51	51	51.1	51.2	51.4	51.4	51.4	51.5	51.5	51.5	51.5	51.6	51.6	51.7	51.8	51.8	52	52.1	52.2	52.2	52.2	52.3	52.4	52.4	52.5	52.8	52.8	52.9	53	53	53.2	53.3	53.4	53.4	53.5	53.5	53.9	54	54	54	54	54.1	54.1	54.2	54.5	54.6	54.7	54.9	55	55	55	55.2	55.4	55.8	55.9	56	56	56.3	56.4	56.5	56.6	56.7	56.8	57	57.2	57.5	57.6	58	58	58	58.5	58.5	58.5	58.8	59	59.4	59.5	60	60.2	60.3	60.4	60.4	60.5	60.9	61	61.5	61.6	61.8	62	62.1	62.1	62.1	62.2	62.2	62.5	62.6	63.2	63.6	64	65.2	65.4;      % cm, total length for fish collected in wild
  2	4	5	9	12	17	31	43	59	52	43	100	91	115	100	74	96	102	130	134	190	150	140	165	190	206	228	200	220	230	250	210	300	350	327	300	310	300	390	350	258	350	350	360	336	350	516	480	380	390	385	402	350	430	440	462	470	470	412	475	447	437	500	460	472	436	506	413	420	390	581	516	450	480	571	541	640	424	716	488	526	450	540	606	550	550	530	550	539	540	630	540	620	655	560	550	640	722	570	624	685	570	620	650	505	657	620	611	650	750	726	724	784	790	760	850	833	714	623	770	853	700	590	887	818	665	720	780	745	800	795	773	1000	880	750	810	970	820	970	920	919	814	799	746	966	780	800	810	904	940	810	1030	860	1010	930	910	890	800	997	943	1085	880	1050	1070	1044	940	990	1040	1110	964	950	1180	1020	955	974	950	1030	950	1050	1143	1030	1496	970	1220	1054	1310	1100	1187	1235	952	1360	1024	1225	1260	997	1130	1000	940	1100	1300	1140	1050	1060	1155	1401	1180	1390	1076	1480	1010	1132	1292	1400	1430	1500	1054	1310	1210	1398	1050	1154	1250	1535	1350	1470	1480	1442	1300	1255	1400	1550	1220	1400	1119	1282	1455	1400	1550	1800	1740	1326	1320	1340	1450	1350	1840	1710	1650	1400	1640	1863	1908	1300	1900	1229	1460	1400	1560	1610	1560	1555	1140	1900	1990	1485	1680	1800	1550	1655	1910	1780	1950	1890	1980	1750	2131	1750	2440	1690	1690	2250	1850	2000	2420	2250	2400	1747	1860	2040	2570	1980	2430	2600	2314	2220	2100	2670	2400	2200	2300	2535	2550	3890	2350	2390	2580	2460	2470	2250	2560	2600	3000]';   % g, wet weights
units.LWw = {'cm', 'g'};   label.LWw = {'fork length', 'wet weights'};  bibkey.LWw = 'MoodMitc2015';

% time-fecundity
data.tN = [...
  1	2   3	4	5	6	7	8	9; % time since birth (yr)
  0 0 9700 11100 18100 30900 35800 37000 36400]'; % # of eggs per yr
data.tN(:,1) = data.tN(:,1) * 365; % Age in days
units.tN  = {'d', '#'};  label.tN = {'time since birth', 'fecundity'};  
temp.tN   = C2K(14.5); units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'RaibJahn1991';

% O2 consumption at different temperatures for a 1 pound fish
% one hour after feeding ad libitum, so f = 1?
data.TJO_1  = [24 26 28 30; 
0.399 0.468 0.537 0.557]';
units.TJO_1  = {'C', 'mg O_2/h.g'};  label.TJO_1 = {'temperature', 'spec O_2 consumption', '1h starve'};  bibkey.TJO_1 = 'AndrMats1975';
% 24 hours after feeding ad libitum, so f = 0?
data.TJO_0  = [24 26 28 30;
0.256 0.327 0.399 0.464]';
units.TJO_0  = {'C', 'mg O_2/h.g'};  label.TJO_0 = {'temperature', 'spec O_2 consumption', '24h starve'};  bibkey.TJO_0 = 'AndrMats1975';
%
% O2 consumption for fish of different weights; Figure 2
% one hour after feeding ad libitum
data.WwJO_1  = [3.135 26.818 50.006 101.295 202.23 504.994 988.435; 
1.224 0.838 0.736 0.623 0.511 0.425 0.398]';
units.WwJO_1  = {'g', 'mg O_2/h.g'};  label.WwJO_1 = {'wet weight', 'spec O_2 consumption', '1h starve'}; 
temp.WwJO_1   = C2K(26); units.temp.WwJO_1 = 'K'; label.temp.WwJO_1 = 'temperature';
bibkey.WwJO_1 = 'AndrMats1975';
% 24 hours after feeding ad libitum
data.WwJO_0  = [3.077 26.978 48.866 101.412 205.405 512.828 1013.967; 
0.86 0.545 0.447 0.393 0.345 0.309 0.249]';
units.WwJO_0  = {'g', 'mg O_2/h.g'};  label.WwJO_0 = {'wet weight', 'spec O_2 consumption', '24h starve'}; 
temp.WwJO_0   = C2K(26); units.temp.WwJO_0 = 'K'; label.temp.WwJO_0 = 'temperature';
bibkey.WwJO_0 = 'AndrMats1975';

% Average percent weight gain in 12 weeks for 4-gram fish at different temperatures; Figure 1
% Fed 6% of body weight
data.TPer_6  = [18	22	26	30	34;
53.401	129.985	339.588	644.962	435.354]';
data.TPer_6(:,2) = data.TPer_6(:,2)/100; % convert percent to fraction
units.TPer_6  = {'C', '-'};  label.TPer_6 = {'temperature', 'fraction weight increase', '6% of body weight/d'};
bibkey.TPer_6 = 'AndrStic1972';
% Fed 4% of body weight
data.TPer_4  = [18	22	26	30	34;
98.477	210.004	410.578	523.24	336.189]';
data.TPer_4(:,2) = data.TPer_4(:,2)/100; % convert percent to fraction
units.TPer_4  = {'C', '-'};  label.TPer_4 = {'temperature', 'fraction weight increase', '4% of body weight/d'};
bibkey.TPer_4 = 'AndrStic1972';
% Fed 2% of body weight
data.TPer_2  = [18	22	26	30	34;
81.576	158.175	170.552	243.816	170.548]';
data.TPer_2(:,2) = data.TPer_2(:,2)/100; % convert percent to fraction
units.TPer_2  = {'C', '-'};  label.TPer_2 = {'temperature', 'fraction weight increase', '2% of body weight/d'};
bibkey.TPer_2 = 'AndrStic1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 5 * weights.tp;
weights.Wwp = 5 * weights.Wwp;
weights.Wwb = 5 * weights.Wwb;
weights.tL = 5 * weights.tL;
weights.WwJO_0 = 0.5 * weights.WwJO_0;
weights.TJO_0 = 0.5 * weights.TJO_0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'TPer_6','TPer_4','TPer_2'}; subtitle1 = {'Fed daily 6, 4, 2% of body weight'};
set2 = {'TJO_0','TJO_1'}; subtitle2 = {'Starving for 1, 24 h'};
set3 = {'WwJO_0','WwJO_1'}; subtitle3 = {'Starving for 1, 24 h'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = '24 hrs may not be enough for all food to assimilate and digest; so may want to provide lower weight for this';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Nothing yet';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3PB88'; % Cat of Life
metaData.links.id_ITIS = '163998'; % ITIS
metaData.links.id_EoL = '204762'; % Ency of Life
metaData.links.id_Wiki = 'Ictalurus_punctatus'; % Wikipedia
metaData.links.id_ADW = 'Ictalurus_punctatus'; % ADW
metaData.links.id_Taxo = '44004'; % Taxonomicon
metaData.links.id_WoRMS = '465537'; % WoRMS
metaData.links.id_fishbase = 'Ictalurus-punctatus'; % fishbase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Channel_catfish}},'...
'note = {Accessed : 2017-04-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SakaIrwi2008'; type = 'Article'; bib = [ ... 
	'title = {Validation of Daily Ring Deposition in the Otoliths of Age-0 Channel Catfish},'...
	'volume = {28},'...
	'doi = {10.1577/M06-176.1},'...
	'journal = {North American Journal of Fisheries Management},'...
	'author = {Sakaris, Peter C. and Irwin, Elise R.},'...
	'month = feb,'...
	'year = {2008},'...
	'pages = {212--218}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SakaIrwi2008'; type = 'Article'; bib = [ ... 
	'title = {Validation of Daily Ring Deposition in the Otoliths of Age-0 Channel Catfish},'...
	'volume = {28},'...
	'doi = {10.1577/M06-176.1},'...
	'journal = {North American Journal of Fisheries Management},'...
	'author = {Sakaris, Peter C. and Irwin, Elise R.},'...
	'month = feb,'...
	'year = {2008},'...
	'pages = {212--218}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JearBrow1971'; type = 'Article'; bib = [ ... 
	'title = {Fecundity, age and growth and condition of channel catfish in an {O}klahoma Reservoir},'...
	'volume = {51},'...
	'journal = {Proceedings of the Oklahoma Academy of Science},'...
	'author = {Jearald, A. and Brown. B.E.},'...
	'year = {1971},'...
	'pages = {15--22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrStic1972'; type = 'Article'; bib = [ ... 
	'title = {Interactions of Feeding Rates and Environmental Temperature on Growth, Food Conversion, and Body Composition of Channel Catfish},'...
	'volume = {101},'...
	'urldate = {2017-04-20},'...
	'journal = {Transactions of the American Fisheries Society},'...
	'author = {Andrews, James W. and Stickney, Robert R.},'...
	'month = jan,'...
	'year = {1972},'...
	'pages = {94--99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndrMats1975'; type = 'Article'; bib = [ ... 
	'title = {The Influence of Various Culture Conditions on the Oxygen Consumption of Channel Catfish},'...
	'volume = {104},'...
	'journal = {Transactions of the American Fisheries Society},'...
	'author = {Andrews, James W. and Matsuda, Yoshiaki},'...
	'year = {1975},'...
	'pages = {322--327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RaibJahn1991'; type = 'Article'; bib = [ ... 
	'title = {Characteristics of Commercially Harvested Channel Catfish From Areas of the {M}ississippi {R}iver Along {I}llinois: Commercial Harvest and the 15.0-- in Minimum Length Limit},'...
	'volume = {6},'...
	'journal = {Journal of Freshwater Ecology},'...
	'author = {Raibley, Paul T. and Jahn, Larry A.},'...
	'year = {1991},'...
	'pages = {363--376}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2017}, ' ...
'howpublished = {\url{http://www.fishbase.org/summary/290}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TyusNiki1990'; type = 'Article'; bib = [ ... 
	'title = {Abundance, Growth, and Diet of Channel Catfish, \emph{Ictalurus punctatus}, in the {G}reen and {Y}ampa {R}ivers, {C}olorado and {U}tah},'...
	'volume = {35},'...
	'url = {http://www.jstor.org/stable/3671541},'...
	'urldate = {2017-04-21},'...
	'journal = {The Southwestern Naturalist},'...
	'author = {Tyus, H. M. and Nikirk, N. J.},'...
	'year = {1990},'...
	'pages = {188--198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pawi2004'; type = 'phdthesis'; bib = [ ... 
	'title = {Temperature effects on spawning and fingerling production of channel catfish \emph{Ictalurus punctatus}},'...
	'url = {https://digitalcommons.lsu.edu/gradschool_theses/122/},'...
	'urldate = {2017-04-18},'...
	'school = {Louisiana State University},'...
	'author = {Pawiroredjo, P. A.},'...
	'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grah1999'; type = 'Inproceedings'; bib = [ ... 
'title = {A review of the biology and management of blue catfish},'...
  'author = {Graham, K. and Irwin, E. R. and Hubert, W. A. and Rabeni, C. F.},'...
  'booktitle = {Catfish 2000: proceedings of the international ictalurid symposium},'...
  'institution = {American Fisheries Society, Symposium}, ' ...
  'volume = {24},'...
  'pages = {37--49}, ' ...
  'year = {1999}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoodMitc2015'; type = 'Misc'; bib = [ ...
'author = {Cassi Moody-Carpentera and Zachary Mitchell and Robert Colombo}, ' ...
'year = {2015}, ' ...
'howpublished = {Unpublished data from Wabash River, Eastern Illinois University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
