function [data, auxData, metaData, txtData, weights] = mydata_Boophis_occidentalis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Mantellidae';
metaData.species    = 'Boophis_occidentalis'; 
metaData.species_en = 'Western white lipped treefrog'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 05];

%% set data
% zero-variate data

data.tj = 180; units.tj = 'd';    label.tj = 'time birth at metam';        bibkey.tj = 'guess';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = '20 to 32 d';
data.am = 3*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'GuarTess2010';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 2.0;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'Wiki';
data.Lp  = 2.8;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'GuarTess2010';
data.Li  = 5.53;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';

data.Wwb = 6e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2-2.5 mm: pi/6*0.225^3';
data.Wwi = 10.9;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Wiki';  

data.Ri  = 210/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Pelophylax_esculentus: 4000*(3/8)^3 eggs per clutch';

% uni-variate data
% time-length
data.tL = [ ... % time since metam (d), SVL (cm)
4	5.681
4	5.681
4	5.681
4	5.824
4	5.701
4	5.558
4	5.507
4	5.405
5	5.693
5	5.734
5	5.765
5	5.847
5	5.980
5	5.294
5	5.366
5	5.489
5	5.601
6	5.112
6	5.695
6	5.705
6	5.532
6	5.215
6	6.114
6	5.460
6	5.429
6	5.890
6	5.798
6	5.297
6	5.153
6	5.082
7	5.687
7	5.452
7	5.523
7	5.575
7	5.615
7	5.779
7	5.840
7	5.912
7	6.106
7	5.258
9	5.885
9	6.110
%11	8.425 % not included 
];
data.tL(:,1) = (data.tL(:,1)+0.5) * 365; % convert yrs to d
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'SVL'};  
temp.tL   = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'AndrVenc2002'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5WPM9'; % Cat of Life
metaData.links.id_ITIS = '1105577'; % ITIS
metaData.links.id_EoL = '337436'; % Ency of Life
metaData.links.id_Wiki = 'Boophis_occidentalis'; % Wikipedia
metaData.links.id_ADW = 'Boophis_occidentalis'; % ADW
metaData.links.id_Taxo = '141193'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Boophis+occidentalis'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boophis_occidentalis}}';
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
bibkey = 'AndrVenc2002'; type = 'Article'; bib = [ ...  
'author = {Franco Andreone and Miguel Vences and Fabio M. Guarino and Frank Glaw and Jasmin E. Randrianirina}, ' ...
'year = {2002}, ' ...
'title  = {Natural history and larval morphology of \emph{Boophis occidentalis} ({A}nura: {M}antellidae: {B}oophinae) provide new insights into the phylogeny and adaptive radiation of endemic {M}alagasy frogs}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volme = {257}, ' ...
'pages = {425-438}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Boophis+occidentalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

