function [data, auxData, metaData, txtData, weights] = mydata_Xenotilapia_flavipinnis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Xenotilapia_flavipinnis'; 
metaData.species_en = 'Yellow sand cichlid'; 

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
metaData.date_subm = [2024 10 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 15];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 9.2;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm of Hemichromis_fasciatus: pi/6*0.128^3';
data.Wwp = 3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01514*Lp^2.97, see F1';
data.Wwi = 11;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.97, see F1';

data.Ri  = 40/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Mylochromis_anaphyrmus';
  
% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
346.734	11.551
365+47.064	12.582
365+288.073	15.089
365+317.976	15.523];
data.tL(:,1) = data.tL(:,1) + 210; % set origin at birth
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
D2 = 'Lm is at odds with tL data';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Lake Tanganyika'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5CBTM'; % Cat of Life
metaData.links.id_ITIS = '649383'; % ITIS
metaData.links.id_EoL = '344800'; % Ency of Life
metaData.links.id_Wiki = 'Xenotilapia_flavipinnis'; % Wikipedia
metaData.links.id_ADW = 'Xenotilapia_flavipinnis'; % ADW
metaData.links.id_Taxo = '190106'; % Taxonomicon
metaData.links.id_WoRMS = '1019030'; % WoRMS
metaData.links.id_fishbase = 'Xenotilapia-flavipinnis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xenotilapia_sima}}';
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
'howpublished = {\url{https://www.fishbase.se/summary/Xenotilapia-sima.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

