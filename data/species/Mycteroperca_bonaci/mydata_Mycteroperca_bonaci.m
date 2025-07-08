function [data, auxData, metaData, txtData, weights] = mydata_Mycteroperca_bonaci

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Mycteroperca_bonaci'; 
metaData.species_en = 'Black grouper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.3); % K, body temp
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
  temp.ab = C2K(18.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 91 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(18.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 67.7;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 150;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 4e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01047*Lp^3.05, see F1';
data.Wwi = 45.4e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.05, see F1; max published weight 100 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(18.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    1  26.01
    2  39.69
    3  50.41
    4  59.08
    5  66.40
    6  73.39
    7  80.61
    8  87.31
    9  92.51
   10  97.54
   11 101.01
   12 105.43
   13 107.66
   14 111.03];
data.tL(:,1) = 365*(data.tL(:,1)+0.8); % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.3);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
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
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '73RZW'; % Cat of Life
metaData.links.id_ITIS = '167760'; % ITIS
metaData.links.id_EoL = '46579700'; % Ency of Life
metaData.links.id_Wiki = 'Mycteroperca_bonaci'; % Wikipedia
metaData.links.id_ADW = 'Mycteroperca_bonaci'; % ADW
metaData.links.id_Taxo = '180503'; % Taxonomicon
metaData.links.id_WoRMS = '159231'; % WoRMS
metaData.links.id_fishbase = 'Mycteroperca-bonaci'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mycteroperca_bonaci}}';
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
bibkey = 'ManiPhil2000'; type = 'article'; bib = [ ... 
'doi = {10.1371/journal.pone.0228254}, ' ...
'author = {Barnett, B.K. and Chanton, J.P. and Ahrens, R. and Thornton, L. and Patterson, W.F.}, ' ... 
'year = {2020}, ' ...
'title = {Life history of northern {G}ulf of {M}exico {W}arsaw grouper \emph{Hyporthodus nigritus} inferred from otolith radiocarbon analysis}, ' ...
'journal = {PLoS ONE}, ' ...
'volume = {15(1)}, '...
'pages = {e0228254}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Mycteroperca-bonaci.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

