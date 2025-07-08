function [data, auxData, metaData, txtData, weights] = mydata_Gobionellus_microdon

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Gobionellus_microdon'; 
metaData.species_en = 'Estuary goby'; 

metaData.ecoCode.climate = {'MA','Am'};
metaData.ecoCode.ecozone = {'MPE','TN'};
metaData.ecoCode.habitat = {'0iMm','0iFr'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 04];

%% set data
% zero-variate data

data.ab = 5;  units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 32;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Warb1979';

data.Wwb = 1.6e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.5 mm and width of 0.45 mm of Gobius niger: pi/6*0.15*0.045^2';
data.Wwp = 4.4;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','GibsEzzi1978'};
  comment.Wwp = 'based on 0.00794*Lp^3.04, see F1';
data.Wwi = 55.6;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00794*Li^3.04, see F1';

data.Ri = 73e3/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.92';
  
% uni-variate data
% time-length
data.tL = [... %  time since birth (d), std length (cm)
157.085	16.265
228.503	19.392
275.645	19.572
297.669	21.446
356.924	22.636
396.463	24.095];
data.tL(:,1) = 100 + data.tL(:,1); % set origin at birth 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Warb1979'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Weight-length: Ww in g = 0.00794*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GPFK'; % Cat of Life
metaData.links.id_ITIS = '637420'; % ITIS
metaData.links.id_EoL = '46576433'; % Ency of Life
metaData.links.id_Wiki = 'Gobionellus'; % Wikipedia
metaData.links.id_ADW = 'Gobionellus_microdon'; % ADW
metaData.links.id_Taxo = '175302'; % Taxonomicon
metaData.links.id_WoRMS = '276498'; % WoRMS
metaData.links.id_fishbase = 'Gobionellus-microdon'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobionellus}}';
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
bibkey = 'Warb1979'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1979.tb03542.x}, ' ...
'author = {Warburton, K.}, ' ... 
'year = {1979}, ' ...
'title = {Growth and production of some important species of fish in a {M}exican coastal lagoon system}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {14(5)}, ' ...
'pages = {449–464}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Gobionellus-microdon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

