function [data, auxData, metaData, txtData, weights] = mydata_Equus_ferus_caballus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Equidae';
metaData.species    = 'Equus_ferus_caballus'; 
metaData.species_en = 'Domestic horse'; 

metaData.ecoCode.climate = {'A','B','C','D'};
metaData.ecoCode.ecozone = {'T'};
metaData.ecoCode.habitat = {'0iTi', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri';'JXi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 03];              
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

data.tg = 337;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 2*365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '30 till 35 d';
data.tp = 914;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 973;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 57*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 38e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 450e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';  
  comment.Wwi = 'ADW gives 227 to 900 kg';

data.Ri  = 1/548;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 foal per litter, 1 litter per 548 d';

% uni-variate data
% time-weight
data.tW_f = [ ... % time (mnth), body weight (lb)
    0  87
    1 178
    6 454
   12 657
   18 783
   24 884
   36 967
   48 971];
data.tW_f(:,1) = data.tW_f(:,1) * 30.5; % convert mnth to d
data.tW_f(:,2) = data.tW_f(:,2) * 453.59237; % convert lb to g
units.tW_f = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f  = C2K(38.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'starmilling';
comment.tW_f = 'data for Arabian females';
%
data.tW_m = [ ... % time (mnth), body weight (lb)
    0   88
    1  170
    6  463
   12  670
   18  806
   24  893
   36  970
   48 1005];
data.tW_m(:,1) = data.tW_m(:,1) * 30.5; % convert mnth to d
data.tW_m(:,2) = data.tW_m(:,2) * 453.59237; % convert lb to g
units.tW_m = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m  = C2K(38.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'starmilling';
comment.tW_m = 'data for Arabian males';

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
metaData.links.id_CoL = '7TKN3'; % Cat of Life
metaData.links.id_ITIS = '926238'; % ITIS
metaData.links.id_EoL = '10202268'; % Ency of Life
metaData.links.id_Wiki = 'Equus_ferus_caballus'; % Wikipedia
metaData.links.id_ADW = 'Equus_caballus'; % ADW
metaData.links.id_Taxo = '6297074'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000054'; % MSW3
metaData.links.id_AnAge = 'Equus_caballus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Equus_ferus_caballus}}';
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
bibkey = 'starmilling'; type = 'Misc'; bib = ...
'howpublished = {\url{https://starmilling.com/estimating-body-weight-of-growing-foals/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Equus_caballus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Equus_caballus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

