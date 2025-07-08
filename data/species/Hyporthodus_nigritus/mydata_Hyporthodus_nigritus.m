function [data, auxData, metaData, txtData, weights] = mydata_Hyporthodus_nigritus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Hyporthodus_nigritus'; 
metaData.species_en = 'Warsaw grouper'; 

metaData.ecoCode.climate = {'MA'};
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

data.Lp  = 115;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 230;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 25.4e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01318*Lp^3.05, see F1';
data.Wwi = 210e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.05, see F1; max published weight 198.1 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(18.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    1  29.22
    2  54.19
    3  70.30
    4  82.87
    5  91.99
    6  98.99
    7 104.32
    8 109.83
    9 114.43
   10 119.39
   11 124.01
   12 128.39
   13 132.04
   14 137.23
   15 141.54
   16 141.49
   17 144.97
   18 149.24
   19 152.78
   20 155.91
   21 159.85
   22 168.27
   23 172.51
   24 175.58
   25 187.89
   26 190.39
   27 195.40
   28 197.92
   29 201.72
   30 204.26
   31 206.82
   32 209.37
   33 211.94
   34 214.52
   35 217.10
   36 219.69
   37 222.29
   38 224.90
   39 227.52
   40 230.14
   41 232.79];
data.tL(:,1) = 365*(data.tL(:,1)+0.6); % set origin at birth
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
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYHJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46579825'; % Ency of Life
metaData.links.id_Wiki = 'Hyporthodus_nigritus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1683152'; % Taxonomicon
metaData.links.id_WoRMS = '475100'; % WoRMS
metaData.links.id_fishbase = 'Hyporthodus-nigritus'; % fishbase

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
'howpublished = {\url{http://www.fishbase.org/summary/Mycteroperca-interstitialis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

