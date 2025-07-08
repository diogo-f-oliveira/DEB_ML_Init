function [data, auxData, metaData, txtData, weights] = mydata_Nototheniops_larseni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Nototheniops_larseni'; 
metaData.species_en = 'Painted notie'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'MASW','MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(0); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 03];

%% set data
% zero-variate data

data.ab = 75;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.am = C2K(0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'RadtTarg1984';   
  temp.am = C2K(0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15.3; units.Lp  = 'cm';  label.Lp  = 'total length'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Notothenia_rossi: 58.5*24/92; fishbase gives 22.5 cm, but this seems large given Li';
data.Li  = 24; units.Li  = 'cm';  label.Li  = 'ultimate total length';               bibkey.Li  = 'fishbase';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3'; 
data.Wwp = 32; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00490*Lp^3.22, see F1';
data.Wwi = 136.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.22, see F1';

data.Ri = 9086/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  
% uni-variate data
% time-length
data.tL = [ ... % increments (#), total length (cm)
1234.027	7.511
1287.754	7.616
1378.974	8.147
1432.505	8.838
1539.961	9.049
1566.691	9.501
1770.564	10.775
1824.283	10.907
1840.109	11.811
1851.138	10.987
1963.711	11.969
1979.697	12.394
2033.925	11.012
2967.590	16.425];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(0);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RadtTarg1984';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W = 0.00490*(TL in cm)^3.22'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; demersal; preferred 0 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '47Z25'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '356934'; % Ency of Life
metaData.links.id_Wiki = 'Nototheniops_larseni'; % Wikipedia
metaData.links.id_ADW = 'Nototheniops_larseni'; % ADW
metaData.links.id_Taxo = '489012'; % Taxonomicon
metaData.links.id_WoRMS = '313400'; % WoRMS
metaData.links.id_fishbase = 'Nototheniops-larseni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nototheniops_larseni}}';
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
bibkey = 'RadtTarg1984'; type = 'Article'; bib = [ ... 
'author = {R. L. Radtke and T. E. Targett}, ' ... 
'year = {1984}, ' ...
'title = {Rhythmic Structural and Chemical Patterns in Otoliths of the {A}ntarctic Fish \emph{Notothenia larseni}: {T}heir Application to Age Determination}, ' ...
'journal = {Polar Biol.}, ' ...
'volume = {3}, ' ...
'pages = {203 - 210}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Nototheniops-larseni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
