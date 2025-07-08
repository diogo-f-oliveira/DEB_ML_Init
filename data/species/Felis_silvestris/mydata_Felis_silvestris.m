function [data, auxData, metaData, txtData, weights] = mydata_Felis_silvestris
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Felis_silvestris'; 
metaData.species_en = 'Wild cat'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'T'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiC'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 64;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 87;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '30 till 35 d';
data.tp = 304;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 304;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 100;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Volf1968';  
  comment.Wwi = '3 to 5 kg, but taken a bit higher in view of tW data';
data.Wwim = 7e3;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Volf1968';  
  comment.Wwim = '5 to 8 kg';

data.Ri  = 2.3*3.7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.3  per litter, 3.7 litters per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), body weight (g)
  7  260
 10  305
 15  390
 20  455
 27  575
 34  670
 41  760
 47  890
 57  990
 69 1140
 84 1530
 96 1860
135 2510
267 5000];
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(37.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Volf1968';
comment.tW_f = 'data for a female kitten';
%
data.tW_m = [ ... % time sice birth(d), body weight (g)
  7  250
 10  280
 15  390
 20  450
 27  540
 34  640
 41  750
 47  820
 57  900
 69 1050
 84 1380
 96 1740
135 2630
267 5500];
units.tW_m = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(37.9);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Volf1968';
comment.tW_m = 'data for a male kitten';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3DXW2'; % Cat of Life
metaData.links.id_ITIS = '180589'; % ITIS
metaData.links.id_EoL = '328605'; % Ency of Life
metaData.links.id_Wiki = 'Felis_silvestris'; % Wikipedia
metaData.links.id_ADW = 'Felis_silvestris'; % ADW
metaData.links.id_Taxo = '168147'; % Taxonomicon
metaData.links.id_WoRMS = '1526001'; % WoRMS
metaData.links.id_MSW3 = '14000057'; % MSW3
metaData.links.id_AnAge = 'Felis_silvestris'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Felis_nigripes}}';
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
bibkey = 'Volf1968'; type = 'Article'; bib = [ ... 
'author = {Volf, J.}, ' ... 
'doi = {10.1111/j.1748-1090.1968.tb00430.x}, ' ...
'year = {1968}, ' ...
'title = {Breeding the {E}uropean wild cat \emph{Felis s. silvestris} at {P}rague {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {8}, ' ...
'pages = {38-42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Felis_nigripes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Felis_nigripes/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

