  function [data, auxData, metaData, txtData, weights] = mydata_Osmerus_mordax

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osmeriformes'; 
metaData.family     = 'Osmeridae';
metaData.species    = 'Osmerus_mordax'; 
metaData.species_en = 'Rainbow smelt';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN', 'MAN'};
metaData.ecoCode.habitat = {'0jFr', 'jiMcp'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 05 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 11]; 

%% set data
% zero-variate data
data.ab = 27; units.ab = 'd';       label.ab = 'age at birth';           bibkey.ab = 'QuigIgoe2004'; 
  temp.ab = C2K(7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 2*365;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'gma';
  temp.ap = C2K(16.5); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 7*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.12;   units.L0 = 'cm';  label.Lb = 'egg diameter';           bibkey.L0 = 'gma'; 
data.Lb = 0.26;   units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'gma'; 
data.Lp = 19.5;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 35.6;   units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 2.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.6 to 0.9 mm: pi/6*0.075^3';

data.Ri = 45e3/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';  
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  bibkey.Ri = {'gma'};   
  comment.Ri= 'temps are guessed';
    
% uni-variate data
% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g) for females
23.19 112.7
20.67  88.1
25.04 158.4
25.61 147.5
17.85  49.5
15.84  50.1];
units.LW_f = {'cm', 'g'}; label.LW_f = {'total length', 'wet weight', 'female'};  
temp.LW_f = C2K(15); units.temp.LW_f = 'K'; label.temp.LW_f = 'temperature';
bibkey.LW_f = {'MaitLyle2010'};
comment.LW_f = 'Data for females for O. eperlanus';
%
data.LW_m = [ ... % total length (cm), wet weight (g) for males
22.42 107.0
20.48  82.4
23.43 121.4
23.57 118.2
17.63  45.4
14.33  31.9];
units.LW_m = {'cm', 'g'}; label.LW_m = {'total length', 'wet weight', 'male'};  
temp.LW_m = C2K(15); units.temp.LW_m = 'K'; label.temp.LW_m = 'temperature';
bibkey.LW_m = {'MaitLyle2010'};
comment.LW_m = 'Data for males for O. eperlanus';

% length-weight, reared under lab conditions at 9-15 C
data.LW = [ ... % total length (cm), wet weight (g)
2.174	0.026
2.233	0.026
2.606	0.025
2.665	0.025
3.037	0.168
3.156	0.072
3.499	0.119
3.618	0.231
3.663	0.231
3.842	0.246
3.901	0.214
3.976	0.374
4.155	0.518
4.169	0.293
4.273	0.309
4.408	0.437
4.333	0.517
4.393	0.597
4.512	0.581
4.527	0.340
4.616	0.468
4.706	0.612
4.840	0.612
4.899	0.644
4.914	0.532
5.033	0.772
5.093	0.836
5.167	0.803
5.048	0.980
5.331	0.931
5.331	1.011
5.406	0.867
5.554	0.818
5.510	0.899
5.540	1.027
5.599	0.994
5.704	1.138
5.793	1.122
5.778	1.410
5.779	1.491
5.853	1.218
5.897	1.330
5.942	1.266
6.016	1.137
5.986	1.073
6.151	1.281
6.031	1.330
5.987	1.410
6.091	1.474
6.002	1.506
6.195	1.425
6.299	1.345
6.315	1.569
6.300	1.697
6.359	1.697
6.360	1.841
6.077	1.730
6.047	1.762
6.151	1.954
6.598	1.649
6.494	1.745
6.464	1.905
6.539	2.017
6.658	2.017
6.658	2.129
6.732	1.889
6.732	1.969
6.821	1.888
6.807	2.049
6.851	2.097
6.911	2.241
6.807	2.241
6.866	2.305
7.000	1.968
7.089	1.984
7.090	2.128
7.417	2.159
7.298	2.384
7.179	2.448
7.269	2.560
7.388	2.576
7.299	2.720
7.180	2.801
7.180	2.897
6.986	2.785
6.956	2.737
6.852	2.657
6.897	2.881
7.403	2.720
7.507	2.784
7.507	2.704
7.581	2.655
7.582	2.783
7.671	2.831
7.388	2.896
7.478	2.880
7.463	2.992
7.508	3.056
7.597	3.088
7.389	3.120
7.493	3.264
7.597	3.264
7.687	3.312
7.791	3.328
7.880	3.408
7.791	3.456
7.805	2.975
7.895	2.975
7.895	3.231
7.984	3.263
8.312	3.374
8.089	3.631
8.089	3.775
8.000	3.696
8.253	3.695
8.164	3.903
8.462	4.031
8.670	4.062
8.373	4.287
8.194	4.208
8.492	4.511
8.656	4.527
8.790	4.927
8.909	4.943
8.894	4.815
9.058	4.958
8.300	5.505
8.627	5.520
8.508	5.729
8.836	5.552
8.895	5.504
8.999	5.423
9.014	5.535
8.792	6.193
9.178	5.599
9.506	5.678
9.223	5.839
9.208	5.967
9.224	6.224
9.090	6.561
9.521	6.159
9.507	6.527
9.582	6.687
9.373	6.816
9.894	6.895
9.805	7.199
10.283	8.143
10.284	8.512
8.316	6.418];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};
temp.LW = C2K(12); units.temp.LW = 'K'; label.temp.LW = 'temperature';
bibkey.LW = {'JoneMcCa2013'};
comment.LW = 'temp is 9 - 15 C';

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1.008	11.683
1.987	15.267
2.967	17.451
3.997	20.533
4.986	23.217];
data.tL(:,1) = (0.75 + data.tL(:,1)) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'QuigIgoe2004'};
comment.tL = 'temp is guessed';

