function [data, auxData, metaData, txtData, weights] = mydata_Charadrius_vociferus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Charadrius_vociferus'; 
metaData.species_en = 'Killdeer'; 

metaData.ecoCode.climate = {'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iFm'};
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
  comment.ab = '22 till 28 d';
data.tx = 24;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 72;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10.9*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'PoweCuth1997';
data.Wwi = 121;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';
  comment.Wwi = 'between 72 and 121 g';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.160	9.654
0.215	10.092
0.881	10.374
1.158	10.223
1.824	10.505
1.934	10.942
2.822	10.489
2.877	10.780
3.931	11.495
3.932	10.763
5.039	13.086
5.040	11.916
6.146	17.311
6.313	16.138
7.033	17.735
7.035	15.394
7.919	19.476
7.974	21.231
8.973	20.483
9.028	21.214
9.913	24.857
9.915	21.931
11.078	22.205
11.079	22.205
11.795	30.386
11.907	29.506
13.126	30.803
13.238	30.216
14.069	31.665
14.845	31.653
14.898	36.187
16.005	39.680
16.891	41.714
17.062	34.689
17.779	40.383
19.051	46.214
20.105	46.783
20.877	54.231
21.873	57.434
22.928	55.222
23.759	57.257
24.642	63.972
25.808	63.075
26.975	58.814
27.859	65.090
28.962	74.874
29.854	67.984
31.019	67.526
31.903	72.632];
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
metaData.links.id_CoL = 'TMXQ'; % Cat of Life
metaData.links.id_ITIS = '176520'; % ITIS
metaData.links.id_EoL = '45509159'; % Ency of Life
metaData.links.id_Wiki = 'Charadrius_vociferus'; % Wikipedia
metaData.links.id_ADW = 'Charadrius_vociferus'; % ADW
metaData.links.id_Taxo = '53610'; % Taxonomicon
metaData.links.id_WoRMS = '159127'; % WoRMS
metaData.links.id_avibase = 'BCF9A19AFE372627'; % avibase
metaData.links.id_birdlife = 'killdeer-charadrius-vociferus'; % birdlife
metaData.links.id_AnAge = 'Charadrius_vociferus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Charadrius_vociferus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Charadrius_vociferus}}';
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

