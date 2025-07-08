function [data, auxData, metaData, txtData, weights] = mydata_Vulpes_velox

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Vulpes_velox'; 
metaData.species_en = 'Swift fox'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 10 30]; 

%% set data
% zero-variate data

data.tg = 55;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 46;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(38.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 39.65;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 2400;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 4.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: one clutch per yr in spring';
  
% uni-variate data

% time-weight data
data.tW_f = [ ... % time (d), body weight (pound)
6.699	0.297
39.567	0.730
57.099	2.500
57.609	2.686
57.811	3.106
77.617	4.171
77.806	3.007
115.947	4.220
117.081	3.886
150.448	4.567];
data.tW_f(:,2) = data.tW_f(:,2) * 453.59237; % convert pounds to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.7);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Kilg1969';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time (d), body weight (pound)
2.648	0.309
38.167	1.040
39.959	1.646
120.528	4.270
151.962	5.223];
data.tW_m(:,2) = data.tW_m(:,2) * 453.59237; % convert pounds to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Kilg1969';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

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

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5BSG2'; % Cat of Life
metaData.links.id_ITIS = '180607'; % ITIS
metaData.links.id_EoL = '328610'; % Ency of Life
metaData.links.id_Wiki = 'Vulpes_velox'; % Wikipedia
metaData.links.id_ADW = 'Vulpes_velox'; % ADW
metaData.links.id_Taxo = '66455'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000891'; % MSW3
metaData.links.id_AnAge = 'Vulpes_velox'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vulpes_velox}}';
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
bibkey = 'Kilg1969'; type = 'Article'; bib = [ ... 
'author = {Delbert L. Kilgore}, ' ... 
'year = {1969}, ' ...
'title = {An Ecological Study of the Swift Fox (\emph{Vulpes velox}) in the {O}klahoma {P}anhandle}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {81(2)}, ' ...
'pages = {512-534}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Vulpes_velox}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

