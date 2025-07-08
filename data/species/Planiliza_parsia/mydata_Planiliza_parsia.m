function [data, auxData, metaData, txtData, weights] = mydata_Planiliza_parsia
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Planiliza_parsia'; 
metaData.species_en = 'Goldspot mullet'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 04 12];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 04 12];

%% set data
% zero-variate data

data.am = 6*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Mugil_cephalus';
  
data.Lp  = 9.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 23.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'Saro1957';
  comment.Wwb = 'based on egg diameter of 0.7 mm of Mugil_cephalus: pi/6*0.07^3';
data.Wwp = 8.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01230*Lp^2.92, see F1';
data.Wwi = 124;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01230*Li^2.92, see F1; max published weight 97.66 g';
    
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), std length (cm)
    1  6.068
    2 11.245
    3 16.844
    4 20.622
    5 23.940];
data.tL(:,1) = (data.tL(:,1) - 0.3) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Saro1957';

% length-weight
data.LW = [ ... % std length (cm), wet weight (g)
4.553	3.949
4.941	2.026
5.329	2.516
5.473	3.967
5.668	2.522
5.813	3.491
6.055	4.461
6.295	8.328
6.393	6.398
6.732	5.922
6.926	6.891
7.119	8.343
7.409	10.280
7.459	6.419
7.652	8.836
7.941	11.739
7.942	10.290
8.183	12.226
8.184	10.778
8.377	12.713
8.569	16.096
8.571	12.234
8.619	13.200
8.763	15.617
8.957	16.103
9.053	18.519
9.199	15.625
9.200	13.694
9.390	21.905
9.490	15.631
9.536	20.459
9.683	17.565
9.729	22.394
9.874	24.328
9.875	20.948
10.068	23.849
10.069	21.435
10.262	22.887
10.309	27.233
10.359	23.854
10.503	24.823
10.551	27.720
10.552	23.858
10.745	27.724
10.841	28.208
10.937	29.659
11.032	36.419
11.033	32.074
11.036	26.764
11.229	27.733
11.323	35.459
11.516	37.394
11.517	33.049
11.519	29.187
11.713	29.191
11.758	37.881
11.808	34.503
11.809	30.641
12.001	35.955
12.046	42.714
12.243	34.994
12.291	36.926
12.337	42.237
12.581	38.380
12.627	44.174
12.725	41.279
12.773	42.246
12.817	53.350
12.869	46.110
12.872	38.386
12.916	47.559
13.064	41.286
13.108	52.873
13.305	46.118
13.306	43.222
13.399	53.361
13.444	60.121
13.493	58.673
13.639	57.228
13.642	50.469
13.690	51.919
13.785	56.265
13.928	62.061
13.931	54.337
14.021	71.718
14.027	56.270
14.027	55.787
14.120	66.892
14.122	62.065
14.171	60.135
14.314	66.896
14.414	57.726
14.458	69.313
14.553	72.694
14.599	79.936
14.646	81.868
14.702	65.455
14.754	55.801
14.797	69.319
14.891	75.114
14.944	64.977
14.990	71.737
14.993	64.013
15.035	78.979
15.038	73.186
15.183	72.223
15.276	82.846
15.381	64.020
15.424	75.124
15.567	80.920
15.618	75.128
15.711	84.785
15.720	64.027
15.803	96.373
15.905	85.272
15.958	74.169
16.000	88.653
16.003	81.412
16.005	76.584
16.098	86.724
16.238	99.278
16.283	106.520
16.438	84.799
16.679	87.218
16.724	96.874
16.916	100.257
17.060	102.191
17.305	97.368
17.400	100.749
17.543	107.027
17.781	116.204
17.881	110.413
18.166	122.488
18.216	120.075
18.789	139.396
19.033	134.573
19.177	137.956
19.504	168.858
19.798	160.657
20.617	172.259
20.848	198.333
20.950	186.748
21.145	183.373
21.568	214.278
21.618	209.934
22.005	211.872
22.290	226.843
22.433	230.708
22.914	239.407
22.916	235.545
23.057	244.720
23.202	247.137
23.345	253.415
23.584	260.661
23.586	254.868
23.730	257.768
23.823	267.907
24.016	269.359
24.159	275.155
24.497	279.024
24.575	324.887
24.640	284.820
24.689	281.924
24.914	324.411
25.022	297.862
25.027	285.310
25.597	311.873];
units.LW   = {'cm', 'g'};  label.LW = {'std length','wet weight'};  
bibkey.LW = 'Saro1957';

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
10.083	51121.076
10.219	40358.744
10.712	45739.910
10.803	39461.883
10.846	52914.798
11.071	45739.910
11.160	55605.381
11.607	69955.157
11.786	69955.157
11.878	58295.964
12.145	72645.740
12.236	69058.296
12.456	95067.265
12.552	58295.964
12.589	107623.318
12.597	56502.242
12.774	71748.879
12.862	83408.072
12.948	109417.040
13.048	39461.883
13.087	78923.767
13.121	154260.090
13.262	113004.484
13.308	107623.318
13.435	158744.395
13.488	104035.874
13.532	110313.901
13.533	99551.570
13.537	74439.462
13.713	99551.570
13.802	103139.013
13.851	77130.045
13.940	80717.489
14.210	78923.767
14.335	147982.063
14.572	63677.130
14.592	225112.108
14.608	119282.511
14.652	129147.982
14.660	71748.879
14.786	130941.704
14.791	95964.126
14.879	111210.762
14.923	116591.928
14.965	136322.870
15.018	81614.350
15.062	88789.238
15.064	72645.740
15.101	128251.121
15.194	108520.179
15.202	56502.242
15.285	98654.709
15.414	136322.870
15.500	165022.422
15.550	126457.399
15.587	182959.641
15.588	172197.309
15.603	77130.045
15.689	101345.291
15.814	166816.143
15.864	129147.982
16.042	143497.758
16.050	89686.099
16.094	97757.848
16.135	123766.816
16.137	109417.040
16.217	174887.892
16.267	138116.592
16.491	144394.619
16.497	105829.596
16.584	121973.094
16.764	121973.094
16.986	136322.870
17.110	207174.888
17.336	199103.139
17.388	149775.785
17.660	137219.731
17.839	135426.009
18.100	196412.556
18.316	252017.937
18.410	225112.108
18.766	243946.188
19.131	208071.749
19.389	283408.072
19.743	320179.372
19.840	273542.601
19.908	118385.650
20.646	284304.933
20.815	360538.117
21.314	326457.399
21.453	295067.265
21.480	418834.081
21.530	384753.363
21.756	370403.587
21.802	366816.143
22.071	366816.143
22.334	411659.193
22.776	459192.825
22.873	410762.332
23.542	443946.188
23.851	478026.906
23.939	490582.960
24.067	532735.426
24.235	614349.776
24.688	586547.085
24.689	577578.475
24.956	597309.417
25.094	575784.753
25.409	570403.587];
units.LN   = {'cm', '#'};  label.LN = {'std length', 'fecundity'};  
temp.LN    = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Saro1957'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^2.92';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TVC3'; % Cat of Life
metaData.links.id_ITIS = '170392'; % ITIS
metaData.links.id_EoL = '211214'; % Ency of Life
metaData.links.id_Wiki = 'Planiliza_parsia'; % Wikipedia
metaData.links.id_ADW = 'Planiliza_parsia'; % ADW
metaData.links.id_Taxo = '1287612'; % Taxonomicon
metaData.links.id_WoRMS = '1509460'; % WoRMS
metaData.links.id_fishbase = 'Planiliza-parsia'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Planiliza_parsia}}';
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
bibkey = 'Saro1957'; type = 'Article'; bib = [ ... 
'author = {Sarojini, K. K.}, ' ... 
'year = {1957}, ' ...
'title = {Biology and Fisheries of the Grey Mullet of {B}engal. {I}. {B}iology of \emph{Mugil parsia} {H}amilton with notes on its fishery in {B}engal}, ' ...
'journal = {Ind. J. Fish}, ' ...
'volume = {4(2)}, ' ...
'pages = {160-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Planiliza-parsiahtml}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

