function [data, auxData, metaData, txtData, weights] = mydata_Copadichromis_likomae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Copadichromis_likomae'; 
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
  
data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 14;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 23e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Smit2000';
  comment.Wwb = 'based on Copadichromis chrysonotus egg length of 4.3 mm and presumed width 0f 3.2 mm: pi/6*0.43*0.32^2';
data.Wwp = 10.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01514*Lp^2.97, see F1';
data.Wwi = 38.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.97, see F1';

data.Ri  = 50/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 50 eggs/young per clutch for Copadichromis chrysonotus, assumed one clutch per yr';
 
% uni-variate data

% time-length
data.tL = [ ... % time (d), total length (cm)
318.768	5.773
347.971	6.178
365+15.139	7.200
365+45.464	7.976
365+73.963	8.711
365+103.869	8.786
365+224.677	10.241
365+258.581	10.151
365+288.509	10.515
365+318.464	11.209
365+348.357	11.119
730+15.083	11.153
730+225.251	12.918
1095+44.801	13.494];
data.tL(:,1) = data.tL(:,1) - 100; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mass1992';

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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5ZWW9'; % Cat of Life
metaData.links.id_ITIS = '649002'; % ITIS
metaData.links.id_EoL = '994748'; % Ency of Life
metaData.links.id_Wiki = 'Copadichromis_likomae'; % Wikipedia
metaData.links.id_ADW = 'Copadichromis_likomae'; % ADW
metaData.links.id_Taxo = '45590'; % Taxonomicon
metaData.links.id_WoRMS = '1013826'; % WoRMS
metaData.links.id_fishbase = 'Copadichromis-likomae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Copadichromis_likomae}}';
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
bibkey = 'Mass1992'; type = 'Article'; bib = [ ...    
'author = {Alfredo V. R. Massinga}, ' ...
'year  = {1992}, ' ...
'title = {Growth, Mortality and Yield-per-Recruit of \emph{Copadichromis likomae} ({C}ichlidae) in {L}ake {N}iassa, {M}ozambique}, ' ...  
'journal = {Revista de Investiga\c{c}\~{a}o Pesqueira Maputo}, ' ...
'volume = {21}, ' ...
'pages = {59-68}'];
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
'howpublished = {\url{https://www.fishbase.se/summary/Copadichromis-likomae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

