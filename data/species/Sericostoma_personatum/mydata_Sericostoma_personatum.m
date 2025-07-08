function [data, auxData, metaData, txtData, weights] = mydata_Sericostoma_personatum

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Trichoptera'; 
metaData.family     = 'Sericostomatidae';
metaData.species    = 'Sericostoma_personatum'; 
metaData.species_en = 'Bushtailed caddisfly'; 

metaData.ecoCode.climate = {'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjH'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'ab'; 'aj_T'; 'tj'; 'am'; 'Lb'; 'Lj'; 'Ni'}; 
metaData.data_1     = {'t-ab'; 't-aj'; 't-L_fT'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Kim Rakel', 'Andre Gergs'};    
metaData.date_subm = [2018 10 19];              
metaData.email    = {'rake@gaiac-eco.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 10 20]; 

%% set data
% zero-variate data

data.ab = 36;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wagn1990';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'duration of hatching at 12 degrees is 36-39 days';
data.tj = 319;  units.tj = 'd';    label.tj = 'time since birth at pupation'; bibkey.tj = 'Wagn1990';   
  temp.tj = C2K(14);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'larval development lasts 319 days at 14 C and 16/8 day/night rythm';
data.tTj_10 = 370;  units.tTj_10 = 'd';    label.tTj_10 = 'time since birth at pupation'; bibkey.tTj_10 = 'Wagn1990';   
  temp.tTj_10 = C2K(10);  units.temp.tTj_10 = 'K'; label.temp.tTj_10 = 'temperature';
  comment.tTj_10 = 'larval development lasts 370 days at 10 C and 16/8 day/night rythm';
data.tTj_6 = 452;  units.tTj_6 = 'd';    label.tTj_6 = 'time since birth at pupation'; bibkey.tTj_6 = 'Wagn1990';   
  temp.tTj_6 = C2K(6);  units.temp.tTj_6 = 'K'; label.temp.tTj_6 = 'temperature';
  comment.tTj_6 = 'larval development lasts 452 days at 6 C and 16/8 day/night rythm';
data.te = 40;     units.te = 'd';     label.te = 'time since pupation at emergence'; bibkey.te = 'Wagn1990';
  temp.te = C2K(14);  units.temp.te = 'K'; label.temp.te = 'temperature';    
   comment.te = 'pupa stage lasts 40+-5 days at 14 C and 16/8 day/night rythm';
data.am = 21;    units.am = 'd';     label.am = 'life span as imago';       bibkey.am = 'wiki'; 
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'wikipedia: lifespan imago: 2-4 weeks';
  
data.Lb = 0.0234; units.Lb = 'cm'; label.Lb = 'head-capsule width at birth';      bibkey.Lb = 'Wagn1990';
data.Lj = 0.2; units.Lj = 'cm'; label.Lj = 'maximum head-capsule width of 7th instar larvae before pupation';      bibkey.Lj = 'WallWall1990';
data.Ljl = 1.2; units.Ljl = 'cm'; label.Ljl = 'maximum larval length of 7th instar larvae before pupation';      bibkey.Ljl = 'OttoSven1980';

data.V0 = 4/3 * pi * 0.175^3; units.V0 = 'cm^3'; label.V0 = 'initial egg volume';      bibkey.V0 = 'Wagn1990';
comment.V0 = 'egg has a diameter of 3-4 mm - simple volume formula 4/3 * pi * 0.35/2 cm^3 '; 

data.Ni  = 351; units.Ni  = '#';  label.Ni  = 'total number of eggs';       bibkey.Ni  = 'Elli1969';   
  temp.Ni = C2K(15); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 comment.Ni = 'oviposition of one female happened 2 times within 1 hour, first clutch: 162 eggs, second clutch: 189 eggs';

% uni-variate data
% T-ab data
data.Tab = [ ... % temperature (C), age at birth (d)
   12 37.5
   16 27.3
   18 24];
 units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'}; 
 bibkey.Tab = 'Wagn1990';
 comment.Tab = 'table 1, mean values of hatching time, except for 18 degrees: only 24 days were used here because of the weird datapoint 61 days';
 
% T-aj data
data.Taj = [ ... % temperature (C), age at birth (d)
   6 452
   10 370
   14 319];
 units.Taj   = {'C', 'd'};  label.Taj = {'temperature', 'age at pupation'}; 
 bibkey.Taj = 'Wagn1990';
 comment.Taj = 'page 205, in text: Duration of life cycle, mean values';
 
 
% 15 deg C
data.tL14 = [ ...
0 0.0234
56 0.0404
107 0.0668
136 0.0978
201 0.1258
239 0.1543
304 0.1866];
units.tL14   = {'d', 'cm'};  label.tL14 = {'time since birth', 'head-capsule width', '14 C'};  
temp.tL14    = C2K(14);  units.temp.tL14 = 'K'; label.temp.tL14 = 'temperature';
bibkey.tL14 = 'Wagn1990';
comment.tL14 = 'table 2 combined with table 3, mean head-capsule width for each instar combined with duration of instars';

% 10 deg, time length
data.tL10 = [ ...
0 0.0234
43 0.0404
93 0.0668
119 0.0978
180 0.1258
212 0.1543
342 0.1866];
units.tL10   = {'d', 'cm'};  label.tL10 = {'time since birth', 'head-capsule width', '10 C'};  
temp.tL10    = C2K(10);  units.temp.tL10 = 'K'; label.temp.tL10 = 'temperature';
bibkey.tL10 = 'Wagn1990';
comment.tL10 = 'table 2 combined with table 3, mean head-capsule width for each instar combined with duration of instars';

% 6 deg, time length
data.tL6 = [ ...
0 0.0234
52 0.0404
119 0.0668
176 0.0978
251 0.1258
305 0.1543
425 0.1866];
units.tL6   = {'d', 'cm'};  label.tL6 = {'time since birth', 'head-capsule width', '6 C'};  
temp.tL6    = C2K(6);  units.temp.tL6 = 'K'; label.temp.tL6 = 'temperature';
bibkey.tL6 = 'Wagn1990';
comment.tL6 = 'table 2 combined with table 3, mean head-capsule width for each instar combined with duration of instars';

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
set1 = {'tL14', 'tL10', 'tL6'}; subtitle1 = {'head-capsule width at  14, 10 and 6 degree Celsius'};
metaData.grp.sets = {set1}; metaData.grp.subtitle = {subtitle1};
 
%% Discussion points
D1 = 'only head-capsule width of the different instars is used here because the lack of length data';
D2 = 'combined with duration of the different instars, the head-capsule width were used for length over time-plots';
D3 = 'only data with 8/16 light/dark rythm were used here';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Acknowledgment
metaData.acknowledgment = 'This entry was financially supported by the CEFIC Long-range Research Initiative (project number ECO28)';

%% Links
metaData.links.id_CoL = '6YJJK'; % Cat of Life
metaData.links.id_ITIS = '604457'; % ITIS
metaData.links.id_EoL = '593127'; % Ency of Life
metaData.links.id_Wiki = 'Sericostoma'; % Wikipedia
metaData.links.id_ADW = 'Sericostoma_personatum'; % ADW
metaData.links.id_Taxo = '29326'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Sericostoma}}';
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
bibkey = 'Wagn1990'; type = 'Article'; bib = [ ... 
'author = {Wagner, R}, ' ... 
'year = {1990}, ' ...
'title = {A laboratory study on the life cycle of  \emph{Sericostoma personatum}({K}irby \& {S}pence), and light dark-dependent food consumption}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {208}, ' ...
'pages = {201-212}, '...
'doi = {10.1007/BF00007785}, '...
'howpublished = {\url{https://link.springer.com/article/10.1007/BF00007785}}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Elli1969'; type = 'Article'; bib = [ ... 
'author = {Elliott, J.M.}, ' ... 
'year = {1969}, ' ...
'title = {Life History and Biology of \emph{Sericostoma personatum} {S}pence ({T}richoptera)}, ' ...
'journal = {Oikos}, ' ...
'volume = {20}, ' ...
'number = {1}, ' ...
'pages = {110-118}, '...
'doi = {10.2307/3543750 }, '...
'howpublished = {\url{http://www.jstor.org/stable/3543750}}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallWall1990'; type = 'Book'; bib = [ ... 
'author = {Wallace, I.D. and Wallace B. and Philipson, G.N.}, ' ... 
'year = {1990}, ' ...
'title = {A key to the case-bearing caddis larvae of {B}ritain and {I}reland}, ' ...
'publisher = {Freshwater Biological Association}, ' ...
'ISBN = {0900386495}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OttoSven1980'; type = 'Article'; bib = [ ... 
'author = {Otto, C. and Svensson, B.S.}, ' ... 
'year = {1980}, ' ...
'title = {The Significance of Case Material Selection for the Survival of Caddis Larvae}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {490}, ' ...
'number = {3}, ' ...
'pages = {855-865}, '...
'doi = {10.2307/4231}, '...
'howpublished = {\url{http://www.jstor.org/stable/4231}}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];




