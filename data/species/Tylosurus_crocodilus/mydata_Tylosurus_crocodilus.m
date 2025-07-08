function [data, auxData, metaData, txtData, weights] = mydata_Tylosurus_crocodilus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Belonidae';
metaData.species    = 'Tylosurus_crocodilus'; 
metaData.species_en = 'Hound needlefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 03];

%% set data
% zero-variate data

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 51.7; units.Lp  = 'cm'; label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on Belone belone: 31.5*140/93';
data.Li  = 150;     units.Li  = 'cm'; label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 223;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00093*Lp^3.14, see F1';
data.Wwi = 6.3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00093*Li^3.14, see F1';
 
data.Ri = 31256/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(28.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), total length (cm)
0	0.907
1	39.471
2	59.018
3	72.679
4	84.980
5	94.564
6	96.903];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SabrAmin2018';

% time-weight
data.tW = [ ... % time since hatch (d), weight (g)
0	23.739
1	101.744
2	346.233
3	638.281
4	1041.390
5	1444.450
6	1601.700];
data.tW(:,1) = 365 * (0 + data.tW(:,1));
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(28.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SabrAmin2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'};
% subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00093*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7CZK4'; % Cat of Life
metaData.links.id_ITIS = '165577'; % ITIS
metaData.links.id_EoL = '217282'; % Ency of Life
metaData.links.id_Wiki = 'Tylosurus_crocodilus'; % Wikipedia
metaData.links.id_ADW = 'Tylosurus_crocodilus'; % ADW
metaData.links.id_Taxo = '624972'; % Taxonomicon
metaData.links.id_WoRMS = '159259'; % WoRMS
metaData.links.id_fishbase = 'Tylosurus-crocodilus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tylosurus_crocodilus}}';
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
bibkey = 'SabrAmin2018'; type = 'Article'; bib = [ ... 
'author = {Sabrah, M.M. and A.M. Amin and A.O. Attia}, ' ... 
'year = {2018}, ' ...
'title = {Family {B}elonidae from the {S}uez {C}anal, {E}gypt: {A}ge, growth, mortality, exploitation rate and reproductive biology}, ' ...
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {44}, ' ...
'pages = {29-35}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Tylosurus-crocodilus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
