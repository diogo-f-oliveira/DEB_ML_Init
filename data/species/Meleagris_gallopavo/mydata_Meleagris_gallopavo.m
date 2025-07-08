function [data, auxData, metaData, txtData, weights] = mydata_Meleagris_gallopavo

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Meleagris_gallopavo'; 
metaData.species_en = 'Wild turkey'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'; 't-Wwe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                 
metaData.date_subm = [2018 08 12];                            
metaData.email     = {'bas.kooijman@vu.nl'};                  
metaData.address   = {'VU University of Amsterdam'};      

metaData.author_mod_1    = {'Bas Kooijman'};                 
metaData.date_mod_1      = [2022 11 04];                            
metaData.email_mod_1     = {'bas.kooijman@vu.nl'};                  
metaData.address_mod_1   = {'VU University of Amsterdam'};      

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 21];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 21];

%% set data
% zero-variate data;
data.ab = 28;      units.ab = 'd';    label.ab = 'age at birth';                          bibkey.ab = 'EoL';  
  temp.ab = C2K(37.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 1;       units.tx = 'd';    label.tx = 'time since birth at fledging';          bibkey.tx = 'EoL';  
  temp.tx = metaData.T_typical; units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 70;       units.tp = 'd';    label.tp = 'time since birth at puberty';          bibkey.tp = 'McRoWall2020';  
  temp.tp = metaData.T_typical; units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'puberty is assumed to occur after completing first molt';
data.tR = 304;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';         bibkey.tR = 'EoL'; 
  temp.tR = metaData.T_typical;  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 13*365;     units.am = 'd';    label.am = 'life span';                          bibkey.am = 'AnAge';                   
  temp.am = metaData.T_typical; units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 47;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';                    bibkey.Wwb = 'AnAge'; 
data.Wwi = 15e3;    units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';               bibkey.Wwi = 'DietDren1997';   
  comment.Wwi = 'EoL: 3.6 till 5.4 kg';
data.Wwim = 30e3;    units.Wwim = 'g';    label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'DietDren1997';   
  comment.Wwim = 'EoL: 6.8 till 11 kg; Wiki: till 39 kg';

data.Ri  = 11/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'EoL';   
  temp.Ri = metaData.T_typical; units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time (d), weight (g)
     0   700
    10  1250
    20  1980
    30  2840
    40  3750
    50  4690
    60  5640
    70  6610
    80  7600
    90  8600
   102  9840];
data.tW(:,1) = 25 + data.tW(:,1); % shift origin to birth
units.tW = {'d', 'g'};     label.tW = {'time', 'wet weight'};  
temp.tW = metaData.T_typical; units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Reid1987';
comment.tW = 'Data for male';
%
data.tW_fm = [ ... % time (d), weight (g)
  3   520.000   450.000
  6	  522.737   460.494
 11	  529.901   470.241
 20	  992.256   689.224
 27	  983.143   919.345
 48	 2514.243  2930.053
 69	 4760.769  5655.047
 91	 7485.764  8978.126
132	11386.424 16346.547
233	13182.962 24841.647];
units.tW_fm = {'d', 'g'};     label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm = metaData.T_typical; units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'DietDren1997'; treat.tW_fm = {1, {'females','males'}};
%
data.tWe = [ ... % age (d), yolk-free embryo weight (g)
 9.070   1.244
10.963	 2.333
12.957	 3.889
15.050	 6.844
17.143	12.133
19.037	19.289
20.033	22.244
21.329	28.778
22.226	33.289
23.023	37.489
24.219	43.711
25.017	48.844
26.213	51.800
27.209	57.244];
units.tWe = {'d', 'g'}; label.tWe = {'age', 'yolk-free embryo weight'};  
temp.tWe = C2K(37.5); units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'DietDren1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tWe = weights.tWe * 2;
weights.tW_fm = weights.tW_fm * 2;
weights.tW = weights.tW * 2;
weights.Wwi = 2 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: tW_tf and tWwe data added, Wwi and Wwim data updated';
D3 = 'mod_1: tp data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3ZDJV'; % Cat of Life
metaData.links.id_ITIS = '176136'; % ITIS
metaData.links.id_EoL = '45510619'; % Ency of Life
metaData.links.id_Wiki = 'Meleagris_gallopavo'; % Wikipedia
metaData.links.id_ADW = 'Meleagris_gallopavo'; % ADW
metaData.links.id_Taxo = '52932'; % Taxonomicon
metaData.links.id_WoRMS = '1525634'; % WoRMS
metaData.links.id_avibase = '9C5ED06A51A9FFEE'; % avibase
metaData.links.id_birdlife = 'wild-turkey-meleagris-gallopavo'; % birdlife
metaData.links.id_AnAge = 'Meleagris_gallopavo'; % AnAge

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Meleagris_gallopavo}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Reid1987'; type = 'Article'; bib = [ ... 
'author = {B. Reid}, ' ... 
'year = {1987}, ' ...
'title = {Food intake and growth rate of cassowary chicks \emph{Casuarius spp} reared at {Mendi, southern Highland Papua New Guinea}}, ' ...
'journal = {Int. Zoo Yb}, ' ...
'volume = {26}, ' ...
'pages = {189--198}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DietDren1997'; type = 'Article'; bib = [ ... 
'author = {Maurine W. Dietz and Rudi H. Drent}, ' ... 
'year = {1997}, ' ...
'title = {Effect of Growth Rate and Body Mass on Resting Metabolic Rate in Galliform Chicks}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {70(5)}, ' ...
'pages = {493–501}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Meleagris_gallopavo}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1178368/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'McRoWall2020'; type = 'Misc'; bib = [ ...
'doi = {10.2173/bow.wiltur.01}, ' ...
'year = {2020}, ' ...
'author = {McRoberts, J. T. and M. C. Wallace and S. W. Eaton}, ' ...
'title = {Wild Turkey (Meleagris gallopavo), version 1.0.}, ' ...
'howpublished = {In Birds of the World (A. F. Poole, Editor). Cornell Lab of Ornithology, Ithaca, NY, USA.}']; 
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

