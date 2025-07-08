function [data, auxData, metaData, txtData, weights] = mydata_Neophoca_cinerea
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Neophoca_cinerea'; 
metaData.species_en = 'Australian sea lion'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb';  'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 03 29];              
metaData.email_mod_1    = {'starrlight@tecnico.ulisboa.pt'};            
metaData.address_mod_1  = {'Tecnico, Lisbon'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 07 23];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 23];

%% set data
% zero-variate data

data.tg = 14*30.5;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Gold2018';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '14 months';
data.tx = 18*30.5;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Gold2018';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'usually around 18 months, can be extended to three or more years if no pup in subsequent breeding season or new pup dies ';
data.tp = 4.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty (female)'; bibkey.tp = 'Gold2018';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '4.5–6 years';
data.tpm = 6*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty (male)';bibkey.tpm  = 'Gold2018';
  temp.tpm = C2K(37);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = '6 years of more for males';
data.am = 26 *365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Gold2018';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; comment.am = 'for females; 21.5 males' ;

data.Lb  = 70;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Gold2018';
  comment.Lb = '60-70 cm';
data.Li  = 180;   units.Li  = 'cm';  label.Li  = 'total length fem.';   bibkey.Li  = 'Gold2018';
  comment.Li = '130-180 cm';
data.Lim  = 250;   units.Lim  = 'cm';  label.Lim  = 'total length male';   bibkey.Lim  = 'Gold2018';
   comment.Lim = '180-250 cm cm';
 
data.Wwb = 9e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Gold2018'; comment.Wwb = '6-9 kg';
% data.Wwx = 59724;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 105e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight fem.';     bibkey.Wwi = 'Gold2018';
  comment.Wwi = '61 - 105 kg';
data.Wwim = 250e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight male';     bibkey.Wwim = 'Gold2018';
  comment.Wwim = '180-250 kg';

data.Ri  = 1/ ((14 + 18) * 30.5);   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Gold2018';   
  temp.Ri = C2K(37);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assuming pup is every 14 + 18 months ';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), standard length (cm)
