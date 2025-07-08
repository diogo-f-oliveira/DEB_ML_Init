function [data, auxData, metaData, txtData, weights] = mydata_Geocapromys_ingrahami
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Echimyidae';
metaData.species    = 'Geocapromys_ingrahami'; 
metaData.species_en = 'Bahamian hutia'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 01 01];              

%% set data
% zero-variate data

data.tg = 117;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 53;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 80;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 250;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 660;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pups per litter; 1 litter per yr';

% univariate data
% time-weight
data.tW1 = [ ... % time since birth (d), weight (g)
0.000	85.361
7.959	115.758
21.982	180.232
29.941	211.848
37.521	248.346
50.407	307.955
62.915	316.348
66.326	321.187
71.253	338.204
85.655	384.381
92.098	431.868
100.057	467.143
119.386	546.190
138.336	614.265];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'female'};  
temp.tW1    = C2K(36);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature'; 
bibkey.tW1 = 'HoweClou1971';
comment.tW1 = 'Data for a female';
%
data.tW2 = [ ... % time since birth (d), weight (g)
0.758	71.938
29.562	132.584
44.343	198.268
57.230	257.877
90.203	347.743];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'male'};  
temp.tW2    = C2K(36);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature'; 
bibkey.tW2 = 'HoweClou1971';
comment.tW2 = 'Data for a male';

%% set weights for all real data
weights = setweights(data, []);
%weights.Ri = 5 * weights.Ri;
%weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW1','tW2'}; subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3FNWV'; % Cat of Life
metaData.links.id_ITIS = '584880'; % ITIS
metaData.links.id_EoL = '326773'; % Ency of Life
metaData.links.id_Wiki = 'Geocapromys_ingrahami'; % Wikipedia
metaData.links.id_ADW = 'Geocapromys_ingrahami'; % ADW
metaData.links.id_Taxo = '63512'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400572'; % MSW3
metaData.links.id_AnAge = 'Geocapromys_ingrahami'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geocapromys_ingrahami}}';
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
bibkey = 'HoweClou1971'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1748-1090.1971.tb01862.x}, ' ...
'author = {Howe, R. and Clough, G. C.}, ' ... 
'year = {1971}, ' ...
'title = {The {B}ahaman hutia in captivity}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {11(1)}, ' ...
'pages = {89–93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Geocapromys_ingrahami}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

