function [data, auxData, metaData, txtData, weights] = mydata_Mycteroperca_rosacea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Mycteroperca_rosacea'; 
metaData.species_en = 'Leopard grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.4); % K, body temp
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

data.ab = 5.5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(22.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 21 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'MathHunt1986';   
  temp.am = C2K(22.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 43;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 86;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 1.8e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00933*Lp^3.05, see F1';
data.Wwi = 11.5e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.05, see F1';
 
data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(22.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Mycteroperca_bonaci';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
2.5	28.977
3.5	33.689
4.5	38.240
5.5	43.257
6.5	47.808
7.5	53.600
8.5	58.154
9.5	63.170
10.5	68.187
11.5	72.278
12.5	74.660
13.5	76.725
14.5	78.493
15.5	80.869
16.5	85.888
17.5	86.719
18.5	87.705
21.5	97.951];
data.tL(:,1) = 365*(data.tL(:,1)+0.5); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MathHunt1986'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 3 * weights.Li;

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
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6RRZV'; % Cat of Life
metaData.links.id_ITIS = '551112'; % ITIS
metaData.links.id_EoL = '46579709'; % Ency of Life
metaData.links.id_Wiki = 'Mycteroperca_rosacea'; % Wikipedia
metaData.links.id_ADW = 'Mycteroperca_rosacea'; % ADW
metaData.links.id_Taxo = '180512'; % Taxonomicon
metaData.links.id_WoRMS = '273883'; % WoRMS
metaData.links.id_fishbase = 'Mycteroperca-rosacea'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteroperca_rosacea}}';
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
bibkey = 'MathHunt1986'; type = 'article'; bib = [ ... 
'author = {Matheson, R.H. and G.R. Huntsman and C.S. Manooch}, ' ... 
'year = {2001}, ' ...
'title = {Age, growth, mortality, food and reproduction of scamp, \emph{Myctoperca phenax}, collected off {N}orth {C}arolina and {S}outh {C}arolina}, ' ...
'journal = { Pacific Science}, ' ...
'volume = {55(2)}, ' ...
'pages = {171-182}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Mycteroperca-rosacea.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

