function [data, auxData, metaData, txtData, weights] = mydata_Odobenus_rosmarus_rosmarus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Odobenidae';
metaData.species    = 'Odobenus_rosmarus_rosmarus'; 
metaData.species_en = 'Atlantic walrus'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MN', 'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, MeleRodr2015 table 1
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine','Ana Sofia Aniceto'};    
metaData.date_subm = [2016 12 05];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 12 05];

%% set data
% zero-variate data

data.tg = 15*30;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'ADW';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'AnAge says 331 days';
data.tx = 730;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '12 to 36 months AWD';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'ADW';
  temp.tp = C2K(36.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'females, 5 to 7 years AWD';
data.tpm = 7*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty';           bibkey.tpm = 'ADW';
  temp.tpm = C2K(36.2);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tp = 'males, 7 to 10 years AWD';
data.am = 40 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
comment.am = 'In the wild, walrus have been estimated to live over 40 years';

data.Lb  = 120;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'ADW';  
data.Li  = 270;   units.Li  = 'cm';  label.Li  = 'ultimate length fem.';   bibkey.Li  = 'ADW';
data.Lim  = 320;   units.Lim  = 'cm';  label.Lim  = 'ultimate length male';   bibkey.Lim  = 'ADW';

data.Wwb = 60e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 200e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 850e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'ADW';
data.Wwim = 1500e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'ADW';

data.Ri  = 1/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
temp.Ri = C2K(36.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'Walruses breed once every 2 to 3 years.';

% uni-variate data
% t-L data

% females
data.tL = [ ... standard length (cm) age (years)
0.199	0.092	0.198	1.128	2.101	3.116	4.190	5.121	4.102	4.100	4.097	6.121	6.118	7.051	7.131	8.067	9.087	9.138	9.105	9.128	10.114	11.128	11.137	11.059	10.074	10.104	11.094	11.070	11.093	12.146	12.035	12.143	12.109	12.081	12.079	12.103	12.074	12.128	12.126	13.043	13.041	13.039	13.037	13.059	14.056	14.050	14.092	15.050	15.045	15.016	15.014	15.066	16.039	16.008	16.005	18.042	18.094	18.008	18.088	17.016	17.040	19.953	22.121	24.070	25.085	26.052;
120.913	130.491	117.722	192.866	227.938	228.256	237.793	230.668	221.129	214.037	204.463	268.575	258.292	257.195	249.391	258.932	272.371	261.731	245.065	230.525	223.398	219.816	246.766	258.826	270.917	278.363	284.002	292.159	279.392	311.269	307.727	300.631	282.547	279.357	274.038	263.044	259.144	254.533	249.213	284.642	278.614	272.585	264.075	249.535	276.095	257.301	301.626	294.500	278.897	275.352	266.842	258.684	295.529	285.955	277.799	294.039	286.590	274.537	266.733	264.288	253.649	262.766	261.625	263.684	260.811	280.989
    ]';  % cm, total length at f and T
data.tL(:,1) = data.tL(:,1) * 365; % transform to days
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'female'};  
temp.tL    = C2K(36.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GarlStew1998'; comment.tL = 'fig. 1 B';
comment.tL = 'Data for females';

% males
data.tLm = [ ... standard length (cm) age (years)
0.143	0.191	1.113	1.122	3.036	3.034	6.126	5.084	5.087	5.090	4.045	4.007	6.041	7.134	7.143	7.100	6.056	7.152	8.056	8.054	9.099	10.058	10.062	10.019	11.013	12.110	12.105	12.012	13.057	13.008	14.055	13.020	13.023	14.021	13.972	14.107	13.969	15.006	16.006	17.964	15.067	15.018	15.060	16.017	16.060	16.023	17.070	17.020	17.018	17.060	18.025	18.065	19.020	19.063	20.024	19.976	19.974	20.014	21.020	21.019	21.017	21.061	22.027	21.980	22.065	22.061	22.014	23.112	23.063	23.013	24.055	25.978	25.021	25.109	25.062	26.015	28.019	29.068	30.069	30.112	33.154;
119.367	129.932	172.742	202.683	216.677	211.980	215.347	225.380	237.122	245.341	246.568	272.401	233.551	241.128	272.243	279.290	285.214	299.836	283.352	278.068	275.667	291.470	302.038	310.846	290.835	311.328	294.890	289.024	286.623	273.709	281.289	314.805	324.785	319.451	305.363	301.247	295.383	269.499	267.101	280.505	318.811	307.072	295.915	305.848	297.626	325.221	329.278	315.778	307.559	296.989	330.404	312.203	315.090	307.456	329.129	319.738	312.106	295.079	316.163	310.293	306.183	300.897	339.009	333.141	313.175	301.434	296.153	317.232	307.254	291.406	281.373	327.656	317.723	308.326	302.457	297.125	312.289	323.391	325.101	316.880	305.572    
    ]';  % cm, total length at f and T
data.tLm(:,1) = data.tLm(:,1) * 365; % transform to days
units.tLm   = {'d', 'cm'};  label.tLm = {'time since birth', 'total length', 'male'};  
temp.tLm    = C2K(36.2);  units.temp.tLm = 'K'; label.temp.tLm = 'temperature';
bibkey.tLm = 'GarlStew1998'; comment.tLm = 'fig. 1 A';
comment.tLm = 'Data for males';
  
% length-weight

% females :
data.LW = [ ... % log_10 total length (cm), log_10 wet weight (kg) 
2.076	2.079	2.264	2.381	2.394	2.395	2.412	2.408	2.413	2.430	2.456;
1.814	1.782	2.234	2.617	2.602	2.565	2.665	2.644	2.831	2.709	2.748
    ]';  
data.LW = 10.^data.LW;
data.LW(:,2) = data.LW(:,2)* 1e3; % kg to g
units.LW = {'cm', 'g'};     label.LW = {'standard length', 'wet weight', 'female'};  
bibkey.LW = 'GarlStew1998';comment.LW = 'fig. 2,open circles';
comment.LW = 'Data for females';

% males : 
data.LWm = [ ... % log_10 total length (cm), log_10 wet weight (kg) 
2.069	2.217	2.421	2.427	2.457	2.469	2.447	2.458	2.459	2.462	2.473	2.485;
1.820	2.119	2.773	2.811	2.795	2.763	2.822	2.855	2.887	2.938	2.906	3.004
    ]';  
data.LWm = 10.^data.LWm;
data.LWm(:,2) = data.LWm(:,2)* 1e3; % kg to g
units.LWm = {'cm', 'g'};     label.LWm = {'standard length', 'wet weight', 'male'};  
bibkey.LWm = 'GarlStew1998';comment.LWm = 'fig. 2, full circles';
comment.LWm = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tLm'}; subtitle1 = {'Data for females, males'};
set2 = {'LW','LWm'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1;set2};
metaData.grp.subtitle = {subtitle1; subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only.';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'This species is subdivided into three subspecies:the Atlantic walrus (O. r. rosmarus) which lives in the Atlantic Ocean, the Pacific walrus (O. r. divergens) which lives in the Pacific Ocean, and O. r. laptevi, which lives in the Laptev Sea of the Arctic Ocean.';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Sexual dimorphism: males larger';
metaData.bibkey.F2 = 'ADW';
metaData.facts = struct('F1',F1,'F2',F2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '5JYBC'; % Cat of Life
metaData.links.id_ITIS = '622043'; % ITIS
metaData.links.id_EoL = '46559147'; % Ency of Life
metaData.links.id_Wiki = 'Odobenus_rosmarus_rosmarus'; % Wikipedia
metaData.links.id_ADW = 'Odobenus_rosmarus'; % ADW
metaData.links.id_Taxo = '67371'; % Taxonomicon
metaData.links.id_WoRMS = '255010'; % WoRMS
metaData.links.id_MSW3 = '14001024'; % MSW3
metaData.links.id_AnAge = 'Odobenus_rosmarus_rosmarus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Walrus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Odobenus_rosmarus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Odobenus_rosmarus/}}';
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
bibkey = 'MeleRodr2015'; type = 'Article'; bib = [ ... 
'author = {M. Melero and V. Rodr\''{i}guez-Prieto and A. Rubio-Garc\''{i}a and D. Garc\''{i}a-P\''{a}rraga and J. M. S\''{a}nchez-Vizca\''{i}no}, ' ... 
'year = {2015}, ' ...
'title = {Thermal reference points as an index for monitoring body temperature in marine mammals}, ' ...
'journal = {BMC Research Notes}, ' ...
'volume = {8}, ' ...
'doi = {10.1186/s13104-015-1383-6}, ' ...
'pages = {411}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GarlStew1998'; type = 'Article'; bib = [ ... 
'author = {Garlich-Miller, J. L. and Stewart, R. E. A.}, ' ... 
'year = {1998}, ' ...
'title = {GROWTH AND SEXUAL DIMORPHISM OF ATLANTIC WALRUSES (\emph{Odobenus rosmarus rosmarus}) IN {F}OXE {B}ASIN, {N}ORTHWEST {T}ERRITORIES, {C}ANADA}, ' ...
'journal = {Marine Mammal Science}, ' ...
'volume = {14}, ' ...
'number = {4}, ' ...
'pages = {803-818}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
