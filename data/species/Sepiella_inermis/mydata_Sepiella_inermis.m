function [data, auxData, metaData, txtData, weights] = mydata_Sepiella_inermis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiida'; 
metaData.family     = 'Sepiidae';
metaData.species    = 'Sepiella_inermis'; 
metaData.species_en = 'Spineless cuttlefish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 29]; 

%% set data
% zero-variate data

data.ab = 12.6;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Nabh1997';   
  temp.ab = C2K(28);     units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 60;     units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Nabh1997';   
  temp.tp = C2K(28);     units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 116;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Nabh1997';   
  temp.am = C2K(28);     units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 0.43;    units.Lb = 'cm';   label.Lb = 'mantle length at birth';   bibkey.Lb = 'Nabh1997';
data.Lp = 3.82;    units.Lp = 'cm';   label.Lp = 'mantle length at puberty';   bibkey.Lp = 'Nabh1997';
data.Li = 7.86;    units.Li = 'cm';   label.Li = 'mantle length at death';   bibkey.Li = 'Nabh1997';
  comment.Li = 'at 149 d';

data.Wwb = 0.04;    units.Wwb = 'g';   label.Wwb = 'weight at birth';   bibkey.Wwb = 'Nabh1997';
data.Wwi = 63.78;    units.Wwi = 'g';   label.Wwi = 'weight at death';   bibkey.Wwi = 'Nabh1997';
  comment.Wwi = 'at 149 d';

data.Ni  = 500; units.Ni  = '#';   label.Ni  = 'cum reprod at 87 d';     bibkey.Ni  = 'Nabh1997';   
  temp.Ni = C2K(28);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
  0 0.43
 10 0.86
 20 1.41
 30 2.00
 40 2.60
 50 3.12
 60 3.82
 70 4.61
 80 5.70
 90 6.10
100 6.33
130 6.82];
units.tL   = {'d', 'cm'};  label.tL = {'time time birth', 'mantle length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Nabh1997';

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
  0  0.04
 10  0.44
 20  1.12
 30  1.84
 40  3.46
 50  5.63
 60  9.96
 70 17.67
 80 29.26
 90 36.62
100 40.22
130 48.21];
units.tWw   = {'d', 'g'};  label.tWw = {'time time birth', 'wet weight'};  
temp.tWw   = C2K(28);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Nabh1997';

