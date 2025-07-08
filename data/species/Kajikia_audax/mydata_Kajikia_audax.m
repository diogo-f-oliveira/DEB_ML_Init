function [data, auxData, metaData, txtData, weights] = mydata_Kajikia_audax
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Istiophoriformes'; 
metaData.family     = 'Istiophoridae';
metaData.species    = 'Kajikia_audax'; 
metaData.species_en = 'Striped marlin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MP','MI'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 03];

%% set data
% zero-variate data

data.ab = 7;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 1.5*365;  units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'Wiki';
  temp.ap = C2K(24);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'Wiki';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 210;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 420;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 440000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight, based on 0.00550*Li^3.15, see F1, gives 1e6 g';

data.Ri  = 29e6/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 277 cm'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki gives 120e6 eggs/yr';
 
% uni-variate data
% time-length
data.tL_f = [ ...  % time since birth (yr), fork length (cm)
1.444	152.865
1.719	167.057
1.943	174.937
2.211	194.394
2.214	167.025
2.433	206.484
2.691	206.994
2.973	220.133
3.454	223.785
3.947	238.490
4.205	236.631];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to f
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','female'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SkilYong1976';
%
data.tL_m = [ ...  % time since birth (yr), fork length (cm)
1.438	150.234
1.693	166.533
1.942	177.569
2.197	195.447
2.466	205.429
2.980	212.764
3.198	215.644
3.454	223.522
3.975	228.225
4.225	232.156
5.211	259.459];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to f
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','male'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SkilYong1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f; weights.tL_f(5) = 0; % ignore outlier
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.ap = 0 * weights.ap;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Birth is here assumed to coincide with hatch due to lack of data';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00550*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3QYCF'; % Cat of Life
metaData.links.id_ITIS = '768127'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Kajikia_audax'; % Wikipedia
metaData.links.id_ADW = 'Kajikia_audax'; % ADW
metaData.links.id_Taxo = '1683089'; % Taxonomicon
metaData.links.id_WoRMS = '712907'; % WoRMS
metaData.links.id_fishbase = 'Kajikia-audax'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kajikia_audax}}';
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
bibkey = 'SkilYong1976'; type = 'Article'; bib = [ ... 
'author = {Robert A. Skillman and Maroan Y. Y. Yong}, ' ... 
'year = {1976}, ' ...
'title = {VON {B}ERTALANFFY GROWTH CURVES FOR STRIPED MARLIN, \emph{Tetrapturus audax}, AND BLUE MARLIN, \emph{Makaira nigricans}, IN THE CENTRAL NORTH {P}ACIFIC {O}CEAN}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {74(3)}, ' ...
'pages = {553-566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Kajikia_audax/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/223}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

