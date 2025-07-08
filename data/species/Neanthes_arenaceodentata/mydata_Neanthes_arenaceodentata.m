function [data, auxData, metaData, txtData, weights] = mydata_Neanthes_arenaceodentata

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Polychaeta'; 
metaData.order      = 'Phyllodocida'; 
metaData.family     = 'Nereidae';
metaData.species    = 'Neanthes_arenaceodentata'; 
metaData.species_en = 'Worm'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiCi'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni_f'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 16]; 

%% set data
% zero-variate data

data.ab = 1.5;    units.ab = 'd';    label.ab = 'age at emergence';            bibkey.ab = 'guess';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tp = 25+27;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MoorDill1993';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 160;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MoorDill1993';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Wwb = 8.2e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on guessed egg diameter of 250 mum: pi/6*0.025^3';
data.Wwp = 18e-3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';bibkey.Wwp = 'MoorDill1993';
  comment.Wwp = 'based on tW data to tp';
data.Wwi = 60e-3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'MoorDill1993';
  comment.Wwi = 'based on tW data';

% uni-variate data

% growth/reproduction at 5 ration levels
all = [ ...
  1       .5     .25    .12   .06 % -, food ration
 13.37   6.64   2.93   1.65  1.20 % mg, wet weight at 21 d since emergence
 28.96  18.90  14.46  12.29  2.28 % mg, wet weight at 42 d since emergence
 48.18  28.04  23.18  17.59  5.59 % mg, wet weight at 63 d since emergence
234    138    101     62     2 ]; % #, mean total number of eggs per female
%
data.tW100 = [23 + [21 42 63]; all([2 3 4],1)'/ 1e3]'; % d, g wet weight at ration 1
units.tW100   = {'d', 'g'};  label.tW100 = {'time since emergence', 'wet weight', 'ration 1'};  
temp.tW100    = C2K(20);  units.temp.tW100 = 'K'; label.temp.tW100 = 'temperature';
bibkey.tW100 = 'MoorDill1993';
comment.tW100 = 'data for ration 1';
%
data.tW50 = [23 + [21 42 63]; all([2 3 4],2)'/ 1e3]'; % d, g wet weight at ration 0.5
units.tW50   = {'d', 'g'};  label.tW50 = {'time since emergence', 'wet weight', 'ration 0.5'};  
temp.tW50    = C2K(20);  units.temp.tW50 = 'K'; label.temp.tW50 = 'temperature';
bibkey.tW50 = 'MoorDill1993';
comment.tW50 = 'data for ration 0.5';
%
data.tW25 = [23 + [21 42 63]; all([2 3 4],3)'/ 1e3]'; % d, g wet weight at ration 0.25
units.tW25   = {'d', 'g'};  label.tW25 = {'time since emergence', 'wet weight', 'ration 0.25'};  
temp.tW25    = C2K(20);  units.temp.tW25 = 'K'; label.temp.tW25 = 'temperature';
bibkey.tW25 = 'MoorDill1993';
comment.tW25 = 'data for ration 0.25';
%
data.tW12 = [23 + [21 42 63]; all([2 3 4],4)'/ 1e3]'; % d, g wet weight at ration 0.12
units.tW12   = {'d', 'g'};  label.tW12 = {'time since emergence', 'wet weight', 'ration 0.12'};  
temp.tW12    = C2K(20);  units.temp.tW12 = 'K'; label.temp.tW12 = 'temperature';
bibkey.tW12 = 'MoorDill1993';
comment.tW12 = 'data for ration 0.12';
%
data.tW6 = [23 + [21 42 63]; all([2 3 4],5)'/ 1e3]'; % d, g wet weight at ration 0.06
units.tW6   = {'d', 'g'};  label.tW6 = {'time since emergence', 'wet weight', 'ration 0.06'};  
temp.tW6    = C2K(20);  units.temp.tW6 = 'K'; label.temp.tW6 = 'temperature';
bibkey.tW6 = 'MoorDill1993';
comment.tW6 = 'data for ration 0.06';
%
data.N100 = all(5,1); % -, # cumulated fecundity at ration 1
units.N100   = '#';  label.N100 = 'fecundity';  
temp.N100    = C2K(20);  units.temp.N100 = 'K'; label.temp.N100 = 'temperature';
bibkey.N100 = 'MoorDill1993';
%
data.N50 = all(5,2); % -, # cumulated fecundity at ration 0.50
units.N50   = '#';  label.N50 = 'fecundity';  
temp.N50    = C2K(20);  units.temp.N50 = 'K'; label.temp.N50 = 'temperature';
bibkey.N50 = 'MoorDill1993';
%
data.N25 = all(5,3); % -, # cumulated fecundity at ration 0.25
units.N25   = '#';  label.N25 = 'fecundity';  
temp.N25    = C2K(20);  units.temp.N25 = 'K'; label.temp.N25 = 'temperature';
bibkey.N25 = 'MoorDill1993';
%
data.N12 = all(5,4); % -, # cumulated fecundity at ration 0.12
units.N12   = '#';  label.N12 = 'fecundity';  
temp.N12    = C2K(20);  units.temp.N12 = 'K'; label.temp.N12 = 'temperature';
bibkey.N12 = 'MoorDill1993';
%
data.N6 = all(5,5); % -, # cumulated fecundity at ration 0.06
units.N6   = '#';  label.N6 = 'fecundity';  
temp.N6    = C2K(20);  units.temp.N6 = 'K'; label.temp.N6 = 'temperature';
bibkey.N6 = 'MoorDill1993';

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

%% Group plots
set1 = {'tW100','tW50','tW25','tW12','tW6'}; subtitle1 = {'Data at ration 1, 0.5, 0.25, 0.12, 0.06'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'The female deposits her eggs and dies shortly thereafter, while the male remains in the tube to "incubate" the eggs';
metaData.bibkey.F1 = 'MoorDill1993'; 
F2 = 'Larval development is direct via a non-planktonic metatrochophore larvae and occurs entirely within the parental tube; juveniles exit the tube 3 to 4 wk after egg deposition';
metaData.bibkey.F2 = 'MoorDill1993'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '45Y3J'; % Cat of Life
metaData.links.id_ITIS = '65895'; % ITIS
metaData.links.id_EoL = '458741'; % Ency of Life
metaData.links.id_Wiki = 'Neanthes_arenaceodentata'; % Wikipedia
metaData.links.id_ADW = 'Neanthes_arenaceodentata'; % ADW
metaData.links.id_Taxo = '480714'; % Taxonomicon
metaData.links.id_WoRMS = '334084'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nereididae}}';
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
bibkey = 'MoorDill1993'; type = 'Article'; bib = [ ... 
'author = {D. W. Moore and T. M. Dillon}, ' ... 
'year = {1993}, ' ...
'title = {The relationship between growth and reproduction in the marine polychaete \emph{Nereis} (\emph{Neanthes}) \emph{arenaceodentata} ({M}oore): implications for chronic sublethal sediment bioassays}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {173}, ' ...
'pages = {231--246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
