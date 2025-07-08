function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_polli
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_polli'; 
metaData.species_en = 'Benguela hake'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 20]; 

%% set data
% zero-variate data
data.am = 20*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';  
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 40;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'ReyFern2016';
  comment.Lp = '37 to 44 cm';
data.Li = 80;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 900 mum: pi/6*0.09^3';
data.Wwp = 425;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'ReyFern2016','fishbase'};
  comment.Wwp = 'based on Wwp = 0.00513*Lp^3.07, see F1';
data.Wwi = 3.6e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.07, see F1';
  
data.GSI = 25; units.GSI = '-';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(14); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% uni-variate data
% time-length data     
data.tL = [ ... % time since birth (d), total length (cm) 
148.377	19.459
159.505	26.293
166.924	21.776
166.924	22.703
185.471	29.189
191.036	30.579
203.091	25.946
207.728	20.386
209.583	28.263
217.002	20.849
226.275	29.653
235.549	25.135
238.331	24.093
240.185	33.127
247.604	30.116
250.386	32.201
252.241	20.849
252.241	27.336
259.660	26.873
273.570	33.359
280.989	32.317
291.190	31.158
330.139	28.263
333.849	31.042
352.396	34.286
389.490	43.320
420.093	45.058
446.986	43.089
471.097	35.676
474.807	44.015
502.628	47.954
560.124	44.015];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ReyFern2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZV7B'; % Cat of Life
metaData.links.id_ITIS = '550664'; % ITIS
metaData.links.id_EoL = '46564950'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_polli'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_polli'; % ADW
metaData.links.id_Taxo = '179870'; % Taxonomicon
metaData.links.id_WoRMS = '272457'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-polli'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Merluccius_polli}}';
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
bibkey = 'ReyFern2016'; type = 'article'; bib = [ ...
'author = {Javier Rey and Lourdes Fern\''{a}ndez-Peralta and Alberto Garc\''{i}a and Enrique Nava and Mar\''{i}a Carmen Clemente and Pablo Otero and Elisa Isabel Villar and Carmen Gloria Pineiro}, ' ... 
'year   = {2016}, ' ...
'title  = {Otolith microstructure analysis reveals differentiated growth historiesin sympatric black hakes (\emph{Merluccius polli} and \emph{Merluccius senegalensis})}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {280-290}, ' ...
'volume = {179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-polli.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

