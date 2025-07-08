function [data, auxData, metaData, txtData, weights] = mydata_Copadichromis_pleurostigmoides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Copadichromis_pleurostigmoides'; 
metaData.species_en = 'Happy'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
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
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 11.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Iles1971'; 
data.Li  = 14.4;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Iles1971';

data.Wwb = 23e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Smit2000';
  comment.Wwb = 'based on Copadichromis chrysonotus egg length of 4.3 mm and presumed width of 3.2 mm: pi/6*0.43*0.32^2';
data.Wwp = 21.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^2.97, see F1';
data.Wwi = 41.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.97, see F1';

data.Ri  = 50/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 50 eggs/young per clutch for Copadichromis chrysonotus, assumed one clutch per yr';
 
% uni-variate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
    1  7.69
    2 11.24
    3 13.74];
data.tL(:,1) = (data.tL(:,1)+0.3)*365; % covert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Iles1971';

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
metaData.links.id_CoL = 'Y2V3'; % Cat of Life
metaData.links.id_ITIS = '649007'; % ITIS
metaData.links.id_EoL = '994752'; % Ency of Life
metaData.links.id_Wiki = 'Copadichromis_pleurostigmoides'; % Wikipedia
metaData.links.id_ADW = 'Copadichromis_pleurostigmoides'; % ADW
metaData.links.id_Taxo = '45594'; % Taxonomicon
metaData.links.id_WoRMS = '1013825'; % WoRMS
metaData.links.id_fishbase = 'Copadichromis-pleurostigmoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Copadichromis_pleurostigmoides}}';
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
bibkey = 'Smit2000'; type = 'Article'; bib = [ ...    
'author = {Lance W. Smith}, ' ...
'year  = {2000}, ' ...
'title = {The reproductive biology of an open-water spawning {L}ake {M}alawi cichlid, \emph{Copadichromis chrysonotus}}, ' ...  
'journal = {African Zoology}, ' ...
'volume = {35(2)}, ' ...
'pages = {151–164}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Iles1971'; type = 'Article'; bib = [ ...    
'author = {Iles, T.D.}, ' ...
'year  = {1971}, ' ...
'title = {Ecological aspects of growth in {A}frican cichlid fishes}, ' ...  
'journal = {J. Cons. Int. Explor. Mer.}, ' ...
'volume = {33(3)}, ' ...
'pages = {363-385}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Copadichromis-pleurostigmoides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

