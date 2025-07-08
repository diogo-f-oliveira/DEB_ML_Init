function [data, auxData, metaData, txtData, weights] = mydata_Rissa_brevirostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Rissa_brevirostris'; 
metaData.species_en = 'Red-legged kittiwake'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'biMc', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 01 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. emps from Rahn1991 for Larus argentatus; ';
data.tx = 32;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'LancRoby2000';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 96;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for R. tridactyla';
data.am = 27*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 30; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LancRoby2000';
data.Wwi = 480; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '325 till 510 g';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Data for R. tridactyla';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.049	25.668
0.050	35.294
0.051	40.642
0.052	51.337
2.085	54.545
2.985	62.032
2.986	80.214
3.078	47.059
4.121	78.075
5.068	91.979
5.922	125.134
6.061	86.631
6.062	94.118
6.063	115.508
6.109	101.604
6.110	109.091
7.056	111.230
7.057	118.717
7.058	125.134
7.059	129.412
7.060	136.898
8.049	104.813
8.050	117.647
8.051	126.203
8.052	140.107
8.951	146.524
9.000	174.332
9.047	171.123
10.038	133.690
10.042	192.513
10.085	141.176
10.086	146.524
10.087	158.289
10.988	188.235
11.033	161.497
11.034	179.679
11.081	175.401
11.131	210.695
11.982	195.722
11.983	198.930
11.984	229.947
12.028	186.096
12.075	176.471
12.169	167.914
12.927	188.235
13.119	221.390
13.120	235.294
13.121	252.406
14.066	231.016
14.067	235.294
14.069	270.588
14.108	167.914
14.109	188.235
15.056	202.139
15.059	231.016
15.060	245.989
15.061	258.824
15.062	278.075
16.096	194.652
16.098	214.973
16.101	256.684
16.102	267.380
16.103	278.075
17.049	282.353
17.050	295.187
17.051	308.021
17.094	249.198
17.993	256.684
18.044	295.187
18.083	200.000
18.085	224.599
19.038	310.160
19.040	333.690
19.130	273.797
20.032	325.134
20.075	260.963
20.076	273.797
20.077	289.840
20.130	358.289
21.067	252.406
21.069	269.519
22.018	317.647
22.022	367.914
22.068	347.594
22.118	376.471
23.006	251.337
23.011	308.021
23.061	347.594
23.112	393.583
24.045	233.155
24.047	254.545
25.000	337.968
25.050	380.749
25.051	389.305
26.037	293.048
26.038	315.508
26.039	317.647
26.047	421.390
27.073	243.850
27.074	248.128
27.979	334.759
28.032	409.626
28.033	413.904
28.034	427.807
28.981	448.128
29.020	336.898
29.072	397.861
29.109	268.449
29.971	406.417
30.012	320.856
30.014	354.011
30.022	445.989
30.101	258.824
30.956	293.048
31.009	372.193
31.010	387.166
31.060	420.321
32.045	316.578
32.046	325.134];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LancRoby2000';
  
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
D1 = 'mod_1: v reduced; the std model is unable to capture the high age at first reproduction';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Main food at Pribilof Islands: northern lanternfish Stenobrachius leucopsarus';
metaData.bibkey.F1 = {'LancRoby2000'}; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4T593'; % Cat of Life
metaData.links.id_ITIS = '176845'; % ITIS
metaData.links.id_EoL = '45509267'; % Ency of Life
metaData.links.id_Wiki = 'Rissa_brevirostris'; % Wikipedia
metaData.links.id_ADW = 'Rissa_brevirostris'; % ADW
metaData.links.id_Taxo = '53830'; % Taxonomicon
metaData.links.id_WoRMS = '343923'; % WoRMS
metaData.links.id_avibase = '58B576ED088D10F9'; % avibase
metaData.links.id_birdlife = 'red-legged-kittiwake-rissa-brevirostris'; % birdlife
metaData.links.id_AnAge = 'Rissa_brevirostris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rissa_brevirostris}}';
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
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles.}, ' ...
'editor = {Deeming, D. C. and Fergunson, M. W. J.}, ' ...
'publisher = {Cambridge University Press}, '...
'pages = {345--360}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LancRoby2000'; type = 'Article'; bib = [ ... 
'author = {Lance, B. and Roby, D.}, ' ... 
'year = {2000}, ' ...
'title = {DIET AND POSTNATAL GROWTH IN RED-LEGGED AND BLACKLEGGED KITTIWAKES: AN INTERSPECIES CROSS-FOSTERING EXPERIMENT}, ' ...
'journal = {The Auk}, ' ...
'volume = {117}, ' ...
'pages = {1016--1028}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rissa_brevirostris}}';
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

