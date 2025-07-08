function [data, auxData, metaData, txtData, weights] = mydata_Pygoscelis_adeliae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Sphenisciformes'; 
metaData.family     = 'Spheniscidae';
metaData.species    = 'Pygoscelis_adeliae'; 
metaData.species_en = 'Adelie penguin'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'TS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2020 03 20];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 01];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 35.2;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BuchBart1986';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from PTAG2005';
data.tx = 28;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from DawsWhit1999; Rahn1991';
data.tp = 84;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(38.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from DawsWhit1999; Rahn1991';
data.tR = 1095;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'ADW';
  temp.tR = C2K(38.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5840;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(38.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 69.85;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ADW';

data.Wwb = 80.96;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BuchBart1986';
data.Wwi = 5000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'ARKive';

data.Ri  = 2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % age (d) weight (g)
0 85.63224897;
1	101.5221626;
2	115.1168845;
3	158.7712652;
4	179.2973024;
5	236.8535196;
6	296.7310658;
7	273.2760048;
8	372.5115943;
9	538.8696943;
10	559.3826628;
11	640.0998952;
12	769.4278152;
13	926.5267366;
14	854.4544536;
15	1009.23858;
16	1108.47417;
17	1233.159432;
18	1188.864685;
19	1274.204972;
20	1489.186828;
21	1551.3661;
22	1523.28145;
23	1645.664986;
24	1772.671577;
25	1969.115473;
26	2112.338695;
27	2033.328563;
28	2192.742279;
29	2060.491869;
30	2446.761995;
31	2488.11465;
32	2608.176857;
33	2698.140199;
34	2700.154414;
35	2593.366745;
36	2766.65616;
37	2703.84959;
38	2918.818378;
39	2976.381129;
40	2906.630175;
41	3086.863975;
42	2987.027224;
43	3039.947318;
44	3028.072765;
45	2974.512304;
46	3113.086334;
47	3043.348449;
48	3133.298723;
49	3095.967962];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Jane1997';
  
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
metaData.links.id_CoL = '4QPKQ'; % Cat of Life
metaData.links.id_ITIS = '174445'; % ITIS
metaData.links.id_EoL = '45512077'; % Ency of Life
metaData.links.id_Wiki = 'Pygoscelis_adeliae'; % Wikipedia
metaData.links.id_ADW = 'Pygoscelis_adeliae'; % ADW
metaData.links.id_Taxo = '51413'; % Taxonomicon
metaData.links.id_WoRMS = '225757'; % WoRMS
metaData.links.id_avibase = '4A947BE7A06E046E'; % avibase
metaData.links.id_birdlife = 'adelie-penguin-pygoscelis-adeliae'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pygoscelis_adeliae}}';
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
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs.}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles}, ' ...
'editor = {Deeming, D. C. and Fergunson, M. W. J}, ' ...
'publisher = {Cambridge University Press}, '...
'address = {Cambridge}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BuchBart1986'; type = 'Article'; bib = [ ... 
'author = {Bucher, T. L. and Bartholomew, G. A. and Trivelpiece, W. Z. and Volkman, N. J.}, ' ... 
'year = {1986}, ' ...
'title = {Metabolism, growth, and activity in Ad\''{e}lie and Emperor Penguin embryos}, ' ...
'journal = {The Auk}, ' ...
'volume = {103}, ' ...
'pages = {485--493}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DawsWhit1999'; type = 'Incollection'; bib = [ ... 
'author = {Dawson, W. R. and Whittow, G. C.}, ' ... 
'year = {1999}, ' ...
'title = {Regulation of Body Temperature}, ' ...
'booktitle = {Sturkie''s Avian Physiology, Fifth Edition}, ' ...
'editor = {Whittow, G. C.}, ' ...
'publisher = {Academic Press}, '...
'address = {San Diego}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jane1997'; type = 'Article'; bib = [ ... 
'author = {Janes, D. N.}, ' ... 
'year = {1997}, ' ...
'title = {Energetics, Growth, and Body Composition of Ad\''{e}lie Penguin Chicks, \emph{Pygoscelis adeliae}}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {70}, ' ...
'pages = {237--243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PTAG2005'; type = 'Book'; bib = [ ... 
'author = {Penguin Taxon Advisory Group.}, ' ... 
'year = {2005}, ' ...
'title = {Penguin Husbandry Manual Third Edition}, ' ...
'publisher = {American Zoo and Aquarium Associations}, ' ...
'address = {Silver Spring}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VlecVlec2002'; type = 'Article'; bib = [ ... 
'author = {Vleck, C. M. and Vleck, D.}, ' ... 
'year = {2002}, ' ...
'title = {Physiological Condition and Reproductive Consequences in Ad\''{e}lie Penguins}, ' ...
'journal = {Integrated and Comparative Biology}, ' ...
'volume = {42}, ' ...
'number = {1}, '...
'pages = {76--83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\urlhttp://animaldiversity.ummz.umich.edu/accounts/Pygoscelis_adeliae/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ARKive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/adelie-penguin/pygoscelis-adeliae/}}';
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

