function [data, auxData, metaData, txtData, weights] = mydata_Mugil_curema

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Mugil_curema'; 
metaData.species_en = 'White mullet'; 

metaData.ecoCode.climate = {'MA','MB','MC','Cfa'};
metaData.ecoCode.ecozone = {'MC','TH','TN'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 23*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 19.7;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 91;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
data.Lim  = 91;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male';    bibkey.Lim  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';               bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 0.9 mm for M. cephalus: pi/6*0.09^3';
data.Wwp = 77.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^2.96, see F1';
data.Wwi = 7.22e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^2.96, see F1; max reported weight: 680 g';
data.Wwim = 7.22e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.01148*Lim^2.96, see F1';
  
data.Ri  = 4e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time - length
data.tL_f = [ ... % yr class (yr), total length (cm)
    0 18.7
    1 22.4
    2 25.1
    3 27.6
    4 29.9
    5 32.0];
data.tL_f(:,1) = (data.tL_f(:,1) + 1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  bibkey.tL_f = 'AguiGall1999';
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % yr class (yr), total length (cm)
    0 17.6
    1 22.1
    2 25.0
    3 27.6
    4 30.0
    5 32.1];
data.tL_m(:,1) = (data.tL_m(:,1) + 1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  bibkey.tL_m = 'AguiGall1999';
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males';

% length - weight
data.LWw = [ ...  % total length (cm), wet weight (g)
16.321	33.503
17.624	44.377
18.156	49.132
19.804	62.052
20.469	64.794
20.629	72.895
20.711	87.057
20.815	68.862
20.816	78.300
20.897	85.047
21.001	73.594
21.214	76.979
21.346	72.943
21.401	80.362
21.425	63.510
21.453	78.343
21.693	81.730
21.694	88.472
21.931	75.679
22.040	93.889
22.064	79.059
22.173	97.268
22.252	89.184
22.254	104.015
22.440	101.331
22.492	95.267
22.570	87.857
22.732	104.048
22.809	85.176
22.837	93.942
22.918	104.060
22.999	112.830
23.101	86.544
23.156	96.660
23.212	114.192
23.237	102.733
23.342	95.999
23.529	101.405
23.530	108.146
23.559	126.351
23.580	91.970
23.793	92.658
23.821	105.469
23.849	111.539
23.953	100.759
24.065	136.497
24.089	116.948
24.165	93.358
24.220	108.193
24.298	95.389
24.381	117.642
24.407	112.925
24.485	103.492
24.511	96.752
24.513	114.280
24.541	123.046
24.645	108.896
24.676	140.583
24.728	127.778
24.753	119.689
24.807	123.738
24.832	114.976
24.883	100.822
24.965	117.681
24.967	131.839
25.019	124.427
25.022	139.932
25.097	109.600
25.177	114.999
25.181	140.617
25.313	136.581
25.315	146.694
25.344	163.550
25.361	103.551
25.475	153.446
25.574	103.565
25.607	145.365
25.738	133.239
25.871	137.293
25.898	142.014
26.030	135.281
26.085	144.723
26.113	159.556
26.162	131.245
26.191	145.404
26.298	152.827
26.321	124.514
26.322	129.908
26.349	138.673
26.350	144.741
26.404	146.767
26.458	151.490
26.513	166.325
26.533	125.877
26.535	136.664
26.615	138.017
26.692	123.191
26.694	133.303
26.749	145.442
26.749	147.464
26.797	109.041
26.801	140.052
26.831	160.279
26.858	167.022
26.885	171.069
26.936	156.915
26.959	129.951
26.966	179.165
27.068	145.463
27.071	167.037
27.180	185.246
27.203	162.327
27.229	156.261
27.254	147.498
27.311	175.817
27.330	121.211
27.389	167.058
27.492	142.121
27.498	181.223
27.523	169.764
27.524	177.854
27.575	163.026
27.599	150.218
27.600	153.589
27.601	161.679
27.655	167.750
27.735	167.081
27.764	187.308
27.785	147.534
27.870	181.248
27.872	196.079
27.916	134.060
27.953	203.501
28.004	190.021
28.029	177.888
28.030	186.652
28.107	173.174
28.157	145.537
28.164	194.077
28.165	201.492
28.182	139.471
28.183	142.842
28.215	181.945
28.220	212.283
28.243	188.689
28.245	206.891
28.293	172.512
28.318	159.705
28.319	168.469
28.350	196.786
28.453	174.546
28.458	209.602
28.507	181.965
28.561	188.036
28.586	176.577
28.589	193.431
28.614	183.321
28.711	121.979
28.723	203.553
28.796	162.434
28.801	190.075
28.802	198.165
28.880	185.361
28.961	194.805
28.984	169.862
28.985	181.997
29.017	219.078
29.038	175.933
29.042	208.293
29.067	193.463
29.176	215.718
29.225	183.362
29.230	221.115
29.250	172.577
29.280	198.197
29.362	216.405
29.441	211.017
29.456	132.816
29.515	170.572
29.522	220.460
29.599	198.218
29.599	202.263
29.706	206.990
29.761	215.757
29.762	225.870
29.863	193.517
29.892	203.631
29.893	212.396
29.998	208.358
30.005	253.527
30.128	186.793
30.183	197.584
30.321	231.975
30.322	238.717
30.430	250.185
30.452	221.871
30.531	214.461
30.587	236.712
30.640	232.671
30.717	214.474
30.773	234.702
30.880	241.451
30.954	203.703
30.955	212.467
31.066	246.183
31.116	223.265
31.145	237.424
31.197	231.360
31.227	253.609
31.329	225.975
31.442	269.803
31.492	246.885
31.516	232.055
31.730	244.205
31.763	288.027
31.812	261.064
31.894	272.530
31.945	259.051
32.345	271.887
32.531	271.899
32.881	300.237
32.953	249.006
32.973	205.862
33.865	313.113
34.110	349.534
34.154	291.559
34.316	309.772
37.007	361.864];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  bibkey.LWw = 'AguiGall1999';
temp.LWw    = C2K(25);  units.temp.LWw = 'K'; label.temp.LWw = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwi = 0 * weights.Wwi;
weights.Wwim = 0 * weights.Wwim;
weights.Wwp = 0 * weights.Wwp;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ww in g = 0.01148*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44J4Q'; % Cat of Life
metaData.links.id_ITIS = '170336'; % ITIS
metaData.links.id_EoL = '46571514'; % Ency of Life
metaData.links.id_Wiki = 'Mugil_curema'; % Wikipedia
metaData.links.id_ADW = 'Mugil_curema'; % ADW
metaData.links.id_Taxo = '46305'; % Taxonomicon
metaData.links.id_WoRMS = '159416'; % WoRMS
metaData.links.id_fishbase = 'Mugil-curema'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mugil_curema}}';
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
bibkey = 'AguiGall1999'; type = 'Article'; bib = [ ... 
'author = {Ana L. Iba\~{n}ez Aguirre and Manuel Gallardo-Cabello and Xavier Chiappa Carrara}, ' ... 
'year = {1999}, ' ...
'title = {Growth analysis of striped mullet, \emph{Mugil cephalus}, and white mullet, \emph{M. curema} ({P}isces: {M}ugilidae), in the {G}ulf of {M}exico}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {97}, ' ...
'pages = {861-872}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mugil-curema.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/mugil cephalus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

