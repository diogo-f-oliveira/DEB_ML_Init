function [data, auxData, metaData, txtData, weights] = mydata_Pseudopleuronectes_yokohamae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Pseudopleuronectes_yokohamae'; 
metaData.species_en = 'Marbled flounder'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.2); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 16];

%% set data
% zero-variate data
data.ab = 10;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'guess';    
  temp.ab = C2K(17.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'DagaChan1992';  
  temp.am = C2K(17.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 22.5;  units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'guess';
data.Li = 45;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Microstomus kitt: pi/6*0.08^3';
data.Wwp = 110;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwp = 'based on 0.00776*Lp^3.07, see F1';
data.Wwi = 923; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00776*Li^3.07, see F1; max published weight 1.8 kg';

data.Ri = 7e6/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';    bibkey.Ri = 'guess';  
  temp.Ri = C2K(17.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % age (years) ~ Length (cm)
 2 18.513 17.689
 3 24.973 22.586
 4 28.397 25.023
 5 29.593 27.301
 6 32.036 27.185
 7 33.730 28.138
 8 32.881 NaN];
data.tL_fm(:,1) = 365 * (0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17.2);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'DagaChan1992'; treat.tL_fm = {1 {'females','males'}};

% time-weight
data.tW_fm = [ ... % age (years) ~ weight (g)
 2	 151.233 146.850
 3	 291.507 271.781
 4	 444.932 352.877
 5	 615.890 469.041
 6   758.356 526.027
 7   835.068 547.945
 8   859.178 NaN];
data.tW_fm(:,1) = 365 * (0+data.tW_fm(:,1)); % convert yr to d
units.tW_fm = {'d', 'g'}; label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm = C2K(17.2);  units.temp.tW_fm = 'K'; label.temp.tL = 'temperature';
bibkey.tW_fm = 'DagaChan1992'; treat.tW_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;
weights.ab = 0 * weights.ab;
weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 0 * weights.Wwi;

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
D1 = 'males are assumed to differ from females by {p_Am} only ';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00776*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4P887'; % Cat of Life
metaData.links.id_ITIS = '616078'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Pseudopleuronectes_yokohamae'; % Wikipedia
metaData.links.id_ADW = 'Pseudopleuronectes_yokohamae'; % ADW
metaData.links.id_Taxo = '185291'; % Taxonomicon
metaData.links.id_WoRMS = '275360'; % WoRMS
metaData.links.id_fishbase = 'Pseudopleuronectes-yokohamae'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pseudopleuronectes_yokohamae}}';
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
bibkey = 'DagaChan1992'; type = 'article'; bib = [ ...
'author = {Chen Dagang and Liu Changan and Dou Shuozeng}, ' ...
'year   = {1992}, ' ...
'title  = {THE BIOLOGY OF FLATFISH ({P}LEURONECTINAE) IN THE COASTAL WATERS OF {C}HINA}, ' ... 
'journal = {Netherlands Journal of Sea Research}, ' ...
'page = {215-221}, ' ...
'volume = {29(1-3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pseudopleuronectes-yokohamae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
