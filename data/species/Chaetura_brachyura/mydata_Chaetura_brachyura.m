function [data, auxData, metaData, txtData, weights] = mydata_Chaetura_brachyura
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Apodidae';
metaData.species    = 'Chaetura_brachyura'; 
metaData.species_en = 'Short-tailed swift'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 09 16];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 29];

%% set data
% zero-variate data

data.ab = 17.5;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17-18 d';
data.tx = 36;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Coll1966';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 108;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on Apus apus';
data.am = 16*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.6;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Coll1966';
  comment.Wwb = 'based on tW data';
data.Wwi = 20;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Wiki';

data.Ri  = 3.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-4, but up to 7, eggs per clutch, assumed: 1 clutch per yr';
 
% uni-variate data
% time - weight
data.tW = [ ...  % age (d), weight (g)
0.000	1.612
0.961	2.095
1.807	2.765
2.867	3.823
3.875	5.124
4.837	6.312
5.858	7.425
6.826	8.667
7.841	10.841
8.876	11.106
9.787	13.266
10.807	15.847
11.843	16.110
12.924	18.098
13.849	18.681
14.783	17.721
15.816	18.577
16.797	19.030
17.773	20.571
18.870	19.668
19.741	20.300
20.727	19.707
21.659	18.983
22.700	18.429
23.739	18.308
24.608	19.190
25.757	18.920
26.687	18.650
27.621	17.691
28.655	18.405
29.640	18.004
30.690	16.063
31.669	16.709
32.710	16.221
33.645	15.270
34.685	14.938
35.881	15.905
36.823	13.972];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Coll1966';
  
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
metaData.links.id_CoL = 'TF2Y'; % Cat of Life
metaData.links.id_ITIS = '178005'; % ITIS
metaData.links.id_EoL = '45511611'; % Ency of Life
metaData.links.id_Wiki = 'Chaetura_brachyura'; % Wikipedia
metaData.links.id_ADW = 'Chaetura_brachyura'; % ADW
metaData.links.id_Taxo = '72202'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'AA21E3A7D45257EA'; % avibase
metaData.links.id_birdlife = 'short-tailed-swift-chaetura-brachyura'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% Discussion points
D1 = 'Feeding is reduced just before fledge';
D2 = 'Males are assumed not to differ from females';
D3 = 'mod_1: v is reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetura_brachyura}}';
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
bibkey = 'Coll1966'; type = 'phdthesis'; bib = [ ... 
'author = {Charles Thompson Collins}, ' ... 
'year = {1966}, ' ...
'title = {The comparative biology of two species of swifts in Trinidad}, ' ...
'school = {Univ of Florida}'];
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

