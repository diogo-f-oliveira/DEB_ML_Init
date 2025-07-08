function [data, auxData, metaData, txtData, weights] = mydata_Vultur_gryphus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Cathartiformes'; 
metaData.family     = 'Cathartidae';
metaData.species    = 'Vultur_gryphus'; 
metaData.species_en = 'Andean condor'; 

metaData.ecoCode.climate = {'BWk', 'BSk', 'Csb', 'Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biSvm', 'biSvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww', 'Ww-JX'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2015 09 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 08 13];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2022 11 29];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};   

metaData.author_mod_4   = {'Bas Kooijman'};    
metaData.date_mod_4     = [2023 04 10];              
metaData.email_mod_4    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_4  = {'VU University, Amsterdam'};   

metaData.author_mod_5   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_5     = [2023 07 04];              
metaData.email_mod_5    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_5  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 56;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = {'FergChris2001','AnAge'};  
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temps are guessed';
data.tx = 6*30.5;     units.tx = 'd';    label.tx = 'nestling period';     bibkey.tx = 'FergChris2001';  
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 549;     units.tp = 'd';    label.tp = 'nestling period';     bibkey.tp = 'guess';  
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2555;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 79*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Ww0  = 280;    units.Ww0  = 'g';  label.Ww0  = 'egg wet weight';        bibkey.Ww0  = 'Wiki';
data.Wwb = 224;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = '0.8*W0 to account for water and energy loss';
data.Wwi = 10500;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'FergChris2001','AnAge'};
  comment.Wwi = 'females 7.5-11 kg';
data.Wwim = 12000;    units.Wwim = 'g';   label.Wwim = 'ultimate wet weight'; bibkey.Wwim = {'FergChris2001','AnAge'};
  comment.Wwim = 'males 11-15 kg';

data.Ri  = 1/2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'FergChris2001';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-weight
tJJWW = [ ... % time since birth (d), food (f g/d, m g/d), weight (f g, m g)
 1   0   0  182  202
 2  14  11  179  202
 3  17  19  183  197
 4  31  27  199  199
 5  43  44  336  206
 6  46  51  250  222
 7  48  63  265  244
 8  70  78  284  269
 9 157  83  328  301  
10 108  98  387  330
15 144 164  686  545
25 270 339 1239 1331
35 442 374 2297 2438
45 558 458 3387 3531
55 505 559 4479 4560
65 555 605 5505 5450
75 457 660 5933 6400
85 815 680 7150 7550
95 855 705 7700 8325]; 
data.tW_f = tJJWW(:,[1 4]);
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'SamoOlne1985';
comment.tW_f = 'Data for females';
%
data.tW_m = tJJWW(:,[1 5]);
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'SamoOlne1985';
comment.tW_m = 'Data for males';

% time-food intake
data.WJX_f = tJJWW(:,[4 2]);
units.WJX_f   = {'g', 'g/d'};  label.WJX_f = {'wet weight', 'food intake', 'female'};  
temp.WJX_f    = C2K(40);  units.temp.WJX_f = 'K'; label.temp.WJX_f = 'temperature';
bibkey.WJX_f  = 'SamoOlne1985';
comment.WJX_f = 'Data for females';
%
data.WJX_m = tJJWW(:,[5 3]);
units.WJX_m   = {'g', 'g/d'};  label.WJX_m = {'wet weight', 'food intake', 'male'};  
temp.WJX_m    = C2K(40);  units.temp.WJX_m = 'K'; label.temp.WJX_m = 'temperature';
bibkey.WJX_m  = 'SamoOlne1985';
comment.WJX_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2;
weights.tW_m = weights.tW_m * 2;

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'WJX_f','WJX_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Body temperature is guessed';
D3 = 'mod_3: additional tW data; ignore guessed Wwx';
D4 = 'scaled functional response turned out to vary during handrearing';
D5 = 'mod_4: v is reduced';
D6 = 'mod_5: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5, 'D6',D6);

%% Facts
F1 = 'wings have the largest surface area (measured in square centimeters) of any extant bird';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'It sometimes takes a condor one week to hatch from an egg; Condors do not have talons like eagles or hawks; their nails are more like toenails';
metaData.bibkey.F2 = 'ventanaws'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5BSLM'; % Cat of Life
metaData.links.id_ITIS = '175279'; % ITIS
metaData.links.id_EoL = '1049160'; % Ency of Life
metaData.links.id_Wiki = 'Vultur_gryphus'; % Wikipedia
metaData.links.id_ADW = 'Vultur_gryphus'; % ADW
metaData.links.id_Taxo = '52316'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '659E8F5C0AEA27F2'; % avibase
metaData.links.id_birdlife = 'andean-condor-vultur-gryphus'; % birdlife
metaData.links.id_AnAge = 'Vultur_gryphus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vultur_gryphus}}';
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
bibkey = 'FergChris2001'; type = 'Book'; bib = [ ... 
'author = {Ferguson-Lees, J. and Christie, D. A.}, ' ... 
'year = {2001}, ' ...
'title = {Raptors of the world}, ' ...
'publisher = {Helm}, ' ...
'isbn = {0 7136 8026 1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Vultur_gryphus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ventanaws'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.ventanaws.org/species_condors_coolfacts/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SamoOlne1985'; type = 'Article'; bib = [ ... 
'author = {H. J. Samour and P. J. S. Olney and D. Herbert and F. Smith and J. White and D. Wood}, ' ... 
'year = {1985}, ' ...
'title = {Breeding and hand-rearing of the {A}ndean condor \emph{Vultur gryphys} at the {Londo Zoo}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {23}, ' ...
'pages = {7-11}']; 
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

