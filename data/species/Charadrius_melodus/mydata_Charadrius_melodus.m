function [data, auxData, metaData, txtData, weights] = mydata_Charadrius_melodus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Charadrius_melodus'; 
metaData.species_en = 'Piping Plover'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd', '0iFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 27;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'Wiki';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 28;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 84;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 14*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5.9;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'AnAge';
data.Wwi = 60;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';
  comment.Wwi = '42 till 64 g';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight 
data.tW = [ ... % time since birth (d), wet weight (g)
0.824	5.976
0.824	6.506
1.882	7.329
1.941	6.041
2.882	9.668
2.941	8.834
3.882	9.203
4.000	9.960
4.941	9.117
5.000	7.828
6.000	11.834
6.000	13.046
6.941	13.870
6.941	15.082
7.824	15.376
7.941	16.208
8.882	16.199
8.941	12.638
10.000	15.733
10.000	16.491
11.000	19.056
11.941	22.835
12.059	19.879
12.941	17.219
14.000	19.936
14.941	19.396
15.118	27.879
15.824	21.433
16.882	21.043
17.941	19.442
19.059	23.067
19.118	32.612
19.882	25.256
21.765	25.995
22.765	30.303
23.706	32.187
24.765	33.616
25.765	36.182
26.765	34.960
27.824	38.586
28.706	37.365
30.941	40.373
32.765	42.173
35.000	43.060
36.824	42.511];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'PoweCuth1997';

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
D1 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'TMX5'; % Cat of Life
metaData.links.id_ITIS = '176507'; % ITIS
metaData.links.id_EoL = '45509160'; % Ency of Life
metaData.links.id_Wiki = 'Charadrius_melodus'; % Wikipedia
metaData.links.id_ADW = 'Charadrius_melodus'; % ADW
metaData.links.id_Taxo = '53600'; % Taxonomicon
metaData.links.id_WoRMS = '159125'; % WoRMS
metaData.links.id_avibase = '671B69FE824DC9FF'; % avibase
metaData.links.id_birdlife = 'piping-plover-charadrius-melodus'; % birdlife
metaData.links.id_AnAge = 'Charadrius_melodus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Charadrius_melodus}}';
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
bibkey = 'PoweCuth1997'; type = 'Article'; bib = [ ... 
'author = {A. N. Powell and F. J. Cuthbert and L. C. Wemmer and A. W. Doolittle and S. T. Feirer}, ' ... 
'year = {1997}, ' ...
'title = {Captive-rearing Piping Plovers: Developing Techniques to Augment Wild Populations}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {16}, ' ...
'pages = {461-477}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Charadrius_melodus}}';
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

