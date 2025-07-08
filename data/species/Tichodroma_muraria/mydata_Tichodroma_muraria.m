function [data, auxData, metaData, txtData, weights] = mydata_Tichodroma_muraria
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Tichodromadidae';
metaData.species    = 'Tichodroma_muraria'; 
metaData.species_en = 'Wallcreeper'; 

metaData.ecoCode.climate = {'ET', 'Cwb', 'Cwc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tncf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am';  'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 20];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 19.5;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Lohr1976';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 22;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Lohr1976';   
  temp.tx = C2K(41.6);   units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 66;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);   units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;         units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Lohr1976';
  temp.tR = C2K(41.6);   units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;        units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(41.6);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Guessed on the basis of Trochlodytes';
  
data.Wwb = 1.9;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Lohr1976';
data.Wwi = 21;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Lohr1976';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Lohr1976';   
  temp.Ri = C2K(41.6);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.122	2.076
2.032	2.184
3.160	2.752
4.244	5.167
5.262	5.506
6.314	6.882
7.369	8.086
8.251	9.406
9.358	10.840
10.386	13.198
11.498	14.401
12.433	15.894
13.259	17.157
14.318	18.187
15.246	19.968
17.126	20.069
18.097	22.427
26.554	19.536
28.450	18.945
30.361	17.777
38.425	16.965];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Lohr1976';

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
D1 = 'tW data suggest varying food availebility, which has been implemented';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '56VKH'; % Cat of Life
metaData.links.id_ITIS = '563471'; % ITIS
metaData.links.id_EoL = '45515494'; % Ency of Life
metaData.links.id_Wiki = 'Tichodroma_muraria'; % Wikipedia
metaData.links.id_ADW = 'Tichodroma_muraria'; % ADW
metaData.links.id_Taxo = '57768'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '89C425901C5B5343'; % avibase
metaData.links.id_birdlife = 'wallcreeper-tichodroma-muraria'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tichodroma_muraria}}';
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
bibkey = 'Lohr1976'; type = 'Book'; bib = [ ...  
'title = {Der Mauerl\"{a}ufer \emph{Trichodroma muraria}}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'year = {1976}, ' ...
'author = {L\"{o}hrl, H.}, ' ...
'volume = {498}, ' ...
'series = {Die Neue Brehm B\"{u}cherei}, ' ...
'address = {Wittenberg Lutherstadt}'];
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

