function [data, auxData, metaData, txtData, weights] = mydata_Argopecten_purpuratus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pectinida'; 
metaData.family     = 'Pectinidae';
metaData.species    = 'Argopecten_purpuratus'; 
metaData.species_en = 'Peruvian scallop'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Arturo Aguirre'};    
metaData.date_subm = [2013 04 30];              
metaData.email    = {'jah_arturo@hotmail.com'};            
metaData.address  = {'Institut Universitaire Europeen de la Mer, Plouzane, France'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2013 09 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 30]; 


%% set data
% zero-variate data

data.ab = 4;       units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BellTole1994';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 24;      units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'UriaRupp2001';   
  temp.tj = C2K(18);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 60;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Agui2013';
  temp.tp = C2K(16);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'StotGonz1997';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '4-5 yr';
  
data.Lb  = 0.01;   units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'BellTole1994';
data.Lj  = 0.0388; units.Lj  = 'cm';  label.Lj  = 'shell height at metam';   bibkey.Lj  = 'FariUria1998';
data.Lp  = 2.0;    units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'Agui2013';
data.Li  = 11.0;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Wolf1987';

data.Wdb = 1.334e-7; units.Wdb = 'g'; label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'FariUria1998';
data.Wdj = 9.8e-7;   units.Wdj = 'g'; label.Wdj = 'dry weight at metam';     bibkey.Wdj = 'FariUria1998';
data.Wdp = 0.16;     units.Wdp = 'g'; label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'Agui2013';
  comment.Wdp = 'obtained from Lp via LW-regression';
data.Wdi = 19.24;    units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'Agui2013';
  comment.Wdi = 'obtained from Li via LW-regression';

