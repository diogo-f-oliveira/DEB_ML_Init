function [data, auxData, metaData, txtData, weights] = mydata_Pagellus_bellottii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Pagellus_bellottii'; 
metaData.species_en = 'Red pandora'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.2); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 20];

%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(25.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Pagellus acarne, corrected for temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'PhanKomf1972';   
  temp.am = C2K(25.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.2;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
data.Li  = 42;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 8.7e-5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.55 mm of Pagellus acarne: pi/6*0.055^3';
data.Wwp = 24.1;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01202*Lp^3.04';
data.Wwi = 1.03e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.04';

data.Ri  = 406800/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ % time since birth (yr), total length (cm)
1	10.944
2	16.224
3	20.607
4	23.477
5	26.513
6	28.991
7	31.299]; 
data.tL(:,1) = (0+data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PhanKomf1972';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Protogynic hermaphrodite';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4BZB9'; % Cat of Life
metaData.links.id_ITIS = '647898'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pagellus_bellottii'; % Wikipedia
metaData.links.id_ADW = 'Pagellus_bellottii'; % ADW
metaData.links.id_Taxo = '505391'; % Taxonomicon
metaData.links.id_WoRMS = '127058'; % WoRMS
metaData.links.id_fishbase = 'Pagellus-bellottii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pagellus_bellottii}}';
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
bibkey = 'PhanKomf1972'; type = 'Article'; bib = [ ... 
'author = {Le Trong Phan and A. Komfowski}, ' ... 
'year = {1972}, ' ...
'title = {A study of \emph{Pagellus coupei} {D}ieuaeide from the {N}orth {W}est {A}frican Region}, ' ...
'journal = {Acta Ichthiologica et Piscatoria}, ' ...
'volume = {2(1)}, ' ...
'pages = {19-30}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Pagellus-bellottii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

