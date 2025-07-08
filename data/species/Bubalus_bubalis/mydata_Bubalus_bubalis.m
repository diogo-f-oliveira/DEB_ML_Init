function [data, auxData, metaData, txtData, weights] = mydata_Bubalus_bubalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Bubalus_bubalis'; 
metaData.species_en = 'Water buffalo'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'T'};
metaData.ecoCode.habitat = {'0iFm', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri';'JXi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 337;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 7.5*30.5;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '6-9 mnth';
data.tp = 1.5*365 ;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'ADW';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365 ;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(38.1);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 34.9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 38e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 725e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';  

data.Ri  = 1.375/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.375 calf per litter, 1 litter per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), body weight (kg)
3.215	34.238
61.223	102.718
123.901	164.333
181.855	212.241
241.363	256.718
302.421	296.049
361.898	328.526
422.924	355.858
480.816	379.766
540.252	396.815
601.265	419.003
657.567	432.628
721.688	447.955
781.102	456.432
838.971	471.769
901.507	478.527
960.926	488.718
1023.448	490.333
1079.737	498.815
1139.137	502.150];
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f  = C2K(38.1);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'AgudNaud2009';
comment.tW_f = 'data for females from computed Brody''s curve, not measurements';
%
data.tW_m = [ ... % time (d), body weight (kg)
0.094	35.958
61.223	102.718
127.036	167.756
181.873	219.098
242.953	267.001
304.024	311.475
361.951	349.098
422.987	379.858
482.450	407.192
538.783	432.817
601.350	451.575
662.350	468.621
721.786	485.669
779.651	499.292
839.070	509.483
901.605	516.241
959.466	528.149
1022.006	536.621
1079.853	543.387
1139.258	548.435];
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m  = C2K(38.1);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'AgudNaud2009';
comment.tW_m = 'data for males  from computed Brody''s curve, not measurements';

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = 'NKLN'; % Cat of Life
metaData.links.id_ITIS = '552476'; % ITIS
metaData.links.id_EoL = '311907'; % Ency of Life
metaData.links.id_Wiki = 'Bubalus_bubalis'; % Wikipedia
metaData.links.id_ADW = 'Bubalus_bubalis'; % ADW
metaData.links.id_Taxo = '68275'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200694'; % MSW3
metaData.links.id_AnAge = 'Bubalus_bubalis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bubalus_bubalis}}';
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
bibkey = 'AgudNaud2009'; type = 'Article'; bib = [ ... 
'author = {Divier Agudelo-G\''{o}mez and Naud\''{i}n Hurtado-Lugo and Zoot, Mario F Cer\''{o}n-Mu\~{n}oz}, ' ... 
'year = {2009}, ' ...
'title = {Growth Curves and Genetic Parameters in {C}olombian Buffaloes (\emph{Bubalus bubalis} {A}rtiodactyla, {B}ovidae)}, ' ...
'journal = {Revista Colombiana de Ciencias Pecuarias}, ' ...
'volume = {22}, ' ...
'pages = {178-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bubalus_bubalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Bubalus_bubalis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

