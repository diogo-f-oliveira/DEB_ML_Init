function [data, auxData, metaData, txtData, weights] = mydata_Phycodurus_eques
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Phycodurus_eques'; 
metaData.species_en = 'Leafy seadragon'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 10 19];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 19];

%% set data
% zero-variate data

data.ab = 22;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(17.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'PaulMats2022';   
  temp.am = C2K(17.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 35;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 3.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.8 mm of Phyllopteryx taeniolatus: pi/6*0.18^3';
data.Wwp = 35.8;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00447*Lp^3.00, see F2';
data.Wwi = 191.7;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.00, see F1';

data.Ri  = 250*2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '250 eggs per brood, assumed 2 broods per yr';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), scalene length (cm)
0.180	10.336
0.320	12.226
0.360	16.338
1.140	22.791
1.260	17.903
1.300	23.459
1.360	21.793
1.680	25.463
2.220	32.692
6.520	28.184
6.700	30.630
8.480	31.539];
data.tL(:,1) = 365 * (data.tL(:,1) + 0); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'scalene length'};  
temp.tL    = C2K(17.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PaulMats2022';

% length-weight
data.LW = [ ... % scalene length (cm(, weight (g)
17.939	4.852
21.533	16.119
22.307	13.797
22.945	21.643
23.522	24.191
25.633	41.798
28.004	54.747
28.264	49.453
30.122	61.126
31.212	66.010
32.376	55.217];    
units.LW   = {'cm', 'g'};  label.LW = {'scalene length','weight'};  
bibkey.LW = 'PaulMats2022';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Li = 0 * weights.Li;
weights.Lp = 0 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from wild, captive'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Lp and Li ignonerd because total length does not equal scalene length';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4GYPB'; % Cat of Life
metaData.links.id_ITIS = '645069'; % ITIS
metaData.links.id_EoL = '46567737'; % Ency of Life
metaData.links.id_Wiki = 'Phycodurus_eques'; % Wikipedia
metaData.links.id_ADW = 'Phycodurus_eques'; % ADW
metaData.links.id_Taxo = '183756'; % Taxonomicon
metaData.links.id_WoRMS = '282248'; % WoRMS
metaData.links.id_fishbase = 'Phycodurus-eques'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phycodurus_eques}}';
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
bibkey = 'PaulMats2022'; type = 'Article'; bib = [ ... 
'doi = {10.3390/fishes7020077}, ' ...
'author = {Daniel Pauly and Leslee Matsushige and Janet Malacane and Amanda Hay and Elaine Chu and Melanie Warren}, ' ... 
'year = {2022}, ' ...
'title = {Length–Weight Relationships and Growth Parameters of Common and Leafy Seadragons ({S}yngnathidae) from a Public Aquarium}, ' ...
'journal = {Fishes}, ' ...
'volume = {7}, ' ...
'pages = {772}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Phycodurus-eques.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

