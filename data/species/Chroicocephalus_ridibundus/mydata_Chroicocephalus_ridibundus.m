function [data, auxData, metaData, txtData, weights] = mydata_Chroicocephalus_ridibundus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Chroicocephalus_ridibundus'; 
metaData.species_en = 'Black-headed gull'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFl', '0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCvf', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 05 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 22;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 31;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'NelsBran1987';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 93;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 32.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge: might be 63 yr';

data.Wwb = 26; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NelsBran1987';
data.Wwi = 306; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
5.038	54.545
10.072	102.579
15.115	164.937
20.155	221.218
23.188	230.509
25.259	244.517
28.247	252.069
30.351	250.888];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'free ranging'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'NelsBran1987';
comment.tW = 'data from free ranging';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.809	28.259
1.950	29.627
2.962	33.158
3.931	40.158
4.989	46.730
6.000	49.826
7.017	62.038
7.941	66.866
9.044	75.610
10.061	86.954
10.986	92.650
12.091	105.734
13.065	118.378
14.041	133.191
15.054	139.760
16.070	149.802
17.039	155.500
18.094	159.033
19.071	176.885
20.136	193.874
21.099	192.193
22.214	218.299
23.229	227.039
24.192	224.056
25.204	228.455
26.261	234.159
27.181	233.778
28.239	241.652
29.378	239.113];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'hand reared'};  
temp.tW1    = C2K(40.9);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'NelsBran1987';
comment.tW1 = 'data from hand reared';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
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
D1 = 'mod_1: v reduced and food availability variable';
D2 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Group plots
set1 = {'tW', 'tW1'}; subtitle1 = {'data free ranging, hand reared'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '5YGFK'; % Cat of Life
metaData.links.id_ITIS = '824041'; % ITIS
metaData.links.id_EoL = '45509275'; % Ency of Life
metaData.links.id_Wiki = 'Chroicocephalus_ridibundus'; % Wikipedia
metaData.links.id_ADW = 'Larus_ridibundus'; % ADW
metaData.links.id_Taxo = '2682065'; % Taxonomicon
metaData.links.id_WoRMS = '137149'; % WoRMS
metaData.links.id_avibase = 'FB02DD9658CC1EC6'; % avibase
metaData.links.id_birdlife = 'black-headed-gull-larus-ridibundus'; % birdlife
metaData.links.id_AnAge = 'Chroicocephalus_ridibundus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chroicocephalus_ridibundus}}';
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
bibkey = 'NelsBran1987'; type = 'Article'; bib = [ ... 
'author = {Nelsen, I. and Brandl, R.}, ' ... 
'year = {1987}, ' ...
'title = {Wachtum und {O}rganentwicklung bei {L}achmoewennestlingen (\emph{Larus ridibundus})}, ' ...
'journal = {J. Orn.}, ' ...
'volume = {128}, ' ...
'pages = {431--439}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Larus_ridibundus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Chroicocephalus_ridibundus}}';
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

