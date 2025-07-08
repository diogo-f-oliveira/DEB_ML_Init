function [data, auxData, metaData, txtData, weights] = mydata_Urocolius_macrourus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Coliiformes'; 
metaData.family     = 'Coliidae';
metaData.species    = 'Urocolius_macrourus'; 
metaData.species_en = 'Blue-naped mousebird'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 10 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 26];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3  = {'Bas Kooijman'};    
metaData.date_mod_3    = [2022 11 20];              
metaData.email_mod_3   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3 = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 04];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 12;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'FinkMiso1995';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from Rahn1991';
data.tx = 12.5;   units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'FinkMiso1995';   
  temp.tx = C2K(39.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temps from Prin1988, FinkMiso1995';
data.tp = 37.5;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temps from Prin1988, FinkMiso1995';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Oise2012';
  temp.tR = C2K(39.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 4380;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Schi1989';   
  temp.am = C2K(39.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 11.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'PrinHaub2003';

data.Wwb = 2.34;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'FinkMiso1995';
data.Wwi = 55.78; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'FinkMiso1995';

data.Ri  = 15/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'HoyoElli2001';   
  temp.Ri = C2K(39.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0 2.34102916;
1	2.82106394;
2	4.56730859;
3	7.29813015;
4	10.53145434;
5	14.70921026;
6	18.34446066;
7	22.52221658;
8	25.35366199;
9	27.42125788;
10	30.17231804;
11	31.35586599;
12	32.80066598;
13	33.14012145;
14	33.21827746;
15	33.11551924;
16	33.75637194;
17	35.00006653;
18	35.84183491;
19	36.40239723;
20	37.103444;
21	37.64395744;
22	37.23975457;
23	38.16205048;
24	40.08906705;
25	38.15763944;
26	41.61192818;
27	42.232732;
28	42.17026127;
29	43.07231858;
30	46.04439073;
31	44.3137365;
32	45.51733332;
33	46.13808972;
34	47.30144649;
35	47.1784971;
36	48.80411645;
37	47.15394232;
38	48.15662348;
39	48.37540623;
40	50.28213677;
42	49.57435486;
44	50.07225673;
45	52.64235524;
46	50.59030233;
48	51.08834649;
50	51.42533557;
55	52.53986737;
60	53.31247731;
65	53.58263206;
70	52.70724967;
80	54.69435123;
90	55.19461039;
100	55.77539708];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(39.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'FinkMiso1995';
  
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
metaData.links.id_CoL = '7DTGY'; % Cat of Life
metaData.links.id_ITIS = '554670'; % ITIS
metaData.links.id_EoL = '45514051'; % Ency of Life
metaData.links.id_Wiki = 'Urocolius_macrourus'; % Wikipedia
metaData.links.id_ADW = 'Urocolius_macrourus'; % ADW
metaData.links.id_Taxo = '55152'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'E45D9EB2FE2364EE'; % avibase
metaData.links.id_birdlife = 'blue-naped-mousebird-urocolius-macrourus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% Discussion points
D1 = 'mod_3: v is reduced';
D2 = 'mod_4: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urocolius_macrourus}}';
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
bibkey = 'HoyoElli2001'; type = 'Article'; bib = [ ... 
'author = {del Hoyo, J. and Elliot, A. and Sargatal, J.}, ' ... 
'year = {2001}, ' ...
'title = {Handbook of Birds of the World}, ' ...
'publisher = {Lynx Edicions}, ' ...
'volume = {6}, ' ...
'address = {Barcelona}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FinkMiso1995'; type = 'Article'; bib = [ ... 
'author = {Finke, C. and Misovic, A. and Prinzinger, R.}, ' ... 
'year = {1995}, ' ...
'title = {Growth, the development of endothermy, and torpidity in Blue-naped Mousebirds \emph{Urocolius macrourus}}, ' ...
'journal = {Ostrich}, ' ...
'volume = {66}, ' ...
'number = {1}, '...
'pages = {1--9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Prin1988'; type = 'Article'; bib = [ ... 
'author = {Prinzinger, R.}, ' ... 
'year = {1988}, ' ...
'title = {Energy metabolism, body-temperature and breathing parameters in nontorpid blue-naped mousebirds \emph{Urocolius macrourus}}, ' ...
'journal = {Journal of Comparative Physiology B}, ' ...
'volume = {157}, ' ...
'pages = {801--806}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinHaub2003'; type = 'Article'; bib = [ ... 
'author = {Prinzinger, R. and Haubitz, B. and Eichhorn, G. and Nothwang, U.}, ' ... 
'year = {2003}, ' ...
'title = {Comparative heart mass in Blue-naped Mousebirds (\emph{Urocolius macrourus}) and Speckled Mousebirds (\emph{Colius striatus})}, ' ...
'journal = {Ostrich}, ' ...
'volume = {74}, ' ...
'number = {1 \& 2}, ' ...
'pages = {139--140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rahn1991'; type = 'Incollection'; bib = [ ... 
'author = {Rahn, H.}, ' ... 
'year = {1991}, ' ...
'title = {Why birds lay eggs}, ' ...
'booktitle = {Egg incubation: its effects on embryonic development in birds and reptiles.}, ' ...
'editor = {Deeming, D. C. and Fergunson, M. W. J.}, ' ...
'publisher = {Cambridge University Press}, '...
'address = {Cambridge}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schi1989'; type = 'Article'; bib = [ ... 
'author = {Schifter, H.}, ' ... 
'year = {1989}, ' ...
'title = {Longevity records of mousebirds ({C}oliidae) in captivity}, ' ...
'journal = {Ostrich}, ' ...
'volume = {60}, ' ...
'number = {1}, '...
'pages = {43}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Oise2012'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.oiseaux-birds.com}}';
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

