function [data, auxData, metaData, txtData, weights] = mydata_Saxicola_torquatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Muscicapidae';
metaData.species    = 'Saxicola_torquatus'; 
metaData.species_en = 'African stonechat'; 

metaData.ecoCode.climate = {'B', 'C'};
metaData.ecoCode.ecozone = {'THp', 'TPa'};
metaData.ecoCode.habitat = {'0iTd', '0iThh', '0iTg'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 16];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 10];

%% set data
% zero-variate data

data.ab = 14;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'StarKoni2008';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 14;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'StarKoni2008';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 42;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'StarKoni2008';
data.Wwi = 21;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'StarKoni2008';

data.Ri  = 2.5*5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'StarKoni2008';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 eggs per clutch, 2 to 3 clutches per yr';
  
% uni-variate data
% time-weight
data.tW_a = [ % time since birth (d), wet weight  (g)
 1	 2.202
 2	 2.936
 3	 4.289
 4	 5.448
 5	 7.109
 6	 8.770
 7	10.354
 8	12.672
 9	14.565
10	16.496
11	17.231
12	18.004
13	18.159
14	18.238
15	17.775
16	17.583
17	17.314
18	16.813
19	17.007
20	16.892
21	16.854
22	16.971
23	16.895
24	17.012
25	16.742
26	16.859
27	16.821
28	16.938
29	16.785
30	16.863];
data.tW_a(:,1) = data.tW_a(:,1) - 1; % set origin at hath
units.tW_a   = {'d', 'g'};  label.tW_a = {'time since birth', 'wet weight'};  
temp.tW_a    = C2K(41.6);  units.temp.tW_a = 'K'; label.temp.tW_a = 'temperature';
bibkey.tW_a = 'StarKoni2008';
comment.tW_a = 'Data for Saxicola torquata axillaris';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_a = weights.tW_a * 2;

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
D1 = 'Body temperature is guessed';
D2 = 'Feeding is reduced towards end of nestling period';
D3 = 'mod_1: v is reduced';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '6XQRC'; % Cat of Life
metaData.links.id_ITIS = '554448'; % ITIS
metaData.links.id_EoL = '45513719'; % Ency of Life
metaData.links.id_Wiki = 'Saxicola_torquatus'; % Wikipedia
metaData.links.id_ADW = 'Saxicola_torquatus'; % ADW
metaData.links.id_Taxo = '56976'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '78B665BF7C704DD7'; % avibase
metaData.links.id_birdlife = 'common-stonechat-saxicola-torquatus'; % birdlife
metaData.links.id_AnAge = 'Saxicola_torquatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Saxicola_torquata}}';
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
bibkey = 'StarKoni2008'; type = 'Article'; bib = [ ... 
'author = {Starck, J. M. and K\"{o}nig, S. and Gwinner, E.}, ' ... 
'doi = {10.1111/j.1474-919x.1995.tb03262.x}, ' ...
'year = {2008}, ' ...
'title = {Growth of Stonechats \emph{Saxicola torquata} from {A}frica and {E}urope: an analysis of genetic and environmental components}, ' ...
'journal = {Ibis}, ' ...
'volume = {137}, ' ...
'pages = {519-531}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Saxicola_torquata}}';
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

