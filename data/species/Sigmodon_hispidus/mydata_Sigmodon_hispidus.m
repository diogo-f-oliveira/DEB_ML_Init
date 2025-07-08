function [data, auxData, metaData, txtData, weights] = mydata_Sigmodon_hispidus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Sigmodon_hispidus'; 
metaData.species_en = 'Hispid cotton rat'; 

metaData.ecoCode.climate = {'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 15;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 40;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.2*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 6.2;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 19.8;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 185;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'AnAge';

data.Ri  = 6.7*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 pups per litter; 6.7 litters per yr';
  
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.883	7.530
2.176	8.618
3.040	10.141
3.685	10.141
6.920	13.621
7.783	14.709
8.863	16.667
9.941	17.537
11.019	18.624
13.830	24.498
15.338	25.368
15.773	27.326
17.065	27.979
18.147	30.589
20.735	33.417
21.815	35.157
23.111	37.333
24.399	36.680
25.047	37.550
29.576	42.771
30.866	42.989
31.516	44.729
34.544	51.037
37.344	52.995
38.855	54.953
42.315	61.914
44.033	61.479
45.549	65.395
54.160	69.746
55.884	71.051
58.461	70.398
60.624	74.749
62.772	74.314
64.710	75.619
67.513	78.665
70.099	80.622
72.251	81.710
74.633	87.366
76.776	85.408
78.283	86.278
81.296	87.366
83.447	88.019
85.379	87.149
89.049	92.369
90.332	89.977
92.268	90.629];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(37.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'McClRand1980';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.732	9.131
2.024	9.696
2.579	10.445
3.690	11.941
6.646	14.192
7.572	15.687
8.681	16.811
10.160	18.123
11.085	19.432
13.679	23.918
14.422	25.786
16.084	26.912
16.642	28.406
17.756	31.021
20.714	34.018
22.192	35.143
23.117	36.452
23.859	37.761
25.519	38.141
25.710	40.379
29.592	44.312
30.702	45.622
37.558	57.585
39.964	60.765
42.751	68.236
44.968	69.923
46.821	72.915
54.770	80.781
56.615	81.162
58.646	82.476
61.787	84.727
63.261	84.547
65.104	84.555
68.430	87.180
69.537	87.744
71.015	88.683
76.185	91.689
78.027	91.137
79.872	91.891
82.822	91.904
84.668	92.844
87.064	92.668
89.840	96.410
91.490	93.620
93.337	94.747
96.845	96.627
98.692	97.940];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(37.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'McClRand1980';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 10 * weights.tW_f;
weights.tW_m = 10 * weights.tW_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: food aailability taken variable in tW data';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '7WVGS'; % Cat of Life
metaData.links.id_ITIS = '180349'; % ITIS
metaData.links.id_EoL = '328441'; % Ency of Life
metaData.links.id_Wiki = 'Sigmodon_hispidus'; % Wikipedia
metaData.links.id_ADW = 'Sigmodon_hispidus'; % ADW
metaData.links.id_Taxo = '62413'; % Taxonomicon
metaData.links.id_MSW3 = '13000917'; % Mammal Spec World
metaData.links.id_AnAge = 'Sigmodon_hispidus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sigmodon_hispidus}}';
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
bibkey = 'McClRand1980'; type = 'Article'; bib = [ ... 
'author = {P. A. McClure and J. C. Randolph}, ' ... 
'year = {1980}, ' ...
'title = {Relative Allocation of Energy to Growth and Development of Homeothermy in the Eastern Wood Rat (\emph{Neotoma floridana}) and Hispid Cotton Rat (\emph{Sigmodon hispidus})}, ' ...
'journal = {Ecological Monographs}, ' ...
'volume = {50}, ' ...
'pages = {199--219}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sigmodon_hispidus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

