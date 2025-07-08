function [data, auxData, metaData, txtData, weights] = mydata_Aequipecten_opercularis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pectinida'; 
metaData.family     = 'Pectinidae';
metaData.species    = 'Aequipecten_opercularis'; 
metaData.species_en = 'Queen scallop'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN','MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 21]; 

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on 2 d for Pecten maximus at 18 C';
data.tj = 20;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'marlin';
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '11-30 d';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '8-10 yr';

data.Li  = 9;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'ADW';
  comment.Li = 'marlin gives 11 cm';

data.Wwb = 1.64e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'marlin';
  comment.Wwb = 'Based on 68 mum egg diameter: pi/6*0.0068^3';
data.Wwi = 107; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'sealifebase';
  comment.Wwb = 'Based on 0.1510*Li^2.986, see F3';

data.Ri = 6e6/365;    units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'marlin';
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity 3e6 - 6e6 eggs per yr';
   
% uni-variate data
% time-length
data.tL = [ ... % time since 1978/01/01 (d), shell height (cm)
4.460	2.452
35.091	2.608
61.729	2.752
95.031	2.961
167.012	3.670
187.045	4.064
232.364	4.497
267.019	4.825
298.971	4.929
325.616	5.112
345.591	5.204
374.871	5.255
417.457	5.306
461.375	5.369
494.640	5.381
521.272	5.498
565.208	5.654
602.492	5.811
629.129	5.954
657.080	6.006
697.007	6.070
715.639	6.095
739.595	6.134
771.544	6.224
795.520	6.368
830.106	6.327
879.341	6.364
964.530	6.558
1162.782	6.601
1219.991	6.585];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'shell height'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RichTayl1982';
comment.tL = 'temperature changes as described in D1';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature (C) of tL data changes as: T(t) = 10+9*sin(2*pi*(t+250)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Simultaneous (ADW) or potandric (sealifebase) hermaphrodite';
metaData.bibkey.F1 = {'ADW','sealifebase'};
F2 = 'Sports jet propulsion swimming';
metaData.bibkey.F2 = 'ADW';
F3 = 'Length-weight: wet weight (in g) = 0.1510*(shell height in cm)^2.986)';
metaData.bibkey.F3 = 'sealifebase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '64YTF'; % Cat of Life
metaData.links.id_ITIS = '79716'; % ITIS
metaData.links.id_EoL = '46468034'; % Ency of Life
metaData.links.id_Wiki = 'Aequipecten_opercularis'; % Wikipedia
metaData.links.id_ADW = 'Aequipecten_opercularis'; % ADW
metaData.links.id_Taxo = '237095'; % Taxonomicon
metaData.links.id_WoRMS = '140687'; % WoRMS
metaData.links.id_molluscabase = '140687'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aequipecten_opercularis}}';
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
bibkey = 'RichTayl1982'; type = 'Article'; bib = [ ... 
'author = {C. A. Richardson and A. C. Taylor and T. J. Venn}, ' ... 
'year = {1982}, ' ...
'title = {GROWTH OF THE QUEEN SCALLOP \emph{Chlamis opercularis} IN SUSPENDED CAGES IN THE {F}IRTH OF {C}LYDE}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {62}, ' ...
'pages = {157-169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Aequipecten-opercularis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Chlamys_opercularis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6178}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


