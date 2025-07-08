function [data, auxData, metaData, txtData, weights] = mydata_Lepidopus_caudatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Trichiuridae';
metaData.species    = 'Lepidopus_caudatus'; 
metaData.species_en = 'Silver scabbardfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 12 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 04];

%% set data
% zero-variate data

data.ab = 79/24;   units.ab = 'd';   label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Trichiurus nanhaiensis';
data.am = 8*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(12.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 111;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'DemeMoll1993'; 
data.Lpm  = 97;   units.Lpm = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'DemeMoll1993'; 
data.Li  = 210;   units.Li  = 'cm';  label.Li  = 'ultimate total length of female';     bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 8e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max publish weight 8 kg; based on 0.00041*Li^3.11, see F1, gives 6.8 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'DemeMoll1993';
  temp.GSI = C2K(12.1); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1  74.6  75.3
    2  96.5  97.4
    3 118.6 116.4
    4 133.1 137.3
    5 149.9 147.9
    6 160.8 158.8
    7 170.0 167.0
    8 183.2 176.0];
data.tL_fm(:,1) = 365 * (0.1 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
treat.tL_fm = {1, {'females','males'}};
temp.tL_fm    = C2K(12.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DemeMoll1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'depth range 180 to 1700 m; bathypelagic by day but moves upwards in the water column at night to feed at middle depths';
metaData.bibkey.F1 = 'Wiki';
F2 = 'length-weight: wet weight (g) = 0.00041*(TL in cm)^3.11';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5VM7L'; % Cat of Life
metaData.links.id_ITIS = '172391'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Lepidopus_caudatus'; % Wikipedia
metaData.links.id_ADW = 'Lepidopus_caudatus'; % ADW
metaData.links.id_Taxo = '46667'; % Taxonomicon
metaData.links.id_WoRMS = '127088'; % WoRMS
metaData.links.id_fishbase = 'Lepidopus-caudatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepidopus_caudatus}}';
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
bibkey = 'DemeMoll1993'; type = 'Article'; bib = [ ... 
'author = {M. Demestre and B. Moll and L. Recasens and P. Sfinchez}, ' ... 
'year = {1993}, ' ...
'title = {Life history and fishery of \emph{Lepidopus caudatus} ({P}isces: in the {C}atalan {S}ea ({N}orthwestern {M}editerranean)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {115}, ' ...
'pages = {23-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Lepidopus-caudatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
