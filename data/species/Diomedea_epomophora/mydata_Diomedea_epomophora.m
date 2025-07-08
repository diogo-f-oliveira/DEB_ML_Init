function [data, auxData, metaData, txtData, weights] = mydata_Diomedea_epomophora

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Diomedeidae';
metaData.species    = 'Diomedea_epomophora'; 
metaData.species_en = 'Southern royal albatross'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCic', 'biCik', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 19];              
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

data.ab = 79;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'RobeRich1993';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from Rahn1991 for Laysan and the Black-footed Albatrosses';
data.tx = 204;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'RobeRich1993';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from Warh1971';
data.tp = 612;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from Warh1971';
data.tR = 9*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'ADW';
  temp.tR = C2K(39.4);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 58*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 500;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RobeRich1993';
data.Wwi = 17e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'RobeRich1993';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult weight (Wiki): 8.5 kg, males are 2 to 3 kg heavier than females';

data.Ri  = .5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0.454	558.656
9.759	846.216
19.087	1255.224
27.114	2004.864
34.509	3021.977
41.643	2727.460
48.895	4740.585
55.285	4154.885
63.124	5681.932
71.064	5994.361
76.337	6672.292
92.274	7588.624
98.438	7586.016
112.240	9814.992
119.721	9544.620
125.741	10538.024
132.304	9102.048
140.331	9851.687
147.455	9508.592
154.165	10525.995
160.604	10183.189
167.530	10568.922
176.844	10905.061
182.744	11291.228
189.702	10122.292
195.597	10484.169
202.257	9533.983
210.806	11182.187
212.455	10865.699
219.751	9672.328];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RobeRich1993';
comment.tW = 'female Chick at Taiaroa Head';
%
data.tW1 = [ ... % age (d) weight (g)
0.430	437.209
6.966	580.192
12.542	1063.662
19.792	1352.092
26.796	2126.456
33.987	2123.412
42.425	3212.959
48.387	3914.889
55.183	3644.807
62.564	4589.052
69.711	4367.403
76.446	5506.254
84.097	6086.012
90.603	6083.258
97.178	6420.557
104.663	6174.474
111.446	7556.219
119.597	7212.689
126.091	8861.762
132.693	7620.102
139.481	9026.136
146.440	7857.199
154.340	7975.313
162.207	7923.401
167.623	7605.320
175.023	8646.722
182.062	9591.112
188.301	8252.439
195.425	7909.343
202.553	7590.537
210.214	8218.874
216.710	8167.542
223.936	8334.525
230.775	8283.047
237.918	8037.109
245.202	8495.565
259.034	7445.177];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(39.4);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'RobeRich1993';
comment.tW1 = 'female Chick at Taiaroa Head';

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

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for 2 female chicks'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '36B3M'; % Cat of Life
metaData.links.id_ITIS = '174524'; % ITIS
metaData.links.id_EoL = '45512094'; % Ency of Life
metaData.links.id_Wiki = 'Diomedea_epomophora'; % Wikipedia
metaData.links.id_ADW = 'Diomedea_epomophora'; % ADW
metaData.links.id_Taxo = '51479'; % Taxonomicon
metaData.links.id_WoRMS = '344000'; % WoRMS
metaData.links.id_avibase = '4D8C9B9731282B9B'; % avibase
metaData.links.id_birdlife = 'southern-royal-albatross-diomedea-epomophora'; % birdlife
metaData.links.id_AnAge = 'Diomedea_epomophora'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diomedea_epomophora}}';
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
bibkey = 'RobeRich1993'; type = 'techreport'; bib = [ ... 
'author = {Robertson, C.J.R. and Richdale, L.E.}, ' ... 
'year = {1993}, ' ...
'issn = {1171-9834}, ' ...
'howpublished = {\url{https://www.doc.govt.nz/Documents/science-and-technical/casn48.pdf}}, ' ...
'title = {THE BREEDING PHENOLOGY OF THE ROYAL ALBATROSS (\emph{Diomedea epomophora sanfordi}) 1937-1974}, ' ...
'series = {Conservation Advisory Science Notes}, ' ...
'volume = {48}, ' ...
'institution = {Department of conservation, P.O.Box 10-420, Wellington, New Zealand}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Diomedea_epomophora}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Diomedea_epomophora/}}';
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

