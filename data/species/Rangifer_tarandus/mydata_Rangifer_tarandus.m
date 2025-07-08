function [data, auxData, metaData, txtData, weights] = mydata_Rangifer_tarandus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Rangifer_tarandus'; 
metaData.species_en = 'Reindeer'; 

metaData.ecoCode.climate = {'Dfc', 'E'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTf', '0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2016 12 31];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 12 31]; 

%% set data
% zero-variate data

data.tg = 228;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(37.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 120;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 662;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21.8*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 6500;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 135e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'KnotBarb2005';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(37.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight data
data.tW_t = [ % time since birth (yr), carcass weight (kg)
0.052	7.177
0.277	56.405
0.365	75.393
0.489	80.330
0.489	87.359
0.551	75.419
0.725	74.038
0.725	83.878
0.949	86.720
1.098	95.878
1.147	74.800
1.745	126.190
1.782	110.030
2.343	163.523
2.368	167.040
2.379	137.524]; 
units.tW_t  = {'yr', 'kg'};  label.tW_t = {'time since birth', 'total weight', 'reindeer R. t. tarandus'};  
temp.tW_t  = C2K(37.2);  units.temp.tW_t = 'K'; label.temp.tW_t = 'temperature';
bibkey.tW_t = 'KnotBarb2005';
comment.tW_t = 'Data for reindeer R. t. tarandus';
% 
data.tW_g = [ ... % time since birth (yr), carcass weight (kg)
0.023	7.869
0.077	27.562
0.177	45.146
0.999	105.703
1.048	78.301
3.000	134.800
3.062	128.483
3.074	109.509
4.913	137.880
8.119	143.953]; 
units.tW_g  = {'yr', 'kg'};  label.tW_g = {'time since birth', 'total weight', 'caribou R. t. grantii'};  
temp.tW_g  = C2K(37.2);  units.temp.tW_g = 'K'; label.temp.tW_g = 'temperature';
bibkey.tW_g = 'KnotBarb2005';
comment.tW_g = 'Data for caribou R. t. grantii';

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
set1 = {'tW_t','tW_g'}; subtitle1 = {'Data for reindeer, caribou'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Reindeer and caribou have the same parameters';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Reindeer is the only cervid that grows antlers in both sexes';
metaData.bibkey.F1 = {'Wiki'}; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '4RF6J'; % Cat of Life
metaData.links.id_ITIS = '180701'; % ITIS
metaData.links.id_EoL = '328653'; % Ency of Life
metaData.links.id_Wiki = 'Rangifer_tarandus'; % Wikipedia
metaData.links.id_ADW = 'Rangifer_tarandus'; % ADW
metaData.links.id_Taxo = '68031'; % Taxonomicon
metaData.links.id_WoRMS = '993630'; % WoRMS
metaData.links.id_MSW3 = '14200328'; % MSW3
metaData.links.id_AnAge = 'Rangifer_tarandus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rangifer_tarandus}}';
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
bibkey = 'KnotBarb2005'; type = 'Article'; bib = [ ... 
'author = {K. K. Knott and P. S. Barboza and R. T. Bowyer}, ' ... 
'year = {2005}, ' ...
'title = {GROWTH IN ARCTIC UNGULATES: POSTNATAL DEVELOPMENT AND ORGAN MATURATION IN \emph{Rangifer tarandus} AND \emph{Ovibos moschatus}}, ' ...
'journal = {J. Mammal.}, ' ...
'volume = {86}, ' ...
'pages = {121-130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rangifer_tarandus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Rangifer_tarandus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

