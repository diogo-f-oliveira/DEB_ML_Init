function [data, auxData, metaData, txtData, weights] = mydata_Pseudemys_peninsularis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Pseudemys_peninsularis'; 
metaData.species_en = 'Peninsula cooter';

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
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

data.tp = 6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '5-7 yr';
data.tpm = 3.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';   
  temp.tpm = C2K(22);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
  comment.tpm = '3-4 yr';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'ADW';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.5; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'ADW';
  comment.Lb = '18-33 mm';
data.Li = 33; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'Wiki';
  comment.Li = 'max 40.64 cm';
data.Lim = 25; units.Lim = 'cm';   label.Lim = 'ultimate carapace length';      bibkey.Lim = 'Wiki';

data.Wwi = 6800; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  comment.Wwi = 'max 15.9 kg';
data.Wwim = 1800; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';    bibkey.Wwim = 'Wiki';

data.Ri  = 3*14/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '11-16 eggs per clutch, 3 cutches per yr';

% uni-variate data

% length ar capture - length at recapture
LLt = [ % carapace length ar capture (cm), carapace length at recapture (cm)
    5.9 16.7 743
    7.1 17.5 511
    8.0 16.4 515
    8.3 17.5 743
    8.8 17.5 743];
data.LL_f = LLt(:,1:2);
units.LL_f   = {'cm', 'cm'};  label.LL_f = {'carapace length at capture', 'carapace length at recapture', 'female'}; 
time.LL_f = LLt(:,3); units.time.LL_f = 'd'; label.time.LL_f = 'time between caputurr and recapture';
treat.LL_f = {0}; units.treat.LL_f = ''; label.treat.LL_f = '';
temp.LL_f    = C2K(22);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'MunsWald2015';
comment.LL_f = 'Data for females; temp is guessed';
%
LLt = [ % carapace length ar capture (cm), carapace length at recapture (cm)
    5.9 15.1 735
    6.3 18.5 725
    9.8 13.3 364
   10.1 15.8 604
   13.2 19.4 745];
data.LL_m = LLt(:,1:2);
units.LL_m   = {'cm', 'cm'};  label.LL_m = {'carapace length at capture', 'carapace length at recapture', 'male'}; 
time.LL_m = LLt(:,3); units.time.LL_m = 'd'; label.time.LL_m = 'time between caputure and recapture';
treat.LL_m = {0}; units.treat.LL_m = ''; label.treat.LL_m = '';
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

%% Links
metaData.links.id_CoL = '78CBH'; % Cat of Life
metaData.links.id_ITIS = '208648'; % ITIS
metaData.links.id_EoL = '1055543'; % Ency of Life
metaData.links.id_Wiki = 'Pseudemys_peninsularis'; % Wikipedia
metaData.links.id_ADW = 'Pseudemys_peninsularis'; % ADW
metaData.links.id_Taxo = '549762'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pseudemys&species=peninsularis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudemys_peninsularis}}';
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
'howpublished = {\url{https://eol.org/pages/1055543}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pseudemys_peninsularis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

