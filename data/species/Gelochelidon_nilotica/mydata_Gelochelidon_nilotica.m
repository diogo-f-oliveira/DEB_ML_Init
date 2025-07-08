function [data, auxData, metaData, txtData, weights] = mydata_Gelochelidon_nilotica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Gelochelidon_nilotica'; 
metaData.species_en = 'Gull-billed tern'; 

metaData.ecoCode.climate = {'B', 'MA'};
metaData.ecoCode.ecozone = {'THp', 'MC'};
metaData.ecoCode.habitat = {'0iFm', 'xiMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 22.5;          units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Harr1975';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 28;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Harr1975';   
  temp.tx = C2K(40.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 84;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1825;        units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 16*365;      units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 27.5;       units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';  bibkey.Ww0 = 'BouzBouc2019';
data.Wwb = 21;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Ww0 and tW';
data.Wwi = 240;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '150 to 292 g  g';

data.Ri  = 3/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 2 to 5 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       21 % added from Wwb
2.056	18.561
2.057	21.649
2.058	30.144
2.095	26.669
3.010	20.118
3.085	22.822
3.086	24.752
3.087	25.525
3.086	32.474
3.923	29.011
3.924	30.942
3.925	34.417
3.962	35.961
4.000	37.506
4.001	41.753
4.914	36.361
4.952	33.272
4.953	40.608
4.954	43.311
4.955	45.242
5.905	38.691
5.905	51.046
5.905	54.135
5.943	44.869
5.981	42.553
6.019	40.237
6.971	57.238
7.010	55.695
7.048	41.795
7.048	47.973
7.886	53.390
8.000	56.480
8.000	62.272
8.000	63.816
8.038	49.531
8.952	54.563
8.952	56.880
8.952	68.463
8.990	62.286
8.990	66.533
9.981	73.882
10.019	79.674
10.019	83.149
10.057	66.547
10.057	69.250
10.095	64.231
10.971	72.738
11.048	75.441
11.048	83.550
11.086	77.372
11.124	86.639
11.124	89.728
11.924	88.195
11.962	94.759
11.962	97.848
11.962	100.551
11.962	102.095
11.962	109.045
12.952	107.514
12.990	89.754
12.990	95.159
12.990	95.932
12.990	97.862
12.990	109.831
13.943	115.250
13.943	124.902
13.981	103.667
13.981	111.775
15.010	131.867
15.010	141.133
15.010	142.291
15.048	120.670
15.048	128.778
15.086	125.690
15.962	126.861
16.000	134.583
16.000	136.900
16.038	148.483
16.914	145.406
16.914	146.565
16.914	147.723
16.952	151.198
16.990	156.218
16.990	157.377
16.990	158.535
17.067	136.142
17.943	148.509
17.943	153.143
17.943	155.073
17.943	160.479
17.943	164.340
17.981	143.491
19.010	159.335
19.010	167.829
19.010	172.462
19.086	147.367
19.086	156.247
20.000	154.715
20.000	167.071
20.000	168.615
20.000	170.159
20.000	170.159
20.000	175.565
20.952	166.698
20.952	168.628
20.952	177.508
20.952	182.528
20.990	160.134
20.990	173.262
21.905	184.471
21.905	186.402
21.905	189.877
21.981	192.581
22.019	165.554
22.019	177.909
23.010	192.595
23.010	197.228
23.010	199.545
23.048	188.734
23.086	174.835
23.086	183.716
23.962	168.670
23.962	198.785
23.962	200.330
24.000	180.253
24.000	183.728
24.038	190.292
24.952	174.089
25.029	199.572
25.029	201.503
25.067	183.743
25.067	185.673
25.067	189.148
25.905	172.944
25.943	187.616
25.943	189.933
25.943	197.655
25.981	199.586
27.048	191.878
27.048	195.353
27.048	198.442
27.086	173.346
27.086	186.473
27.086	188.790];
n = size(data.tW(:,1),1);
for i = 2:n % make sure that all times are unique
  if data.tW(i,1) <= data.tW(i-1,1)
    data.tW(i,1) = max(data.tW(i-1,1),data.tW(i,1)) + 1e-10;
  end
end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'AlbaMase2011';
comment.tW = 'hand-reared on insect-diet';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.Ww0 = weights.Ww0 * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Relative food intake reduced just after hatching';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3FJY7'; % Cat of Life
metaData.links.id_ITIS = '176882'; % ITIS
metaData.links.id_EoL = '45509307'; % Ency of Life
metaData.links.id_Wiki = 'Gelochelidon_nilotica'; % Wikipedia
metaData.links.id_ADW = 'Sterna_nilotica'; % ADW
metaData.links.id_Taxo = '168218'; % Taxonomicon
metaData.links.id_WoRMS = '148798'; % WoRMS
metaData.links.id_avibase = '87168739C37AC427'; % avibase
metaData.links.id_birdlife = 'common-gull-billed-tern-gelochelidon-nilotica'; % birdlife
metaData.links.id_AnAge = 'Gelochelidon_nilotica'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gelochelidon_nilotica}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gelochelidon_nilotica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlbaMase2011'; type = 'Article'; bib = [ ... 
'author = {N. Albano and J. A. Masero and J. M. S\''{a}nchez-Guzm\''{a}n and A. Villegas and F. Santiago-Quesada}, ' ... 
'year = {2011}, ' ...
'title = {Effects of diet on growth-related patterns of energy and macronutrient assimilation efficiency in a semi-precocial bird, the Gull-billed Tern \emph{Gelochelidon nilotica}}, ' ...
'journal = {Ardea}, ' ...
'volume = {99}, ' ...
'pages = {93-101}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BouzBouc2019'; type = 'Article'; bib = [ ... 
'doi = {10.2478/v10043-011-0035-x}, ' ...
'author = {Abdelhakim Bouzid and Abdennour Boucheker and Farrah Samraouiand Boudj\''{e}ma Samraoui}, ' ... 
'year = {2019}, ' ...
'title = {Breeding of the gull-Billed tern in the {S}ahara and an update on itS distribution in {A}lgeria}, ' ...
'journal = {Zoology and Ecology}, ' ...
'volume = {29(1)}, ' ...
'pages = {52-58}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Harr1975'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {C. Harrison}, ' ...
'year = {1975}, ' ...
'title  = {A field guide to the nests, eggs and nestlings of British and European birds}, ' ...
'publisher = {Collins, London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

