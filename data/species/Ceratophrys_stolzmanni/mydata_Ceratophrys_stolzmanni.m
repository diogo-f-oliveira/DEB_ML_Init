function [data, auxData, metaData, txtData, weights] = mydata_Ceratophrys_stolzmanni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ceratophryidae';
metaData.species    = 'Ceratophrys_stolzmanni'; 
metaData.species_en = 'Pacific horned frog'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 19]; 

%% set data
% zero-variate data

data.ab = 40/24; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'OrtiAlme2013';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 26; units.tj = 'd';    label.tj = 'time birth at metam';        bibkey.tj = 'OrtiAlme2013';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = '20 to 32 d';
data.am = 6*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 3.44;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'OrtiAlme2013';
data.Lp  = 4.5;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess';
data.Li  = 8.2;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'OrtiAlme2013';
data.Lim = 6.79;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'OrtiAlme2013';

data.Wwb = 4.9e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'OrtiAlme2013';
  comment.Wwb = 'based on egg diameter of 2.11 mm: pi/6*0.211^3';
data.Wwi = 125.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Ceratophrys_cranwelli: (8.2/13)^3*500';
data.Wwim = 71.3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwi = 'based on (Lim/Li)^3*Wwi';

data.Ri  = 2100/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'OrtiAlme2013';   
temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % age (d), total tadpole length (cm) * SVL/TL
%0.337	0.202*0.41 % embryo data
1.633	0.694*0.41
1.634	0.867*0.41
4.273	1.647*0.41
4.274	1.850*0.41
4.323	2.081*0.41
5.278	1.301*0.41
6.288	1.936*0.41
6.289	2.139*0.41
6.290	2.341*0.41
6.334	1.676*0.41
6.381	1.416*0.41
6.387	2.659*0.41
8.259	3.295*0.41
8.260	3.555*0.41
8.262	3.873*0.41
8.354	3.092*0.41
8.359	4.191*0.41
11.378	4.220*0.39
11.423	3.497*0.39
11.423	3.613*0.39
11.424	3.815*0.39
11.428	4.624*0.39
11.486	6.734*0.39
13.295	4.220*0.39
13.296	4.393*0.39
13.297	4.624*0.39
13.347	4.913*0.39
13.347	5.087*0.39
14.356	5.491*0.39
14.360	6.445*0.39
14.395	3.642*0.39
14.398	4.335*0.39
14.400	4.769*0.39
14.402	5.029*0.39
14.403	5.318*0.39
14.405	5.780*0.39
14.407	6.185*0.39
18.333	5.491*0.50
18.335	5.751*0.50
18.388	6.792*0.50
18.389	7.110*0.50
18.390	7.341*0.50
18.442	8.121*0.50
19.296	6.416*0.50
19.341	5.838*0.50
19.435	5.405*0.50
19.486	6.040*0.50
21.403	6.069*0.50
21.405	6.416*0.50
21.406	6.618*0.50
21.407	6.879*0.50
21.408	7.052*0.50
21.409	7.197*0.50
21.410	7.399*0.50
21.411	7.572*0.50
22.462	6.908*0.50
22.463	7.110*0.50
23.371	6.705*0.50
23.372	6.879*0.50
23.465	6.243*0.50
23.508	5.231*0.50
23.566	7.254*0.50
27.288	4.104*0.80
27.337	4.335*0.80
27.380	3.237*0.80
27.382	3.613*0.80
27.383	3.786*0.80
31.358	3.266*1
31.369	5.520*1
31.510	4.913*1];
data.tL(:,1) = data.tL(:,1) - 1.633; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'OrtiAlme2013';
comment.tL = 'Converted from total length to SVL, using pictures';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'this data determines [p_M] poorly';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = 'SNTX'; % Cat of Life
metaData.links.id_ITIS = '207883'; % ITIS
metaData.links.id_EoL = '1018971'; % Ency of Life
metaData.links.id_Wiki = 'Ceratophrys_stolzmanni'; % Wikipedia
metaData.links.id_ADW = 'Ceratophrys_stolzmanni'; % ADW
metaData.links.id_Taxo = '139184'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ceratophrys+stolzmanni'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ceratophrys_stolzmanni}}';
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
bibkey = 'OrtiAlme2013'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1748-1090.2012.00193.x}, ' ...
'author = {D. Ortiz and D. Almeida-Reinoso and A. Coloma}, ' ...
'year = {2013}, ' ...
'title  = {Notes on husbandry, reproduction and development in the {P}acific horned frog \emph{Ceratophrys stolzmanni} ({A}nura: {C}eratophryidae), with comments on its amplexus}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volme = {47}, ' ...
'pages = {151-162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Ceratophrys&where-species=stolzmanni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1018971}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

