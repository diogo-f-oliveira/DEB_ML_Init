function [data, auxData, metaData, txtData, weights] = mydata_Austroglossus_microlepis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Austroglossus_microlepis'; 
metaData.species_en = 'West coast sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.4); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 10];

%% set data
% zero-variate data
data.am = 13*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Mora1982';  
  temp.am = C2K(10.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 41.25;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'guess';
  comment.Lp = 'based on Austroglossus_pectoralis: 33*75/60 cm';
data.Li = 75;    units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7  mm of Buglossidium luteum: pi/6*0.07^3';
data.Wwp = 809.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F2';
data.Wwi = 5.6e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.07, see F2; max published weight 4 kg';

data.Ri = 1.3e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(10.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on fecundity of Austroglossus_pectoralis: 3e4*5.6e3/1.33e3';
  
% uni-variate data

% time-length
data.tL = [ ... % age (years), total length (cm)
    3 25.9
    4 28.7
    5 29.4
    6 31.4
    7 33.9
    8 35.4
    9 38.6
   10 41.5
   11 43.6
   15 48.0];
data.tL(:,1) = (0.8 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Mora1982';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: Ww in g = 0.00977*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'JWMY'; % Cat of Life
metaData.links.id_ITIS = '173039'; % ITIS
metaData.links.id_EoL = '46570338'; % Ency of Life
metaData.links.id_Wiki = 'Austroglossus_microlepis'; % Wikipedia
metaData.links.id_ADW = 'Austroglossus_microlepis'; % ADW
metaData.links.id_Taxo = '162714'; % Taxonomicon
metaData.links.id_WoRMS = '219822'; % WoRMS
metaData.links.id_fishbase = 'Austroglossus-microlepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Austroglossus_microlepis}}';
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
bibkey = 'Mora1982'; type = 'article'; bib = [ ...
'howpublished = {\url{https://digital.csic.es/handle/10261/161506}}, ' ...
'author = {Morales-Nin, Beatriz}, ' ... 
'year   = {1982}, ' ...
'title  = {Primeros datos del crecimiento de \emph{Austroglossus microlepis} en aguas de {N}amibia}, ' ...
'journal = {Collection of Scientific Papers of the International Commission for the Southeast Atlantic Fisheries :  ()}, ' ...
'page = {195-198}, ' ...
'volume = {9(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Austroglossus-microlepis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
