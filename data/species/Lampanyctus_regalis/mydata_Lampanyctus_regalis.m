function [data, auxData, metaData, txtData, weights] = mydata_Lampanyctus_regalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Lampanyctus_regalis'; 
metaData.species_en = 'Pinpoint lampfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.4); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 01];

%% set data
% zero-variate data
data.am = 6*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ChilTayl1980';  
  temp.am = C2K(2.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14;   units.Lp = 'cm';   label.Lp = 'standard length fat puberty';    bibkey.Lp = 'ChilTayl1980';
data.Li = 21;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ChilTayl1980';
  comment.Wwb = 'based on egg diameter of 0.3 mm: pi/6*0.03^3';
data.Wwp = 26; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';  
  comment.Wwi = 'based on 0.00575*Lp^3.19, see F1';
data.Wwi = 95; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.00575*Li^3.19, see F1';

data.Ri = 4.5e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(2.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.9';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr),standard length
0.416	3.126
0.984	6.072
1.515	6.977
2.046	9.142
2.501	10.268
3.050	13.880
3.524	15.117
4.036	16.467
4.530	17.741];
data.tL(:,1) = (data.tL(:,1) + 0.3)* 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(2.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChilTayl1980';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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
F1 = 'Length-Weight relationship: W in g = 0.00575*(SL in cm)^3.19';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '73SKN'; % Cat of Life
metaData.links.id_ITIS = '162634'; % ITIS
metaData.links.id_EoL = '46564273'; % Ency of Life
metaData.links.id_Wiki = 'Lampanyctus_regalis'; % Wikipedia
metaData.links.id_ADW = 'Lampanyctus_regalis'; % ADW
metaData.links.id_Taxo = '178148'; % Taxonomicon
metaData.links.id_WoRMS = '301545'; % WoRMS
metaData.links.id_fishbase = 'Lampanyctus-regalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampanyctus_regalis}}';
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
bibkey = 'ChilTayl1980'; type = 'article'; bib = [ ...
'doi = {10.1007/bf00410339}, ' ...
'author = {J. J. Childress and S. M. Taylor and G. M. Cailliet and M. H. Price}, ' ... 
'year   = {1980}, ' ...
'title  = {Patterns of growth, energy utilization and reproduction in some meso- and bathypelagic fishes off {S}outhern {C}alifornia}, ' ...
'journal = {Marine Biolog}, ' ...
'page = {27–40}, ' ...
'volume = {61(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lampanyctus-regalis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

