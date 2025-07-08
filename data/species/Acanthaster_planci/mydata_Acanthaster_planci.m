function [data, auxData, metaData, txtData, weights] = mydata_Acanthaster_planci

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Valvatida'; 
metaData.family     = 'Acanthasteridae';
metaData.species    = 'Acanthaster_planci'; 
metaData.species_en = 'Crown-of-thorns starfish'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MP', 'MI'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCia'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 01]; 


%% set data
% zero-variate data

data.aj = 38; units.aj = 'd'; label.aj = 'age at settlement';   bibkey.aj = 'HendLuca1971';
  temp.aj = C2K(29); units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.tp = 2*365; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(29); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;  units.am = 'd';     label.am = 'life span';               bibkey.am = 'ADW';   
  temp.am = C2K(29); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 19;   units.Lp  = 'cm';  label.Lp  = 'diameter at puberty';       bibkey.Lp  = 'Kenc1977';
data.Li  = 70;   units.Li  = 'cm';  label.Li  = 'ultimate diameter';         bibkey.Li  = 'ADW';

data.Wwb  = 1.7e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'CabaPrat2016';
  comment.Wwb = 'based on egg diameter of 0.15 mm: pi/6*0.015^3';

data.GSI  = 0.22; units.GSI  = '-'; label.GSI  = 'gonado somatic index';     bibkey.GSI  = 'Wiki';   
  temp.GSI = C2K(29);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% univariate data

% time-length
data.tL = [... % time since settlement, (yr), diameter (cm)
239.910	8.830
325.719	14.109
362.739	11.057
393.645	15.531
482.276	19.060
608.152	17.611
701.807	22.980
730.858	20.888
764.485	24.488
853.167	27.580
882.198	25.663
944.927	26.733
976.352	26.742
1005.108	27.189
1044.064	30.003
1067.429	31.761
1101.627	30.458
1125.124	31.078
1219.309	31.895
1315.991	33.764
1349.760	36.138
1373.492	34.744
1402.054	36.854
1436.119	36.690
1467.198	39.676
1491.175	36.182
1613.953	38.846
1679.148	41.230
1736.578	42.824
1768.095	42.045
1794.324	41.703
1833.442	43.116];
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'diameter'};  
temp.tL   = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kenc1977';

% length-fecundity
data.LN = [... % diameter (cm), fecundity (#)
20 1.5e6
30 1.5e7
40 5.0e7];
units.LN   = {'d', 'cm'};  label.LN = {'diameter', 'fecundity'};  
temp.LN   = C2K(29);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN= 'Wiki';

% length-weight
data.LW = [ ... % diameter (cm), wet weight (g)
 3.14  0.30
 4.37  0.60
 5.61  1.05
 9.79  4.00
12.10  6.14
14.80  8.51
19.00 15.20
20.50 18.61
21.60 22.61
24.14 26.09
22.14 24.76];
units.LW   = {'d', 'g'};  label.LW = {'diameter', 'wet weight'};  
bibkey.LW= 'Kenc1977';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 8 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'dioecious, which means that each individual is either male or female';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'consumes exclusively live sclerectinian corals, but if absent can feed on soft corals (Wiki)';
metaData.bibkey.F2 = 'EoL';
metaData.facts = struct('F1',F1,'F2',F2);  

%% Links
metaData.links.id_CoL = '8TF2'; % Cat of Life
metaData.links.id_ITIS = '157194'; % ITIS
metaData.links.id_EoL = '598484'; % Ency of Life
metaData.links.id_Wiki = 'Acanthaster_planci'; % Wikipedia
metaData.links.id_ADW = 'Acanthaster_planci'; % ADW
metaData.links.id_Taxo = '40898'; % Taxonomicon
metaData.links.id_WoRMS = '213289'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthaster_planci}}';
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
bibkey = 'Kenc1977'; type = 'Article'; bib = [ ... 
'author = {R. A. Kenchington}, ' ... 
'year = {1977}, ' ...
'title = {GROWTH AND RECRUITMENT OF \emph{Acanthaster planci} ({L}.) ON THE {G}REAT {B}ARRIER {R}EEF}, ' ...
'journal = {Biol. Conserv.}, ' ...
'volume = {11}, ' ...
'pages = {103--118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HendLuca1971'; type = 'Article'; bib = [ ... 
'author = {J. A. Henderson and J. S. Lucas}, ' ... 
'year = {1971}, ' ...
'title = {Larval development and metamorphosis of \emph{Acanthaster planci} ({A}steroidea)}, ' ...
'journal = {Nature}, ' ...
'volume = {232}, ' ...
'pages = {655--657}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CabaPrat2016'; type = 'Article'; bib = [ ... 
'author = {C. F. Caballes and M. S. Pratchett and A. M. Kerr and J. A. Rivera-Posada}, ' ... 
'year = {2016}, ' ...
'title = {The Role of Maternal Nutrition on Oocyte Size and Quality, with Respect to Early Larval Development in The Coral-Eating Starfish, \emph{Acanthaster planci}}, ' ...
'journal = {PLoS One}, ' ...
'volume = {11}, ' ...
'number = {6}, ' ...
'pages = {e0158007}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Acanthaster-planci.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/598484/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Acanthaster_planci/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
