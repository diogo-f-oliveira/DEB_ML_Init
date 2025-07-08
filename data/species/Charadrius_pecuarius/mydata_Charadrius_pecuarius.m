function [data, auxData, metaData, txtData, weights] = mydata_Charadrius_pecuarius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Charadriidae';
metaData.species    = 'Charadrius_pecuarius'; 
metaData.species_en = 'Kittlitz''s Plover'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iFm', '0iSm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2018 07 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 08];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 28];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 28];

%% set data
% zero-variate data

data.ab = 24.5;      units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 25;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on other Charadrius species at AnAge';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on other Charadrius species at AnAge';

data.Ww0 = 7.8;    units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';   bibkey.Ww0 = 'avibase';
data.Wwb = 6.1;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'TjorUnde2008';
data.Wwi = 31;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'avibase';
data.Wwim = 34;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'avibase';
  
data.Ri  = 1.88*1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.88 eggs per clutch, 1.5 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.028	5.145
0.028	5.613
0.028	6.002
0.028	6.158
0.028	6.314
0.028	6.704
0.969	4.758
0.969	5.303
0.969	7.642
0.996	5.537
0.996	6.706
1.052	6.083
1.965	6.475
2.020	7.411
2.961	8.426
3.017	5.231
3.958	9.209
3.958	9.676
5.009	10.147
5.009	10.459
6.033	10.695
6.033	11.397
6.946	12.334
6.946	13.036
8.054	12.649
8.054	13.039
8.054	13.507
8.054	13.896
8.994	12.340
8.994	12.963
8.994	13.587
8.994	13.899
8.994	14.366
9.935	14.681
9.935	15.148
10.932	15.463
10.932	16.008
11.983	16.401
13.921	21.083
14.031	17.108
14.031	17.965
15.969	20.699
15.969	21.166
15.996	19.763
15.996	20.153
19.926	21.722
21.006	25.077
21.006	25.389
21.919	27.106
22.998	26.173
22.998	26.641
22.998	28.590
23.994	24.227
26.983	29.068
27.924	29.616];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'TjorUnde2008';

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
D1 = 'mod_1: smaller v and larger [p_M] that is more consistent with other Charadrius species, with same MRE';
D2 = 'mod_2: males are assume to differ from females by {p_Am} only';
D3 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '69PL5'; % Cat of Life
metaData.links.id_ITIS = '176538'; % ITIS
metaData.links.id_EoL = '45516147'; % Ency of Life
metaData.links.id_Wiki = 'Charadrius_pecuarius'; % Wikipedia
metaData.links.id_ADW = 'Charadrius_pecuarius'; % ADW
metaData.links.id_Taxo = '53603'; % Taxonomicon
metaData.links.id_WoRMS = '366846'; % WoRMS
metaData.links.id_avibase = '0F0DCC2F28E4E83B'; % avibase
metaData.links.id_birdlife = 'kittlitzs-plover-charadrius-pecuarius'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Charadrius_pecuarius}}';
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
bibkey = 'TjorUnde2008'; type = 'Article'; bib = [ ...  
'title = {The energetic implications of precocial development for three shorebird species breeding in a warm environment}, ' ...
'journal = {Ibis}, ' ...
'year = {2008}, ' ...
'author = {K. M. C. Tj{\o}rve and L. G. Underhill and G. H. Visser}, ' ...
'volume = {150}, ' ...
'pages = {125-138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=0F0DCC2F28E4E83B&sec=lifehistory}}';
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

