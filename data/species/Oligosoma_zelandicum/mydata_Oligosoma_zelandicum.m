function [data, auxData, metaData, txtData, weights] = mydata_Oligosoma_zelandicum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Scincidae';
metaData.species    = 'Oligosoma_zelandicum'; 
metaData.species_en = 'Brown skink'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 02];

%% set data
% zero-variate data

data.ab = 12*7;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Barw1959';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '65-77 d, but mean temperature is unknown';
data.am = 5*465;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.76;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Barw1959';  
data.Lp  = 5.0;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'Barw1959';  
data.Li  = 6.8;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';    bibkey.Li  = 'Barw1959';

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-5 young per litter, 3 clutches per yr assumed';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (d), SVL (cm)
0.000	2.571
0.303	3.560
0.527	3.717
0.820	4.496
1.028	5.049
1.209	5.442
1.234	5.121
1.311	5.019
1.328	4.875
1.509	5.176
1.613	5.511
1.647	5.494
1.716	5.240
1.716	5.493
2.043	5.951
2.078	6.170
2.284	6.090
2.293	6.006
2.318	5.609
2.370	5.802
2.413	5.810
2.714	5.999
3.213	6.016
3.290	6.200
3.299	6.107
3.307	5.947
3.325	6.469];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Barw1959'; 

% length-weight
data.LW = [ ... % weight (10*g), SVL (mm) 
2.403	0.137
2.490	0.330
2.498	0.151
2.545	0.199
2.561	0.296
2.609	0.262
2.609	0.343
2.640	0.294
2.688	0.325
2.719	0.276
2.735	0.210
2.743	0.356
2.759	0.275
2.790	0.355
2.822	0.290
2.838	0.354
2.885	0.353
2.940	0.352
2.940	0.449
2.980	0.367
3.051	0.463
3.075	0.398
3.083	0.479
3.320	0.554
3.336	0.652
3.359	0.440
3.367	0.423
3.438	0.503
3.462	0.616
3.470	0.730
3.478	0.502
3.478	0.632
3.525	0.712
3.557	0.712
3.581	0.662
3.589	0.857
3.604	0.613
3.636	0.888
3.636	1.197
3.668	0.741
3.699	0.903
3.778	0.771
3.778	0.869
3.834	1.111
3.842	0.981
3.857	0.786
3.857	0.932
3.889	1.175
3.905	0.931
3.912	0.801
3.921	0.979
3.936	1.060
3.976	0.864
3.976	0.929
4.000	1.010
4.015	0.977
4.039	0.912
4.047	0.976
4.118	1.072
4.190	1.347
4.245	1.346
4.348	1.343
4.450	0.821
4.680	1.969
4.680	2.066
4.712	2.066
4.719	2.001
4.743	2.130
4.743	2.179
4.791	2.194
4.799	2.129
4.862	1.900
4.869	1.835
4.870	2.127
4.870	2.143
4.876	1.006
4.878	2.046
4.878	2.208
4.878	2.241
4.893	1.964
4.894	2.321
4.894	2.403
4.941	2.532
4.941	2.597
4.941	2.710
4.965	2.320
4.965	2.385
4.980	2.125
4.980	2.173
4.996	2.465
5.013	3.342
5.013	3.407
5.020	2.205
5.035	2.042
5.043	2.010
5.044	2.367
5.044	2.416
5.059	2.058
5.067	2.188
5.083	2.528
5.091	2.398
5.092	2.674
5.092	2.772
5.099	2.057
5.099	2.154
5.115	2.284
5.115	2.381
5.139	2.576
5.139	2.673
5.147	2.527
5.154	2.072
5.178	2.672
5.194	2.282
5.250	2.882
5.273	2.638
5.273	2.751
5.281	2.378
5.281	3.027
5.282	3.482
5.329	2.896
5.329	3.026
5.352	2.685
5.352	2.750
5.353	3.269
5.384	2.830
5.384	2.944
5.392	2.603
5.407	2.164
5.407	2.521
5.407	2.683
5.408	2.748
5.455	2.439
5.486	2.568
5.486	2.649
5.486	2.698
5.487	3.282
5.502	2.779
5.503	2.941
5.511	3.347
5.518	2.356
5.518	2.421
5.536	4.175
5.550	2.891
5.550	3.086
5.550	3.249
5.566	3.411
5.589	2.744
5.598	3.134
5.598	3.247
5.598	3.345
5.598	3.865
5.605	2.809
5.605	3.036
5.624	5.504
5.646	3.669
5.660	2.791
5.693	3.603
5.708	3.277
5.708	3.342
5.716	2.952
5.748	3.585
5.755	2.757
5.755	2.838
5.764	3.731
5.771	3.244
5.772	3.373
5.787	2.756
5.787	3.211
5.788	3.584
5.788	3.925
5.788	4.006
5.796	4.282
5.803	3.373
5.804	3.795
5.827	3.275
5.827	3.697
5.827	3.811
5.835	3.453
5.844	4.249
5.844	4.330
5.850	2.430
5.867	3.826
5.890	3.582
5.890	3.679
5.891	4.394
5.905	2.997
5.906	3.078
5.914	3.273
5.914	3.533
5.923	4.296
5.954	4.181
5.969	3.596
5.978	3.953
5.992	2.768
5.993	3.174
6.001	3.709
6.009	3.514
6.009	3.595
6.010	4.472
6.010	4.602
6.025	3.985
6.032	3.010
6.058	4.894
6.080	3.691
6.087	2.993
6.088	3.512
6.089	5.023
6.103	3.171
6.136	3.934
6.136	4.161
6.137	5.493
6.143	3.706
6.191	3.916
6.191	4.030
6.192	4.501
6.192	4.923
6.192	5.004
6.198	3.331
6.198	3.461
6.198	3.510
6.198	3.640
6.200	4.679
6.231	4.273
6.240	5.198
6.270	3.849
6.278	4.109
6.279	4.613
6.287	4.759
6.292	2.615
6.301	3.784
6.302	4.385
6.302	4.498
6.309	3.475
6.317	4.043
6.327	5.781
6.333	3.686
6.333	3.978
6.380	3.571
6.389	4.139
6.405	4.788
6.436	3.976
6.438	5.648
6.491	4.267
6.501	5.712
6.516	4.802
6.587	5.044
6.604	5.612
6.739	6.275
6.777	5.803
6.810	6.712];
units.LW  = {'cm', 'g'};  label.LW = {'SVL', 'weight'};  
bibkey.LW = 'Barw1959'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assued not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Placental viviparous';
metaData.bibkey.F1 = 'Barw1959'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4978F'; % Cat of Life
metaData.links.id_ITIS = '1182592'; % ITIS
metaData.links.id_EoL = '791261'; % Ency of Life
metaData.links.id_Wiki = 'Oligosoma_zelandicum'; % Wikipedia
metaData.links.id_ADW = 'Oligosoma_zelandicum'; % ADW
metaData.links.id_Taxo = '643426'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Oligosoma&species=zelandicum'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oligosoma_zelandicum}}';
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
bibkey = 'Barw1959'; type = 'article'; bib = [ ... 
'author = {Barwick, R.E.}, ' ... 
'year = {1959}, ' ...
'title = {Life history of the common {N}ew {Z}ealand skink \emph{Leiolopisma zelandica}}, ' ...
'journal = {Trans. Roy. Soc. N. Z.}, ' ...
'howpublished = {\utl{https://archive.org/details/transactions-and-proceedings-royal-society-new-zealand-86-331-380/page/n25/mode/2up}}, ' ...
'volume = {86}, ' ...
'pages = {331-380}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

