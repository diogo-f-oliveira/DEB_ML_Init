function [data, auxData, metaData, txtData, weights] = mydata_Mesocricetus_auratus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Mesocricetus_auratus'; 
metaData.species_en = 'Golden hamster'; 

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTd', '0iTa', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 16;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Lemmus lemmus';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 48;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.9*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Wwb = 2.45;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MorrDiet1977';
data.Wwi = 85;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
data.Wwim = 105; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'AnAge';
  comment.Wwim = 'based on tWw_m';

data.Ri  = 3*9/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9 pups per litter; 3 litters per yr, based on Lemmus lemmus';
   
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.008	2.346
1.270	2.522
3.975	3.054
6.956	5.390
10.210	8.266
13.557	12.045
16.363	15.825
19.713	20.326
22.882	24.646
25.420	29.150
27.686	32.932
30.229	38.519
32.499	43.565
34.584	47.167
36.121	48.606
37.294	48.963
39.550	50.037
44.146	50.382
48.301	53.616
51.192	55.772
54.809	59.369
59.145	62.783
63.470	62.947
67.526	63.474
71.409	65.987
74.033	69.227
76.837	72.285
79.550	75.164
82.531	77.319
85.693	79.835
89.485	82.168
94.720	84.856
100.043	87.003];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(38.1);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'Bond1945';
comment.tWw_f = 'Data for females, digitized from drawn curve';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
0.189	2.346
1.630	2.340
5.512	4.492
9.397	7.547
13.286	11.865
17.179	17.086
21.528	23.929
25.334	30.053
30.591	38.878
33.405	45.005
35.579	48.247
38.016	49.321
41.454	53.460
44.802	57.419
47.329	58.674
52.193	58.656
54.725	61.174
57.172	65.317
60.061	66.931
63.671	68.723
67.104	71.418
70.988	74.292
75.057	78.429
78.492	81.666
81.747	84.903
86.084	88.317
90.331	91.731
94.935	94.422
100.168	96.569];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(38.1);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'Bond1945';
comment.tWw_m = 'Data for males, digitized from drawn curve';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4237W'; % Cat of Life
metaData.links.id_ITIS = '632735'; % ITIS
metaData.links.id_EoL = '1179513'; % Ency of Life
metaData.links.id_Wiki = 'Mesocricetus_auratus'; % Wikipedia
metaData.links.id_ADW = 'Mesocricetus_auratus'; % ADW
metaData.links.id_Taxo = '62493'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000364'; % MSW3
metaData.links.id_AnAge = 'Mesocricetus_auratus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mesocricetus_auratus}}';
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
bibkey = 'Bond1945'; type = 'Article'; bib = [ ... 
'doi = {10.1086/PHYSZOOL.18.1.30151852}, ' ...
'author = {Bond, C. R.}, ' ... 
'year = {1945}, ' ...
'title = {The Golden Hamster (\emph{Cricetus auratus}): Care, Breeding, and Growth}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {18(1)}, ' ...
'pages = {52–59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MorrDiet1976'; type = 'Article'; bib = [ ... 
'doi = {10.1086/physzool.50.4.30155733}, ' ...
'author = {Morrison, P. and Dieterich, R. and Preston, D.}, ' ... 
'year = {1976}, ' ...
'title = {Breeding and reproduction of fifteen wild rodents maintained as laboratory colonies}, ' ...
'journal = {Lab Anim Sci.}, ' ...
'volume = {26}, ' ...
'pages = {237-243}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Mesocricetus_auratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

