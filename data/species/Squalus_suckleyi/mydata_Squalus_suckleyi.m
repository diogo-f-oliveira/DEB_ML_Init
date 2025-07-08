function [data, auxData, metaData, txtData, weights] = mydata_Squalus_suckleyi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Squalidae';
metaData.species    = 'Squalus_suckleyi'; 
metaData.species_en = 'Pacific spiny dogfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPN', 'MPNE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 16];

%% set data
% zero-variate data;
data.ab = 23*30;units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';    
  temp.ab = C2K(10.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on squalus acanthias';
data.am = 50*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Trib2010';   
  temp.am = C2K(10.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 25;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Trib2010';
data.Lp  = 90;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
  comment.Lp = 'TL 80-100 cm';
data.Lpm  = 75;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty of males'; bibkey.Lpm  = 'fishbase';
  comment.Lpm = 'TL 70-80 cm';
data.Li  = 140;   units.Li  = 'cm';  label.Li  = 'ultimate total length  for females';   bibkey.Li  = 'fishbase';
data.Lim  = 121;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'guess';

data.Wwp = 950; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00933*Lp^3.02, see F1';
data.Wwi = 950; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*Li^3.02, see F1';

% data.Wwi = 12021; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Avsa2001';

data.Ri  = 8/365/2; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 pups per litter, 1 litter each 2 yr';
  
% univariate data
% time-length
data.tL_f = [ ... time (yr), total length (cm)
5.280	69.598
5.515	67.051
6.673	68.606
6.913	61.978
7.487	67.602
7.725	61.994
9.107	70.696
9.456	70.193
10.272	66.128
10.384	70.212
10.618	68.686
10.856	63.079
11.088	63.594
11.541	72.787
11.544	70.236
12.012	66.674
12.230	78.413
12.355	71.273
12.359	67.191
12.459	80.969
12.580	77.400
12.590	68.726
12.701	72.810
12.929	75.876
13.049	72.817
13.052	70.266
13.053	69.246
13.272	80.985
13.514	72.317
13.858	75.385
14.205	76.412
14.445	69.785
14.669	75.912
14.784	77.445
14.891	84.590
14.898	78.977
14.904	73.365
15.032	63.674
15.131	78.472
15.131	78.472
15.586	86.134
15.606	68.788
15.949	72.876
16.168	84.616
16.174	79.004
16.181	72.881
16.290	79.006
16.295	74.924
16.520	80.541
16.652	67.279
16.875	74.936
17.328	84.639
17.335	78.517
17.339	74.435
17.431	95.356
17.444	84.131
17.456	73.928
17.545	96.889
17.696	66.790
17.798	79.547
18.140	84.146
18.157	69.350
18.263	78.536
18.266	75.475
18.477	93.846
18.482	89.255
18.498	75.990
18.721	83.647
19.081	72.940
19.081	72.940
19.083	71.410
19.183	85.698
19.649	83.156
19.661	72.952
19.766	82.648
19.768	80.607
19.778	72.444
19.880	84.181
20.004	77.551
20.118	79.084
20.227	85.209
20.338	89.803
20.450	93.376
20.460	84.193
20.470	76.030
20.561	97.460
20.585	76.543
20.679	95.932
20.686	89.300
20.912	94.917
20.918	89.815
20.931	78.080
20.945	66.856
21.039	85.225
21.396	77.579
21.400	74.008
21.604	98.502
21.733	87.280
21.838	96.976
21.848	87.793
21.948	101.570
21.961	90.856
22.192	91.371
22.204	81.167
22.324	78.109
22.431	85.254
22.441	77.091
22.538	93.419
22.747	112.811
22.760	102.097
23.114	96.492
23.221	104.147
23.244	84.760
23.569	104.154
23.590	86.298
23.687	102.626
23.693	97.524
23.704	87.831
23.813	93.955
23.829	80.180
23.932	91.407
24.039	99.062
24.384	101.620
24.510	93.459
24.748	88.362
24.754	83.260
24.979	88.877
25.091	92.961
25.193	104.698
25.432	98.580
25.447	85.315
25.539	106.235
25.674	90.422
25.778	100.118
25.899	96.039
26.011	99.612
26.144	84.819
26.254	89.924
26.469	104.724
26.480	95.030
26.576	112.379
26.582	107.277
26.711	96.565
26.832	91.976
27.070	86.369
27.160	109.330
27.404	99.131
27.515	103.215
27.518	100.153
27.758	94.036
27.759	93.015
27.858	107.813
28.004	81.286
28.443	103.234
28.788	105.792
29.020	105.796
29.131	110.390
29.151	93.044
29.259	100.189
29.266	93.556
29.389	87.947
29.490	100.704
29.735	89.484
30.066	104.287
30.182	104.289
30.195	93.065
30.289	111.945
30.295	106.843
30.304	98.680
30.304	98.680
30.764	102.771
31.102	110.941
31.123	92.574
31.233	98.188
31.235	96.148
31.244	89.005
31.795	113.506
31.941	87.489
32.268	105.863
32.401	91.069
32.854	101.283
32.954	114.550
33.093	94.655
33.107	82.410
33.194	107.922
33.215	90.066
33.432	102.315
33.452	84.968
33.898	100.794
34.225	119.168
34.463	113.560
34.578	114.583
34.837	91.119
34.926	115.100
34.947	96.734
35.051	107.450
35.051	107.450
35.168	105.922
35.184	92.657
35.393	112.559
35.515	107.459
35.647	93.176
36.196	120.228
36.427	121.254
36.804	96.261
36.917	98.815
37.145	102.391
37.241	119.229
37.720	105.974
38.080	96.287
38.174	114.657
38.186	104.963
39.004	99.878
39.006	97.837
39.443	121.315
39.572	109.583
39.814	101.425
39.916	113.162
40.377	115.722
40.727	114.198
41.885	116.263];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(10.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Trib2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... time (yr), total length (cm)5.587	57.534
5.748	57.534
6.070	57.078
6.870	63.014
7.032	62.100
7.674	63.927
7.995	64.384
8.154	66.667
8.554	69.863
9.200	67.580
9.360	68.037
9.360	68.037
9.520	69.863
9.760	70.776
10.005	66.667
10.073	81.735
10.323	70.776
10.646	69.406
10.965	73.973
11.450	70.776
12.009	75.799
12.486	83.105
12.581	64.840
12.734	75.342
13.049	83.562
13.210	83.105
13.218	73.059
13.378	73.973
13.379	73.516
13.460	72.146
13.853	84.475
13.946	68.493
14.026	68.950
14.172	88.128
14.181	76.256
14.349	68.037
14.351	65.297
14.424	74.429
14.491	90.868
14.510	68.037
14.573	89.041
14.904	77.626
14.979	84.932
14.979	84.932
15.062	81.735
15.144	79.452
15.216	90.411
15.315	67.123
15.378	89.041
15.389	75.342
15.395	67.123
15.553	71.233
15.554	70.320
15.629	76.256
15.629	76.256
15.715	69.406
16.514	76.256
16.589	84.018
16.670	83.105
16.835	78.082
16.841	70.776
16.915	78.539
16.995	79.452
17.081	72.146
17.240	73.973
17.395	82.192
17.395	82.192
17.400	75.342
17.400	75.342
17.560	76.256
17.635	83.562
17.794	86.301
17.954	86.758
17.958	81.735
18.043	76.256
18.120	80.365
18.124	76.256
18.127	72.146
18.199	82.192
18.209	69.863
18.447	74.429
18.598	86.301
18.610	71.233
18.610	71.233
18.678	86.758
18.684	80.365
18.764	79.909
18.842	83.105
19.006	79.909
19.087	78.539
19.163	84.475
19.164	82.648
19.402	87.215
19.572	76.256
19.650	78.995
19.723	89.041
19.728	82.192
19.729	80.822
19.806	84.932
19.809	81.279
19.810	80.822
19.890	80.822
19.966	86.301
20.051	81.279
20.136	75.799
20.138	72.146
20.289	85.388
20.298	74.429
20.370	84.475
20.443	93.607
20.447	89.041
20.457	76.256
20.536	78.082
20.544	68.493
20.615	79.452
20.690	87.215
20.695	80.365
20.703	70.776
20.769	88.584
20.787	66.210
20.853	84.475
20.856	80.365
21.010	89.498
21.016	81.279
21.095	83.562
21.257	82.192
21.338	81.735
21.339	79.909
21.492	90.411
21.494	87.215
21.655	87.215
21.816	87.671
21.979	84.475
21.981	81.735
22.068	73.973
22.143	80.822
22.216	90.411
22.391	73.059
22.459	87.671
22.464	81.279
22.784	83.562
22.862	87.215
23.021	89.041
23.028	81.279
23.268	82.648
23.588	85.388
23.665	88.584
23.666	88.128
23.669	84.018
23.751	82.648
23.833	80.365
23.916	76.712
23.998	75.799
24.066	90.868
24.153	82.192
24.309	89.041
24.311	85.845
24.473	85.388
24.474	84.018
24.476	81.735
24.945	97.717
24.954	86.758
25.034	88.128
25.036	85.388
25.112	90.868
25.195	88.128
25.197	84.932
25.201	80.365
25.270	94.521
25.516	88.128
25.517	87.215
25.681	84.018
25.837	89.498
25.916	90.868
25.916	90.868
26.082	85.388
26.399	90.868
26.487	81.735
26.560	91.324
26.640	91.324
26.642	89.041
26.884	88.128
26.957	98.174
26.968	83.562
27.128	85.388
27.279	97.260
27.285	89.498
27.285	89.498
27.287	88.128
27.287	88.128
27.363	93.607
27.448	87.671
27.527	89.041
27.602	95.890
27.689	88.128
27.847	91.781
27.852	85.845
27.853	84.018
28.017	80.365
28.252	88.584
28.332	88.128
28.490	91.781
28.490	91.781
28.579	82.192
28.653	89.498
28.896	87.671
29.294	93.151
29.294	93.151
29.453	95.434
29.536	91.781
29.538	90.411
29.538	90.411
29.862	86.758
30.102	88.584
30.102	88.584
30.507	84.932
30.827	87.215
30.827	87.215
30.907	88.584
31.230	86.758
31.313	83.562
31.314	83.105
31.387	91.781
31.866	95.890
32.028	94.977
32.194	88.584
32.357	86.301
32.436	87.671
32.592	94.521
32.602	82.192
32.757	88.584
33.965	87.671
34.687	90.868
34.769	88.584];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(10.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Trib2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 5 * weights.Li;
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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00933*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6ZFP3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560215'; % Ency of Life
metaData.links.id_Wiki = 'Squalus_suckleyi'; % Wikipedia
metaData.links.id_ADW = 'Squalus_suckleyi'; % ADW
metaData.links.id_Taxo = '592342'; % Taxonomicon
metaData.links.id_WoRMS = '299224'; % WoRMS
metaData.links.id_fishbase = 'Squalus-suckleyi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Squalus_suckleyi}}';  
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
bibkey = 'Trib2010'; type = 'phdthesis'; bib = [ ... 
'author = {Cindy A. Tribuzio}, ' ...
'year = {2010}, ' ...
'title  = {Life history, demography, and ecology of the spiny dogfish (\emph{Squalus acanthias}) in the {G}ulf of {A}laska}, ' ...
'schhol = {University of Alaska Fairbanks}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Squalus-suckleyi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
