function [data, auxData, metaData, txtData, weights] = mydata_Ciconia_stormi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Ciconiiformes'; 
metaData.family     = 'Ciconiidae';
metaData.species    = 'Ciconia_stormi'; 
metaData.species_en = 'Storm''s stork'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 29;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'MaceRang2006';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 63;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MaceRang2006';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 189;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'aviansag';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'val;ue is uncertain';
data.am = 23*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'aviansag';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 41;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'MaceRang2006';
data.Wwi = 1.8e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'MaceRang2006';
  comment.tW = 'extrapolated from tW data';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0.604	40.930
1.955	40.930
3.231	37.209
4.957	40.930
6.835	52.093
8.562	63.256
10.816	85.581
13.070	111.628
14.874	137.674
16.678	167.442
18.483	204.651
20.439	253.023
22.321	308.837
23.978	372.093
25.785	427.907
26.991	487.442
28.499	561.860
29.782	636.279
31.065	706.977
32.424	788.837
34.008	874.419
35.290	945.116
36.722	1000.930
38.153	1056.744
39.659	1105.116
41.088	1138.605
42.667	1172.093
43.718	1172.093
44.622	1205.581
45.523	1205.581
46.502	1242.791
47.553	1242.791
48.376	1220.465
49.657	1268.837
50.637	1320.930
51.461	1302.326
52.664	1320.930
53.494	1365.581
54.764	1298.605
55.821	1369.302
56.795	1350.698
57.618	1324.651
58.825	1391.628
59.653	1410.233
60.632	1451.163
61.531	1425.116
62.434	1454.884
63.560	1458.605
64.538	1484.651
65.436	1451.163];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MaceRang2006';
comment.tW = 'Data digitized from drawn curve';
  
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

%% Links
metaData.links.id_CoL = '5Z5SK'; % Cat of Life
metaData.links.id_ITIS = '559262'; % ITIS
metaData.links.id_EoL = '1049150'; % Ency of Life
metaData.links.id_Wiki = 'Ciconia_stormi'; % Wikipedia
metaData.links.id_ADW = 'Ciconia_stormi'; % ADW
metaData.links.id_Taxo = '51864'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '0C6D8B195D83534D'; % avibase
metaData.links.id_birdlife = 'storms-stork-ciconia-stormi'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ciconia_stormi}}';
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
bibkey = 'MaceRang2006'; type = 'Article'; bib = [ ... 
'author = {M. Mace and W. Ranger and E. Lewins and D.-M. Atallian and M. Farley}, ' ... 
'year = {2006}, ' ...
'title = {Breeding and hand-rearing Storm''s storks \emph{Ciconia stormi} at the {Zoological Society of San Diego}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {40}, ' ...
'pages = {254--260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049150/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aviansag'; type = 'Misc'; bib = ...
'howpublished = {\url{http://aviansag.org/Fact_Sheets/Cicag/Storms_Stork.pdf}}';
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

