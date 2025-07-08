function [data, auxData, metaData, txtData, weights] = mydata_Microstomus_kitt
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Pleuronectidae';
metaData.species    = 'Microstomus_kitt'; 
metaData.species_en = 'Lemon sole'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
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
data.ab = 5.5;      units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'fishbase';    
  temp.ab = C2K(15.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'fishbase';  
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 31.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'fishbase';
data.Li = 65;    units.Li = 'cm';   label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.29  mm: 4/3*pi*0.064^3';
data.Wwp = 389;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';           bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.01244 * Lp^3.0, see F4';
data.Wwi = 3.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';      bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01244 * Li^3.0, see F4';

data.Ri = 6.7e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'Wiki';
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data
data.tL = [ ... % age (years) ~ Length (cm) 
6.878	19.961
8.816	18.898
8.872	17.244
9.011	20.197
10.010	18.071
10.895	20.433
11.883	21.496
11.884	21.142
11.886	20.551
11.889	19.843
12.878	20.669
13.869	21.142
13.870	20.787
13.915	22.087
13.962	22.913
14.903	23.386
14.907	22.087
15.943	23.976
16.938	23.031
18.027	23.740
19.810	24.567
23.926	24.921];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Magn2007';

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

%% Facts
F1 = 'Preferred temperature 4 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Semi-pelagic species that is not bound to a demersal life style';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.01244 * (L in cm)^3.0';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '437HG'; % Cat of Life
metaData.links.id_ITIS = '172888'; % ITIS
metaData.links.id_EoL = '46570110'; % Ency of Life
metaData.links.id_Wiki = 'Microstomus_kitt'; % Wikipedia
metaData.links.id_ADW = 'Microstomus_kitt'; % ADW
metaData.links.id_Taxo = '46954'; % Taxonomicon
metaData.links.id_WoRMS = '127140'; % WoRMS
metaData.links.id_fishbase = 'Microstomus-kitt'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microstomus_kitt}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/1382}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
