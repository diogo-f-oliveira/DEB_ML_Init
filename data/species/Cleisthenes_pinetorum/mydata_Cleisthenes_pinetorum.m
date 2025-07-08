function [data, auxData, metaData, txtData, weights] = mydata_Cleisthenes_pinetorum
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Cleisthenes_pinetorum'; 
metaData.species_en = 'Sohachi'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.2); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 11];

%% set data
% zero-variate data
data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(17.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(17.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 24.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 47;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.29 mm of Microstomus kitt: 4/3*pi*0.064^3';
data.Wwp = 136.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00741*Lp^3.07, see F4';
data.Wwi = 1e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00741*Li^3.07, see F4; max published weight 1.2 kg';

data.Ri = 20e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(17.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Microstomus_kitt: 0.7*1e3/3.5e3';

% uni-variate data
% time-length
data.tL = [ ... % age (years) ~ Length (cm) 
    1  3.501  3.139
    2  8.635  8.275
    3 12.958 12.550
    4 17.322 15.469
    5 20.425 17.845
    6 22.210 19.314
    7 23.817 20.063
    8 25.243 21.170
    9 27.120 22.866
   10 27.821 23.704];
data.tL(:,1) = 365 * (0+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(17.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TomiInog1996'; treat.tL = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

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
F1 = 'Length-Weight relationship: W in g = 0.00741*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5Z8ZR'; % Cat of Life
metaData.links.id_ITIS = '616039'; % ITIS
metaData.links.id_EoL = '46570142'; % Ency of Life
metaData.links.id_Wiki = 'Cleisthenes_pinetorum'; % Wikipedia
metaData.links.id_ADW = 'Cleisthenes_pinetorum'; % ADW
metaData.links.id_Taxo = '171433'; % Taxonomicon
metaData.links.id_WoRMS = '280211'; % WoRMS
metaData.links.id_fishbase = 'Cleisthenes-pinetorum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cleisthenes_pinetorum}}';
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
bibkey = 'TomiInog1996'; type = 'article'; bib = [ ...
'author = {Osamu Tominaga and Ken Inoguchi and Yasuhiro Watanabe and Motohito Yamaguchi and Toshikuni Nakatani and Toyomi Takahashi}, ' ...
'year   = {1996}, ' ...
'title  = {Age and Growth of Pointhead Flounder \emph{Hippoglossoides pinetorum} in {I}shikari {B}ay, {H}okkaido}, ' ... 
'journal = {Fisheries Science}, ' ...
'page = {215-221}, ' ...
'volume = {62(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cleisthenes-pinetorum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
