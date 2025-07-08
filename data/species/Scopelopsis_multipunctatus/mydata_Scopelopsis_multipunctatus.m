function [data, auxData, metaData, txtData, weights] = mydata_Scopelopsis_multipunctatus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Scopelopsis_multipunctatus'; 
metaData.species_en = 'Multispotted lanternfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 02];

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(8.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.2;   units.Lp = 'cm';   label.Lp = 'standard length fat puberty';    bibkey.Lp = 'fishbase';
data.Li = 9.1;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.3 mm of Lampanyctus_ritteri: pi/6*0.03^3';
data.Wwp = 1.93; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwi = 'based on 0.00513*Lp^3.25, see F1';
data.Wwi = 6.71; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.00513*Li^3.25, see F1';

data.Ri = 78e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(8.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (yr),weight (mg)
  0.000	  73.099
 26.652	 102.456
 68.626  109.815
 92.966	 146.551
158.909	 395.889
183.992	 662.460
228.381	1018.577
251.088	1110.868
279.297	 789.925
293.913	1242.771
338.434	1524.000
357.337	2794.244];
data.tW(:,2) = data.tW(:,2) * 1e-3; % convert mg to g
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(8.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Lega1967';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
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
F1 = 'Length-Weight relationship: W in g = 0.00513*(SL in cm)^3.25';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VV7G'; % Cat of Life
metaData.links.id_ITIS = '623727'; % ITIS
metaData.links.id_EoL = '46564279'; % Ency of Life
metaData.links.id_Wiki = 'Scopelopsis_multipunctatus'; % Wikipedia
metaData.links.id_ADW = 'Scopelopsis_multipunctatus'; % ADW
metaData.links.id_Taxo = '187107'; % Taxonomicon
metaData.links.id_WoRMS = '217717'; % WoRMS
metaData.links.id_fishbase = 'Scopelopsis-multipunctatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scopelopsis_multipunctatus}}';
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
bibkey = 'Lega1967'; type = 'article'; bib = [ ...
'author = {Legand, M.}, ' ... 
'year   = {1967}, ' ...
'title  = {Cycles biologiques des poissons m\''{e}sopé\''{e}lagiques dans l''Est de l''{O}c\''{e}an {I}ndien}, ' ...
'journal = {Premi\`{e}re Note. Cah. ORSTOM, s\''{e}r. Oc\''{e}anogr.}, ' ...
'page = {69-78}, ' ...
'volume = {5(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Scopelopsis-multipunctatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

