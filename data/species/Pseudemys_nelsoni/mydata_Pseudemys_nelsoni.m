function [data, auxData, metaData, txtData, weights] = mydata_Pseudemys_nelsoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Pseudemys_nelsoni'; 
metaData.species_en = 'Florida red-bellied cooter';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 05];

%% set data
% zero-variate data

data.ab = 52.5;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'ADW';   
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '45-60 d';
data.tp = 7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '6-8 yr';
data.tpm = 3*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';   
  temp.tpm = C2K(22);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
  comment.tpm = '3-4 yr';
data.am = 26.1*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.2; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'ADW';
  comment.Lb = '28-38 mm';
data.Li = 30.5; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Wiki';
data.Lim = 25; units.Lim = 'cm';   label.Lim = 'ultimate carapace length';      bibkey.Lim = 'Wiki';

data.Wwb = 12.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Wiki';
  comment.Wwb = '10.1-14.5 g';
data.Wwi = 4000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
data.Wwim = 1800; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';    bibkey.Wwim = 'Wiki';

data.Ri  = 20*4.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7-26 eggs per clutch, 3-6 clutches per yr';

% uni-variate data

% length ar capture - length at recapture
LLt = [ % carapace length ar capture (cm), carapace length at recapture (cm)
    8.6 16.0  744
    9.5 18.7 1682
   10.0 20.0  866
   10.7 17.3  849
   12.7 19.6  954];
data.LL_f = LLt(:,1:2);
units.LL_f   = {'cm', 'cm'};  label.LL_f = {'carapace length at capture', 'carapace length at recapture', 'demale'}; 
time.LL_f = LLt(:,3); units.time.LL_f = 'd'; label.time.LL_f = 'time between caputurr and recapture';
treat.LL_f = {0}; %units.treat.LL_f = ''; label.treat.LL_f = '';
temp.LL_f    = C2K(22);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'MunsWald2015';
comment.LL_f = 'Data for females; temp is guessed';
%
LLt = [ % carapace length ar capture (cm), carapace length at recapture (cm)
    8.2 13.2  50.3
    9.9 20.4 109.2
   10.2 15.9  89.6
   11.5 18.8 109.2
   14.9 19.3  74.1];
data.LL_m = LLt(:,1:2);
units.LL_m   = {'cm', 'cm'};  label.LL_m = {'carapace length at capture', 'carapace length at recapture', 'male'}; 
time.LL_m = LLt(:,3); units.time.LL_m = 'd'; label.time.LL_m = 'time between caputure and recapture';
treat.LL_m = {0}; %units.treat.LL_m = ''; label.treat.LL_m = '';
temp.LL_m    = C2K(22);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'MunsWald2015';
comment.LL_m = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.LL_f = 5 * weights.LL_f;
weights.LL_m = 5 * weights.LL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LL_f', 'LL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Lays eggs in alligator nests';
metaData.bibkey.F1 = 'ADW';
F2 = 'Temperatures below 28.5 C give males';
metaData.bibkey.F2 = 'ADW';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6WCBF'; % Cat of Life
metaData.links.id_ITIS = '173813'; % ITIS
metaData.links.id_EoL = '1055546'; % Ency of Life
metaData.links.id_Wiki = 'Pseudemys_nelsoni'; % Wikipedia
metaData.links.id_ADW = 'Pseudemys_nelsoni'; % ADW
metaData.links.id_Taxo = '549761'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pseudemys&species=nelsoni'; % ReptileDB
metaData.links.id_AnAge = 'Pseudemys_nelsoni'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudemys_nelsoni}}';
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
bibkey = 'MunsWald2015'; type = 'Article'; bib = [ ... 
'author = {Eric C. Munscher and Andrew D. Walde and Theresa Stratmann and and Brian P. Butterfield}, ' ... 
'year = {2015}, ' ...
'title = {Exceptional Growth Rates Observed in Immature \emph{Pseudemys} from a Protected Spring System in {F}lorida}, ' ...
'journal = {Herpetology Notes, volume}, ' ...
'volume = {8}, ' ...
'pages = {133-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1055546}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pseudemys_nelsoni/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pseudemys_nelsoni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

