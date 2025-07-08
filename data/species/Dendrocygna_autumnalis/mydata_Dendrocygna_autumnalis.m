function [data, auxData, metaData, txtData, weights] = mydata_Dendrocygna_autumnalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Dendrocygna_autumnalis'; 
metaData.species_en = 'Black-bellied whistling duck'; 

metaData.ecoCode.climate = {'A', 'Cfa'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'biFp', 'biFm'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCi', 'xiHl', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww','Ww-JX','Ww-JP','Ww-JA'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1 = {'Bas Kooijman'};    
metaData.date_mod_1   = [2022 11 16];              
metaData.email_mod_1  = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1= {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 24];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 28;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'AnAge';   
  temp.ab = C2K(34);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 3;     units.tx = 'd';    label.tx = 'time since birth at fledging';    bibkey.tx = 'guess';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4 * 30.5;     units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'JameThom2020';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'time they stay with parents after fledging';
data.tR = 365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8.2 * 365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 22;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Cain1976';
data.Wwi =978.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'JameThom2020';
comment.Wwi = 'range 655-978.7';
data.Ri  = 14/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
2.600	22.625
2.600	24.444
2.600	26.183
2.600	27.806
2.800	29.028
6.400	45.786
6.400	50.324
6.800	31.645
6.800	33.896
6.800	39.566
9.400	65.702
9.600	53.922
9.800	38.241
9.800	60.296
15.800	97.613
15.800	106.370
16.000	81.500
16.200	74.792
16.600	114.931
20.000	111.087
20.000	114.971
20.000	123.152
20.000	142.519
25.000	106.471
25.000	124.278
25.000	135.428
25.000	213.535
27.600	127.557
27.600	134.305
27.600	260.259
28.000	141.416
30.800	165.115
30.800	181.481
30.800	196.071
31.000	223.045
31.200	123.293
31.200	271.783
31.200	309.166
33.600	293.704
33.800	206.507
33.800	253.797
33.800	334.110
34.000	217.436
34.000	238.988
34.000	262.676
34.000	281.366
34.200	181.544
36.800	281.446
36.800	351.893
37.000	203.055
37.000	243.205
37.000	301.478
37.000	396.879
39.600	265.095
39.800	407.359
40.000	325.815
40.000	355.046
40.000	370.630
44.800	358.285
44.800	404.080
45.000	421.826
45.200	331.638
49.600	343.388
49.600	364.674
50.000	411.302
50.000	425.683
50.000	488.414
56.800	565.618
56.800	683.302
57.000	528.057
57.200	621.707
62.400	595.881
62.600	627.418
62.800	480.722
62.800	738.688
68.800	485.168
69.000	576.140
69.000	611.853
69.000	655.387
76.400	667.251
76.800	622.954
79.200	511.378
79.200	617.777
79.400	667.456
84.200	679.358
84.400	529.539
84.400	628.818];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Cain1976';

% weight - energy intake, excretory energy - metabolized energy
WXPA = [ ... % weight (g), energy intake (kcal/d), excretory energy (kcal/d), metablized energy (kcal/d)
 54.0  49.8 15.4  34.5
109.0  93.1 31.1  62.0
148.7 115.3 40.2  75.1
198.9 150.4 32.2 118.3
275.0 195.6 35.1 160.5
379.8 172.3 30.2 142.0
576.5 242.2 26.3 215.9
684.7 125.5 16.8 108.7];
%
data.WpX = [WXPA(:,1), 4.186 * WXPA(:,2)];
units.WpX   = {'g', 'kJ/d'};  label.WpX = {'wet weight', 'energy intake'};  
temp.WpX    = C2K(41.2);  units.temp.WpX = 'K'; label.temp.WpX = 'temperature';
bibkey.WpX = 'Cain1976';
%
data.WpP = [WXPA(:,1), 4.186 * WXPA(:,3)];
units.WpP   = {'g', 'kJ/d'};  label.WpP = {'wet weight', 'excretory energy'};  
temp.WpP    = C2K(41.2);  units.temp.WpP = 'K'; label.temp.WpP = 'temperature';
bibkey.WpP = 'Cain1976';
%
data.WpA = [WXPA(:,1), 4.186 * WXPA(:,4)];
units.WpA   = {'g', 'kJ/d'};  label.WpA = {'wet weight', 'metablized energy'};  
temp.WpA    = C2K(41.2);  units.temp.WpA = 'K'; label.temp.WpA = 'temperature';
bibkey.WpA = 'Cain1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.ab = 8 * weights.ab;
weights.Wwb = 3 * weights.Wwb;
weights.WpX(end) = 0;
weights.WpP(end) = 0;
weights.WpA(end) = 0;

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
D2 = 'Energy intake of adult seems to be half the value after 9 wks, which the std model cannot capture';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '34Q2Z'; % Cat of Life
metaData.links.id_ITIS = '175044'; % ITIS
metaData.links.id_EoL = '45510521'; % Ency of Life
metaData.links.id_Wiki = 'Dendrocygna_autumnalis'; % Wikipedia
metaData.links.id_ADW = 'Dendrocygna_autumnalis'; % ADW
metaData.links.id_Taxo = '51988'; % Taxonomicon
metaData.links.id_WoRMS = '422567'; % WoRMS
metaData.links.id_avibase = 'C01A22D6C148AC65'; % avibase
metaData.links.id_birdlife = 'black-bellied-whistling-duck-dendrocygna-autumnalis'; % birdlife
metaData.links.id_AnAge = 'Dendrocygna_autumnalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendrocygna_autumnalis}}';
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
bibkey = 'Cain1976'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1366940}, ' ...
'author = {Cain, B. W.}, ' ... 
'year = {1976}, ' ...
'title = {Energetics of Growth for Black-Bellied Tree Ducks}, ' ...
'journal = {The Condor}, ' ...
'volume = {78}, ' ...
'pages = {124-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dendrocygna_autumnalis}}';
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
%
bibkey = 'JameThom2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.bbwduc.01}, ' ...
'author = {James, J. D. and J. E. Thompson}, ' ...
'year = {2020}, ' ...
'title = {Black-bellied Whistling-Duck (\emph{Dendrocygna autumnalis})}, ' ...
'howpublished = {version 1.0. In Birds of the World (A. F. Poole and F. B. Gill, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
