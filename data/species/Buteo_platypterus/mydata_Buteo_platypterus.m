function [data, auxData, metaData, txtData, weights] = mydata_Buteo_platypterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Buteo_platypterus'; 
metaData.species_en = 'Broad-winged hawk';

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 29.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '28-32 d';
data.tx = 35;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'avibase';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 105;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1.6*365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18.3*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 42;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 28;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnAge';
data.Wwi = 440;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 420;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 2.5 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.990	24.953
0.991	26.465
0.992	33.270
2.037	26.465
2.104	31.758
2.105	34.783
2.168	27.221
2.765	49.149
2.891	35.539
2.892	37.807
2.893	43.100
3.021	31.758
3.872	34.026
3.875	43.100
3.876	45.369
3.943	50.662
3.945	56.711
3.952	77.127
4.860	52.174
4.941	100.567
5.002	86.200
5.979	73.346
6.118	97.543
6.836	91.493
6.903	95.274
6.958	64.272
6.961	73.346
6.970	100.567
7.036	103.592
7.948	89.225
7.951	102.079
7.952	103.592
7.955	112.665
8.015	95.274
8.953	162.571
9.862	139.887
9.919	112.665
9.994	143.667
9.996	147.448
10.006	177.694
10.008	186.011
10.726	180.718
11.045	154.253
11.967	173.157
12.028	158.034
12.039	190.548
13.031	223.062
13.033	229.868
13.085	187.524
13.167	240.454
14.028	271.456
14.127	172.401
14.862	220.038
14.864	223.819
14.948	280.529
14.997	231.380
15.064	235.161
15.996	285.822
16.125	277.505
16.972	266.919
16.980	291.871
17.089	226.087
17.099	255.577
17.101	260.870
17.881	245.747
18.001	210.964
18.006	226.843
18.095	300.189
19.009	291.115
19.012	301.701
19.016	314.556
20.000	321.361
20.125	302.457
20.897	260.870
20.988	335.728
20.989	342.533
20.991	348.582
21.021	241.210
21.035	285.066
21.083	230.624
22.043	364.461
22.948	331.191
23.012	324.386
23.027	369.754
23.112	231.380
23.902	245.747
23.964	234.405
24.051	300.189
24.065	344.802
24.072	365.217
25.057	375.803
25.089	273.724
25.114	348.582
26.027	338.752
26.098	357.656
26.999	310.775
27.102	225.331
27.105	233.648
27.992	344.045
28.184	329.679
29.041	348.582
31.052	294.140
31.101	245.747
31.136	351.607
33.092	329.679
34.126	289.603
35.033	260.870
35.057	334.972
38.187	299.433
39.053	345.558
42.127	340.265
46.253	350.095];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'LyonMosh1987';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'NYVJ'; % Cat of Life
metaData.links.id_ITIS = '175365'; % ITIS
metaData.links.id_EoL = '45511422'; % Ency of Life
metaData.links.id_Wiki = 'Buteo_platypterus'; % Wikipedia
metaData.links.id_ADW = 'Buteo_platypterus'; % ADW
metaData.links.id_Taxo = '52653'; % Taxonomicon
metaData.links.id_WoRMS = '159370'; % WoRMS
metaData.links.id_avibase = '79F3C681417F2056'; % avibase
metaData.links.id_birdlife = 'broad-winged-hawk-buteo-platypterus'; % birdlife
metaData.links.id_AnAge = 'Buteo_platypterus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buteo_platypterus}}';
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
bibkey = 'LyonMosh1987'; type = 'Article'; bib = [ ... 
'doi = {10.1676/13-020.1}, ' ...
'title = {Morphological Growth, Behavioral Development, and Parental Care of Broad-Winged Hawks}, ' ...
'author = {David M. Lyons and James A. Mosher}, ' ...
'journal = {Journal of Field Ornithology}, ' ...
'year = {1987}, ' ...
'volume = {58(3)}, ' ...
'pages = {334-344}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Buteo_platypterus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=79F3C681417F2056&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

