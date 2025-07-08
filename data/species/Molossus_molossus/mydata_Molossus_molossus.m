function [data, auxData, metaData, txtData, weights] = mydata_Molossus_molossus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Molossidae';
metaData.species    = 'Molossus_molossus'; 
metaData.species_en = 'Velvety free-tailed bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 108;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 42;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'HausMoll1981';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'age at first marturity 103 d'; 
data.am = 5.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 3.45; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'AnAge';
  comment.Wwb = '2.31 g for male, 2.36 g for female';
data.Wwi = 14;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'AnAge';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 2 litters per yr';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.732	3.240
1.869	3.368
3.168	3.513
4.142	3.625
4.954	3.705
6.090	3.817
6.822	4.010
8.040	4.250
9.016	4.490
10.071	4.602
11.046	4.843
12.022	5.099
12.915	5.275
14.052	5.403
15.026	5.435
16.164	5.836
17.059	6.092
17.953	6.316
19.089	6.348
20.065	6.717
21.040	6.877
21.932	6.909
23.071	7.293
24.127	7.437
24.940	7.742
25.913	7.710
26.892	8.398
28.107	8.142
29.081	8.255
30.136	8.303
30.948	8.431
32.005	8.751
32.981	9.072
34.034	8.848
35.011	9.360
35.987	9.664
37.202	9.456
38.094	9.457
39.068	9.457
39.961	9.649
41.179	9.809
41.830	10.002
43.128	10.034
44.102	10.098
45.075	10.098
46.049	10.195
47.023	10.227
47.997	10.355
48.971	10.355
50.106	10.387
51.160	10.228
52.216	10.420
53.108	10.404
54.001	10.484
55.136	10.437
55.949	10.677
57.328	10.693
58.140	10.805
59.113	10.773
60.006	10.870
61.061	10.934
62.198	11.126
63.092	11.382
64.471	11.287
65.202	11.431
66.093	11.351
66.987	11.511
68.203	11.384
69.096	11.576
70.151	11.576];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'females'};  
temp.tWw_f    = C2K(34.8);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'HausMoll1981';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
0.900	3.928
1.792	3.880
3.010	4.073
3.903	4.137
4.878	4.361
5.691	4.553
7.071	4.730
7.964	4.890
8.778	5.194
9.997	5.482
10.973	5.738
12.109	5.867
13.087	6.475
14.225	6.699
15.037	6.891
16.013	7.148
17.071	7.580
17.885	7.900
19.345	7.980
20.077	8.157
20.974	8.797
22.030	8.909
23.086	9.149
24.144	9.597
25.116	9.486
26.012	9.886
27.069	10.254
28.124	10.318
28.938	10.639
30.074	10.719
31.130	10.927
32.105	11.119
33.161	11.232
34.216	11.344
35.028	11.392
36.084	11.568
36.976	11.552
37.950	11.697
38.843	11.745
40.060	11.857
41.196	11.921
42.169	11.842
42.821	12.226
44.118	12.162
45.011	12.242
46.068	12.467
46.879	12.531
47.935	12.659
49.152	12.675
50.288	12.787
51.097	12.548
51.992	12.852
52.967	13.028
54.266	13.172
54.914	13.157
56.132	13.301
57.105	13.269
58.000	13.557
59.054	13.477
60.351	13.398
61.083	13.702
62.138	13.686
63.192	13.638
64.164	13.527
65.139	13.655
66.113	13.767
67.174	14.519
68.223	13.896
69.113	13.688
70.093	14.456];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'males'};  
temp.tWw_m    = C2K(34.8);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'HausMoll1981';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '43YHY'; % Cat of Life
metaData.links.id_ITIS = '209529'; % ITIS
metaData.links.id_EoL = '327951'; % Ency of Life
metaData.links.id_Wiki = 'Molossus_molossus'; % Wikipedia
metaData.links.id_ADW = 'Molossus_molossus'; % ADW
metaData.links.id_Taxo = '64049'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13801512'; % MSW3
metaData.links.id_AnAge = 'Molossus_molossus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Molossus_molossus}}';
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
bibkey = 'HausMoll1981'; type = 'Article'; bib = [ ... 
'author = {Ursel H\"{a}ussler and Evelyn M\"{o}ller and U. Schmidt}, ' ... 
'year = {1981}, ' ...
'title = {Zur {H}altung und {J}ugendentwicklung von \emph{Molossus molossus} ({C}hiroptera)}, ' ...
'journal = {Z. S\"{a}ugetierkd}, ' ...
'volume = {46}, ' ...
'pages = {337-351}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Molossus_molossus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

