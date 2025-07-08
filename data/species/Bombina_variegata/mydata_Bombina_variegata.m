function [data, auxData, metaData, txtData, weights] = mydata_Bombina_variegata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bombinatoridae';
metaData.species    = 'Bombina_variegata'; 
metaData.species_en = 'Yellow-bellied toad'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTs', 'jiTf', 'jiFp'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 02];

%% set data
% zero-variate data

data.ab = 7;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 70;   units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'guess';   
  temp.tj = C2K(24.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 1.5*365; units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'BulbKutr2018';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 29*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 1.5;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'BulbKutr2018'; 
data.Lp  = 3.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on tj and tL data';
data.Li  = 5.6;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Wiki';

data.Wwb = 1.7e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.49 mm of Bombina bombina: pi/6*0.149^3';
data.Wwi = 12; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';


data.Ri  = 200/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri  = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'till 200 eggs per clutch, assumed: 1 clutch per season';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
0	1.50299 1.49700
1	2.67594 2.66395
2	3.43563 3.34581
3	3.51273 3.72232
3	4.11752 3.92591
3	3.37500 4.05166
3	4.01571 3.84207
3   NaN     3.65044
4	4.25451 4.45809
4	5.00301 4.55390
4	3.99702 3.94910
4	4.30839 4.18264
4	4.35031 NaN
4	4.38624 NaN
4	3.78144 NaN
4	4.06886 NaN
4	4.11677 NaN
5	5.00825 4.32560
5	4.78668 4.39746
5	4.57709 4.21182
5   NaN     4.51721
6	4.69009 4.33081
6	4.90566 4.54638
6	4.97152 4.25894
6	5.07332 NaN
7   NaN     4.64746
8	5.09582 NaN
8	3.51483 NaN]; 
data.tL_fm(:,1) = data.tL_fm(:,1) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(24.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'BulbKutr2018'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'tadpoles are assumed to differ from frogs by del_M only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5WNNK'; % Cat of Life
metaData.links.id_ITIS = '661632'; % ITIS
metaData.links.id_EoL = '332923'; % Ency of Life
metaData.links.id_Wiki = 'Bombina_variegata'; % Wikipedia
metaData.links.id_ADW = 'Bombina_variegata'; % ADW
metaData.links.id_Taxo = '47535'; % Taxonomicon
metaData.links.id_WoRMS = '1515900'; % WoRMS
metaData.links.id_amphweb = 'Bombina+variegata'; % AmphibiaWeb
metaData.links.id_AnAge= 'Bombina_variegata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bombina_variegata}}';
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
bibkey = 'BulbKutr2018'; type = 'Article'; bib = [ ... 
'author = {Ufuk B\"{u}lb\"{u}l and Bilal KutruP and Ali Ihsan Ero\u{g}lu and Halime Ko\c{c} and Muammer Kurnaz and Yasemin Odaba\c{s}}, ' ... 
'year = {2018}, ' ...
'title = {Life history traits of a Turkish population of the Yellow-bellied Toad, \emph{Bombina variegata} ({L}innaeus , 1758) ({A}nura: {B}ombinatoridae)}, ' ...
'journal = {Herpetozoa}, ' ...
'volume = {31}, ' ...
'pages = {11-19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Bombina+variegata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Bombina_variegata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
