function [data, auxData, metaData, txtData, weights] = mydata_Plodia_interpunctella

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Lepidoptera'; 
metaData.family     = 'Pyralidae';
metaData.species    = 'Plodia_interpunctella'; 
metaData.species_en = 'Indian meal moth'; 

metaData.ecoCode.climate = {'A', 'B'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Wwb'; 'Wwj'; 'Wwe'; 'Ni'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Ana Lopez Llandres'; 'Bas Kooijman'};    
metaData.date_subm = [2014 09 17];              
metaData.email    = {'anallandres@gmail.com'};            
metaData.address  = {'University of Tours'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 18]; 

%% set data
% zero-variate data
data.ab = 2.8;  units.ab = 'd';         label.ab = 'age at birth';                bibkey.ab = 'SilhMill1972';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 12.2;    units.tj = 'd';      label.tj = 'time since birth at metam';   bibkey.tj = 'SilhMill1972';   
  temp.tj = C2K(30);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.te = 7;    units.te = 'd';         label.te = 'time since birth at emergence'; bibkey.te = 'SilhMill1972';
  temp.te = C2K(30);  units.temp.te = 'K'; label.temp.te = 'temperature';
data.am = 8;    units.am = 'd';         label.am = 'life span as imago';          bibkey.am = 'SilhMill1972';   
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.028e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'SilhMill1972';
data.Wwj = 13.67e-3; units.Wwj = 'g';   label.Wwj = 'wet weight at pupation';     bibkey.Wwj = 'SilhMill1972';
data.Wwe = 11.39e-3; units.Wwe = 'g';   label.Wwe = 'wet weight at emergence';    bibkey.Wwe = 'SilhMill1972';

data.del_S  = 0.091; units.del_S  = 'g/g'; label.del_S  = 'g (pupa_case+silk)/g pupa'; bibkey.del_S  = 'ImurSinh1986';   
  comment.del_S = 'computed as =  (14.71e-2+10.40e-2)/275.76e-2= 0.091, assuming that pupa_case is the cocoon (empty pupal exoesqueleton)';
data.Ni  = 190;      units.Ni  = '#'; label.Ni  = 'cum # of eggs';                bibkey.Ni  = 'AlloGosw1990';   
 
% uni-variate data

% time-wet weight of larva
data.tW_bj =  [ ... % time age (d), larval wet weight (mg)
2.8125	        0.0282608696
6.041666667	    0.304347826
7.013888889  	0.347826087
8.020833333 	1.630434783
8.923611111 	3.282608696
9.965277778	    4.652173913
10.90277778	    9.260869565
11.875	        12.36956522
12.88194444	    14.82608696
13.81944444	    13.67391304];
data.tW_bj(:,1) = data.tW_bj(:,1) - 2.8; % d, convert age to time since birth
data.tW_bj(:,2) = data.tW_bj(:,2)/ 1e3; % convert mg to g
units.tW_bj  = {'d', 'g'};  label.tW_bj = {'time since birth', 'larva wet weight'};  
temp.tW_bj   = C2K(30);  units.temp.tW_bj = 'K'; label.temp.tW_bj = 'temperature';
bibkey.tW_bj = 'SilhMill1972';

% time-wet weight of pupa 
data.tW_je =  [... % age (d), pupal wet weight (mg)
13.82944444	11.52173913
14.79166667	10.52173913
16.73611111	9.934782609
18.57638889	10.56521739];
data.tW_je(:,1) = data.tW_je(:,1) - 13.2; % d, convert age to time since pupation
data.tW_je(:,2) = data.tW_je(:,2)/ 1e3; % convert mg to g
units.tW_je  = {'d', 'g'}; label.tW_je = {'time since birth', 'pupa wet weight'};  
temp.tW_je   = C2K(30); units.temp.tW_je = 'K'; label.temp.tW_je = 'temperature';
bibkey.tW_je = 'SilhMill1972';

