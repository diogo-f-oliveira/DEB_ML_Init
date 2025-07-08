function [data, auxData, metaData, txtData, weights] = mydata_Chaoborus_crystallinus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Diptera'; 
metaData.family     = 'Chaoboridae';
metaData.species    = 'Chaoborus_crystallinus'; 
metaData.species_en = 'Glassworm'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0eFl', '0eFp', '0eFm', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ae'; 'am'; 'Wd0'; 'Wwj'; 'Wwe'; 'Wde'; 'Ni'}; 
metaData.data_1     = {'t-L_f'; 't-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Kim Rakel'};    
metaData.date_subm = [2017 05 19];              
metaData.email    = {'rakel@gaiac-eco.de'};            
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 07 11]; 

%% set data
% zero-variate data

data.ab = 1.044;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Parm1969';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'unclear if lab data or field data';
data.tj = 52;  units.tj = 'd';    label.tj = 'time since birth at pupation'; bibkey.tj = 'Wier1984';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'f for this data is much smaller than 1 in view of tL data versus tLi data';
data.te = 3;     units.te = 'd';     label.te = 'time since pupation at emergence'; bibkey.te = 'Buen1990';
  temp.te = C2K(20);  units.temp.te = 'K'; label.temp.te = 'temperature';    
data.am = 10;    units.am = 'd';     label.am = 'life span as imago';       bibkey.am = 'BereBons2002'; 
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'max 10 days, in lab at 25 degrees: 5.2 days';
    
  
data.Wd0 = 1.63e-6; units.Wd0 = 'g'; label.Wd0 = 'initial dry weight';      bibkey.Wd0 = 'Buen1990';
data.Wwj = 5.61e-3; units.Wwj = 'g'; label.Wwj = 'wet weight of pupa';      bibkey.Wwj = 'Buen1990';
data.Wwe = 2.33e-3; units.Wwe = 'g'; label.Wwe = 'wet weight of imago';     bibkey.Wwe = 'Buen1990';
data.Wde = 0.70e-3; units.Wde = 'g'; label.Wde = 'dry weight of imago';     bibkey.Wde = 'Buen1990';
  comment.Wde = 'dry weight belongs to same experiment as wet weight';

data.Ni  = 283; units.Ni  = '#';  label.Ni  = 'total number of eggs';       bibkey.Ni  = 'Ratt1977';   
  temp.Ni = C2K(20); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data

% time-head length data Swif1992
data.tLi = [ ... % duration of instar (d), length head capsule of instar (mm)
4.5 0.26  % instar 1
3.3 0.47  % instar 2
3.7 0.86  % instar 3
7   1.36];% instar 4
data.tLi(:,1) = cumsum(data.tLi(:,1)); % convert duration to time since birth
data.tLi(:,2) = data.tLi(:,2)/ 10; % convert mm to cm
units.tLi   = {'d', 'cm'};  label.tLi = {'time', 'length of head capsule'};  
temp.tLi    = C2K(20);  units.temp.tLi = 'K'; label.temp.tLi = 'temperature';
bibkey.tLi = 'Swif1992';

% time-total length data Wier1984
data.tL = [ ... % time since birth (d), total(cm)
4	0.182
6	0.257
7	0.252
8	0.26
9	0.269
10	0.288
13	0.319
14	0.361
15	0.389
16	0.428
17	0.423
20	0.497
22	0.512
24	0.539
27	0.615
31	0.669
41	0.851
43	0.905
44	0.896
48	0.925
52	0.942];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Wier1984';
comment.tL = 'length measured since birth until pupation';

% time-weight data 
% females
data.tWw_f = [ ... % experimental time (d), wet weight (mg)
0	2.32
2	2.9
4	3.54
6	4.11
8	4.64
10	4.97
12	5.46];
data.tWw_f(:,2) = data.tWw_f(:,2)/1e3; % convert mg to g
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(20);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Buen1990';
comment.tWw_f = 'wet weight of L4-Larvae of females at 20 C and 15 daphnids per day as food';
% males
data.tWw_m = [ ... % experimental time (d), wet weight (mg)
0	1.76
2	2.12
4	2.5
6	2.93
8	3.28];
data.tWw_m(:,2) = data.tWw_m(:,2)/1e3; % convert mg to g
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(20);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Buen1990';
comment.tWw_m = 'weight of L4-Larvae of males at 20 C and 15 daphnids per day as food';

% W-N data  from Buen1990
data.WN = [ ... % wet weight (mg), number of eggs 
1.59	114.30
1.80	129.10
1.88	126.90
2.02	139.40
2.35	194.30
2.57	194.30
2.72	224.00];
data.WN(:,1) = data.WN(:,1) * data.Wwj/ data.Wwe/ 1e3; % convert mg to g and weight at emergens to weight at pupation
units.WN = {'g', '#'};  label.WN = {'wet weight', 'number of eggs', '10 C'};
temp.WN = C2K(20); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Buen1990';
comment.WN = 'data Buen1990';

