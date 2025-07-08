  function [data, auxData, metaData, txtData, weights] = mydata_Dorosoma_cepedianum

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Dorosoma_cepedianum'; 
metaData.species_en = 'American gizzard shad';

metaData.ecoCode.climate = {'Cfa','Dfa','MC'};
metaData.ecoCode.ecozone = {'THn','MAW','MAg'};
metaData.ecoCode.habitat = {'0iMpe', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.ab = 73/24; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'WallYeag1990';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 36.1;   units.Lp = 'cm';   label.Lp = 'std length at puberty';bibkey.Lp = 'fishbase';
data.Li = 56/0.95; units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on FL 56 cm and F1';

data.Wwb = 2.2e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*0.075^3';
data.Wwi = 2.24e3;   units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00891*Li^3.05, see F1';
  
data.Ri = 5.4e5/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), standard length (cm) 
0.562	14.778
0.661	13.954
0.668	11.835
0.723	15.617
0.769	15.712
0.807	18.110
0.822	13.503
1.061	21.165
1.107	22.458
1.291	26.063
1.322	28.000
1.345	26.896
1.414	27.729
1.751	28.577
1.813	28.673
1.912	28.309
1.989	27.945
2.050	29.146
2.073	28.503
2.173	30.075
2.234	30.447
2.326	32.111
2.388	32.852
2.487	33.502
2.579	33.508
2.671	35.909
2.740	33.056
2.817	33.705
2.916	33.434
2.993	33.162
3.062	33.719
3.154	34.461
3.353	36.223
3.736	37.166
3.904	36.899
4.012	36.167
4.088	36.540
4.149	35.991
4.333	36.093
5.000	38.065
5.092	38.531
5.168	39.365];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'standard length', 'female'};  bibkey.tL_f = 'Bodo1964';
temp.tL_f = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), standard length (cm) 
0.085	1.941
0.162	4.434
0.239	9.876
0.325	15.411
0.332	13.936
0.333	14.674
0.394	15.875
0.493	15.788
0.907	17.010
0.983	17.659
0.999	16.922
1.084	21.351
1.145	21.170
1.168	21.817
1.199	22.648
1.268	23.573
1.383	26.345
1.491	26.904
1.567	27.276
1.674	27.375
1.751	27.932
1.920	27.665
1.988	27.115
2.149	28.046
2.249	29.157
2.326	29.807
2.418	31.102
2.479	31.751
2.571	31.387
2.717	31.487
2.801	30.202
2.908	31.129
3.000	30.674
3.084	31.139
3.153	32.157
3.253	32.254
3.436	30.237
3.751	32.927
3.919	33.489
3.995	31.558
4.080	33.591
4.915	35.664
6.056	35.820
6.086	32.780
6.155	36.194];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'standard length', 'male'};  bibkey.tL_m = 'Bodo1964';
temp.tL_m = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males';

% time - wet weight
data.tWw_f = [ ... % time since birth (yr), wet weight (cm) 
0.121	30.968
0.207	49.027
0.302	138.893
0.465	72.435
0.586	198.232
0.682	352.200
0.794	408.754
0.795	442.088
0.975	480.782
1.061	496.277
1.105	583.512
1.397	478.758
1.552	496.905
1.630	573.928
1.699	694.530
1.820	728.018
1.872	781.931
1.977	1005.142
2.053	920.625
2.061	815.507
2.124	1166.869
2.303	867.099
2.388	841.568
2.457	757.040
2.551	782.802
2.647	854.719
2.821	1167.763
3.226	1263.154
3.371	1078.724
3.473	922.445
3.567	937.951
3.680	1025.275
4.480	1054.506
4.566	1087.950
4.663	1357.304];
data.tWw_f(:,1) = 365 * data.tWw_f(:,1);
units.tWw_f = {'d', 'g'};     label.tWw_f = {'time since birth', 'wet weight', 'female'};  bibkey.tWw_f = 'Bodo1964';
temp.tWw_f = C2K(24);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g) 
0.121	48.917
0.215	64.423
0.301	51.713
0.396	85.168
0.543	172.535
0.604	211.074
0.647	254.720
0.725	300.973
0.820	413.916
0.889	434.517
0.966	421.796
0.984	473.100
1.096	470.679
1.147	496.387
1.259	478.581
1.396	409.526
1.508	389.157
1.577	402.066
1.646	450.872
1.733	530.470
1.801	510.046
1.889	740.927
1.975	751.294
2.079	823.222
2.241	705.481
2.242	731.123
2.335	577.397
2.413	631.343
2.464	546.793
2.576	587.962
2.654	667.549
2.714	636.857
2.929	716.620
3.223	804.175
3.428	709.568
3.514	663.524
3.583	696.945
3.817	897.245
3.910	720.442
4.435	813.423];
data.tWw_m(:,1) = 365 * data.tWw_m(:,1);
units.tWw_m = {'d', 'g'};     label.tWw_m = {'time since birth', 'wet weight', 'male'};  bibkey.tWw_m = 'Bodo1964';
temp.tWw_m = C2K(24);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
comment.tWw_m = 'Data for males';

% length - weight
data.LWw = [ ... % standard length (cm), wet weight (g)
9.481	25.333
10.749	23.340
11.422	34.414
12.543	45.441
13.589	52.760
14.486	67.526
15.383	82.291
16.505	98.890
17.553	122.928
18.525	137.685
19.572	158.008
20.547	196.913
21.519	213.528
22.419	250.585
23.618	285.751
24.518	328.380
25.494	374.716
26.472	432.198
27.523	484.099
28.423	523.012
29.326	580.502
30.526	632.387
31.353	682.454
32.335	773.371
33.380	776.975
34.288	875.331
35.564	936.496
36.472	1036.709
37.610	1185.195];
units.LWw = {'cm', 'g'};  label.LWw = {'standard length', 'wet weight'};  bibkey.LWw = 'Bodo1964';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.Li = weights.Li * 3;
weights.Wwb = weights.Wwb * 3;
% weights.Ri = weights.Ri * 3;
% weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males ase assumed to differ froam females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight weight (in g) = 0.00891*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DGD5'; % Cat of Life
metaData.links.id_ITIS = '161737'; % ITIS
metaData.links.id_EoL = '46562459'; % Ency of Life
metaData.links.id_Wiki = 'Dorosoma_cepedianum'; % Wikipedia
metaData.links.id_ADW = 'Dorosoma_cepedianum'; % ADW
metaData.links.id_Taxo = '173385'; % Taxonomicon
metaData.links.id_WoRMS = '159600'; % WoRMS
metaData.links.id_fishbase = 'Dorosoma-cepedianum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Dorosoma_cepedianum}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{www.fishbase.org/summary/Dorosoma-cepedianum.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bodo1964'; type = 'Article'; bib = [ ...  
'author = {Anthony Bodola}, ' ...
'year = {1964}, ' ...
'title  = {Life history of the gizzard shad, \emph{Dorosoma cepedianum} ({L}e {S}ueur), in western {L}ake {E}rie}, ' ...
'journal = {Fishery Bulletin of the  Fish and Wildlife Service}, ' ...
'volume = {65}, ' ...
'pages = {391-425}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

  