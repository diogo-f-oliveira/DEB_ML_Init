function [data, auxData, metaData, txtData, weights] = mydata_Hyperoplus_lanceolatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Uranoscopiformes'; 
metaData.family     = 'Ammodytidae';
metaData.species    = 'Hyperoplus_lanceolatus'; 
metaData.species_en = 'Great sandeel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 14];

%% set data
% zero-variate data

data.ab = 19;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(10.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(10.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 13;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.9 mm of Ammodytes_marinus: pi/6*0.09^3'; 
data.Wwp = 6; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00269*Lp^3.01, see F1';
data.Wwi = 179; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00269*Li^3.01, see F1';

data.Ri = 35e3/365;  units.Ri = '#/d';    label.Ri = 'max reproduction rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(10.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% length-length
data.tL= [  ... % time since birth (yr), total length (cm)
 1.3  9.7
 1.5 13.0
 1.7 14.5
 2.3 14.4
 2.5 15.1
 2.7 17.4
 3.3 18.9
 3.5 20.2
 3.7 23.8];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'Central East Grounds'};  
temp.tL    = C2K(10.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'kand1941';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
%weights.Wwp = 0 * weights.Wwp;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from CEG, N coast'};
% set2 = {'tW','tW1'}; subtitle2 = {'Data from CEG, N coast'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00269*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NR7W'; % Cat of Life
metaData.links.id_ITIS = '171682'; % ITIS
metaData.links.id_EoL = '46573115'; % Ency of Life
metaData.links.id_Wiki = 'Hyperoplus_lanceolatus'; % Wikipedia
metaData.links.id_ADW = 'Hyperoplus_lanceolatus'; % ADW
metaData.links.id_Taxo = '177024'; % Taxonomicon
metaData.links.id_WoRMS = '126756'; % WoRMS
metaData.links.id_fishbase = 'Hyperoplus-lanceolatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyperoplus_lanceolatus}}';
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
bibkey = 'Kand1941'; type = 'Article'; bib = [ ... 
'author = {K\"{a}ndler, R.}, ' ... 
'year = {1941}, ' ...
'title = {Untersuchungen \"{u}ber Fortpflanzung, Wachstum und Variabilit\"{a}t der {A}rten des {S}andaals in {O}st- und {N}ordsee, mit besonderer {B}er\"{u}ucksichtigung von \emph{Ammodytes tobianus} {L}}, ' ...
'journal = {Kieler Meeresforsch}, ' ...
'volume = {5(1)}, ' ...
'pages = {45-139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hyperoplus-lanceolatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

