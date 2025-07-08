function [data, auxData, metaData, txtData, weights] = mydata_Genypterus_capensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ophidiiformes'; 
metaData.family     = 'Ophidiidae';
metaData.species    = 'Genypterus_capensis'; 
metaData.species_en = 'Kingklip'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', '0iMdb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 14];

%% set data
% zero-variate data

data.am = 30*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(9.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 67.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
  comment.Lp = 'based on Genypterus_blacodes: 90*150/200';
data.Li  = 180;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb  = 3.35e-5;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.4 mm of Genypterus_blacodes: pi/6*0.04^3';
data.Wwp = 791;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00224*Lp^3.16, see F1';
data.Wwi = 15e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'max published weight, based on 0.00224*Li^3.16, see F1, gives 30 kg';
 
data.Ri = 1e6/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess'; 
  temp.Ri = C2K(9.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Genypterus_blacodes: 1e6';

% uni-variate data
% time-length
data.tL_f = [ ... % time (d), length (cm)
2.026	34.253
2.150	29.270
2.152	28.025
2.156	25.534
2.162	21.797
2.998	41.726
3.014	31.762
3.035	54.182
3.046	47.954
3.050	45.463
3.058	40.480
3.063	37.367
3.066	35.498
3.090	56.050
3.998	67.260
4.002	64.769
4.005	62.900
4.006	62.278
4.010	59.786
4.015	57.295
4.090	46.708
4.100	40.480
4.151	44.840
4.197	51.690
5.016	82.206
5.021	44.217
5.141	76.601
5.144	74.733
5.149	71.619
5.153	69.128
5.160	64.769
5.163	62.900
5.928	90.925
5.964	69.128
5.991	87.811
5.994	85.943
6.012	74.733
6.015	72.865
6.057	82.829
6.063	79.093
6.091	62.278
6.906	94.662
7.000	72.865
7.034	87.189
7.061	70.996
7.095	85.320
7.098	83.452
7.100	82.206
7.104	79.715
7.110	76.601
7.871	106.495
7.922	75.356
7.980	110.231
7.993	102.758
7.999	99.021
8.002	97.153
8.007	94.039
8.013	90.302
8.014	90.302
8.021	85.943
8.027	82.206
8.082	84.075
8.909	108.986
8.960	113.345
8.972	105.872
8.986	97.153
8.991	94.662
8.996	91.548
9.000	89.057
9.039	100.267
9.068	82.829
9.875	120.196
9.886	113.345
9.892	109.609
9.954	107.117
10.018	103.381
10.022	101.512
10.029	97.153
10.033	94.662
10.041	89.680
10.883	105.872
10.888	102.758
10.897	97.153
10.933	110.854
10.936	108.986
10.982	115.836
10.984	114.591
11.079	92.171
11.938	133.274
11.961	118.950
11.970	113.968
11.975	110.854
11.988	102.758
11.990	101.512
12.041	105.872
12.212	107.740
12.768	121.441
12.830	118.950
12.854	104.626
12.892	116.459
12.894	115.214
12.959	110.854
13.838	139.502
13.851	132.028
13.915	128.292
13.936	115.214
13.940	113.345
14.004	109.609
14.008	107.117
14.036	125.178
14.041	122.064
14.043	120.819
14.801	117.705
14.806	114.591
14.810	112.100
14.831	134.520
14.869	111.477
14.897	129.537
14.966	122.687
15.020	125.178
16.009	122.687
16.013	120.196
16.059	127.046
16.065	123.932
16.845	141.993
16.868	128.292
16.968	137.633
16.973	135.142
16.977	132.651
16.989	125.178
17.901	133.897
17.995	146.975
18.026	128.292
18.042	118.950
18.088	125.801
18.089	125.178
18.092	123.310
18.939	136.388
18.947	132.028
18.952	128.915
19.072	126.423
19.940	126.423
19.992	130.160
19.997	127.046
20.729	139.502
21.147	132.028
21.154	127.669
22.001	140.747
22.012	133.897
22.045	149.466
22.046	148.843
23.851	142.616
24.941	148.843];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'total length'};  
temp.tL_f    = C2K(9.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Japp1990'; 
comment.tL_f = 'Data for South Coast';
%
data.tL_m = [ ...
1.935	33.218
2.000	26.438
2.003	25.205
2.049	27.669
2.057	23.971
2.082	36.911
2.960	59.685
2.974	52.907
3.043	44.278
3.044	43.662
3.048	41.813
3.140	47.356
3.868	68.287
3.874	65.205
3.879	62.741
3.947	54.728
3.953	76.911
3.958	49.182
3.992	57.808
4.811	84.281
4.816	81.816
4.820	79.968
4.827	76.887
4.834	73.189
4.891	70.723
4.896	68.258
4.900	66.409
4.925	54.085
4.954	65.175
5.063	62.091
5.846	81.171
5.855	76.858
5.861	73.777
5.866	71.312
5.874	67.614
5.878	65.766
5.885	62.068
5.890	84.867
5.937	86.715
5.982	89.794
6.791	96.550
6.796	94.085
6.798	92.852
6.806	89.155
6.865	85.456
6.920	83.606
6.923	82.374
6.979	79.907
7.002	68.815
7.034	78.057
7.038	76.208
7.042	74.360
7.046	72.511
7.863	100.217
7.865	74.337
7.894	84.811
7.898	82.962
7.905	79.881
7.923	95.902
7.941	87.275
7.978	94.052
8.037	90.353
8.079	70.017
8.813	87.866
8.881	105.118
8.945	98.954
8.950	96.489
8.952	95.257
8.957	92.792
8.961	90.943
8.973	85.397
8.978	82.932
8.983	80.467
8.991	101.418
9.797	109.406
9.842	112.486
9.909	105.089
9.916	101.392
9.921	98.927
10.036	93.378
10.037	92.762
10.823	110.609
10.853	95.820
10.879	108.143
10.883	106.294
10.899	98.283
10.942	102.596
11.844	113.662
11.852	109.964
11.857	107.499
11.862	105.035
11.866	103.186
11.884	94.559
11.920	101.952
12.803	97.614
12.873	113.633
12.875	112.401
12.879	110.552
13.687	117.307
13.691	115.459
13.799	112.991
13.825	125.314
13.853	111.757
13.858	109.292
13.883	122.231
13.923	102.512
14.813	119.741
14.857	123.437
14.874	115.426
14.938	109.262
16.754	125.848
16.810	123.382
16.872	118.451
17.688	121.509
17.786	123.971
17.799	117.808
18.657	125.179
18.665	121.481
19.746	120.835
19.823	133.157
20.837	139.906
20.844	136.825];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'total length'};  
temp.tL_m    = C2K(9.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Japp1990'; 
comment.tL_m = 'Data for South Coast';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 3 * weights.Ri;
weights.Wwb = 3 * weights.Wwb;

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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00224*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6KC6R'; % Cat of Life
metaData.links.id_ITIS = '165002'; % ITIS
metaData.links.id_EoL = '46565542'; % Ency of Life
metaData.links.id_Wiki = 'Genypterus'; % Wikipedia
metaData.links.id_ADW = 'Genypterus_capensis'; % ADW
metaData.links.id_Taxo = '174840'; % Taxonomicon
metaData.links.id_WoRMS = '278704'; % WoRMS
metaData.links.id_fishbase = 'Genypterus-capensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Genypterus}}';
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
bibkey = 'Payn1985'; type = 'Article'; bib = [ ... 
'doi = {10.1080/02541858.1985.11447913}, ' ...
'author = {A.I.L. Payne}, ' ... 
'year = {1985}, ' ...
'title = {Growth and stock differentiation of kingklip (\emph{Genypterus capensis}) on the south-east coast of {S}outh {A}frica}, ' ...
'journal = {South African Journal of Zoology}, ' ...
'volume = {20(2)}, ' ...
'pages = {49-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Japp1990'; type = 'Article'; bib = [ ... 
'doi = {10.1080/02541858.1985.11447913}, ' ...
'author = {D. W. Japp}, ' ... 
'year = {1990}, ' ...
'title = {A new study on age and growth of kinklip \emph{Genypterus capensis} off the south and west coasts of {S}outh {A}frica, with comment on its use for stock identification}, ' ...
'journal = {South African Journal of marine Science}, ' ...
'volume = {9}, ' ...
'pages = {223-237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Genypterus-capensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

