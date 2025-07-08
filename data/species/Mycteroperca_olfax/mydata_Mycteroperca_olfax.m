function [data, auxData, metaData, txtData, weights] = mydata_Mycteroperca_olfax

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Mycteroperca_olfax'; 
metaData.species_en = 'Sailfin grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp','jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 31];

%% set data
% zero-variate data

data.ab = 4; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(19.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 29 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'SadoEklu1999';   
  temp.am = C2K(19.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 65.3;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 120;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'SadoEklu1999';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 1.8e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00603*Lp^3.02, see F1';
data.Wwi = 11.5e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.02, see F1';
 
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(19.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Mycteroperca_bonaci';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.717	20.461
0.909	33.218
0.969	42.126
0.972	38.078
0.978	29.373
1.001	45.163
1.041	35.448
1.051	20.266
1.110	31.400
1.962	53.078
1.965	49.231
1.994	55.912
1.997	50.447
2.000	46.803
2.004	40.325
2.007	35.467
2.035	44.375
2.036	42.755
2.075	33.444
2.139	38.304
3.023	61.601
3.025	58.362
3.027	55.731
3.032	48.646
3.052	69.092
3.058	59.780
3.061	54.719
3.062	52.897
3.099	47.433
3.102	43.384
3.104	40.752
3.130	50.874
3.134	45.611
4.028	54.334
4.053	66.278
4.063	52.513
4.092	58.384
4.097	50.287
4.098	49.072
4.123	62.028
4.124	60.206
4.127	56.360
5.052	67.917
5.117	70.550
5.121	64.275
5.122	63.668
5.124	60.834
5.128	54.761
5.153	66.300
6.085	68.141
6.118	69.154
6.146	78.061
6.148	74.012
6.151	70.166
6.183	71.786
6.214	75.228
6.220	66.322
11.308	84.036
17.599	97.726
21.731	100.441];
data.tL(:,1) = 365*(data.tL(:,1)+0.5); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'UsseFried2015'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'known from Isla del Coco and Galapagos Islands'; 
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '44ZP9'; % Cat of Life
metaData.links.id_ITIS = '551110'; % ITIS
metaData.links.id_EoL = '46579707'; % Ency of Life
metaData.links.id_Wiki = 'Mycteroperca_olfax'; % Wikipedia
metaData.links.id_ADW = 'Mycteroperca_olfax'; % ADW
metaData.links.id_Taxo = '180509'; % Taxonomicon
metaData.links.id_WoRMS = '273881'; % WoRMS
metaData.links.id_fishbase = 'Mycteroperca-olfax'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteroperca_olfax}}';
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
bibkey = 'UsseFried2015'; type = 'article'; bib = [ ... 
'doi = {10.7717/peerj.1270}, ' ...
'author = {Paolo Usseglio and Alan M. Friedlander and Edward E. DeMartini and Anna Schuhbauer and Eva Schemmel and Pelayo Salinas de L\''{e}on}, ' ... 
'year = {2015}, ' ...
'title = {Improved estimates of age, growth and reproduction for the regionally endemic {G}alapagos sailfin grouper \emph{Mycteroperca olfax} ({J}enyns, 1840)}, ' ...
'journal = {PeerJ}, ' ...
'volume = {3}, ' ...
'pages = {e1270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Mycteroperca-olfax.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

