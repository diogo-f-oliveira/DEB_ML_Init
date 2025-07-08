function [data, auxData, metaData, txtData, weights] = mydata_Calonectris_leucomelas
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Calonectris_leucomelas'; 
metaData.species_en = 'Streaked shearwater'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCim'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 09 20];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 55;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'RamoMoni2003';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Calonectris diomedea: 55 to 65 d';
data.tx = 97; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'OkaSugi2002';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 291; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for Calonectris diomedea';
data.am = 24.8*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Calonectris diomedea';

data.Wwb = 59; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OkaSugi2002';
data.Wwi = 720; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'OkaSugi2002';
  comment.Wwi = 'asymptote for nestling; mean adult weight is lower: 552 g';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.516	58.985
1.170	79.302
1.960	79.253
2.880	85.304
4.062	101.517
4.718	107.584
6.033	113.610
6.952	129.839
8.134	139.945
9.315	158.194
9.970	178.510
11.153	188.616
12.071	206.880
12.991	208.860
14.041	227.116
14.960	237.238
16.012	245.316
16.931	257.474
18.111	279.794
18.898	296.031
20.210	318.343
21.125	352.892
22.046	354.872
23.099	356.843
24.152	350.672
24.674	379.139
26.250	395.327
27.172	391.200
28.219	421.670
29.270	435.855
30.059	435.807
31.240	456.091
32.156	484.534
33.470	496.668
34.258	504.762
35.574	504.682
36.229	524.998
37.283	512.720
38.332	535.047
38.989	541.114
40.170	561.398
40.173	545.113
40.958	571.528
42.011	567.393
43.457	577.483
44.118	557.086
45.692	587.524
46.350	589.520
47.269	601.677
48.190	603.657
49.371	621.905
50.553	634.047
51.342	638.070
51.998	650.244
53.051	644.072
54.102	658.258
55.153	664.300
56.071	686.636
57.253	698.778
57.779	698.745
58.829	714.966
60.144	720.993
61.069	694.473
62.254	690.330
63.041	706.567
64.091	722.787
65.013	716.624
66.194	736.908
66.983	736.860
68.301	724.566
69.223	720.438
70.144	720.382
71.328	722.346
72.119	714.155
73.042	697.813
74.226	701.812
75.015	701.764
75.936	703.743
77.122	695.529
77.912	691.409
79.361	683.178
80.285	660.730
81.207	654.567
82.261	646.360
83.052	640.205
84.372	615.697
85.163	605.470
86.349	593.184
87.404	580.906
88.327	570.671
89.379	570.607
90.304	550.194
91.490	535.872
92.283	517.503
93.069	535.776
94.122	535.712
95.572	515.267
96.364	500.969
97.287	492.770
98.857	545.601];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'OkaSugi2002';
comment.tW = 'Data from Mikura Island 1999';
  
%% set weights for all real data
weights = setweights(data, []);weights.tp = 0.1;
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'PYXK'; % Cat of Life
metaData.links.id_ITIS = '203449'; % ITIS
metaData.links.id_EoL = '45511299'; % Ency of Life
metaData.links.id_Wiki = 'Calonectris_leucomelas'; % Wikipedia
metaData.links.id_ADW = 'Calonectris_leucomelas'; % ADW
metaData.links.id_Taxo = '51563'; % Taxonomicon
metaData.links.id_WoRMS = '343971'; % WoRMS
metaData.links.id_avibase = '13B165A3056EF798'; % avibase
metaData.links.id_birdlife = 'streaked-shearwater-calonectris-leucomelas'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calonectris_leucomelas}}';
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
bibkey = 'OkaSugi2002'; type = 'Article'; bib = [ ... 
'author = {N. Oka and H. Suginome and N. Jida and N. Maruyam}, ' ... 
'year = {2002}, ' ...
'title = {Chick Growth and  Fledgling Performance of Streaked Shearwaters \emph{Calonectris leucomelas} on {M}ikura {I}sland for Two Breeding Seasons}, ' ...
'journal = {J. Yamashina Inst. Onithol}, ' ...
'volume = {34}, ' ...
'pages = {39-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RamoMoni2003'; type = 'Article'; bib = [ ... 
'author = {J. A. Ramos and Z. Moniz and E. Sol\''{a} nd L. R. Monteiro}, ' ... 
'doi = {10.1071/mu9900180}, ' ...
'year = {2003}, ' ...
'title = {Reproductive measures and chick provisioning of {C}ory''s Shearwater \emph{Calonectris diomedea borealis} in the {A}zores}, ' ...
'journal = {Bird Study }, ' ...
'volume = {50}, ' ...
'pages = {47-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Calonectris_diomedea}}';
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

