function [data, auxData, metaData, txtData, weights] = mydata_Talpa_occidentalis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Talpidae';
metaData.species    = 'Talpa_occidentalis'; 
metaData.species_en = 'Spanish mole'; 
metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfb', 'Csb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wwe'; 't-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 26]; 

%% set data
% zero-variate data

data.tg = 28;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'BarrZuri2004';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 31;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BarrZuri2004';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 182;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BarrZuri2004';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'BarrZuri2004';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data is unsure';

data.Wwb = 4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'BarrZuri2004';
data.Wwi = 70.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'BarrZuri2004';

data.Ri  = 1.1*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'BarrZuri2004';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data for embryo
data.tWe = [ ... % time since birth (d), wet weight (g)
14 0.05
16 0.08
19 0.45
21 0.60
23 1.00
27 3.00];
units.tWe   = {'d', 'g'};  label.tWe = {'time since birth', 'wet weight'};  
temp.tWe    = C2K(38.3);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'BarrZuri2004';
%
% t-W data post natal
data.tW = [ ... % time since birth (d), wet weight (g)
10   17.5
14   22
20   30.5
25.5 37
31   47
200  70];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BarrZuri2004';

  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Moles are unique among mammals because all females of the 4 investigated species (Talpa occidentalis, T. europaea, T. romana, and T. stankovici) have ovotestes instead of simply ovaries';
metaData.bibkey.F1 = 'BarrZuri2004'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54M2Y'; % Cat of Life
metaData.links.id_ITIS = '633854'; % ITIS
metaData.links.id_EoL = '1178990'; % Ency of Life
metaData.links.id_Wiki = 'Talpa_occidentalis'; % Wikipedia
metaData.links.id_ADW = 'Talpa_occidentalis'; % ADW
metaData.links.id_Taxo = '61356'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700740'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Talpa_europaea}}';
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
bibkey = 'BarrZuri2004'; type = 'Article'; bib = [ ... 
'author = {F. J. Barrionuevo and F. Zurita and M. Burgos and R. Jim\''{e}nez}, ' ... 
'year = {2004}, ' ...
'title = {Developmental Stages and Growth Rate of the Mole \emph{Talpa occidentalis} ({I}nsectivora, {M}ammalia)}, ' ...
'doi = {\url{https://doi.org/10.1644/BPR-010}}, ' ...
'journal = {J. Mammal.}, ' ...
'volume = {85}, ' ...
'number = {1}, ' ...
'pages = {120--125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Talpa_europaea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