data.Ri  = 892997; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Agui2013';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
% Aguirre (PARACAS BAY 2012-2013, suspended cages)
data.tL = [ ... % time since birth (d), shell height (cm)
89	4.1
89	3.9
89	4.1
89	3.5
89	3.4
89	3.6
89	3.9
89	4.1
89	4.1
89	3.4
89	3.8
89	4.2
89	3.6
89	4
89	3.6
89	3.7
89	3.7
89	3.7
89	3.7
89	3.5
89	3.4
89	3.7
89	3.5
89	3.4
89	3.4
89	3.2
89	3
89	3.4
89	3.3
98	3.9
98	4.7
98	4
98	4.5
98	4.5
98	3.8
98	3.8
98	4.5
98	3.9
98	4.2
98	4.2
98	4.2
98	3.8
98	3.7
98	4.1
98	3.7
98	4.1
98	3.7
98	4.4
98	4.1
98	4.5
98	3.8
98	3.9
98	3.7
105	4.2
105	4.1
105	3.4
105	4
105	3.9
105	4.3
105	4.5
105	4.3
105	4.3
105	4.4
105	4.1
105	4.2
105	4
105	4.5
105	4.7
105	4
105	3.8
105	4.3
105	4.4
105	4.4
105	4.1
105	4.8
118	4.9
118	5.4
118	4.7
118	5.1
118	4.5
118	4.7
118	5.2
118	4.7
118	5.3
118	4.9
118	4.8
118	4.6
118	4.8
118	5.2
118	5.2
118	5.4
118	4.6
123	4.6
123	5.5
123	5.6
123	5.6
123	5.6
123	5.1
123	4.7
123	5.3
123	5.4
123	4.6
123	4.9
123	5.2
123	5.1
123	5.1
123	5
123	5
123	4.8
123	5.5
123	5.1
123	5.1
130	5.2
130	5.8
130	5.9
130	5.4
130	5.6
130	5.3
130	5.3
130	5.8
130	5.6
130	5.6
130	5.4
137	5.4
137	6.3
137	5.1
137	5.8
137	5.8
137	5.6
137	5.7
137	5.7
137	5.8
137	6.2
137	5.4
137	5.6
137	5.7
137	6
137	5.3
137	6
137	5.2
137	5.8
137	5.8
144	6.3
144	5.8
144	5.8
144	6.5
144	6
144	6.3
144	5.5
144	6.3
144	6
144	5.8
144	5.9
144	6
144	6
144	6
144	6
144	5.8
151	6.1
151	6.7
151	6
151	6.4
151	6.5
151	5.6
151	5.6
151	6.5
151	6.1
151	6.1
151	5.7
151	6.2
151	6.3
151	5.8
151	6.1
151	6.3
151	5.6
157	6
157	6.6
157	6.8
157	6
157	6.5
157	6.2
157	5.7
157	6.6
157	6.5
157	6.1
157	6.3
157	6.3
157	6.1
157	6.1
157	6.2
157	6
165	6.5
165	7.1
165	6.5
165	7.2
165	6.6
165	6.6
165	6
165	6.2
165	6.7
165	6.6
165	7
165	6.8
165	6.9
165	6.4
165	6.2
165	6.3
165	6.1
165	6.3
165	6.2
172	6.5
172	6.3
172	6.9
172	5.9
172	6.6
172	6.4
172	6.4
172	7
172	7.3
172	6.5
172	6.6
172	7.1
172	6.6
172	7
172	6.5
172	6.8
172	6.7
172	6.4
179	6.9
179	6.8
179	6.2
179	6.8
179	6.8
179	6.6
179	6.8
179	6.5
179	6.5
179	6.3
179	6.4
179	7.5
179	6.8
179	7.1
179	7
179	6.2
179	6.9
179	7
179	7
179	7.3
179	6.3
179	6.9
184	7
184	7.2
184	7.4
184	7.2
184	6.6
184	6.7
184	6.9
184	7.2
184	7
184	6.5
193	7.3
193	7.3
193	6.5
193	7.3
193	6.6
193	6.6
193	6.6
193	7.3
193	6.9
193	7.1
193	6.6
193	6.4
193	7.5
193	6.9
193	7.3
193	7.3
193	6.9
193	7.1
193	6.9
201	7.1
201	7.2
201	7.1
201	7.2
201	6.7
201	7.3
201	7.5
201	7.3
201	6.7
201	6.8
201	7.1
201	7
201	6.7
201	7
201	7
201	6.7
201	7.3
201	7.2
214	7.4
214	7.1
214	7.9
214	7.7
214	7.4
214	7.8
214	7.3
214	7
214	7.4
214	7.6
214	7.4
214	7
214	6.7
214	7.7
214	6.8
214	7.2
214	8.1
214	7.8
214	7.4
214	7.6
214	7.3
214	7.2
214	7.1
221	7.7
221	7
221	7
221	7.9
221	7.3
221	7.2
221	6.9
221	7.4
221	6.9
221	7.3
221	7.4
221	7.4
221	6.8
221	6.8
221	7.7
221	7.9
221	6.6
221	6.9
221	7.2
221	6.6
227	8
227	7.1
227	6.9
227	6.6
227	8
227	7.9
227	7
227	7.4
227	7.4
227	8
227	7.3
227	7.5
227	8.3
227	7.2
227	7.4
227	7.2
227	6.7
227	7.3
235	8
235	7.9
235	7.9
235	8.1
235	8.1
235	7.8
235	7.9
235	7.5
235	7.1
235	8
235	7.2
235	7.2
235	7.7
235	7.5
242	7.9
242	7.6
242	8
242	7.5
242	7.3
242	7.1
242	7.7
242	7.4
242	7.7
242	7.3
242	8
242	7.1
242	7.1
242	7.5
242	7.4
242	7.4
242	7.3
242	7.3
242	7.4
247	7.4
247	8.4
247	7.3
247	7.2
247	7.3
247	7.8
247	7.3
247	7.2
247	7.3
247	7.1
247	7.9
256	7.5
256	7.9
256	7.9
256	8.4
256	7.9
256	7.9
256	8
256	7.9
256	8.1
256	7.3
256	8.1
256	7.4
256	7.9
256	6.9
256	7.6
266	8
266	7.5
266	8.1
266	8.6
266	8.1
266	7.8
266	7.5
266	8.1
266	7.8
266	7.8
266	8.4
266	8.3
273	8.3
273	8
273	7.5
273	7.8
273	8.4
273	8
273	8
273	8.1
273	7.1
273	7.9
273	8.8
273	8
273	7.8
273	7.6
273	8.1
273	8
273	8.4
273	7.3
273	8.8
273	7.3] ;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Agui2013';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'GHCL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46468046'; % Ency of Life
metaData.links.id_Wiki = 'Argopecten_purpuratus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3942270'; % Taxonomicon
metaData.links.id_WoRMS = '394269'; % WoRMS
metaData.links.id_molluscabase = '394269'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argopecten_purpuratus}}';
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
bibkey = 'BellTole1994'; type = 'Article'; bib = [ ... 
'author = {Bellolio, G. and Toledo, P. and Campos, B.}, ' ... 
'year = {1994}, ' ...
'title = {Morfologia de la concha larval y portlarval del ostion \emph{Argopecten purpuratus} ({L}amarck, 1819 {B}ivalvia, {P}ectinidae) en {C}hile}, ' ...
'journal = {Revista Chilena de Historia Natural}, ' ...
'volume = {67}, ' ...
'pages = {229-237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FariUria1998'; type = 'Article'; bib = [ ... 
'author = {Farias, A. and Uriarte, I. and Castilla, J. C.}, ' ... 
'year = {1998}, ' ...
'title = {A biochemical study of the larval and postlarval stages of the chilean scallop \emph{Argopecten purpuratus}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {166}, ' ...
'pages = {37-47}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'UriaRupp2001'; type = 'Incollection'; bib = [ ... 
'author = {Uriarte, I. and Rupp, G. and Abarca, A.}, ' ... 
'year = {2001}, ' ...
'title = {Produccion de juveniles de Pectinidos iberoamericanos bajo condiciones controladas}, ' ...
'booktitle = {Los Moluscos Pectinidos de Iberoamerica: Ciencia y Acuicultura}, ' ...
'editor = {A. N. Maeda-Martinez}, ' ...
'publisher = {Limusa, Noriega Editores}, '...
'address = {Mexico}, '...
'pages = {147-172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StotGonz1997'; type = 'Article'; bib = [ ... 
'author = {Stotz, W. and Gonzalez, S.}, ' ... 
'year = {1997}, ' ...
'title = {Abundance, growth, and production of the sea scallop \emph{Argopecten purpuratus} ({L}amarck 1819): bases for sustainable exploitation ef natural scallop beds in north-central {C}hile}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {32}, ' ...
'pages = {173-183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wolf1987'; type = 'Article'; bib = [ ... 
'author = {Wolff, M.}, ' ... 
'year = {1987}, ' ...
'title = {Population dynamics of the peruvian scallop \emph{Argopecten purpuratus} during the {E}l {N}i\~{n}o phenomenon of 1983}, ' ...
'journal = {Canadian Journal of Fisheries and Aquatic Sciences}, ' ...
'volume = {44}, ' ...
'pages = {1684-1691}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Agui2013'; type = 'Misc'; bib = [ ...
'author = {Aguirre, A.}, ' ... 
'note = {Original data}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

