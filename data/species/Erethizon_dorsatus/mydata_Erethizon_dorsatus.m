function [data, auxData, metaData, txtData, weights] = mydata_Erethizon_dorsatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Erethizontidae';
metaData.species    = 'Erethizon_dorsatus'; 
metaData.species_en = 'North American porcupine'; 

metaData.ecoCode.climate = {'BSk', 'Dsb', 'Dfa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2017 12 30];              

%% set data
% zero-variate data

data.tg = 210;    units.tg = 'd';     label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 60;     units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 23.4*365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 500;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 1000;  units.Wwx = 'g';    label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 8600;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% time-weight
data.tWw = [ ... % time (d), weight (lb)
0.000	1.090
6.355	1.316
14.135	1.850
20.520	2.440
32.484	2.864
42.784	3.091
54.188	3.571
59.481	3.600
61.437	3.461
65.318	3.938
73.103	4.360
80.055	4.698
88.956	5.065
93.950	5.599
100.074	5.741
106.460	6.302
115.654	6.333
122.347	6.167
128.454	6.729
134.859	6.815
137.632	7.152
144.287	7.966
150.968	8.108
157.923	8.362
166.262	8.869
172.099	9.207
178.764	9.769
185.712	10.219
192.665	10.529
198.786	10.755
205.471	10.785
212.136	11.347
219.097	11.461
226.615	11.575
233.297	11.689
241.078	12.224
246.662	11.917
253.883	12.508
261.126	12.538
268.095	12.456];
data.tWw(:,2) = 453.59237 * data.tWw(:,2); % conver lb to g
units.tWw   = {'d', 'cm'};  label.tWw = {'time since birth', 'head-body length'};  
temp.tWw    = C2K(37);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ShadPlos1943';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

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
metaData.links.id_CoL = '6GGVM'; % Cat of Life
metaData.links.id_ITIS = '825295'; % ITIS
metaData.links.id_EoL = '45293396'; % Ency of Life
metaData.links.id_Wiki = 'Erethizon_dorsatum'; % Wikipedia
metaData.links.id_ADW = 'Erethizon_dorsatum'; % ADW
metaData.links.id_Taxo = '5377748'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400108'; % MSW3
metaData.links.id_AnAge = 'Erethizon_dorsatus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Erethizon_dorsatum}}';
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
bibkey = 'ShadPlos1943'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1374741}, ' ...
'author = {Shadle, A. R. and Ploss, W. R.}, ' ... 
'year = {1943}, ' ...
'title = {An Unusual Porcupine Parturition and Development of the Young}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {24(4)}, ' ...
'pages = {492-496}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Erethizon_dorsatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

