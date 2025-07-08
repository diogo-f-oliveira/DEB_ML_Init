function [data, auxData, metaData, txtData, weights] = mydata_Cepphus_grylle
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Alcidae';
metaData.species    = 'Cepphus_grylle'; 
metaData.species_en = 'Black guillemot'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'xiMcp', '0bTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'; 'pXi'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2017 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 25;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 34;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Cair1987';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 102;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.tR = 1095;       units.tR = 'd';    label.tR = 'time since birth at first egg laying';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.7); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 29.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Guess is based on Cassins auklet';

data.Wwb = 33;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 427.5;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/365;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
data.pXm = 780; units.pXm = 'kJ/d'; label.pXm = 'food intake at 25 d';     bibkey.pXm = 'Cair1987';

% uni-variate data
% time-weight
data.tW_PC81 = [ ... % time since birth (d), wet weight (g)
0.983	37.222
2.009	46.836
2.906	55.169
5.000	71.828
6.026	94.926
6.966	99.405
8.034	105.167
8.932	143.675
9.915	128.892
12.051	156.466
12.991	189.838
14.060	191.747
15.043	192.374
15.940	234.093
16.966	223.161
17.949	243.691
18.974	273.851
19.872	260.996
20.897	261.621
21.880	278.941
22.863	300.113
23.846	300.097
24.829	276.968
25.897	320.610
26.923	293.627
27.949	330.208
28.846	314.142
30.940	317.961
31.923	349.406
32.863	305.089
35.085	323.031];
units.tW_PC81   = {'d', 'g'};  label.tW_PC81 = {'time since birth', 'wet weight', 'Pitsulak City 1981'};  
temp.tW_PC81    = C2K(40.7);  units.temp.tW_PC81 = 'K'; label.temp.tW_PC81 = 'temperature';
bibkey.tW_PC81  = 'Cair1987';
comment.tW_PC81 = 'Data from Pitsulak City 1981';
%
data.tW_PC82 = [ ... % time since birth (d), wet weight 
0.198	34.874
0.926	36.938
2.020	44.478
3.025	54.752
4.030	65.709
4.945	80.084
6.035	78.051
7.132	90.378
7.953	95.862
9.153	137.592
10.061	134.872
11.110	142.411
12.031	167.726
13.164	160.908
14.097	213.574
15.370	213.595
16.104	229.334
17.154	239.609
18.184	205.438
19.066	245.111
20.128	281.369
21.033	271.812
21.943	274.562
23.074	263.642
24.139	306.053
25.052	314.957
26.095	308.821
27.203	345.763
28.044	295.863
29.244	337.593
30.334	334.877
31.109	340.360
32.242	331.491
33.142	312.361
34.159	349.985];
units.tW_PC82   = {'d', 'g'};  label.tW_PC82 = {'time since birth', 'wet weight', 'Pitsulak City 1982'};  
temp.tW_PC82    = C2K(40.7);  units.temp.tW_PC82 = 'K'; label.temp.tW_PC82 = 'temperature';
bibkey.tW_PC82  = 'Cair1987';
comment.tW_PC82 = 'Data from Pitsulak City 1982';
%
data.tW_PC83 = [ ... % time since birth (d), wet weight 
1.973	44.154
2.956	48.019
4.027	64.667
5.094	64.701
7.962	101.214
9.031	110.833
10.103	131.315
12.074	167.160
13.059	181.249
14.045	202.367
15.112	199.206
16.021	259.938
16.997	231.854
18.026	253.612
18.964	244.058
19.956	295.208
20.938	292.683
22.006	297.829
22.861	302.968
23.929	308.114
25.045	335.626
25.938	320.958
27.012	350.385
28.029	314.635
28.975	347.253
30.041	340.897
30.985	365.848
31.924	364.600
32.908	373.577
33.973	364.665
35.043	376.201];
units.tW_PC83   = {'d', 'g'};  label.tW_PC83 = {'time since birth', 'wet weight', 'Pitsulak City 1983'};  
temp.tW_PC83    = C2K(40.7);  units.temp.tW_PC83 = 'K'; label.temp.tW_PC83 = 'temperature';
bibkey.tW_PC83  = 'Cair1987';
comment.tW_PC83 = 'Data from Pitsulak City 1983';
%
data.tW_P83 = [ ... % time since birth (d), wet weight 
0.997	32.414
1.952	40.690
2.998	48.276
3.998	56.552
4.952	66.897
5.953	75.862
6.907	88.276
7.906	105.517
8.860	122.759
9.904	141.379
10.906	136.552
12.907	147.586
13.902	204.828
14.944	241.379
16.038	227.586
16.993	230.345
17.763	265.517
19.943	298.621
20.997	235.862
21.901	286.207
22.900	304.828
23.993	301.379
24.991	325.517
25.948	313.793
26.904	311.724
28.951	321.379
29.903	353.103
31.041	350.345
31.998	335.172
33.090	342.069
33.955	331.724
35.002	333.793];
units.tW_P83   = {'d', 'g'};  label.tW_P83 = {'time since birth', 'wet weight', 'Piqiuliit 1983'};  
temp.tW_P83    = C2K(40.7);  units.temp.tW_P83 = 'K'; label.temp.tW_P83 = 'temperature';
bibkey.tW_P83  = 'Cair1987';
comment.tW_P83 = 'Data from Piqiuliit 1983';

%% set weights for all real data
weights = setweights(data, []);
 weights.tW_P83 = weights.tW_P83 * 2;
weights.tW_PC83 = weights.tW_PC83 * 2;
weights.tW_PC82 = weights.tW_PC82 * 2;
weights.tW_PC81 = weights.tW_PC81 * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_PC81','tW_PC82','tW_PC83','tW_P83'}; subtitle1 = {'Data from Pitsulak City 1981, 1982, 1983 and Piqiuliit 1983'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: v is reduced';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Food is benthic blennies, principally Stichaeus punctatus and Eumesogrammus praecis';
metaData.bibkey.F1 = 'Cair1987'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'SFVL'; % Cat of Life
metaData.links.id_ITIS = '176985'; % ITIS
metaData.links.id_EoL = '45509349'; % Ency of Life
metaData.links.id_Wiki = 'Cepphus_grylle'; % Wikipedia
metaData.links.id_ADW = 'Cepphus_grylle'; % ADW
metaData.links.id_Taxo = '53898'; % Taxonomicon
metaData.links.id_WoRMS = '137130'; % WoRMS
metaData.links.id_avibase = 'B5AA5952E13FE5F3'; % avibase
metaData.links.id_birdlife = 'black-guillemot-cepphus-grylle'; % birdlife
metaData.links.id_AnAge = 'Cepphus_grylle'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cepphus_grylle}}';
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
bibkey = 'Cair1987'; type = 'Article'; bib = [ ... 
'author = {Cairns, D. K.}, ' ... 
'year = {1987}, ' ...
'title = {THE ECOLOGY AND ENERGETICS OF CHICK PROVISIONING BY BLACK GUILLEMOTS}, ' ...
'journal = {The condor}, ' ...
'volume = {89}, ' ...
'pages = {627--635}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cepphus_grylle}}';
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

