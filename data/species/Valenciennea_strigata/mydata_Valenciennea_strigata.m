function [data, auxData, metaData, txtData, weights] = mydata_Valenciennea_strigata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Valenciennea_strigata'; 
metaData.species_en = 'Blueband goby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 22];

%% set data
% zero-variate data

data.ab = 3.6;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(28.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 18;   units.Li  = 'cm';  label.Li  = 'ultimate total length for males';  bibkey.Li  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 3.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^3.02, see F1';
data.Wwi = 63.2;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.01023*Li^3.02, see F1';

data.Ri  = 8.7e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% length-change in length
data.LdL = [... %  total length (cm), change inlength (cm/d)
8.965	0.024
9.494	0.014
10.087	0.018
10.176	0.058
10.269	0.034
10.304	0.027
11.497	0.005
11.523	0.010
11.640	0.012
11.732	0.009
11.798	0.020
12.016	0.008
12.180	0.007
12.296	0.011
12.300	0.006
12.699	0.010
12.867	0.004
12.894	0.008
13.017	0.003
13.369	0.010
13.507	0.005
13.795	0.018
14.000	0.003
14.279	0.008];
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'total length', 'change in total length'};  
temp.LdL    = C2K(28.3);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Reav1997';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;
weights.Ri = 0 * weights.Ri;

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01023*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7F9CN'; % Cat of Life
metaData.links.id_ITIS = '638211'; % ITIS
metaData.links.id_EoL = '46575457'; % Ency of Life
metaData.links.id_Wiki = 'Valenciennea_strigata'; % Wikipedia
metaData.links.id_ADW = 'Valenciennea_strigata'; % ADW
metaData.links.id_Taxo = '189865'; % Taxonomicon
metaData.links.id_WoRMS = '219599'; % WoRMS
metaData.links.id_fishbase = 'Valenciennea-strigata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Valenciennea_strigata}}';
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
bibkey = 'HernMund2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-011-9782-6}, ' ...
'author = {V. Hernaman and P. L. Munday}, ' ... 
'year = {2005}, ' ...
'title = {Life-history characteristics of coral reef gobies. {I}. {G}rowth and life-span}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {290}, ' ...
'pages = {207–221}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Reav1997'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-011-9782-6}, ' ...
'author = {Robert H. Reavis}, ' ... 
'year = {1997}, ' ...
'title = {The natural history of a monogamous coral-reef fish, \emph{Valenciennea strigata} ({G}obiidae): 1. {A}bundance, growth, survival and predation}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {49}, ' ...
'pages = {239–246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Valenciennea-strigata.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
