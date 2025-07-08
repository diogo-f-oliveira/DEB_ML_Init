function [data, auxData, metaData, txtData, weights] = mydata_Pseudochaenichthys_georgianus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Channichthyidae';
metaData.species    = 'Pseudochaenichthys_georgianus'; 
metaData.species_en = 'South Georgia icefish'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0bMcd', 'biMp'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 07];

%% set data
% zero-variate data

data.ab = 60;  units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'Trac2015';   
  temp.ab = C2K(-0.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '1-2 months';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(-0.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 47.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'ClarReid2008'; 
data.Lpm = 46.5; units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ClarReid2008'; 
data.Li  = 59; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';     bibkey.Li  = 'ClarReid2008';
data.Lim = 56; units.Lim = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'ClarReid2008';

data.Wwb = 4.5e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4.4 mm: 4/3*pi*0.22^3'; 
data.Wwp = 1.3e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00646*Lp^3.17, see F1';
data.Wwpm = 1.2e3; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';   bibkey.Wwpm = 'fishbase';
  comment.Wwpm = 'based on 0.00646*Lpm^3.17, see F1';
data.Wwi = 2.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight 2.1 kg; based on 0.00646*Li^3.17, see F1';
 
data.Ri = 17958/365; units.Ri = '#/d';   label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(-0.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.061	 2.201
0.175	 2.495
0.351	 2.495
0.473	 5.870
0.578	 6.017
0.683	 6.457
1.348	24.801
1.418	20.252
1.506	22.893
1.515	18.931
1.532	21.719
1.603	19.518
2.329	33.753
2.399	34.046
2.513	36.688
2.514	35.220
2.600	38.889
3.327	47.987
3.407	44.025
3.494	48.721
3.495	44.319
3.503	47.254
3.504	46.373
3.582	48.574
4.424	50.042
4.503	48.281];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(-0.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ClarReid2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00646*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; demersal; depth range 5 - 770 m. Polar, preferred -1 C; Larvae have a long pelagic phase';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Adults lack hemoglobin in this family';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '4NT25'; % Cat of Life
metaData.links.id_ITIS = '642960'; % ITIS
metaData.links.id_EoL = '46573086'; % Ency of Life
metaData.links.id_Wiki = 'Pseudochaenichthys_georgianus'; % Wikipedia
metaData.links.id_ADW = 'Pseudochaenichthys_georgianus'; % ADW
metaData.links.id_Taxo = '185082'; % Taxonomicon
metaData.links.id_WoRMS = '234667'; % WoRMS
metaData.links.id_fishbase = 'Pseudochaenichthys-georgianus'; % fishbase642960


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudochaenichthys_georgianus}}';
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
bibkey = 'ClarReid2008'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0954102008000990}, ' ...
'author = {Sarah Clarke and William D.K. Reid and Martin A. Collins and Mark Belcjier}, ' ... 
'year = {2008}, ' ...
'title = {Biology and distribution of {S}outh {G}eorgia icefish (\emph{Pseudochaenichthys georgianus}) around {S}outh {G}eorgia and {S}hag {R}ocks}, ' ...
'journal = {Antarctic Science}, ' ...
'volume = {20(4)}, ' ...
'pages = {343–353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/Summary/Pseudochaenichthys-georgianus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
