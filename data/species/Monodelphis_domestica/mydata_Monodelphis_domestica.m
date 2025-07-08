function [data, auxData, metaData, txtData, weights] = mydata_Monodelphis_domestica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Didelphimorphia'; 
metaData.family     = 'Didelphidae';
metaData.species    = 'Monodelphis_domestica'; 
metaData.species_en = 'Gray short-tailed opossum'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 15;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(32.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 53;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(32.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 122;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(32.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.1*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(32.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.1;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 20.3;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 100;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 58 to 95 g (unsexed, but males are larger)';
data.Wwim = 150;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = {'Wiki','BergCerq1994'};
  comment.Wwim = 'Wiki: in captivity up to 180 g';

data.Ri  = 9*4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(32.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9 pups per litter, 4 litters per yr';
 
% univartia data
% time-weight
data.tW_f = [ ... % age class (based on dental structure), wet weight (g)
3	38.419
4	49.155
5	53.966
6	72.704
7	89.958];
data.tW_f(:,1) = data.tW_f(:,1) * 4 * 30.5; % convert age class to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(32.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'BergCerq1994';
comment.tW_f = 'Data for females; age class-time conversion is roughly based on TyndMack1976, but subject to error';
% 
data.tW_m = [ ... % age class (based on dental structure), wet weight (g)
3	40.464
4	56.533
5	74.085
6	91.341
7	110.374];
data.tW_m(:,1) = data.tW_m(:,1) * 4 * 30.5; % convert age class to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(32.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'BergCerq1994';
comment.tW_m = 'Data for males; age class-time conversion is roughly based on TyndMack1976, but subject to error';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.Wwi = 3 * weights.Wwi;
weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_1: scaled func response f_bx for period bx, but f for periods 0b and xi';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = '"They are one of the worlds most variably sized mammals"';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '446N3'; % Cat of Life
metaData.links.id_ITIS = '552572'; % ITIS
metaData.links.id_EoL = '1039322'; % Ency of Life
metaData.links.id_Wiki = 'Monodelphis_domestica'; % Wikipedia
metaData.links.id_ADW = 'Monodelphis_domestica'; % ADW
metaData.links.id_Taxo = '168801'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10400138'; % MSW3
metaData.links.id_AnAge = 'Monodelphis_domestica'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Monodelphis_domestica}}';
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
bibkey = 'BergCerq1994'; type = 'Article'; bib = [ ... 
'author = {H. G. Bergallo and R. Cerqueira}, ' ... 
'year = {1994}, ' ...
'title = {Reproduction and growth of the opossum \emph{Monodelphis domestica} ({M}ammalia: \emph{Didelphidae}) in northeastern {B}razil}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {232}, ' ...
'pages = {551 - 563}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TyndMack1976'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1379686}, ' ...
'author = {Tyndale-Biscoe, C. H. and Mackenzie, R. B.}, ' ... 
'year = {1976}, ' ...
'title = {Reproduction in \emph{Didelphis marsupialis} and \emph{D. albiventris} in {C}olombia}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {57}, ' ...
'pages = {249-265}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Monodelphis_domestica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

