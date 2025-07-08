function [data, auxData, metaData, txtData, weights] = mydata_Elephantulus_rufescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Macroscelidea'; 
metaData.family     = 'Macroscelididae';
metaData.species    = 'Elephantulus_rufescens'; 
metaData.species_en = 'Rufous elephant shrew'; 
metaData.ecoCode.climate = {'BWh', 'BWk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 31]; 

%% set data
% zero-variate data

data.tg = 61;  units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = '';   
  temp.tg = C2K(35.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 23;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = '';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 50;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = '';
  temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 7.9*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 10.6;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = '';
data.Wwx = 29;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = '';
data.Wwi = 58;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = '';

data.Ri  = 5.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = '';   
  temp.Ri = C2K(37.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 young per litter, 5.2 litters per yr';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
1.847	11.719
3.752	14.728
5.807	16.447
7.861	18.453
10.361	19.312
11.974	21.175
14.321	23.754
16.083	25.186
18.286	26.905
20.193	29.054
21.950	32.063
23.861	32.636
26.060	35.788
27.826	35.788
30.028	37.507
31.937	39.083
33.997	39.083
36.063	37.221
38.401	42.951
40.302	46.963
42.077	43.811
44.869	45.530
46.478	48.825
50.594	50.258
51.932	45.817
54.136	46.963
56.334	50.115
58.689	49.971
60.595	52.550
62.229	47.536
64.562	54.986
68.098	53.553
70.308	52.693
71.921	54.556
74.265	58.424
76.319	60.287];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(37.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RathBeam1981';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '398D3'; % Cat of Life
metaData.links.id_ITIS = '584920'; % ITIS
metaData.links.id_EoL = '326393'; % Ency of Life
metaData.links.id_Wiki = 'Elephantulus_rufescens'; % Wikipedia
metaData.links.id_ADW = 'Elephantulus_rufescens'; % ADW
metaData.links.id_Taxo = '61599'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11200014'; % MSW3
metaData.links.id_AnAge = 'Elephantulus_rufescens'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elephantulus_rufescens}}';
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
bibkey = 'RathBeam1981'; type = 'Article'; bib = [ ...
'author = {Rathbun, G. B. and Beaman, P. and Maliniak, E.},'...
'doi = {10.1111/j.1748-1090.1981.tb01977.x}, ' ...
'year = {1981}, ' ...
'title = {Capture, husbandry and breeding of Rufous elephant-shrews}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {21}, ' ...
'number = {1}, ' ...
'pages = {176-184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Elephantulus_rufescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/site/accounts/information/Elephantulus_rufescens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

