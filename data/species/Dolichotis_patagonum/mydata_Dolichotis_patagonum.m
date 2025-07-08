function [data, auxData, metaData, txtData, weights] = mydata_Dolichotis_patagonum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Caviidae';
metaData.species    = 'Dolichotis_patagonum'; 
metaData.species_en = 'Patagonian mara'; 

metaData.ecoCode.climate = {'C', 'B'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-tW'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'sta@akvaplan.niva.no'};            
metaData.date_acc  = [2018 09 06];              

%% set data
% zero-variate data

data.tg = 85;   units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 65;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 158;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.8); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 183;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 14.4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 650;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Rode1974';
data.Wwi = 12.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 8 till 16 kg';

data.Ri  = 2*3.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter; 3.5 litters per yr';
   
% univariate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
 1  649
 8  789
15  845
22  934
36 1611
40 1812
43 1896
50 2064
57 2377
64 2774];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Rode1974';
comment.tW = 'data concerns a male';
%
data.tW1 = [ ... % time since birth (d), wet weight (g)
 1  677
 8  906
29 1359
33 1471
36 1723
40 1840
43 1896
50 2321
57 2774];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(36.8);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Rode1974';
comment.tW1 = 'data concerns a male';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
 1  733
 8 1130
26 1298
30 1359
33 1704
47 2232
54 2461];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(36.8);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Rode1974';
comment.tW2 = 'data concerns a male';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1','tW2'}; subtitle1 = {'Data for male 1, 2, 3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '377CX'; % Cat of Life
metaData.links.id_ITIS = '584722'; % ITIS
metaData.links.id_EoL = '1038700'; % Ency of Life
metaData.links.id_Wiki = 'Dolichotis_patagonum'; % Wikipedia
metaData.links.id_ADW = 'Dolichotis_patagonum'; % ADW
metaData.links.id_Taxo = '63457'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400212'; % MSW3
metaData.links.id_AnAge = 'Dolichotis_patagonum'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dolichotis_patagonum}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dolichotis_patagonum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Rode1974'; type = 'Article'; bib = [ ... 
'author = {Rosenthal, M. A.}, ' ... 
'doi = {10.1111/j.1748-1090.1974.tb00825.x}, ' ...
'year = {1974}, ' ...
'title = {Hand-rearing Patagonian cavies or maras: \emph{Dolichotis patagonum}: at {L}incoln {P}ark, {C}hicago}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {14}, ' ...
'pages = {214-215}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