% length-weight
data.LWw = [ ... % mantle length (cm), wet weight (g)
0.403	0.491
0.512	0.039
0.636	0.049
0.760	0.826
0.837	1.292
0.884	0.682
0.976	1.303
1.070	1.157
1.178	1.165
1.271	3.475
1.302	0.867
1.426	0.416
1.535	0.425
1.550	1.040
1.612	1.352
1.705	1.666
1.705	1.205
1.814	0.753
1.860	1.524
1.922	0.915
2.000	1.382
2.108	2.004
2.155	1.393
2.232	2.013
2.279	1.096
2.325	1.560
2.341	2.329
2.418	3.563
2.449	2.491
2.495	4.490
2.495	3.262
2.527	2.497
2.619	4.039
2.619	3.118
2.697	4.045
2.759	3.128
2.789	5.740
2.805	4.821
2.820	5.743
2.852	3.596
2.883	4.212
2.945	5.138
2.976	4.066
2.991	5.449
3.052	9.598
3.069	4.994
3.098	14.514
3.115	6.379
3.177	5.617
3.239	6.542
3.254	8.386
3.271	3.628
3.285	9.156
3.285	7.314
3.286	5.164
3.394	7.015
3.410	5.788
3.425	7.017
3.518	6.257
3.548	12.399
3.579	10.253
3.703	10.569
3.703	10.109
3.780	12.571
3.781	6.738
3.796	9.348
3.797	8.581
3.827	10.272
3.889	13.040
3.950	15.654
3.951	9.667
3.967	11.050
4.013	9.365
4.028	12.743
4.075	9.830
4.121	13.979
4.136	15.361
4.137	11.524
4.182	16.132
4.183	11.681
4.199	10.761
4.245	14.909
4.246	11.532
4.276	14.297
4.307	16.142
4.323	12.766
4.462	15.693
4.476	21.067
4.492	17.077
4.523	17.540
4.524	14.931
4.538	18.769
4.553	22.455
4.585	20.922
4.601	17.546
4.601	15.704
4.632	15.860
4.646	22.769
4.646	21.694
4.663	17.858
4.693	19.395
4.741	15.715
4.755	22.931
4.786	19.249
4.787	17.253
4.787	16.179
4.818	18.177
4.864	19.101
4.879	20.484
4.926	18.185
4.984	37.839
5.050	20.804
5.063	29.862
5.066	18.963
5.125	29.407
5.142	22.346
5.174	18.358
5.174	17.744
5.188	27.109
5.204	25.882
5.249	32.486
5.249	31.105
5.250	27.113
5.252	18.671
5.374	26.509
5.388	30.962
5.434	33.422
5.452	22.370
5.481	32.197
5.590	32.819
5.590	30.517
5.605	31.286
5.700	25.920
5.715	25.307
5.775	35.597
5.775	34.522
5.792	30.839
5.793	26.234
5.807	29.612
5.807	29.152
5.821	38.670
5.821	37.749
5.824	25.315
5.837	34.680
5.917	26.551
5.931	33.306
5.963	29.164
5.991	39.144
6.070	33.777
6.070	33.317
6.084	38.998
6.101	35.008
6.109	68.934
6.114	44.680
6.115	41.610
6.148	30.099
6.162	39.618
6.194	33.480
6.269	45.766
6.272	30.416
6.286	40.395
6.287	34.561
6.303	33.488
6.331	44.082
6.332	42.087
6.344	56.057
6.379	39.174
6.408	46.852
6.440	41.635
6.457	36.263
6.471	45.321
6.501	45.938
6.565	41.184
6.595	45.791
6.608	53.621
6.609	49.323
6.625	47.329
6.627	40.728
6.655	50.708
6.672	46.258
6.703	48.102
6.716	55.625
6.718	49.485
6.735	39.815
6.765	48.260
6.828	43.199
6.903	53.951
6.949	56.104
6.951	47.968
6.968	38.759
7.026	56.109
7.027	54.728
7.075	47.977
7.120	52.893
7.153	44.299
7.182	55.354
7.227	57.967
7.401	46.467
7.663	52.781
7.723	59.387
7.785	62.462
7.878	62.776];
units.LWw   = {'cm', 'g'};  label.LWw = {'mantle length', 'wet weight'};  
bibkey.LWw = 'Nabh1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tWw = 3 * weights.tWw;
weights.Ni = 3 * weights.Ni;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'semelparous: death at first spawning; change to bentic form 5 d post hatch';
metaData.bibkey.F1 = 'Nabh1997'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YFYZ'; % Cat of Life
metaData.links.id_ITIS = '556565'; % ITIS
metaData.links.id_EoL = '46475521'; % Ency of Life
metaData.links.id_Wiki = 'Sepiella_inermis'; % Wikipedia
metaData.links.id_ADW = 'Sepiella_inermis'; % ADW
metaData.links.id_Taxo = '157678'; % Taxonomicon
metaData.links.id_WoRMS = '220314'; % WoRMS
metaData.links.id_molluscabase = '220314'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepiella_inermis}}';
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
bibkey = 'Nabh1997'; type = 'article'; bib = [ ...
'author = {Jaruwat Nabhitabhata}, ' ... 
'year = {1997}, ' ...
'title = {Life cycle of three cultured generations of spinless cuttlefish, \emph{Sepiella inermis} ({F}\''{e}russac \& {D}''{O}rbigny, 1848)}, ' ...
'journal = {Phuket Marine Biological Center Special Publication}, ' ...
'volume = {17(1)}, ' ...
'pages = {289-298}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Sepiella-inermis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

