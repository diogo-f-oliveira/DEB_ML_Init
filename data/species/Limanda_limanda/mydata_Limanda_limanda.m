function [data, auxData, metaData, txtData, weights] = mydata_Limanda_limanda
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Limanda_limanda'; 
metaData.species_en = 'Common dab'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 19]; 

%% set data
% zero-variate data
data.am = 12*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 26;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 40;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 4e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.93  mm: 4/3*pi*0.046^3';
data.Wwp = 202;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00854 * Lp^3.091, see F4';
data.Wwi = 1e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     

data.Ri = 9.4e5/365; units.Ri = '#/d';  label.Ri = 'reprod rate at ...'; bibkey.Ri = 'Wiki';
  temp.Ri = C2K(9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ Length (cm) 
2.001	14.286
2.992	18.440
3.997	20.410
6.007	23.547
6.997	24.368
6.997	24.598
7.012	25.058];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Magn2007';

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

%% Facts
F1 = 'Preferred temperature 9 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Semi-pelagic species that is not bound to a demersal life style';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.00854 * (L in cm)^3.091';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '6PZCF'; % Cat of Life
metaData.links.id_ITIS = '172881'; % ITIS
metaData.links.id_EoL = '46570103'; % Ency of Life
metaData.links.id_Wiki = 'Limanda_limanda'; % Wikipedia
metaData.links.id_ADW = 'Limanda_limanda'; % ADW
metaData.links.id_Taxo = '46950'; % Taxonomicon
metaData.links.id_WoRMS = '127139'; % WoRMS
metaData.links.id_fishbase = 'Limanda-limanda'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Limanda_limanda}}';
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
bibkey = 'Magn2007'; type = 'article'; bib = [ ...
'author = {E. Magnussen}, ' ... 
'year   = {2007}, ' ...
'title  = {Interpopulation comparison of growth patterns of 14 fish species on {F}aroe {B}ank: are all fishes on the bank fast-growing?}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {453-475}, ' ...
'volume = {71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/695}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
