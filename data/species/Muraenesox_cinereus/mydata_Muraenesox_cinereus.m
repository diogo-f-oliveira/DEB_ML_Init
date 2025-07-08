function [data, auxData, metaData, txtData, weights] = mydata_Muraenesox_cinereus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Muraenesocidae';
metaData.species    = 'Muraenesox_cinereus'; 
metaData.species_en = 'Daggertooth pike conger'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 02];

%% set data
% zero-variate data

data.ab = 19;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(17.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(17.4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 93.2; units.Lp  = 'cm';  label.Lp  = 'total length puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 220;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.7-2.2 mm of Congresox_talabonoides: pi/6*0.2^3';
data.Wwp = 4.9e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00437*Lp^3.07, see F1';
data.Wwi = 67.9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00437*Li^3.07, see F1';
 
data.Ri  = 3848/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(17.4);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.081	27.314
1.153	26.081
1.333	32.222
1.333	30.378
1.370	27.610
1.387	32.527
1.406	31.604
1.407	26.072
1.425	25.456
1.442	32.218
1.532	31.600
1.551	30.984
1.568	34.672
1.586	34.671
1.586	33.442
1.642	26.677
1.782	48.803
1.870	60.173
1.892	45.418
1.945	48.489
1.982	46.644
2.017	53.097
2.049	68.158
2.143	54.937
2.452	50.622
2.509	40.476
2.632	54.918
2.636	39.549
2.708	42.620
2.754	74.893
2.794	59.522
2.796	51.838
2.827	73.660
2.833	49.992
2.867	57.368
2.869	50.606
2.882	69.048
2.883	64.744
2.903	58.289
2.905	52.141
2.956	63.205
2.971	76.114
2.988	81.031
2.994	55.519
3.011	60.744
3.012	58.592
3.015	44.145
3.027	71.809
3.027	69.964
3.028	65.968
3.032	49.677
3.137	63.505
3.175	56.434
3.191	65.347
3.209	68.113
3.214	47.211
3.245	70.263
3.283	62.885
3.283	60.118
3.287	44.135
3.297	78.253
3.555	62.260
3.590	65.947
3.608	67.790
3.642	73.937
3.645	62.871
3.680	68.710
3.711	88.688
3.718	61.024
3.719	57.950
3.731	83.769
3.734	67.785
3.738	54.261
3.768	78.850
3.769	73.932
3.808	64.709
3.808	62.557
3.822	81.307
3.827	59.790
3.863	59.481
3.865	51.489
3.877	76.694
3.912	81.303
3.933	70.852
3.946	90.523
3.970	65.625
3.982	94.518
3.986	76.997
4.038	86.831
4.060	68.695
4.093	82.526
4.116	63.468
4.189	61.620
4.279	62.232
4.298	60.079
4.308	92.046
4.315	63.767
4.316	62.230
4.317	54.546
4.331	74.525
4.353	56.389
4.365	84.360
4.370	60.999
4.387	68.068
4.389	57.002
4.552	56.996
4.606	60.068
4.674	78.815
4.694	70.515
4.728	79.735
4.730	72.665
4.735	49.612
4.834	90.489
4.855	80.960
4.859	64.668
4.874	74.811
4.888	92.639
4.894	69.278
4.926	86.490
4.977	98.168
4.984	72.041
5.021	66.814
5.035	83.104
5.036	79.723
5.052	88.329
5.072	82.181
5.345	76.023
5.706	82.464
5.707	77.546
5.761	77.851
5.796	85.841
5.797	80.309
5.812	92.296
5.813	91.374
5.830	95.676
5.831	89.836
5.833	82.152
5.942	80.303
5.960	82.454
5.975	94.134
5.975	92.290
6.010	100.280
6.011	92.903
6.012	90.136
6.013	87.985
6.066	91.671
6.067	88.905
6.082	99.355
6.373	95.348
6.683	88.266
6.739	80.272
6.753	96.870
6.807	100.864
6.827	91.027
6.866	81.190
6.899	95.943
6.916	100.553
6.932	106.085
6.936	91.023
7.025	96.552
7.062	94.092
7.838	109.431
7.858	98.365
7.897	86.683
7.929	105.739
7.930	100.514
7.946	112.193
8.038	105.120
8.054	112.189
8.075	100.815
8.907	109.390
8.958	120.454
8.997	110.923
9.740	111.510
9.957	113.346
10.066	112.419
10.827	110.546
10.843	118.844
10.881	113.310
10.967	131.135
10.971	115.151
11.027	110.231
11.067	92.094
11.785	119.115
11.839	122.187
11.859	114.809
11.931	117.266
12.009	92.980
12.966	107.390
13.053	123.677
13.905	119.034
13.960	119.647
14.015	117.493
14.015	114.726
14.863	129.448
15.068	107.924
15.137	121.753
15.319	118.365];
data.tL_f(:,1) = (0+data.tL_f(:,1))*365; % % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(17.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WataMura2013';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.623	33.440
1.765	44.193
2.668	55.224
2.707	44.157
2.942	46.914
3.069	45.987
3.360	41.980
3.886	41.960
4.011	47.795
4.030	45.336
4.046	53.019
4.063	55.785
4.098	63.468
4.569	63.757
4.588	59.453
4.661	55.455
4.695	67.134
4.714	64.059
4.950	61.284
5.095	59.434
5.310	69.262
5.583	64.333
5.602	61.566
5.746	68.016
5.837	66.168
5.856	62.786
5.871	76.003
6.143	71.996
6.599	59.069
6.671	63.984
6.672	57.529
6.704	77.200
6.833	67.359
6.904	71.660
6.938	82.724
8.986	81.108
9.819	83.535
10.000	85.373
10.019	79.532
10.093	73.996
11.016	77.342
11.977	76.075
12.970	90.791
13.860	83.995
15.001	85.180
15.799	79.924];
data.tL_m(:,1) = (0+data.tL_m(:,1))*365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(17.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WataMura2013';
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00437*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44L7T'; % Cat of Life
metaData.links.id_ITIS = '161296'; % ITIS
metaData.links.id_EoL = '46561544'; % Ency of Life
metaData.links.id_Wiki = 'Muraenesox_cinereus'; % Wikipedia
metaData.links.id_ADW = 'Muraenesox_cinereus'; % ADW
metaData.links.id_Taxo = '42559'; % Taxonomicon
metaData.links.id_WoRMS = '126296'; % WoRMS
metaData.links.id_fishbase = 'Muraenesox-cinereus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Muraenesox_cinereus}}';
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
bibkey = 'WataMura2013'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-013-0605-x}, ' ...
'author = {Watari, S. and Murata, M. and Hinoshita, Y. and Mishiro, K. and Oda, S. and Ishitani, M.}, ' ... 
'year = {2013}, ' ...
'title = {Re-examination of age and growth of daggertooth pike conger \emph{Muraenesox cinereus} in the western {S}eto {I}nland {S}ea, {J}apan}, ' ...
'journal = {Fisheries Science}. ' ...
'volume = {79(3)},', ...
'pages = {367–373}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'howpublished = {\url{https://www.fishbase.de/summary/Muraenesox-cinereus.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
