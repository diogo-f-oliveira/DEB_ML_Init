function [data, auxData, metaData, txtData, weights] = mydata_Diplodus_hottentotus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Diplodus_hottentotus'; 
metaData.species_en = 'Zebra'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 07];

%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(25.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 33*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(25.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 28;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 60;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 345;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^3.06, see F1';
data.Wwi = 3557;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.06, see F1';

data.GSI  = 0.055; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(25.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Diplodus_cadenati';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
 0  7.7  7.7
 1 12.7 13.4
 2 18.2 17.5
 3 21.6 21.7
 4 24.3 24.8
 5 26.3 25.4
 6 27.3 25.1
 7 26.6 28.3
 8 26.5 31.9
 9 29.2 31.1
10 31.9 32.8
11 32.0 33.4
12 33.6 33.5
13 33.4 34.3
14 40.0 34.7
15 35.8 35.9
16 38.1 37.5
17 33.7 35.9
18 35.7 37.5
19 37.1 37.2
20 38.7 39.6
21 NaN  41.7
22 40.0 NaN
23 NaN  41.4
24 NaN  NaN
25 NaN  42.0
26 NaN  40.1
27 NaN  39.2
28 NaN  NaN
29 NaN  NaN
30 42.6 44.0
31 NaN  45.0
32 NaN  NaN
33 NaN  48.0];
data.tL_fm(:,1) = (0.7+data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(125.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MannBuxt1997'; treat.tL_fm = {1 {'females','males'}};
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'known only from southern Mozambique and South Africa';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6CXQJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '2418824'; % Ency of Life
metaData.links.id_Wiki = 'Diplodus_hottentotus'; % Wikipedia
metaData.links.id_ADW = 'Diplodus_hottentotus'; % ADW
metaData.links.id_Taxo = '3415072'; % Taxonomicon
metaData.links.id_WoRMS = '713378'; % WoRMS
metaData.links.id_fishbase = 'Diplodus-hottentotus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodus_hottentotus}}';
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
bibkey = 'MannBuxt1997'; type = 'Article'; bib = [ ... 
'doi = {10.1016/s0165-7836(01)00421-0}, ' ...
'author = {Mann, B.Q. and C.D. Buxton}, ' ... 
'year = {1997}, ' ...
'title = {Age and growth of \emph{Diplodus sargus capensis} and \emph{D. cervinus hottentotus} ({S}paridae) on the {T}sitsikama coast, {S}outh {A}frica}, ' ...
'journal = {Cybium}, ' ...
'volume = {21(2)}, ' ...
'pages = {135-147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Diplodus-hottentotus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
