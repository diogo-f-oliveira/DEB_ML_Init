function [data, auxData, metaData, txtData, weights] = mydata_Bos_mutus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Bos_mutus'; 
metaData.species_en = 'Wild yak'; 

metaData.ecoCode.climate = {'BWk','Dwb','ET'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri';'JXi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 04];              
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

data.tg = 274;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 228;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '30 till 35 d';
data.tp = 738;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 738;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 26.3*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 23.55e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Han2014';
data.Wwi = 300e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';  
data.Wwim = 1000e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'ADW';  

data.Ri  = 0.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 foal per litter, 0.8 litters per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time (yr), body weight (g)
    0.0  23.55
    0.5  79.80
    1.0 123.20
    2.0 196.80
    3.0 263.50];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert mnt to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f  = C2K(38);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Han2014';
comment.tW_f = 'data for females from Datong Yak Farm';
%
data.tW_m = [ ... % time (yr), body weight (kg)
    0.0  26.00
    0.5 105.50
    1.0 127.97
    2.0 227.94
    3.0 310.50
    4.5 500.00];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert mnt to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m  = C2K(38);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Han2014';
comment.tW_m = 'data for males from Datong Yak Farm';

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
metaData.links.id_CoL = '5FZB7'; % Cat of Life
metaData.links.id_ITIS = '196332'; % ITIS
metaData.links.id_EoL = '47364990'; % Ency of Life
metaData.links.id_Wiki = 'Bos_grunniens_mutus'; % Wikipedia
metaData.links.id_ADW = 'Bos_grunniens'; % ADW
metaData.links.id_Taxo = '167479'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200680'; % MSW3
metaData.links.id_AnAge = 'Bos_grunniens_mutus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bos_mutus}}';
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
bibkey = 'Han2014'; type = 'incollection'; bib = [ ... 
'doi = {10.5713/ajas.2004.410}, ' ...
'author = {Jianlin Han}, ' ...
'year = {2014}, ' ...
'title = {Wild yak (\emph{Bos mutus} {P}rzewalski, 1883)}, ' ... 
'booktitle = {Ecology, Evolution and Behaviour of Wild Cattle: Implications for Conservation}, ' ...
'publisher = {Cambridge University Press}, ' ...
'editor = {M. Melletti and J. Burton.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bos_grunniens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Bos_grunniens/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