% W-N data  from Buen1990
data.WN_2 = [ ... % wet weight (mg), number of eggs 
2.49	250.30
2.54	243.40
2.65	265.10
2.69	243.40
2.94	264.00
3.02	252.60
3.19	253.70
3.22	267.40
3.22	277.70
3.62	277.70
3.72	292.60
3.78	289.10
4.12	293.70
4.12	305.10
4.22	298.30
4.22	332.60
4.25	289.10
4.25	285.70
4.27	339.40];
data.WN_2(:,1) = data.WN_2(:,1) * data.Wwj/ data.Wwe/ 1e3; % convert mg to g and weight at emergens to weight at pupation
units.WN_2 = {'g', '#'};  label.WN_2 = {'wet weight', 'number of eggs', '20 C'};
temp.WN_2 = C2K(20); units.temp.WN_2 = 'K'; label.temp.WN_2 = 'temperature';
bibkey.WN_2 = 'Buen1990';
comment.WN_2 = 'data from Ratt1974, but published in Buen1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tLi = 10 * weights.tLi;
weights.tj = 5 * weights.tj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f', 'tWw_m'}; subtitle1 = {'Buen1990 data for females, males'};
set2 = {'WN', 'WN_2'}; subtitle2 = {'Data from Buen1990, Ratt1974'};
metaData.grp.sets = {set1,set2}; metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'They overwinter in the larval stage (most 4th instar) but in summer they can also have a second generation which lifecycle is completed in 44 days';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'C. crystallinus lives mainly as a larvea with 4 instar stadia';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'At emergence it lives for a few more days without eating and lays eggs. In its larval stage it is benthic';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Chaoborus larva has modified antennae with which is can grap small prey, such as crustaceans, chironomid larvae, olichochaetes';
metaData.bibkey.F3 = 'chebucto'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'TM7X'; % Cat of Life
metaData.links.id_ITIS = '125912'; % ITIS
metaData.links.id_EoL = '746432'; % Ency of Life
metaData.links.id_Wiki = 'Chaoborus'; % Wikipedia
metaData.links.id_ADW = 'Chaoborus_crystallinus'; % ADW
metaData.links.id_Taxo = '28524'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_diptera = 'Chaoborus+crystallinus'; % Diptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaoborus}}';
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
bibkey = 'chebucto'; type = 'Misc'; bib = ...
'howpublished = {\url{http://lakes.chebucto.org/ZOOBENTH/BENTHOS/xvii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Parm1969'; type = 'Article'; bib = [ ... 
'author = {Parma, S.}, ' ... 
'year = {1969}, ' ...
'title = {The life cycle of \emph{Chaoborus crystallinus} ({D}e {G}eer) ({D}iptera, {C}haoboridae) in a {D}utch pond}, ' ...
'journal = {Verhandlungen Internationale Vereinigung f\"{u}r theoretische und angewandte Limnologie}, ' ...
'volume = {17}, ' ...
'pages = {888--894}, '...
'howpublished = {\url{https://pure.knaw.nl/portal/en/publications/the-life-cycle-of-chaoborus-crystallinus-de-geer-diptera-chaoboridae-in-a-dutch-pond(867d28fb-b9d3-44a5-b237-b7637bf94c15).html}}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ratt1977'; type = 'PhDthesis'; bib = [ ... 
'author = {Ratte, H. T.}, ' ... 
'year = {1977}, ' ...
'school = {RWTH Aachen}, ' ...
'title = {Wachstum, H\"{a}utung und Dormanz bei dem Verticalwanderer \emph{Chaoborus} in Abh\"{a}ngigkeit von tagesperiodisch wechselnden Temperaturen und Photoperioden}, ' ...
'howpublished = {\url{https://books.google.de/books/about/Wachstum_hautung_und_dormanz_bei_dem_ver.html?id=3p0SAQAAIAAJ&redir_esc=y}}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wier1984'; type = 'PhDthesis'; bib = [ ... 
'author = {Wiertz, S.}, ' ... 
'year = {1984}, ' ...
'school = {RWTH Aachen}, ' ...
'title = {Funktionelle {R}eaktion bei den {L}arven der {M}\"{u}cke \emph{Chaoborus crystallinus} ({D}iptera, {C}haoboridae) unter besonderer {B}er\"{u}cksichtigung der {T}emperatur- und {P}hotoperiodeabhaengigkeit}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Buen1990'; type = 'PhDthesis'; bib = [ ... 
'author = {Buens, M.}, ' ... 
'year = {1990}, ' ...
'school = {RWTH Aachen}, ' ...
'title = {Experimentelle Pr\"{u}fungen von Hypothesen zur Determination von K\"{o}rpergewicht und Gelegegr\"{o}{\ss}e bei \emph{Chaoborus crystallinus} De Geer (Diptera, Chaoboridae)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BereBons2002'; type = 'Article'; bib = [ ... 
'author = {Berendonk, T. U. and Bonsall, M. B.}, ' ... 
'year = {2002}, ' ...
'title = {The phantom midge and a comparison of metapopulation structures}, ' ...
'journal = {Ecology}, ' ...
'volume = {83}, ' ...
'number = {1}, '...
'pages = {116--128}, '...
'doi = {10.2307/2680125}, '...
'howpublished = {\url{https://www.jstor.org/stable/2680125?seq=1#page_scan_tab_contents}}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Swif1992'; type = 'Article'; bib = [ ... 
'author = {Swift, M. C.}, ' ... 
'year = {1992}, ' ...
'title = {Prey capture by the four larval instars of \emph{Chaoborus crystallinus}}, ' ...
'journal = {Limnology and Oceanography}, ' ...
'volume = {37}, ' ...
'number = {1}, '...
'pages = {14--24}, '...
'doi = {10.4319/lo.1992.37.1.0014}';];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];