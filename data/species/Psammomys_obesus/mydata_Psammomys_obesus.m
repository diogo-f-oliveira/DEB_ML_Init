function [data, auxData, metaData, txtData, weights] = mydata_Psammomys_obesus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Psammomys_obesus'; 
metaData.species_en = 'Fat sand rat'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2017 12 30];              

%% set data
% zero-variate data

data.tg = 24;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 28;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 6.25;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 40;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 212;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.5/ 38;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.5 pups per litter; litter interval 38';
 
% uni-variate data
% t-W data
data.tW = [ ... % time (d), wet weight (g)
2.835	72.785
10.101	87.251
17.544	105.696
24.810	125.949
31.899	148.011
38.810	163.562
46.076	178.752
53.165	186.347
60.253	197.559
67.519	211.302
74.962	219.982
81.696	227.215
88.962	223.599
96.228	226.492
102.962	229.024
110.228	233.363
117.494	231.555
124.760	233.725];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight', 'chow only'};  
temp.tW    = C2K(37.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MaisMedv2006';
comment.tW = 'Food: standard chow';
%
data.tW1 = [ ... % time (d), wet weight (g)
3.367	78.933
10.278	90.506
18.253	101.356
24.987	117.631
32.076	132.459
39.165	151.989
46.430	154.521
53.165	160.669
60.608	168.987
67.696	171.157
74.253	179.837
81.873	185.624
88.785	185.624
96.405	188.517
103.316	192.134
110.582	194.304
117.671	196.835
124.760	193.219];
units.tW1   = {'d', 'g'};  label.tW1 = {'time', 'wet weight', 'chow with 30% straw'};  
temp.tW1    = C2K(37.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'MaisMedv2006';
comment.tW1 = 'Food: chow blended with 30% wheat straw';

%% set weights for all real data
weights = setweights(data, []);
%weights.Ri = 10 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
%weights.psd.v = 5 * weights.psd.v;
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for chow, chow + 30% wheat straw'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4NCRG'; % Cat of Life
metaData.links.id_ITIS = '632993'; % ITIS
metaData.links.id_EoL = '1179771'; % Ency of Life
metaData.links.id_Wiki = 'Psammomys_obesus'; % Wikipedia
metaData.links.id_ADW = 'Psammomys_obesus'; % ADW
metaData.links.id_Taxo = '62839'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001163'; % MSW3
metaData.links.id_AnAge = 'Psammomys_obesus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psammomys_obesus}}';
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
bibkey = 'MaisMedv2006'; type = 'Article'; bib = [ ... 
'author = {M. Maislos and V. Medvedovskv and I. Sztarkier and A. Yaari and E. Sikuler}, ' ... 
'year = {2006}, ' ...
'title = {\emph{Psammomys obesus} (sand rat), a new animal model of non-alcoholic fatty liver disease}, ' ...
'journal = {Diabetes Research and Clinical Practice}, ' ...
'volume = {72}, ' ...
'pages = {1--5}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Psammomys_obesus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

