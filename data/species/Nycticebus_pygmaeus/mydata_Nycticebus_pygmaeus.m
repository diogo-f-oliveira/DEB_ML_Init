function [data, auxData, metaData, txtData, weights] = mydata_Nycticebus_pygmaeus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Lorisidae';
metaData.species    = 'Nycticebus_pygmaeus'; 
metaData.species_en = 'Pygmy slow loris'; 

metaData.ecoCode.climate = {'Am', 'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiH', 'xiCim', 'xiCvbe'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 09]; 


%% set data
% zero-variate data

data.tg = 188;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 133;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 273;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19.4*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 21;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Soda1993';
data.Wwi = 419; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/448;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% uni-variate data
% t-W data
data.tW = [ ... % age (d) weight (g)
2.157	21.087
13.559	30.402
23.424	39.179
26.824	44.696
29.905	46.883
32.682	50.185
36.994	52.914
39.477	59.552
47.526	75.572
49.717	86.103
53.429	92.728
56.543	103.803
61.482	109.858
65.796	113.143
69.815	119.764
73.813	120.830
75.989	127.472
80.599	127.975
82.150	131.846
83.421	142.943
87.109	143.457
88.963	146.214
92.374	154.508
94.224	156.154
98.220	156.664
103.468	163.271
108.415	171.549
111.182	172.073
113.040	175.941
115.779	169.243
117.929	169.218
118.859	171.430
121.317	171.402
123.773	170.819
128.082	172.992
129.628	175.753
131.484	179.065
132.084	175.169
133.289	169.044
133.581	165.152
135.440	169.020
140.372	173.408
141.319	180.064
146.607	197.227
148.493	208.316
150.678	217.181
153.120	213.264
154.379	221.027
155.324	227.128
157.191	233.218
163.975	239.808
172.288	244.713
176.593	245.776
183.328	239.588
190.086	239.511
195.945	245.001
198.095	244.976
200.226	239.952
203.951	249.910
207.663	256.534];
units.tW   = {'d', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Soda1993';
comment.tW = 'Data digitized from curve';

%% set weights for all real data
weights = setweights(data, []);

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
metaData.links.id_CoL = '485JT'; % Cat of Life
metaData.links.id_ITIS = '572891'; % ITIS
metaData.links.id_EoL = '326539'; % Ency of Life
metaData.links.id_Wiki = 'Nycticebus_pygmaeus'; % Wikipedia
metaData.links.id_ADW = 'Nycticebus_pygmaeus'; % ADW
metaData.links.id_Taxo = '65546'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100118'; % MSW3
metaData.links.id_AnAge = 'Nycticebus_pygmaeus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nycticebus_pygmaeus}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Nycticebus_pygmaeus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Soda1993'; type = 'Article'; bib = [ ... 
'author = {C. Sodaro}, ' ... 
'year = {1993}, ' ...
'title = {Hand-rearing and reintroduction of a pygmy slow loris \emph{Nycticebus pygmaeus} at {Brookfield Zoo, Chicago}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {32}, ' ...
'pages = {221--224}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

