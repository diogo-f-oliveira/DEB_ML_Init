function [data, auxData, metaData, txtData, weights] = mydata_Ateles_geoffroyi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Atelidae';
metaData.species    = 'Ateles_geoffroyi'; 
metaData.species_en = 'Geoffroy''s spider monkey'; 
metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(36.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 10]; 

%% set data
% zero-variate data

data.tg = 232;    units.tg = 'd';    label.tg = 'gestation time';            bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 91;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Soda1993';   
  temp.tx = C2K(36.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1825;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for female, 1826 d for male';
data.am = 47.1*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(36.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 426;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 7268; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 6 till 9 kg';

data.Ri  = 0.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
     
% univariate data

% time-weight
data.tW = [ ... % time since birth (d)], weight (g)
0.734	416.774
6.308	427.893
10.029	427.847
12.999	438.998
15.605	436.169
21.538	469.661
30.451	497.522
35.281	508.650
38.248	525.396
41.583	547.732
42.339	528.143
43.438	556.101
48.637	572.819
54.568	609.109
57.541	614.666
59.753	648.205
65.696	664.914
78.309	726.295
79.805	715.087
80.902	745.843
86.838	773.741
86.847	759.755
92.049	770.878
95.760	787.615
100.207	815.532
102.054	837.886
105.405	835.047
119.115	927.184
124.323	929.916
128.393	966.229
130.634	952.215
133.961	988.537
135.826	980.122
136.934	994.094
147.692	1047.107
150.670	1044.272
152.146	1063.834
155.123	1063.797
156.594	1091.751
161.798	1100.077
167.356	1139.169
171.438	1155.901
174.398	1183.836
177.355	1214.568
177.374	1183.799
182.914	1250.863
185.122	1289.996
213.670	1457.472
215.906	1451.849
216.271	1463.033
218.855	1496.568
224.808	1496.493
228.138	1527.221
232.191	1591.506];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Soda1993';
comment.tW = 'Data digitized from curve';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'J8P6'; % Cat of Life
metaData.links.id_ITIS = '572958'; % ITIS
metaData.links.id_EoL = '323938'; % Ency of Life
metaData.links.id_Wiki = 'Ateles_geoffroyi'; % Wikipedia
metaData.links.id_ADW = 'Ateles_geoffroyi'; % ADW
metaData.links.id_Taxo = '65860'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100399'; % MSW3
metaData.links.id_AnAge = 'Ateles_geoffroyi'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ateles_geoffroyi}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ateles_geoffroyi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Soda1993'; type = 'Article'; bib = [ ... 
'author = {V. Sodaro}, ' ... 
'year = {1993}, ' ...
'title = {Hand-rearing and reintroduction of a Black-handed spider monkey at {B}rookfield {Z}oo, Chicago \emph{Ateles geoffroyi} }, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {32}, ' ...
'pages = {224--228}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

