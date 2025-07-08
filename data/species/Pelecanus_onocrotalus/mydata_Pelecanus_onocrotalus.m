function [data, auxData, metaData, txtData, weights] = mydata_Pelecanus_onocrotalus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Pelecaniformes'; 
metaData.family     = 'Pelecanidae';
metaData.species    = 'Pelecanus_onocrotalus'; 
metaData.species_en = 'Great white pelican'; 

metaData.ecoCode.climate = {'Csa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'TPa', 'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFe'};
metaData.ecoCode.embryo  = {'Tnpfm', 'Tnsfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2012 07 31];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'Lisbon University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 08 07];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 12 15];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_4     = [2023 07 02];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 02];

%% set data
% zero-variate data

data.ab = 32.5;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = {'CramSimm1977','SnowPerr1998'};   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from OberVerk1998; Sedg2011';
data.tx = 80;     units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'CramSimm2004';   
  temp.tx = C2K(40.6);    units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx  = 'temps from AbraEvan1999 for Pelecanus erythrorhynchos';
data.tp = 240;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.6);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp  = 'temps from AbraEvan1999 for Pelecanus erythrorhynchos';
data.tR = 1095;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'CramSimm2004';
  temp.tR = C2K(40.6);    units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 18615;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CramSimm2004';   
  temp.am = C2K(40.6);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 157.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SnowPerr1998';

data.Wwb = 106.2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Sedg2011';
data.Wwi = 7590;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';
data.Wwim = 11450; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'CramSimm2004';   
  temp.Ri = C2K(40.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % weight^1/3 (g^1/3) at age (d)
0 4.73559811387689;
1 4.69814322310175;
2 4.66468169549284;
3 4.70568197676223;
4 4.96509016122481;
5 5.24754231148817;
6 5.70417258856963;
7 6.01846165480645;
8 5.86067886538962;
9 5.92973592758163;
10 6.03314984400369;
11 6.22222340324996;
12 6.59696830458033;
13 6.81631032810149;
14 7.08136354300997;
15 7.57872628700455;
16 8.10639133822717;
17 8.59523803433841;
18 9.16168691877341;
19 9.87511349546425;
20 10.4768955317165;
21 10.96684230073;
22 11.5779207441248;
23 12.0092521239428;
24 12.3420115855534;
25 12.6702052286723;
26 13.1250264549731;
27 13.4663083044634;
28 13.9522180583432;
29 14.3273215579383;
30 14.8124803420368;
31 15.1102980787737;
32 15.3827433619623;
33 15.7406091663144;
34 15.979139480908;
35 16.2865056995694;
36 16.4605731431584;
37 16.6791018308052;
38 16.9153811162298;
39 17.2130062072632;
40 17.4131753823472;
46 18.2716013686352;
53 19.1747497937454;
60 19.4429628500738;
67 19.789458048402];
data.tW(:,2) = data.tW(:,2).^3; % convert weight^1/3 to weight
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Sedg2011';

% hand-raised data
data.tW1 = [ ...
  1  129
  3  135
  4  150
  5  172
  6  194
  7  319
  8  376
  9  415
 10  484
 11  590
 12  650
 13  850
 14  905
 15 1010
 16 1125];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(40.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'OberVerk1998';
%
data.tW2 = [ ...
   1 107
   2 113
   3 125
   4 139
   5 150
   6 184
   7 225
   8 262
   9 330
  10 380
  11 462
  12 520
  13 580
  14 640];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(40.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'OberVerk1998';
%
data.tW3 = [ ...
   1  123
   2  128
   3  147
   4  158
   5  190
   6  215
   7  242
   8  339
   9  418
  10  513
  11  630
  12  805
  14 1180];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(40.6);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'OberVerk1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Hand-reared chicks'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'mod_1: hand-reared data added and varying food for tW data';
D2 = 'mod_3 = v is reduced';
D3 = 'mod_3: males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '75YWG'; % Cat of Life
metaData.links.id_ITIS = '174693'; % ITIS
metaData.links.id_EoL = '45513853'; % Ency of Life
metaData.links.id_Wiki = 'Pelecanus_onocrotalus'; % Wikipedia
metaData.links.id_ADW = 'Pelecanus_onocrotalus'; % ADW
metaData.links.id_Taxo = '51649'; % Taxonomicon
metaData.links.id_WoRMS = '137176'; % WoRMS
metaData.links.id_avibase = '8BAFB01E85D7AF4B'; % avibase
metaData.links.id_birdlife = 'great-white-pelican-pelecanus-onocrotalus'; % birdlife
metaData.links.id_AnAge = 'Pelecanus_onocrotalus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelecanus_onocrotalus}}';
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
bibkey = 'SnowPerr1998'; type = 'Book'; bib = [ ... 
'author = {Snow, D. W. and Perrins, C. M.}, ' ... 
'year = {1998}, ' ...
'title = {The Birds of the Western Palearctic, Concise Edition}, ' ...
'publisher = {Oxford University Press}, ' ...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CramSimm2004'; type = 'Book'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {2004}, ' ...
'title = {BWPi: Birds of the Western Palearctic interactive (DVD-ROM)}, ' ...
'howpublished = {DVD-ROM}, ' ...
'publisher = {BirdGuides Ltd}, '...
'address = {Sheffield}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CramSimm1977'; type = 'Incollection'; bib = [ ... 
'author = {Cramp, S. and Simmons, K. E. L.}, ' ... 
'year = {1977}, ' ...
'title = {Ostrich to Ducks.}, ' ...
'booktitle = {Handbook of the Birds of Europe, the Middle East and North Africa, The Birds of the Western Palearctic}, ' ...
'volume = {I}, ' ...
'publisher = {Oxford University Press}, '...
'address = {Oxford}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AbraEvan1999'; type = 'Article'; bib = [ ... 
'author = {Abraham, C. L. and Evans, R. M.}, ' ... 
'year = {1999}, ' ...
'title = {The development of endothermy in {A}merican White Pelicans}, ' ...
'journal = {The Condor}, ' ...
'volume = {101}, ' ...
'pages = {832--841}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OberVerk1998'; type = 'Article'; bib = [ ... 
'author = {Ober, S. H. and Verkade, R.}, ' ... 
'year = {1998}, ' ...
'title = {Hand-rearing the Eastern or Great white pelican \emph{Pelecanus onocrotalus} at {V}ogelpark {A}vifauna, {A}lphen}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {36}, ' ...
'pages = {171--173}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sedg2011'; type = 'Misc'; bib = [...
'year  = {2011}, ' ...
'title = {Eastern White Pelican protocols}, ' ...
'institution = {Sedgwick County Zoo}, ' ...
'howpublished = {\url{http://www.scz.org/animal_exhibits-animal.php?a_id=122}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=8BAFB01E85D7AF4B&sec=lifehistory}}';
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

