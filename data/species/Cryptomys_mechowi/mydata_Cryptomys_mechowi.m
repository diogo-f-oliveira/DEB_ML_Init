function [data, auxData, metaData, txtData, weights] = mydata_Cryptomys_mechowi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Bathyergidae';
metaData.species    = 'Cryptomys_mechowi'; 
metaData.species_en = 'Mechow''s mole-rat'; 
metaData.ecoCode.climate = {'Aw', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(34); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2017 12 29];              

%% set data
% zero-variate data

data.tg = 105;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'BennAgui1995';   
  temp.tg = C2K(34);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '95 till 111 d';
data.tx = 35;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'BennAgui1995';   
  temp.tx = C2K(34);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(34); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 19.6;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 250;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2.6/ 112;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.6 pups per litter; litter interval 112 d';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
3.518	17.809
5.961	17.789
10.844	18.714
16.943	22.038
20.594	27.792
23.440	29.697
33.604	35.880
44.978	47.355
53.923	52.103
57.971	63.636
65.287	68.879
74.232	73.626
83.582	79.816
99.020	94.632
113.251	102.710
119.742	113.261
126.255	113.208
140.086	117.435
147.819	118.336
154.319	124.549
163.273	124.959
169.375	126.838
201.514	135.736
219.406	145.231
224.691	148.562
229.958	160.568
238.096	161.949
277.956	177.532];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BennAgui1995';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;
weights.Wwi = 10 * weights.Wwi;
weights.Wwb = 10 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'ZY8F'; % Cat of Life
metaData.links.id_ITIS = '584672'; % ITIS
metaData.links.id_EoL = '999274'; % Ency of Life
metaData.links.id_Wiki = 'Cryptomys_mechowi'; % Wikipedia
metaData.links.id_ADW = 'Cryptomys_mechowi'; % ADW
metaData.links.id_Taxo = '112574'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400019'; % MSW3
metaData.links.id_AnAge = 'Cryptomys_mechowi'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cryptomys_mechowi}}';
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
bibkey = 'BennAgui1995'; type = 'Article'; bib = [ ... 
'author = {N. C. Bennett and G. H. Aguilar}, ' ... 
'year = {1995}, ' ...
'title = {The reproductive biology of the giant {Z}ambian mole-rat, \emph{Cryptomys mechowi} ({R}odentia: {B}athyergidae)}, ' ...
'journal = {South African Journal of Zoology}, ' ...
'doi = {10.1080/02541858.1995.11448364}, ' ... 
'volume = {30}, ' ...
'pages = {1--4}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cryptomys_mechowi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

