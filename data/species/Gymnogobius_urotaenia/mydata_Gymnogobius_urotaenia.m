function [data, auxData, metaData, txtData, weights] = mydata_Gymnogobius_urotaenia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Oxudercidae';
metaData.species    = 'Gymnogobius_urotaenia'; 
metaData.species_en = 'Big-head Far East goby'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'LN'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.ab = 10;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'KolpDemi2011';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'KolpDemi2011';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'KolpDemi2011'; 
data.Li  = 17.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'KolpDemi2011';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';

% uni-variate data
% time-length
data.tL_f = [... %  yr class (yr), total length (cm)
    1 7.51
    2 9.86
    3 11.83
    4 13.20];
data.tL_f(:,1) = 365 * (0.5 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(10);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KolpDemi2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [... %  yr class (yr), total length (cm)
    1 7.14
    2 9.76
    3 11.87
    4 13.38
    5 14.5];
data.tL_m(:,1) = 365 * (0.5 + data.tL_m(:,1)); 
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(10);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'KolpDemi2011';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [... %  yr class (yr), wet weight (g)
    1 4.1
    2 8.5
    3 14.6
    4 20.3];
data.tW_f(:,1) = 365 * (0.5 + data.tW_f(:,1));
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(10);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'KolpDemi2011';
comment.tW_f = 'Data for females';
%
data.tW_m = [... %  yr class (yr), wet weight (g)
    1 3.6
    2 8.6
    3 16.0
    4 21.0
    5 23.9];
data.tW_m(:,1) = 365 * (0.5 + data.tW_m(:,1)); 
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(10);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'KolpDemi2011';
comment.tW_m = 'Data for males';

% length-weight
data.LW_f = [... %  total length(cm), wet weight (g)
4.962	1.146
5.074	1.146
5.426	1.146
5.795	1.819
5.875	1.819
5.891	1.078
6.099	2.156
6.276	2.628
6.436	1.617
6.724	2.898
6.933	3.841
7.141	2.830
7.413	3.908
7.862	5.189
8.022	4.852
8.247	6.739
8.391	5.526
8.631	4.852
8.647	7.143
8.824	7.143
8.936	7.480
9.096	5.930
9.224	7.345
9.449	6.941
9.689	8.356
9.769	9.299
9.817	10.377
9.929	6.671
9.994	8.221
10.090	7.615
10.250	10.849
10.554	12.129
11.115	15.499
11.115	11.321
11.404	11.792
11.532	17.251
11.917	14.623
11.933	10.916
12.205	20.822
12.237	16.644
12.349	21.968
12.349	22.574
13.006	19.542
13.215	22.709
13.407	18.127
13.535	23.383];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'KolpDemi2011';
comment.LW_f = 'Data for females';
%
data.LW_m = [... %  total length(cm), wet weight (g)
4.369	0.674
4.721	0.741
5.026	1.011
5.090	1.078
5.250	1.078
5.346	1.280
5.426	1.280
5.619	1.348
5.747	1.752
5.955	1.550
5.987	1.887
6.147	1.954
6.244	2.022
6.244	2.022
6.324	2.358
6.372	2.291
6.532	2.628
6.596	2.291
6.692	2.830
6.853	2.628
6.885	2.898
7.109	3.369
7.173	3.571
7.301	3.571
7.397	3.976
7.462	3.976
7.574	3.706
7.718	4.582
7.766	4.852
7.878	4.245
7.878	4.043
7.894	5.997
7.926	4.650
8.071	4.717
8.167	4.919
8.167	5.458
8.279	4.852
8.327	5.323
8.423	5.997
8.439	5.458
8.519	4.987
8.551	5.660
8.631	5.997
8.712	6.941
8.776	6.132
8.824	6.671
8.872	5.256
8.968	5.863
9.032	6.671
9.032	7.615
9.128	6.873
9.128	6.806
9.160	5.660
9.224	8.086
9.224	7.480
9.256	6.402
9.288	7.749
9.353	6.402
9.433	8.423
9.481	6.671
9.497	7.615
9.545	8.693
9.593	6.132
9.609	7.412
9.609	8.019
9.737	7.682
9.753	9.097
9.785	10.108
9.849	9.232
9.881	7.951
9.897	8.356
9.929	7.278
9.978	8.895
10.026	8.288
10.122	10.445
10.154	11.456
10.170	9.164
10.218	9.906
10.394	10.040
10.442	10.714
10.458	9.838
10.635	12.264
10.683	11.725
10.763	9.164
10.795	11.388
10.939	12.601
10.939	9.906
11.115	12.668
11.163	13.881
11.163	11.927
11.244	15.566
11.308	12.332
11.340	10.984
11.420	13.140
11.436	14.151
11.452	15.229
11.548	15.094
11.612	11.388
11.708	17.453
11.708	18.598
11.724	13.410
11.853	14.623
12.045	15.364
12.125	13.949
12.221	20.687
12.285	18.666
12.429	13.544
12.606	15.566
12.686	18.801
12.942	18.801
13.071	18.261
13.311	23.652];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m  = 'KolpDemi2011';
comment.LW_m = 'Data for males';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
8.164	1040.773
8.169	1115.880
8.369	1619.099
8.369	1686.695
8.461	1912.017
8.482	973.176
8.487	1243.563
8.584	935.623
8.779	950.644
8.871	1311.159
9.076	1957.082
9.132	1303.648
9.276	1799.356
9.276	1604.077
9.378	1206.009
9.470	1528.970
9.475	1686.695
9.670	1626.610
9.967	2204.936
10.459	2550.429
11.166	1889.485
11.468	2768.241
11.566	2219.957
11.765	3376.610
11.852	3864.807
12.734	3218.884];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(10);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KolpDemi2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
set3 = {'LW_f','LW_m'}; subtitle3 = {'Data for females, males'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6L787'; % Cat of Life
metaData.links.id_ITIS = '637488'; % ITIS
metaData.links.id_EoL = '46576579'; % Ency of Life
metaData.links.id_Wiki = 'Gymnogobius'; % Wikipedia
metaData.links.id_ADW = 'Gymnogobius_urotaenia'; % ADW
metaData.links.id_Taxo = '175586'; % Taxonomicon
metaData.links.id_WoRMS = '280967'; % WoRMS
metaData.links.id_fishbase = 'Gymnogobius-urotaenia'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnogobius}}';
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
bibkey = 'KolpDemi2011'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945211010073}, ' ...
'author = {E. V. Kolpakov and E. I. Deminab}, ' ... 
'year = {2011}, ' ...
'title = {Biology, Abundance, and Life Cycle of Big-Head {F}ar {E}ast Goby \emph{Gymnogobius urotaenia} ({G}obiidae) from the {S}erebryanka {R}iver ({C}entral {P}rimor''e)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {51}, ' ...
'pages = {73-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Gymnogobius-urotaenia.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

