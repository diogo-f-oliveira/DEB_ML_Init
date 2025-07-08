function [data, auxData, metaData, txtData, weights] = mydata_Palaemonetes_varians

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Palaemonetes_varians'; 
metaData.species_en = 'Common ditch shrimp'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0iMm', '0iFm', 'jiMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'; 'T-aj'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 27]; 

%% set data
% zero-variate data

data.ab = 20;  units.ab = 'd';      label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on Palaemonetes pugio';
data.tp = 40;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Palaemonetes pugio';
data.am = 400;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Palaemonetes pugio';

data.Lp  = 1.9;   units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'guess based on Palaemonates pugio: 1.8 * 5.2/5';
data.Li  = 5.2;   units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'sealifebase';

data.Wwb = 2.74e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Olip2013';
data.Wwp = 0.058;   units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'guess based on (Lp/Li)^3*Wwi';
data.Wwi = 1.2;     units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on weight-length of Palaemonates pugio: (5.2/5)^3*1';

data.Ni  = 150;   units.Ni  = '#'; label.Ni  = 'life time reprod output';   bibkey.Ni  = 'sealifebase';   
  temp.Ni = C2K(20);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% t-W data
data.tW = [ ... % time (d), wet weight (g)
0.000	0.127
6.874	0.137
13.937	0.145
20.933	0.159
27.928	0.167
34.924	0.171
41.919	0.183];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(19.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PalmBure2008';

data.Ttj = [ ... % temperature (C), larval duration (d)
15	25.410
17	19.594
20	13.549
25	9.301
30	7.647];
units.Ttj   = {'C', 'd'};  label.Ttj = {'temperature', 'larval duration'};  
bibkey.Ttj = 'OlipHaut2013';
comment.Ttj = 'Data concern 4 instar developement; 5 star development takes 5 till 1 d longer';

  
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

%% Facts
F1 = 'Brackish water species';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'For increasing temperature, 4 instars are more common then 5 instars';
metaData.bibkey.F2 = 'OlipHaut2013'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '96397'; % ITIS
metaData.links.id_EoL = '344117'; % Ency of Life
metaData.links.id_Wiki = 'Palaemonetes_varians'; % Wikipedia
metaData.links.id_ADW = 'Palaemonetes_varians'; % ADW
metaData.links.id_Taxo = '33870'; % Taxonomicon
metaData.links.id_WoRMS = '587704'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Palaemonetes_varians}}';
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
bibkey = 'PalmBure2008'; type = 'Article'; bib = [ ...
'author = {J. Palma and D. P. Bureau and J. P. Andrade}, ' ...
'year = {2008}, ' ...
'title = {Effect of binder type and binder addition to artificial diets used for the growth of \emph{Palaemonetes varians} and \emph{Palaemon elegans} ({C}rustacea: {P}alaemonidae) produced as aquaculture live preys}, ' ...
'journal = {Aquaculture International}, ' ...
'volume = {16}, ' ...
'pages = {427-436}, ' ...
'howpublished = {\url{https://link.springer.com/content/pdf/10.1007%2Fs10499-007-9155-5.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OlipHaut2013'; type = 'Article'; bib = [ ...
'author = {A. Oliphant and C. Hauton and S. Thatje}, ' ...
'year = {2013}, ' ...
'title = {The Implications of Temperature-Mediated Plasticity in Larval Instar Number for Development within a Marine Invertebrate, the Shrimp \emph{Palaemonetes varians}}, ' ...
'journal = {PLOS ONE}, ' ...
'volume = {8}, ' ...
'pages = {e75785}, ' ...
'howpublished = {\url{https://link.springer.com/content/pdf/10.1007%%2Fs10499-007-9155-5.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Olip2013'; type = 'Phdthesis'; bib = [ ...
'author = {A. Oliphant}, ' ...
'year = {2013}, ' ...
'title = {Decapod crustacean larval developmental plasticity and the evolution of lecithotrophy and abbreviated development}, ' ...
'school = {University of Southhamtpon; Faculty of Natural and Environmental Sciences; Ocean and Earth Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.ca/summary/Palaemonetes-varians.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
