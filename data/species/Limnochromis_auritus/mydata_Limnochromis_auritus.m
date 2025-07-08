function [data, auxData, metaData, txtData, weights] = mydata_Limnochromis_auritus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Limnochromis_auritus'; 
metaData.species_en = 'Spangled cichlid'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 17];

%% set data
% zero-variate data

data.am = 6*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 13;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 23e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Smit2000';
  comment.Wwb = 'based on Copadichromis chrysonotus egg length of 4.3 mm and presumed width of 3.2 mm: pi/6*0.43*0.32^2';
data.Wwp = 4.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^2.97, see F1';
data.Wwi = 30.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.97, see F1';

data.Ri  = 300/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
319.375	7.113
346.821	7.302
365+12.832	7.638
365+73.784	9.118
365+105.151	8.978
365+224.917	10.066
365+288.721	10.629
365+319.731	10.782
365+346.821	11.118
730+105.508	12.024
730+134.380	12.066
730+223.848	12.635
730+288.008	13.161
730+319.375	13.314];
data.tL(:,1) = data.tL(:,1)+30; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NiyoIsum2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;

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
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6QBM8'; % Cat of Life
metaData.links.id_ITIS = '649518'; % ITIS
metaData.links.id_EoL = '205302'; % Ency of Life
metaData.links.id_Wiki = 'Limnochromis_auritus'; % Wikipedia
metaData.links.id_ADW = 'Limnochromis_auritus'; % ADW
metaData.links.id_Taxo = '178856'; % Taxonomicon
metaData.links.id_WoRMS = '1018926'; % WoRMS
metaData.links.id_fishbase = 'Limnochromis-auritus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limnochromis_auritus}}';
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
bibkey = 'Smit2000'; type = 'Article'; bib = [ ...    
'author = {Lance W. Smith}, ' ...
'year  = {2000}, ' ...
'title = {The reproductive biology of an open-water spawning {L}ake {M}alawi cichlid, \emph{Copadichromis chrysonotus}}, ' ...  
'journal = {African Zoology}, ' ...
'volume = {35(2)}, ' ...
'pages = {151–164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Limnochromis-auritus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

