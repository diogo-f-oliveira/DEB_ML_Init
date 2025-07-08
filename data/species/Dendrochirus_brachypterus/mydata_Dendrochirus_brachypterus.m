function [data, auxData, metaData, txtData, weights] = mydata_Dendrochirus_brachypterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Dendrochirus_brachypterus'; 
metaData.species_en = 'Dwarf lionfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 07 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 29];

%% set data
% zero-variate data

data.ab = 2.5;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(25.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
data.Li  = 17;     units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.7e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm of Pterois_volitans: pi/6*0.08^3';
data.Wwp = 5.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'}';
  comment.Wwp = 'based on 0.01230*Lp^3.11, see F1';
data.Wwi = 82.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^3.11, see F1';
 
data.Ri  = 165000/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based in Pterois_volitans: 2e6*82.5/1e3';

% uni-variate data
% time-weight
data.tW = [ ... %  time since birth (d), weight (g)
 0	     0.898
28.601	 3.619
58.455	10
87.102	20
119.441	22.549
146.180	26
180.973	27.095
213.284	28.323
243.115	30
273.574	35
305.279	39];
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(25.5); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Fish1997';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.ab = 0 * weights.ab;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34PLK'; % Cat of Life
metaData.links.id_ITIS = '166892'; % ITIS
metaData.links.id_EoL = '46568077'; % Ency of Life
metaData.links.id_Wiki = 'Dendrochirus_brachypterus'; % Wikipedia
metaData.links.id_ADW = 'Dendrochirus_brachypterus'; % ADW
metaData.links.id_Taxo = '105789'; % Taxonomicon
metaData.links.id_WoRMS = '218052'; % WoRMS
metaData.links.id_fishbase = 'Dendrochirus-brachypterus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dendrochirus_brachypterus}}';
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
bibkey = 'Fish1997'; type = 'Article'; bib = [ ... 
'doi = {10.1023/A:1007331304122}, ' ...
'author = {Lev Fishelson}, ' ... 
'year = {1997}, ' ...
'title = {Experiments and observations on food consumption, growth and starvation in \emph{Dendrochirus brachypterus} and \emph{Pterois volitans} ({P}teroinae, {S}corpaenidae)}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {50}, ' ...
'pages = {391–403}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Dendrochirus-brachypterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

