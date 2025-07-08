function [data, auxData, metaData, txtData, weights] = mydata_Trematocara_variabile
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Trematocara_variabile'; 
metaData.species_en = 'Cichlid'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 13];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 17;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'NiyoIsum2015';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm of Hemichromis_fasciatus: pi/6*0.128^3';
data.Wwp = 3.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00389*Lp^3.21, see F1';
data.Wwi = 34.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishbase','NiyoIsum2015'};
  comment.Wwi = 'based on 0.00389*Li^3.21, see F1';

data.Ri  = 140/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lethrinops_parvidens';
  
% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
288.517	6.986
319.186	6.991
350.612	7.290
365+73.454	9.026
365+104.502	9.178
365+227.178	10.771
365+258.605	11.317
365+321.079	11.868
365+349.098	11.872
730+15.902	12.122
730+47.707	12.570
730+73.076	12.278
730+106.395	12.479
730+135.171	13.222
730+166.976	13.276
730+228.314	13.333
730+319.186	14.183
730+350.612	14.088
1095+135.171	15.242
1095+257.469	16.096];
data.tL(:,1) = data.tL(:,1) + 140; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NiyoIsum2015';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.21'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Lake Tanganyika'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5833Q'; % Cat of Life
metaData.links.id_ITIS = '649353'; % ITIS
metaData.links.id_EoL = '215349'; % Ency of Life
metaData.links.id_Wiki = 'Trematocara_variabile'; % Wikipedia
metaData.links.id_ADW = 'Trematocara_variabile'; % ADW
metaData.links.id_Taxo = '189294'; % Taxonomicon
metaData.links.id_WoRMS = '1014127'; % WoRMS
metaData.links.id_fishbase = 'Trematocara-variabile'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trematocara_variabile}}';
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
bibkey = 'NiyoIsum2015'; type = 'Article'; bib = [ ... 
'author = {Niyonkuru, C. and P. Isumbisho and J. Moreau}, ' ...
'year  = {2015}, ' ...
'title = {Growth, mortality rates and exploitation of cichlids in anthropological coastal zone in the north of {L}ake {T}anganyika}, ' ...  
'journal = {J. Agric. Life Sci.}, ' ...
'volume = {2(1)}, ' ...
'pages = {2375-4222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Trematocara-variabile.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

