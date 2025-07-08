function [data, auxData, metaData, txtData, weights] = mydata_Pristipomoides_macrophthalmus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Pristipomoides_macrophthalmus'; 
metaData.species_en = 'Cardinal snapper';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 11];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 11];

%% set data
% zero-variate data

data.ab = 8.5;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(18.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 70*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BareGrah2025';   
  temp.am = C2K(18.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.82 mm: pi/6*0.082^3'; 
data.Wwp = 73; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01660*Lp^2.96, see F1';
data.Wwi = 391; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01660*Li^2.96, see F1';

data.Ri  = 3.4e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Lutjanus_carponotatus: 749e3*391/859';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), fork length (cm)
7.191	30.677
10.286	32.413
10.990	37.359
15.912	39.097
17.896	40.191
18.053	40.962
18.058	38.714
18.136	39.485
24.886	41.096
24.959	44.051
26.077	41.547
27.111	41.098
28.059	43.154
31.871	44.057
34.017	43.674
35.054	42.198
36.874	45.346
37.201	41.236
39.984	40.597
43.868	44.261
44.827	42.078
46.643	47.153
47.916	46.127
48.955	43.816
48.960	41.375
56.819	44.529
63.733	44.086
67.779	46.659];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(18.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BareGrah2025';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01660*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MJZ8'; % Cat of Life
metaData.links.id_ITIS = '643085'; % ITIS
metaData.links.id_EoL = '46580803'; % Ency of Life
metaData.links.id_Wiki = 'Pristipomoides_macrophthalmus'; % Wikipedia
metaData.links.id_ADW = 'Pristipomoides_macrophthalmus'; % ADW
metaData.links.id_Taxo = '184759'; % Taxonomicon
metaData.links.id_WoRMS = '276555'; % WoRMS
metaData.links.id_fishbase = 'Pristipomoides-macrophthalmus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pristipomoides_macrophthalmus}}';
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
bibkey = 'BareGrah2025'; type = 'techreport'; bib = [ ...
'doi = {10.1007/s10641-024-01659-3}, ' ...
'author = {Ivy E. Baremore and Rachel T. Graham and Allen  H. Andrews and Simon J. B. Gulak and Matthew J. Witt and Virginia R. Shervette}, ' ...
'year = {2025}, ' ...
'title = {Validation and otolith‑mass prediction of age and growth for cardinal snapper \emph{Pristipomoides macrophthalmus} of the {C}aribbean {S}ea}, ' ... 
'journal = {Environ Biol Fish}, ' ...
'volume = {108}, '...
'pages = {227–239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pristipomoides-macrophthalmus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