0.825	115.396
0.922	102.731
0.922	101.464
0.971	105.897
2.039	111.280
2.913	120.145
3.883	145.158
3.981	137.876
4.078	130.277
5.000	154.657
5.437	135.343
5.437	142.942
5.583	160.040
5.825	141.042
5.874	124.261
6.117	151.807
6.553	151.491
6.990	160.673
7.039	152.124
7.913	160.673
7.961	126.794
8.301	150.224
8.398	159.723
8.398	164.789
8.883	157.190
9.417	168.272
9.515	160.989
9.951	154.974
9.951	158.773
9.951	162.256
10.388	158.456
10.874	145.475
10.874	159.723
11.408	158.773
11.456	145.792
11.893	166.055
11.893	149.591
11.942	160.989
11.942	160.673
11.942	135.660
12.427	156.873
12.476	148.325
12.961	148.008
13.398	155.607
13.835	160.989
13.981	150.541
14.369	163.206
15.340	140.726
15.874	154.974
16.942	152.124
17.864	173.971
17.961	163.522
18.981	167.322
20.922	155.290
20.971	160.989
22.913	160.356
24.029	146.741];  
data.tL_f(:,1) = data.tL_f(:,1) * 365; % yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'standard length', 'female'};  
temp.tL_f    = C2K(37);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GoldMcKe2009';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), standard length (cm)
0.943	98.042
1.557	120.196
1.926	127.156
1.927	119.873
1.967	134.121
1.968	131.588
1.969	117.023
2.541	134.745
3.033	130.621
3.484	146.128
3.525	139.795
4.508	162.576
5.861	160.655
6.393	170.779
7.541	168.544
9.918	192.887
9.919	193.836
9.959	195.102
12.869	171.626
13.607	198.844
14.549	195.346
16.025	198.172
16.107	190.256
17.049	188.341
18.033	187.059
18.525	192.750
18.566	187.050
20.000	191.144];  
data.tL_m(:,1) = data.tL_m(:,1) * 365; % yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'standard length', 'male'};  
temp.tL_m    = C2K(37);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GoldMcKe2009';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time since birth (yr), standard length (cm)
0.874	35.787
1.893	33.315
2.913	36.461
3.981	63.427
3.981	60.955
3.981	54.663
4.903	69.494
5.291	80.056
5.437	65.674
5.437	53.090
6.019	66.798
6.019	47.472
6.359	72.865
6.845	71.966
6.990	83.652
7.913	85.000
8.350	100.955
8.350	92.191
8.495	77.135
8.932	97.360
9.466	96.461
9.515	80.955
9.563	87.247
9.903	99.831
10.534	102.978
10.874	87.472
11.359	79.607
11.359	92.640
11.893	89.270
11.893	94.213
11.942	79.157
11.942	78.708
11.942	71.292
12.039	103.652
12.379	89.719
12.427	98.933
13.058	69.045
13.398	81.854
13.447	78.708
13.981	84.551
14.029	74.888
14.417	85.449
15.922	85.449
17.039	89.494
17.913	88.371
20.971	80.056
22.961	91.966
24.029	86.798];  
data.tWw_f(:,1) = data.tWw_f(:,1) * 365; % yr to d
data.tWw_f(:,2) = data.tWw_f(:,2) * 1e3; % kg to g
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'weight', 'female'};  
temp.tWw_f    = C2K(37);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'GoldMcKe2009';
comment.tWw_f = 'Data for females';
% 
data.tWw_m = [ ... % time since birth (yr), standard length (cm)
1.903	55.546
1.903	44.522
2.408	57.672
3.029	53.505
3.417	75.573
3.456	56.677
4.388	101.346
5.903	89.352
6.408	121.924
7.573	112.537
9.864	166.200
10.019	138.912
14.447	152.792
16.000	213.766
17.942	188.671];  
data.tWw_m(:,1) = data.tWw_m(:,1) * 365; % yr to d
data.tWw_m(:,2) = data.tWw_m(:,2) * 1e3; % kg to g
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'weight', 'male'};  
temp.tWw_m    = C2K(37);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'GoldMcKe2009';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f'; 'tL_m'}; subtitle1 = {'data for female, male'};
set2 = {'tWw_f'; 'tWw_m'}; subtitle2 = {'data for female, male'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males and females are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod 1: males and females are identical up till birth and then they are assumed to differ by {p_Am} and E_Hp';
D3 = 'mod 1: added data from Gold2018 which replaces most of the AnAge and AWD data in the zero-variate. ';
D4 = 'mod 1: removed the Wwx data with was from AnAge and conflicted with the rest.';
D5 = 'mod 2: reduced k.';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '46Q8P'; % Cat of Life
metaData.links.id_ITIS = '180623'; % ITIS
metaData.links.id_EoL = '46559210'; % Ency of Life
metaData.links.id_Wiki = 'Neophoca_cinerea'; % Wikipedia
metaData.links.id_ADW = 'Neophoca_cinerea'; % ADW
metaData.links.id_Taxo = '67405'; % Taxonomicon
metaData.links.id_WoRMS = '255001'; % WoRMS
metaData.links.id_MSW3 = '14001013'; % MSW3
metaData.links.id_AnAge = 'Neophoca_cinerea'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neophoca_cinerea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/Neophoca_cinerea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Neophoca_cinerea/}}';
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
bibkey = 'GoldMcKe2009'; type = 'techreport'; bib = [ ... 
'author = {S. D. Goldsworthy and J. McKenzie and P. D. Shaughnessy and R. R. McIntosh and B. Page and R .Campbell}, ' ... 
'year = {2009}, ' ...
'title = {An Update of the Report: Understanding the Impediments to the Growth of {A}ustralian Sea Lion Populations}, ' ...
'institution = {South Australian Research and Development Institute}, ' ...
'series = {SARDI Research Report}, ' ...
'volume = {356}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gold2018'; type = 'incollection'; bib = [ ... 
'author = {S. D. Goldsworthy}, ' ... 
'year = {2018}, ' ...
'title = {Australian Sea Lion: \emph{{N}eophoca {C}inerea}.}, ' ...
'booktitle = {Encyclopedia of Marine Mammals (Third Edition)}, ' ...
'editor = {B. Würsig and J. G. M. Thewissen and Kit M. Kovacs}, ' ...
'publisher = {Academic Press}, ' ...
'doi = {10.1016/B978-0-12-804327-1.00052-2}, ' ...
'pages = {44--46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