% temperature-age at birth
data.Tab = [ ... % temperature (C), days to first hatch (dpf)
 5.1  42
10.9  18
14.9  13
18.3  10];
data.Tab(:,1) = C2K(data.Tab(:,1)); % convet C to K
units.Tab = {'K', 'd'}; label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = {'JoneMcCa2013'};
 
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
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Bas Kooijman: O. mordax and O. eperlanus are here treated as sufficiently similar in view of the large effect of varying environmental conditions (temp, salinity, food)';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Spawning is initiated at temperature 4-7C';
metaData.bibkey.F1 = 'QuigIgoe2004'; 
F2 = 'Landlocked populations and large parts of anadromous populations usually reproduce only once in their life. Juveniles prefer fresh or brackish water until they mature.';
metaData.bibkey.F2 = 'redlist'; 
metaData.facts = struct('F1',F1,'F2',F2);
                                 
%% Links
metaData.links.id_CoL = '74ZTP'; % Cat of Life
metaData.links.id_ITIS = '162041'; % ITIS
metaData.links.id_EoL = '357054'; % Ency of Life
metaData.links.id_Wiki = 'Osmerus_mordax'; % Wikipedia
metaData.links.id_ADW = 'Osmerus_mordax'; % ADW
metaData.links.id_Taxo = '502213'; % Taxonomicon
metaData.links.id_WoRMS = '126737'; % WoRMS
metaData.links.id_fishbase = 'Osmerus-mordax'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rainbow_smelt}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_Oe'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/European_smelt}}';  
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
bibkey = 'MaitLyle2010'; type = 'Techreport'; bib = [ ...  
'author = {P. Maitland and A. Lyle}, ' ...
'year = {2010}, ' ...
'title = {The smelt \emph{Osmerus eperlanus} in {S}cotland.}, ' ... 
'howpublished = {\url{https://www.fba.org.uk/journals/index.php/FF/article/viewFile/328/231}}, ' ...
'Institution = {Freshwater Biology Association}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'QuigIgoe2004'; type = 'Article'; bib = [ ...  
'author = {Quigley, D. T. G. and Igoe, F. and OConnor, W.}, ' ...
'year = {2004}, ' ...
'title = {The {E}uropean smelt \emph{Osmerus eperlanus} {L}. in {I}reland: General biology, ecology, distribution and status with conservation recommendations}, ' ... 
'publisher = {Royal Irish Academy}, ' ...
'journal = {Threatened Irish Freshwater Fishes}, ' ...
'volume = {104B(3)}, '...
'pages = {57--66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneMcCa2013'; type = 'Techreport'; bib = [ ...  
'author = {N. Jones and I. McCarthy}, ' ...
'year = {2013}, ' ...
'title = {Conservation aquaculture rearing techniques for the {E}uropean smelt \emph{Osmerus eperlanus}}, ' ... 
'howpublished = {\url{http://www.seafareproject.eu/index.php/download_file/view/16/72/}}, ' ...
'publisher = {Royal Irish Academy}, ' ...
'institution = {Seafare, Sustainable and Environmentally friendly Aquaculture for the Atlantic region of Europe}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gma'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.gma.org/fogm/osmerus_mordax.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'redlist'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/15631/0}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/253}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
