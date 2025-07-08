function [data, auxData, metaData, txtData, weights] = mydata_Pseudemys_concinna
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Pseudemys_concinna'; 
metaData.species_en = 'River cooter';

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl','biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 55;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '45-65 d';
data.tp = 6*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6-10 yr';
data.tpm = 3.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(20);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tp = '2-4 yr';
data.am = 77*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.2; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'Wiki';
  comment.Lb = '27-39 mm';
data.Li = 28.7; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'ADW';
  comment.Li = 'Dres1997 gives 43 cm';
data.Lim = 22.3; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'ADW';

data.Wwb = 8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'ADW';
  comment.Wwb = '5.2-14 g';
data.Wwi = 5000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'ADW';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 eggs per clutch, 1 clutch per yr assumed';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.077	3.380
1.034	6.707
2.051	9.203
3.000	10.503
4.074	11.750
4.894	12.218
6.153	12.530];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Dres1997';
comment.tL_f = 'Data for females from at Round Pond, Gallatin County, Illinois; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
0.143	4.055
1.037	7.225
2.116	9.719
3.069	11.953
4.022	14.187
5.035	15.745];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2) / 0.93; % convert plastron to carapace length (guessed)
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Dres1997';
comment.tL_m = 'Data for males from at Round Pond, Gallatin County, Illinois; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Temperatures < 22.5 C give males > 30 C females';
metaData.bibkey.F1 = 'ADW';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NM9N'; % Cat of Life
metaData.links.id_ITIS = '173805'; % ITIS
metaData.links.id_EoL = '1055547'; % Ency of Life
metaData.links.id_Wiki = 'Pseudemys_concinna'; % Wikipedia
metaData.links.id_ADW = 'Pseudemys_concinna'; % ADW
metaData.links.id_Taxo = '48631'; % Taxonomicon
metaData.links.id_WoRMS = '1314183'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pseudemys&species=concinna'; % ReptileDB
metaData.links.id_AnAge = 'Pseudemys_concinna'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudemys_concinna}}';
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
bibkey = 'Dres1997'; type = 'Article'; bib = [ ... 
'author = {Michael J. Dreslik}, ' ... 
'year = {1997}, ' ...
'title = {ECOLOGY OF THE RIVER COOTER, \emph{Pseudemys concinna}, IN A SOUTHERN {I}LLINOIS FLOODPLAIN LAKE}, ' ...
'journal = {Herpetological Natural History}, ' ...
'volume = {5(2)}, ' ...
'pages = {135-145}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pseudemys_concinna}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1055547}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Pseudemys_concinna/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

