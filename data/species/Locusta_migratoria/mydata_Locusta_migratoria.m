function [data, auxData, metaData, txtData, weights] = mydata_Locusta_migratoria

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Orthoptera'; 
metaData.family     = 'Acrididae';
metaData.species    = 'Locusta_migratoria'; 
metaData.species_en = 'Migratory locust'; 

metaData.ecoCode.climate = {'B', 'Cs'};
metaData.ecoCode.ecozone = {'TH', 'TA', 'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Wdb'; 'Wdp'; 'Ri'}; 
metaData.data_1     = {'t-Wd_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 01 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 02 19]; 

%% set data
% zero-variate data

data.ab = 12.75; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Roon1936';   
  temp.ab = C2K(33);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 21;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'TuZhan2012';
  temp.tp = C2K(30);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 63;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'TuZhan2012';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;    units.Lp  = 'cm';  label.Lp  = 'ultimate total length';      bibkey.Lp  = 'Wiki';
  comment.Lp = 'Wiki: 4-6 cm for gregarious form';

data.Wdb = 0.012; units.Wdb = 'g';  label.Wdb = 'dry weight at birth';        bibkey.Wdb = 'Clar1957';
data.Wdp = 1;    units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';      bibkey.Wdp = 'TuZhan2012';

data.Ri  = 7*80/47;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'TuZhan2012';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'TuZhan2012: 2 - 7 pods/female, and 44 - 99.5 eggs/pod, and one female laid 12 pods (Chen 1991)';
  
% uni-variate data

% tW-data 
data.tW_30 = [... % time since birth (d), dry weight (g)
1.058	0.072
1.981	0.117
3.021	0.155
3.944	0.157
4.983	0.195
5.965	0.272
7.004	0.349
7.928	0.409
8.967	0.431
10.064	0.541
11.045	0.681
12.142	0.845
13.066	1.010
13.989	1.075
15.086	1.060];
units.tW_30   = {'d', 'g'};  label.tW_30 = {'time since birth', 'dry weight', '30 C'};  
temp.tW_30    = C2K(30);  units.temp.tW_30 = 'K'; label.temp.tW_30 = 'temperature';
bibkey.tW_30 = 'TuZhan2012';
comment.tW_30 = 'data on instar 3 till 5 of Locusta migratoria manilensis; eggs and neonates were incubated at 27C';
% 27 C
data.tW_27 = [... % time since birth (d), dry weight (g)
1.058	0.065
1.981	0.092
3.078	0.130
4.868	0.160
5.907	0.212
6.946	0.267
7.985	0.334
8.909	0.389
9.948	0.389
11.045	0.431
12.026	0.546
13.066	0.661
14.047	0.761
15.028	0.865
15.894	0.965
17.049	1.027
17.915	0.990];
units.tW_27   = {'d', 'g'};  label.tW_27 = {'time since birth', 'dry weight', '27 C'};  
temp.tW_27    = C2K(27);  units.temp.tW_27 = 'K'; label.temp.tW_27 = 'temperature';
bibkey.tW_27 = 'TuZhan2012';
% 24 C
data.tW_24 = [... % time since birth (d), dry weight (g)
1.058	0.065
2.386	0.082
3.136	0.110
4.060	0.137
5.041	0.160
6.023	0.172
7.004	0.162
8.043	0.195
9.082	0.237
10.006	0.287
11.103	0.329
12.084	0.382
13.066	0.429
14.105	0.429
14.971	0.509
16.068	0.586
17.049	0.666
18.088	0.751
19.012	0.828
19.993	0.928
20.975	1.017
22.014	1.077
23.111	1.050];
units.tW_24   = {'d', 'g'};  label.tW_24 = {'time since birth', 'dry weight', '24 C'};  
temp.tW_24    = C2K(24);  units.temp.tW_24 = 'K'; label.temp.tW_24 = 'temperature';
bibkey.tW_24 = 'TuZhan2012';
% 21 C
data.tW_21 = [... % time since birth (d), dry weight (g)
1.058	0.070
1.981	0.082
3.021	0.097
4.117	0.117
5.099	0.127
6.023	0.140
7.293	0.145
8.159	0.155
9.082	0.140
10.064	0.187
10.930	0.202
12.026	0.232
12.950	0.254
13.989	0.292
14.913	0.317
15.952	0.354
17.107	0.379
18.030	0.392
19.012	0.379
19.993	0.374
20.975	0.464
22.014	0.519
23.111	0.554
23.977	0.594
24.958	0.671
25.997	0.701
27.036	0.738
28.075	0.798
29.057	0.865
30.038	0.913
31.077	0.970
32.001	1.020
33.040	1.035
33.964	1.022
35.003	1.007
36.158	0.978];
units.tW_21   = {'d', 'g'};  label.tW_21 = {'time since birth', 'dry weight', '21 C'};  
temp.tW_21    = C2K(21);  units.temp.tW_21 = 'K'; label.temp.tW_21 = 'temperature';
bibkey.tW_21 = 'TuZhan2012';
% 18 C
data.tW_18 = [... % time since birth (d), dry weight (g)
1.000	0.070
2.155	0.087
2.963	0.095
4.060	0.110
5.041	0.122
6.138	0.137
7.119	0.137
7.928	0.150
9.024	0.135
9.890	0.167
11.103	0.180
12.084	0.172
13.008	0.165
13.989	0.162
14.913	0.207
16.068	0.212
16.991	0.234
17.973	0.229
18.954	0.259
20.051	0.274
20.975	0.289
21.956	0.309
23.111	0.324
23.977	0.357
25.016	0.357
25.997	0.387
26.978	0.384
28.075	0.379
28.941	0.369
29.923	0.347
31.020	0.352
31.943	0.397
33.040	0.421
33.964	0.454
34.945	0.449
36.100	0.476
37.023	0.504
37.889	0.519
38.929	0.526
39.910	0.564
41.007	0.581
41.988	0.594
42.970	0.613
43.951	0.623
44.932	0.651
46.029	0.656
47.011	0.698
47.992	0.706
48.858	0.743
49.955	0.751
50.994	0.768
52.033	0.788
52.957	0.813
54.054	0.813
54.977	0.810
56.074	0.805
56.940	0.788
57.922	0.803
58.961	0.793
60.000	0.791];
units.tW_18   = {'d', 'g'};  label.tW_18 = {'time since birth', 'dry weight', '18 C'};  
temp.tW_18    = C2K(18);  units.temp.tW_18 = 'K'; label.temp.tW_18 = 'temperature';
bibkey.tW_18 = 'TuZhan2012';

TaaNM = [ ... % temp (C), life span male (d), life span female (d), adult period (d), pods/female (#), tot egg mass (g)
24 49.8  54.0 31.0  7.0 1.04
27 55.6  63.5 44.3 10.5 2.05
30 66.8  62.8 47.0 12.3 2.29];

%% set weights for all real data
weights = setweights(data, []);
%weights.tW_18 = weights.tW_18 * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_30','tW_27','tW_24','tW_21','tW_18'}; subtitle1 = {'Data at 30, 27, 24, 21, 18 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'L. migratoria does not moult well at 18 C';
D2 = 'We here assume that only the final instar allocates to reproduction';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Solitary form is larger than gregarious form';
metaData.bibkey.F1 = 'Wiki'; 
F2 = '1-4 generations per yr in China';
metaData.bibkey.F2 = 'TuZhan2012'; 
F3 = 'stops eating 1-2 d before mouting; no mating at 18C, no egg laying at 18 and 21 C';
metaData.bibkey.F3 = 'TuZhan2012'; 
F4 = 'egg laying at 12.7 d at 30C, 14.6 d at 24C after instar 3';
metaData.bibkey.F4 = 'TuZhan2012'; 
F5 = 'A male needs during its development about 30 g of plant material to reach its adult weight of 2 g';
metaData.bibkey.F5 = 'waza'; 
F6 = 'A female needs 44 g of food to reach a body weight of 3 g';
metaData.bibkey.F6 = 'waza'; 
F7 = 'Egg length increases by 70% during development till hatching by absorption of water';
metaData.bibkey.F7 = 'waza'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5,'F6',F6,'F7',F7);

%% Links
metaData.links.id_CoL = '72LGF'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '494417'; % Ency of Life
metaData.links.id_Wiki = 'Locusta_migratoria'; % Wikipedia
metaData.links.id_ADW = 'Locusta_migratoria'; % ADW
metaData.links.id_Taxo = '18150'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_orthoptera = '74311'; % orthoptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Locusta_migratoria}}';
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
bibkey = 'TuZhan2012'; type = 'Article'; bib = [ ... 
'author = {X. Tu and Z. Zhang and D. L. Johnson and G. Cao and Z. Li and S. Gao and X. Nong and G. Wang}, ' ... 
'year = {2012}, ' ...
'title = {Growth, Development and Daily Change in Body Weight of Locusta migratoria manilensis (Orthoptera: Acrididae) Nymphs at Different Temperatures}, ' ...
'journal = {Journal of Orthoptera Research}, ' ...
'doi = {10.1665/034.021.0201}, ' ...
'volume = {21}, ' ...
'number = {2}, '...
'pages = {133--140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Roon1936'; type = 'Article'; bib = [ ... 
'author = {M. L. Roonwal}, ' ... 
'year = {1936}, ' ...
'title = {Studies on the Embryology of the {A}frican Migratory Locust, \emph{Locusta migratoria migratorioides} {R}. and {F}. I. {T}he Early Development, with a New Theory of Multi-PhasedGastrulation among Insects}, ' ...
'journal = {Philosophical Transactions of the Royal Society of London. Series B, BiologicalSciences}, ' ...
'volume = {226}, ' ...
'number = {538}, '...
'pages = {391--421}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Clar1957'; type = 'Article'; bib = [ ... 
'author = {Clarke, K. U.}, ' ... 
'year = {1957}, ' ...
'title = {The relationship of oxygen consumption to age and weight during post-embryonic growth of \emph{Locusta migratoria} {L}.}, ' ...
'journal = {J. Exptl. Biol.}, ' ...
'volume = {34}, ' ...
'pages = {29--41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'waza'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.waza.org/en/zoo/visit-the-zoo/invertebrates-house/insects/locusta-migratoria}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

