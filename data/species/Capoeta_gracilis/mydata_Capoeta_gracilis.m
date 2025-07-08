
function [data, auxData, metaData, txtData, weights] = mydata_Capoeta_gracilis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Capoeta_gracilis'; 
metaData.species_en = 'Tilkhos'; 

metaData.ecoCode.climate = {'BSk', 'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm', '0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biHl', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Saeid Esmaeilpour-Poodeh'};        
metaData.date_subm   = [2022 04 27];                           
metaData.email       = {'Esmaeilpoorsaeid@yahoo.com'};                 
metaData.address     = {'Gorgan University of Agricultural Sciences and Natural Resources'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2022 05 17]; 

%% set data
% zero-variate data
data.am = 4*365;     units.am = 'd';  label.am = 'life span';  bibkey.am = 'Sardari2010';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.82;    units.Lp = 'cm'; label.Lp = 'length at puberty for females'; bibkey.Lp = 'Sardari2010';
data.Li = 21.17;    units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'Sardari2010';
  comment.Li = 'Bas Kooijman: fishbase gives 35 cm';
  
data.Wwb = 2.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'TurkErdo2002';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';

data.Ri = 93860/365; units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'KeivNasr2017';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
 0.5 6.92
 1 9.10
 2 12.59
 3 16.83
 4 17.60];
data.tL(:,1) = 365 * (0.75+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Sardari2010';

% time-weight
data.tWw = [ ... % time since birth (yr), wet weight (g)
 0.5  4.71
 1  9.28
 2  27.03
 3 51.08
 4 82.38];
data.tWw (:,1) = 365 * (0.75+data.tWw (:,1)); % convert yr to d
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(18);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Sardari2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';

%% Links
metaData.links.id_CoL = '5X9L8'; % Cat of Life
metaData.links.id_ITIS = '690167'; % ITIS
metaData.links.id_EoL = '1156460'; % Ency of Life
metaData.links.id_Wiki = 'Capoeta_gracilis'; % Wikipedia
metaData.links.id_ADW = 'Squalidus_gracilis_gracilis'; % ADW
metaData.links.id_Taxo = '592141'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Capoeta-gracilis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capoeta_gracilis}}';  
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
bibkey = 'KeivNasr2017'; type = 'Book'; bib = [ ... 
'author = {Keivani, Y. and Nasri, M. and Abbasi, K. and Abdoli, A.}, ' ...
'year = {2017}, ' ...
'title  = {Atlas of Inland Water Fishes of Iran}, ' ...
'publisher = {Iran Department of Environment}, ' ...
'pages = {190}, '];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sardari2010'; type = 'Mscthesis'; bib = [ ... 
'author = {Sardar, E.}, ' ...
'year = {2010}, ' ...
'title  = {Comparison of population dynamics of \emph{Capoeta capoeta gracilis} in Zarrin Gol and Tilabad streams, Golestan province, Iran}, ' ...
'school = {Gorgan university of Agricultural Sciences and Natural Resources, Iran}, ' ...
'pages = {220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TurkErdo2002'; type = 'article'; bib = [ ...  
'author = {Mustafa T\"{u}rkmen and Orhan Erdogan and Ayhan Yildirim and Ihsam Akyurt}, ' ...
'year = {2002}, ' ...
'title = {Reproduction tactics, age and growth of \emph{Capoeta capoeta umbla} {H}eckel 1843 from the A\c{s}kale {R}egion of the {K}arasu {R}iver, {T}urkey}, ' ... 
'journal = {Fisheries Research}, ' ...
'volume = {54}, '...
'pages = {317-328}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Capoeta-gracilis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

