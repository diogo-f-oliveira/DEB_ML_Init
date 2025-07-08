function [data, auxData, metaData, txtData, weights] = mydata_Dissodactylus_primitivus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Pinnotheridae';
metaData.species    = 'Dissodactylus_primitivus'; 
metaData.species_en = 'Heart urchin pea crab'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0bMr','bjMp','jiMr'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP','biD','jiCi','jiS','jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab', 'aj', 'ap', 'am', 'Lj', 'Lp', 'Li', 'Wwb', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 23]; 

%% set data
% zero-variate data

data.ab = 19.5;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'PohlTelf1983';   
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 15.3;  units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'PohlTelf1983';   
  temp.tj = C2K(28); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 250;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'PohlTelf1983';
  temp.tp = C2K(28);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(28);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lj  = 0.0745;   units.Lj  = 'cm';  label.Lj  = 'carapace width at metam';   bibkey.Lj  = 'PohlTelf1983';
data.Lp  = 0.58;   units.Lp  = 'cm';  label.Lp  = 'carapace width at puberty';   bibkey.Lp  = 'PohlTelf1982';
data.Li  = 1;     units.Li  = 'cm';  label.Li  = 'ultimate carapace width for females'; bibkey.Li  = 'PohlTelf1982';

data.Wwb = 9.4e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'PohlTelf1983';
  comment.Wwb = 'Computed from egg size at hatch 0.64 X 0.53 mm: 4/24*pi*0.064*0.053^2';
data.Wwi = 0.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'PohlTelf1982';
  comment.Wwi = 'Based on Li, using F2';

data.Ri  = 4;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
% females
data.tL_f = [ ... % time since birth (d), carapace width (cm)
26.667	0.092
32.500	0.109
40.833	0.122
48.333	0.142
54.167	0.158
63.333	0.175
73.333	0.196
85.000	0.222
95.833	0.245
108.333	0.277
120.833	0.303
136.667	0.333
150.000	0.364
169.167	0.400
187.500	0.440
209.167	0.476
228.333	0.517
248.333	0.565
270.000	0.611
300.000	0.656
336.667	0.697
376.667	0.736
410.000	0.779
462.500	0.801
498.333	0.845
505.000	0.822
537.500	0.873
586.667	0.928
593.333	0.863
647.500	0.944]; 
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace width', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PohlTelf1982';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since birth (d), carapace width (cm)
25.000	0.096
30.000	0.112
36.667	0.130
45.833	0.143
52.500	0.166
61.667	0.186
67.500	0.206
78.333	0.232
90.833	0.252
104.167	0.285
117.500	0.315
135.000	0.341
150.000	0.377
169.167	0.402
186.667	0.446
207.500	0.484
230.833	0.524
254.167	0.562
279.167	0.601
303.333	0.639
336.667	0.682
383.333	0.703
423.333	0.718
484.167	0.738
536.667	0.774
603.333	0.789
635.000	0.776
678.333	0.804]; 
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace width', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PohlTelf1982';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Egg production rate is unkown and guess is based on kap = 0.8';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'Lives in symbiosis with sea urchin Meoma ventricosa; The crab lives on the urchin, usually inside or near its mouth';
metaData.bibkey.F1 = 'BruyRiga2009'; 
F2 = 'Weight-length: family member Austinixa aidae of Carapace Width 1 cm has wet weight 0.2 g';
metaData.bibkey.F2 = 'PierPezz2011'; 
F3 = 'Larval development consists of a prezoeal stage of 5 min, followed by three zoeal stages of 1, 2.1, and 2.7 days, respectively. The megalopa can be reached by day 6 (mean 6.8), the first crab instar by day 12 (mean 15.3).';
metaData.bibkey.F3 = 'PohlTelf1983'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6DB7S'; % Cat of Life
metaData.links.id_ITIS = '98971'; % ITIS
metaData.links.id_EoL = '46512482'; % Ency of Life
metaData.links.id_Wiki = 'Dissodactylus'; % Wikipedia
metaData.links.id_ADW = 'Dissodactylus_primitivus'; % ADW
metaData.links.id_Taxo = '358091'; % Taxonomicon
metaData.links.id_WoRMS = '422153'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pinnotheridae}}';
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
bibkey = 'PohlTelf1982'; type = 'Article'; bib = [ ... 
'author = {G. Pohle and M. Telford}, ' ... 
'year = {1982}, ' ...
'title = {POST-LARVAL GROWTH OF \emph{Dissodactylus primitivus} {B}OUVIER, 1917 ({B}RACHYURA: {P}INNOTHERIDAE) UNDER LABORATORY CONDITIONS}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {163}, ' ...
'pages = {221-224}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PohlTelf1983'; type = 'Article'; bib = [ ... 
'author = {G. Pohle and M. Telford}, ' ... 
'year = {1983}, ' ...
'title = {The Larval Development of \emph{Dissodactylus primitivus} {B}ouvier, 1917 ({B}rachyura: {P}innotheridae) Reared in the Laboratory}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'volume = {33}, ' ...
'number = {2}, ' ...
'pages = {257--273}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BruyRiga2009'; type = 'Article'; bib = [ ... 
'author = {C. De Bruyn and T. Rigaud and B. David and C. De Ridder}, ' ... 
'year = {2009}, ' ...
'title = {Symbiosis between the pea crab \emph{Dissodactylus primitivus} and its echinoid host \emph{Meoma ventricosa}: {P}otential consequences...}, ' ...
'journal = {Marine Ecology Progress Series}, ' ...
'volume = {375}, ' ...
'pages = {173-183}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PierPezz2011'; type = 'Article'; bib = [ ... 
'author = {D. F. Peir\''{o} and P. R. Pezzuto and F. L. Mantelatto}, ' ... 
'year = {2011}, ' ...
'title = {Relative growth and sexual dimorphism of \emph{Austinixa aidae} ({B}rachyura: {P}innotheridae): a symbiont of the ghost shrimp \emph{Callichirus major} from the southwestern {A}tlantic}, ' ...
'journal = {Lat. Am. J. Aquat. Res.}, ' ...
'volume = {39}, ' ...
'number = {2}, ' ...
'pages = {261--270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
