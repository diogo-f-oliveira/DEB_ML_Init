function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_sinensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_sinensis'; 
metaData.species_en = 'Chinese sturgeon'; 

metaData.ecoCode.climate = {'MC','Dfb'};
metaData.ecoCode.ecozone = {'MPNW','THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.5); % K, body temp 
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 04];

%% set data
% zero-variate data;
data.am = 33*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'fishbase';   
  temp.am = C2K(23.5);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 160;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 346;      units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.56e-2;    units.Wwb = 'g';   label.Wwb = 'wet weight birth';   bibkey.Wwb = 'SunZhua2019';
  comment.Wwb = 'based on egg diameter of 2.7–3.4 mm: pi/6*0.31^3';
data.Wwp = 31.5e3;    units.Wwp = 'g';   label.Wwp = 'uwet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00324*Lp^3.17, see F1';
data.Wwi = 362.6e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00324*Li^3.17, see F1';
 
data.Ri  = 1.3e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time since birth, (d), total length (cm), weight (g)
 0	11.243   7.308
30	16.388  27.442
60	23.438  89.130
90	27.739 157.612];
units.tLW = {'d', 'cm', 'g'};     label.tLW = {'time since birth', 'total length', 'weight'};  
  temp.tLW = C2K(23.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'SunZhua2019'; treat.tLW = {1 {'length','weight'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
 
%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00324*(TL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9C7K'; % Cat of Life
metaData.links.id_ITIS = '550555'; % ITIS
metaData.links.id_EoL = '46561181'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_sinensis'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_sinensis'; % ADW
metaData.links.id_Taxo = '42443'; % Taxonomicon
metaData.links.id_WoRMS = '271699'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-sinensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_sinensis}}';  
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
bibkey = 'SunZhua2019'; type = 'Article'; bib = [ ...  
'doi = {10.1111/jai.13835}, ' ...
'author = {Liting Sun and Ping Zhuang}, ' ...
'year = {2019}, ' ...
'title = {Growth and feeding ecology of juvenile {C}hinese sturgeon, \emph{Acipenser sinensis}, in the {Y}angtze {E}stuary}, ' ... 
'journal = { J Appl Ichthyol.}, ' ...
'volume = {35}, ' ...
'pages = {47–53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acipenser-sinensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

