function [data, auxData, metaData, txtData, weights] = mydata_Mycteroperca_interstitialis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Mycteroperca_interstitialis'; 
metaData.species_en = 'Yellowmouth grouper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 30];

%% set data
% zero-variate data

data.ab = 7; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(19.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 41 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(19.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 42;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 84;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 599;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00646*Lp^3.06, see F1';
data.Wwi = 4995;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*Li^3.06, see F1; max published weight 10.2 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(19.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
1.057	26.510
2.242	31.243
3.370	35.135
4.160	37.676
5.067	33.181
5.176	39.386
6.078	43.271
6.196	35.398
7.320	46.161
8.337	48.207
9.183	51.419
9.184	50.246
10.141	55.474
10.256	52.126
11.386	54.007
12.232	56.717
12.233	55.209
13.191	60.604
13.363	56.587
14.097	56.780
14.378	60.644
15.229	55.644
15.340	59.168
16.186	61.878
17.203	63.588
17.317	61.916
18.277	63.624
19.177	70.358
19.181	64.324
20.142	64.021
21.218	61.376
22.172	71.631
23.303	71.837
24.208	70.694
25.225	72.404
26.245	67.243
27.146	73.809
28.162	76.190
30.198	74.582
31.102	75.450
34.206	84.437
35.118	72.233
36.247	74.114
38.111	77.026
40.147	75.586
41.160	82.827];
data.tL(:,1) = 365*(data.tL(:,1)+0.9); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19.6);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'ManiPhil2000'; 

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
F1 = 'length-weight: Ww in g = 0.00646*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44ZP5'; % Cat of Life
metaData.links.id_ITIS = '167762'; % ITIS
metaData.links.id_EoL = '46579704'; % Ency of Life
metaData.links.id_Wiki = 'Mycteroperca_interstitialis'; % Wikipedia
metaData.links.id_ADW = 'Mycteroperca_interstitialis'; % ADW
metaData.links.id_Taxo = '180506'; % Taxonomicon
metaData.links.id_WoRMS = '273878'; % WoRMS
metaData.links.id_fishbase = 'Mycteroperca-interstitialis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteroperca_interstitialis}}';
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
bibkey = 'ManiPhil2000'; type = 'article'; bib = [ ... 
'author = {Manickchand-Heileman, S.C. and D.A.T. Phillip}, ' ... 
'year = {2000}, ' ...
'title = {Age and growth of the yellowedge grouper, \emph{Epinephelus flavolimbatus}, and the yellowmouth grouper, \emph{Mycteroperca interstitialis}, off {T}rinidad and {T}obago}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {98}, '...
'pages = {290-298}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Mycteroperca-interstitialis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

