function [data, auxData, metaData, txtData, weights] = mydata_Speleomantes_imperialis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Speleomantes_imperialis'; 
metaData.species_en = 'Imperial cave salamander';

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTc'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 173;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 3.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'amphibiaweb';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.67;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'amphibiaweb';
data.Lp  = 10.42;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'TessSotg2008'; 
  comment.Lp = 'SVL 4.8 cm, converted to TL using F1';
data.Li  = 15;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'TessSotg2008';
  comment.Li = 'SVL 6.9 cm, converted to TL using F1';
data.Lim  = 14.8;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'TessSotg2008';
  comment.Li = 'SVL 6.8 cm, converted to TL using F1';

data.Wwb = 8.71e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 5 to 6 mm: pi/6*0.55^3';
data.Wwp = 2.9;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'TessSotg2008';
data.Wwi = 7.8;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'TessSotg2008';
data.Wwim = 7;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'TessSotg2008';

data.Ri  = 10/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Speleomantes_ambrosii: 6 to 14 eggs per clutch, 1 clutch per yr';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
1.955	3.403
1.955	3.094
1.976	4.112
2.995	4.459
3.016	4.730
3.951	6.236
3.951	5.721
3.951	5.232
4.991	5.502
5.012	6.622
5.033	5.206
7.009	6.906];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.46; % convert SVL to TL
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TessSotg2008';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
2.995	4.562
3.910	6.416
4.991	5.631
5.927	6.172
5.948	6.249
5.948	6.558
6.988	6.223
8.007	6.120
10.003	6.803];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
data.tL_m(:,2) = data.tL_m(:,2)/ 0.46; % convert SVL to TL
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TessSotg2008';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-length: max TL 15 cm (amphibiaweb), max SVL 6.9 cm (TessSotg2008), so SVL = TL * 0.46';
metaData.bibkey.F1 = {'amphibiaweb','TessSotg2008'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4YHFB'; % Cat of Life
metaData.links.id_ITIS = '668342'; % ITIS
metaData.links.id_EoL = '51898620'; % Ency of Life
metaData.links.id_Wiki = 'Speleomantes_imperialis'; % Wikipedia
metaData.links.id_ADW = 'Speleomantes_imperialis'; % ADW
metaData.links.id_Taxo = '696045'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hydromantes+imperialis'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Speleomantes_imperialis}}';
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
bibkey = 'TessSotg2008'; type = 'Incollection'; bib = [ ... 
'author = {Giulia Tessa and Giuseppe Sotgiu and Rafael Repetto and Cristina Giacoma and Enrico Gazzaniga and Marco Favelli and Stefano Doglio and Alessandro Candiotto and Stefano Bovero}, ' ... 
'year = {2008}, ' ...
'title = {Longevity and population dynamics in \emph{Speleomantes imperialis sarrabusensis} (Southern {S}ardinia, {I}taly).}, ' ...
'editor = {Corti C.}, ' ...
'booktitle = {Herpetologia Sardiniae}, ' ...
'volume = {8}, ' ...
'publisher = {Societas Herpetologica Italica, Edizioni Belvedere, Latina, le scienze}, ' ...
'pages = {504 pp}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Hydromantes+imperialis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/330915}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

