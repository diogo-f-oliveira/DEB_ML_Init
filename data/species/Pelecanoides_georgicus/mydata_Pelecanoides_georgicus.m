function [data, auxData, metaData, txtData, weights] = mydata_Pelecanoides_georgicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Pelecanoides_georgicus'; 
metaData.species_en = 'South Georgia diving petrel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAS', 'MIS', 'MPS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 46;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'PaynPrin1979';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Wiki: 44 to 52 d, temp is guessed';
data.tx = 50; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'PaynPrin1979';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '43 to 60 d';
data.tp = 150; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '43 to 60 d';
data.tR = 2*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'EoL';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = '2 or 3 yr';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'EoL: in the wild 6.5 yr';

data.Wwb = 15; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PaynPrin1979';
  comment.Wwb = 'based on egg weight: 13.1 to 20.5 g, mean 17.39 g';
data.Wwi = 165; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'PaynPrin1979';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult mass 103.2 g (PaynPrin1979)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    0   15
14.991	74.227
16.046	80.048
17.031	86.232
18.014	93.869
19.140	100.054
20.054	105.510
20.970	108.787
22.024	116.061
23.081	120.429
24.139	122.252
24.982	128.435
26.109	132.076
27.096	134.263
28.011	139.720
29.070	139.727
30.058	140.460
30.975	142.283
32.104	143.744
33.020	145.930
34.009	145.209
34.927	145.215
36.060	141.226
37.191	139.779
38.040	136.878
38.961	132.523
40.163	131.078
40.944	125.268
42.006	120.915
42.856	116.560
44.061	110.027
45.052	107.126
45.899	106.768
46.961	103.868];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'PaynPrin1979';
  
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
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6TZ8D'; % Cat of Life
metaData.links.id_ITIS = '174667'; % ITIS
metaData.links.id_EoL = '45517750'; % Ency of Life
metaData.links.id_Wiki = 'Pelecanoides_georgicus'; % Wikipedia
metaData.links.id_ADW = 'Pelecanoides_georgicus'; % ADW
metaData.links.id_Taxo = '51630'; % Taxonomicon
metaData.links.id_WoRMS = '225780'; % WoRMS
metaData.links.id_avibase = 'D5FE30FFAB104DF9'; % avibase
metaData.links.id_birdlife = 'south-georgia-diving-petrel-pelecanoides-georgicus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelecanoides_georgicus}}';
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
bibkey = 'PaynPrin1979'; type = 'Article'; bib = [ ... 
'author = {M. R. Payne and P. A. Prince}, ' ... 
'year = {1979}, ' ...
'title = {Identification and breeding biology of the diving petrels \emph{Pelecanoides georgicus} and \emph{P. urinatrix exsul} at {S}outh {G}eorgia}, ' ...
'journal = {New Zealand Journal of Zoology}, ' ...
'volume = {6}, ' ...
'pages = {299-318}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049390/details}}';
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

