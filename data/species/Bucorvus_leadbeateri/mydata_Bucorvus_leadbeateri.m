function [data, auxData, metaData, txtData, weights] = mydata_Bucorvus_leadbeateri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Bucerotiformes'; 
metaData.family     = 'Bucorvidae';
metaData.species    = 'Bucorvus_leadbeateri'; 
metaData.species_en = 'Southern ground hornbill'; 

metaData.ecoCode.climate = {'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 04];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 42;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'GunnGunn2012';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps from GunnGunn2012'; 
data.tx = 86;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Msim2004';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 258;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'SpeaMorr2005';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 25550; units.am = 'd';    label.am = 'life span';                bibkey.am = 'SpeaMorr2005';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 109.5;units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'ALR2012';

data.Wwb = 55;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GunnGunn2012';
data.Wwi = 3324; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 4000; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = {'Msim2004','Mabu2012'};   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1 55;
2	58;
3	69;
4	77;
5	84;
6	95;
7	110;
8	118;
9	136;
10	168;
11	169;
12	188;
13	190;
14	202;
15	244;
16	288;
17	336;
18	386;
19	457;
20	518;
21	591;
22	600;
23	655;
24	705;
25	780;
26	810;
27	930;
28	1030;
29	1120;
30	1210;
31	1255;
32	1340;
33	1380;
34	1390;
35	1480;
36	1600;
37	1785;
38	1900;
39	1980;
40	2150;
41	2200;
42	2250;
43	2375;
44	2380;
45	2420;
46	2550;
47	2500;
48	2600;
49	2620;
50	2710;
51	2740;
52	2750;
53	2730;
54	2830;
55	2860;
56	2885;
57	2910;
58	2920;
59	3100;
60	3110;
61	3130];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'GunnGunn2012';
  
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
D1 = 'Males are assumed to differ from females by {p_Am} only'; 
D2 = 'Body temperatures are guessed';
D3 = 'mod_2: scaled functional response is taken variable in tW data';
D4 = 'mod_2: v is reduced';
D5 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = 'NMVD'; % Cat of Life
metaData.links.id_ITIS = '554468'; % ITIS
metaData.links.id_EoL = '1048004'; % Ency of Life
metaData.links.id_Wiki = 'Bucorvus_leadbeateri'; % Wikipedia
metaData.links.id_ADW = 'Bucorvus_leadbeateri'; % ADW
metaData.links.id_Taxo = '105636'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '4192DE77F2F73998'; % avibase
metaData.links.id_birdlife = 'southern-ground-hornbill-bucorvus-leadbeateri'; % birdlife
metaData.links.id_AnAge = 'Bucorvus_leadbeateri'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bucorvus_leadbeateri}}';
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
bibkey = 'TacuCrai2013'; type = 'Article'; bib = [ ... 
'author = {Tacutu, R. and Craig, T. and Budovsky, A. and Wuttke, D. and Lehmann, G. and Taranukha, D. and Costa, J. and Fraifeld, V. E. and de Magalh\~{a}es, J. P.}, ' ... 
'year = {2013}, ' ...
'title = {Human Ageing Genomic Resources: Integrated databases and tools for the biology and genetics of ageing}, ' ...
'journal = {Nucleic Acids Research}, ' ...
'volume = {41}, ' ...
'pages = {D1027--D1033}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SpeaMorr2005'; type = 'Techreport'; bib = [ ... 
'author = {Spear, D. and Morrison, K. and Daly, B. and du Plessis, M. and Turner, A. and Friedmann, Y.}, ' ... 
'year = {2005}, ' ...
'title = {Southern Ground Hornbill population and habitat viability assessment (PHVA)}, ' ...
'institution = {Southern African Wildlife College}, ' ...
'address = {South Africa}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Msim2004'; type = 'Article'; bib = [ ... 
'author = {Msimanga, A.}, ' ... 
'year = {2004}, ' ...
'title = {Breeding biology of Southern Ground Hornbill \emph{Bucorvus leadbeateri} in {Z}imbabwe: impacts of human activities}, ' ...
'journal = {Bird Conservation International}, ' ...
'volume = {14}, ' ...
'pages = {S63--S68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GunnGunn2012'; type = 'Misc'; bib = [ ... 
'author = {Gunn, M. and Gunn, D. and Kemp, L. and Kemp, A.}, ' ... 
'year = {2012}, ' ...
'note = {Personal communication}, ' ...
'howpublished = {\url{http://www.mabulagroundhornbillconservationproject.org.za/}}, ' ...
'institution = {Loskop Dam Nature Reserve \& Mabula Ground Hornbill Conservation and Research Project}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ALR2012'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animals.jrank.org/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mabu2012'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.mabulagroundhornbillconservationproject.org.za}}';
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

