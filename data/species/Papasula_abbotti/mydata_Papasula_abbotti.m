function [data, auxData, metaData, txtData, weights] = mydata_Papasula_abbotti
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Suliformes'; 
metaData.family     = 'Sulidae';
metaData.species    = 'Papasula_abbotti'; 
metaData.species_en = 'Abbott''s booby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 02];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 170; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(40.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Data for S. sula, 91 till > 139 d';
data.tp = 510; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for S. sula, 91 till > 139 d';
data.tR = 8*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(40.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'Data for S. sula, 2-3 yr';
data.am = 40*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'Wiki';   
  temp.am = C2K(40.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 60; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Nels1971';
data.Wwi = 1550; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Nels1971';

data.Ri  = 1/2.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 1 clutch per 2 or 3 yr';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.781	101.681
1.808	70.300
2.581	88.503
4.639	72.698
7.215	106.419
7.217	127.288
9.020	153.241
10.436	153.135
11.464	137.406
12.627	194.711
13.526	173.775
15.589	225.795
16.615	189.196
17.908	251.709
19.967	254.164
20.233	363.709
21.510	243.614
21.522	384.483
23.568	235.635
23.838	379.093
25.379	350.282
25.523	530.272
27.572	407.510
28.102	590.079
29.641	532.573
29.911	676.032
31.454	662.873
31.575	576.777
33.523	785.328
33.885	500.953
35.821	571.243
35.967	777.319
37.513	792.856
37.631	672.847
39.562	675.312
39.571	784.877
41.776	993.408
41.883	735.139
43.814	748.039
43.819	800.212
45.492	807.914
45.880	833.972
47.305	938.213
48.073	899.026
49.879	943.239
51.573	1188.330
52.577	898.690
54.011	1112.496
55.679	1052.372
55.691	1195.849
57.612	1093.967
59.041	1245.165
59.804	1145.977
61.611	1205.843
62.108	997.110
63.670	1213.515
65.608	1296.849
67.542	1341.053];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Nels1971';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4CJ75'; % Cat of Life
metaData.links.id_ITIS = '561804'; % ITIS
metaData.links.id_EoL = '45513857'; % Ency of Life
metaData.links.id_Wiki = 'Papasula_abbotti'; % Wikipedia
metaData.links.id_ADW = 'Papasula_abbotti'; % ADW
metaData.links.id_Taxo = '51658'; % Taxonomicon
metaData.links.id_WoRMS = '344099'; % WoRMS
metaData.links.id_avibase = '92A2CCFC06063A60'; % avibase
metaData.links.id_birdlife = 'abbotts-booby-papasula-abbotti'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Papasula_abbotti}}';
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
bibkey = 'Nels1971'; type = 'Article'; bib = [ ... 
'author = {J. B. Nelson}, ' ... 
'doi = {10.1111/j.1474-919X.1971.tb05179.x}, ' ...
'year = {1971}, ' ...
'title = {THE BIOLOGY OF {A}BBOTT''S BOOBY \emph{Sula abbotti}}, ' ...
'journal = {Ibis}, ' ...
'volume = {113}, ' ...
'pages = {429--467}'];
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