% time-wet weight of imago
data.tW_em =  [... % age (d), wet weight(mg), 
20	         11.39130435
21.73611111	 10.93478261
23.40277778	 9.391304348];
data.tW_em(:,1) = data.tW_em(:,1) - 18.6; % d, convert age to time since emergence
data.tW_em(:,2) = data.tW_em(:,2)/ 1e3; % convert mg to g
units.tW_em  = {'d', 'g'};  label.tW_em = {'time since birth', 'larva wet weight'};  
temp.tW_em   = C2K(30); units.temp.tW_em = 'K'; label.temp.tW_em = 'temperature';
bibkey.tW_em = 'SilhMill1972';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Silk production is assumed to increase [p_M] by a factor s_S after [E_R] > s_s * max [E_R]';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Imagos do not feed';
metaData.bibkey.F1 = 'VukaSnez2012'; 
F2 = 'The larva starts producing silk after day 21 when they start spinning a loose cocoon for pupation';
metaData.bibkey.F2 = 'ImurSinh1986'; 
F3 = 'Imagos do not feed';
metaData.bibkey.F3 = 'VukaSnez2012'; 
F4 = 'Larvae not produce silk only to build the cocoon, buy also spin silken threads wherever they go (as a result they spoil more than they consume in stored grain products)';
metaData.bibkey.F4 = 'VukaSnez2012'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '4KHKB'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '952934'; % Ency of Life
metaData.links.id_Wiki = 'Plodia_interpunctella'; % Wikipedia
metaData.links.id_ADW = 'Plodia_interpunctella'; % ADW
metaData.links.id_Taxo = '29835'; % Taxonomicon
metaData.links.id_WoRMS = '1488685'; % WoRMS
metaData.links.id_lepidoptera = '12561'; % lepidoptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plodia_interpunctella}}';
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
bibkey = 'AlloGosw1990'; type = 'Article'; bib = [ ... 
'author = {Allotey, J. and Goswami, L.}, ' ... 
'year = {1990}, ' ...
'title = {Comparative biology of two phycitid moths, \emph{Plodia interpunctella} ({H}ubn.) and \emph{Ephestia cautella} ({W}lk.) on some selected food media}, ' ...
'journal = {Journal Insect Science and its Application}, ' ...
'volume = {11}, ' ...
'pages = {209--215}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VukaSnez2012'; type = 'Article'; bib = [ ... 
'author = {Vukajlovi, F. N. and Sne\v{z}ana, B. P.}, ' ... 
'year = {2012}, ' ...
'title = {CONTRIBUTION TO THE STUDIES OF THE {I}NDIAN MEAL MOTH \emph{Plodia interpunctella} {H}ubn. ({L}EPIDOPTERA: {P}YRALIDAE) FECUNDITY DEPENDING ON DIET TYPE}, ' ...
'journal = {Kragujevac J. Sci.}, ' ...
'volume = {34}, ' ...
'pages = {107--115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ImurSinh1986'; type = 'Article'; bib = [ ... 
'author = {Imura, O. and Sinha, R. N.}, ' ... 
'year = {1986}, ' ...
'title = {Bioenergetics of the {I}ndian meal moth, \emph{Plodia interpunctella} ({L}epidoptera, {P}yralidae )}, ' ...
'journal = {Ann. Entomol. Soc. Am.}, ' ...
'volume = {79}, ' ...
'pages = {96--103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilhMill1972'; type = 'Article'; bib = [ ... 
'author = {Silhacek, D. L. and Miller, G. L.}, ' ... 
'year = {1972}, ' ...
'title = {Growth and Development of the {I}ndian Meal Moth, \emph{Plodia interpunctella} ({L}epidoptera: {P}hycitidae) under laboratory mass-rearing conditions}, ' ...
'journal = {Annals of the Entomological Society of America}, ' ...
'volume = {65}, ' ...
'pages = {1084--1087}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
