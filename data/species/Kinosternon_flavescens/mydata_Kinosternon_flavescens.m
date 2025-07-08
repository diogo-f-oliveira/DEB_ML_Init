function [data, auxData, metaData, txtData, weights] = mydata_Kinosternon_flavescens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Kinosternon_flavescens'; 
metaData.species_en = 'Yellow mud turtle'; 

metaData.ecoCode.climate = {'BSh','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'Ww-WwR'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 07];

%% set data
% zero-variate data

data.tp = 11*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Iver1991';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'ADW gives 5-8 yrs';
data.tpm = 5.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';   
  temp.tpm = C2K(25);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
  comment.tpm = '4-7 yrs';
data.am = 40*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Wiki';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.5;   units.Lb   = 'cm';  label.Lb  = 'plastron length at birth';         bibkey.Lb  = 'Iver1991'; 
data.Lp  = 9.0; units.Lp  = 'cm';  label.Lp  = 'carapace length fat puberty'; bibkey.Lp  = 'Iver1991';
  comment.Lp = '9.5-10 cm';
data.Li  = 11.3;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'ADW';
data.Lim  = 14;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'ADW';

data.Wwi = 391; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'ADW';

data.Ri  = 6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-9 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
data.tL = [ ... % time since birth (yr), carapace length (cm)
1.500	3.458
2.662	4.511
3.083	4.047
3.091	5.579
3.458	5.562
3.677	5.694
3.835	4.687
3.836	4.538
3.919	5.901
3.999	5.304
4.014	6.182
4.092	5.772
4.095	5.510
4.115	5.940
4.195	5.250
4.529	6.036
4.635	5.346
4.681	5.589
4.684	5.272
4.687	5.066
4.704	5.720
4.723	6.205
4.751	5.926
4.786	4.899
4.847	6.038
4.927	5.423
4.953	5.292
4.966	6.375
4.969	6.114
5.068	5.946
5.110	6.637
5.146	5.592
5.154	7.067
5.165	6.096
5.168	5.798
5.211	6.377
5.290	5.854
5.301	4.772
5.354	6.639
5.427	6.733
5.518	7.331
5.582	5.950
5.600	6.566
5.614	5.240
5.618	7.126
5.650	6.454
5.671	6.809
5.678	6.156
5.678	6.156
5.683	5.689
5.705	5.913
5.745	6.679
5.775	6.212
5.779	5.802
5.781	5.690
5.782	5.578
5.795	6.642
5.808	5.391
5.813	7.184
5.816	6.885
5.822	6.362
5.954	5.523
6.018	6.345
6.025	5.691
6.045	6.083
6.047	5.897
6.262	6.384
6.268	5.898
6.301	7.280
6.378	6.982
6.379	6.851
6.413	6.049
6.430	6.702
6.661	5.733
6.662	5.639
6.686	7.880
6.731	5.995
6.782	5.808
6.809	5.603
6.818	6.966
6.851	6.182
6.855	5.902
6.866	7.060
6.898	6.407
6.924	6.276
6.996	6.389
7.169	6.259
7.210	6.931
7.359	6.746
7.360	6.634
7.370	7.997
7.375	7.511
7.378	7.269
7.434	8.837
7.437	8.539
7.455	6.914
7.555	6.691
7.595	7.494
7.765	7.607
7.767	7.458
7.805	8.448
7.812	5.591
7.818	7.272
7.821	7.029
7.850	8.840
7.882	8.150
7.904	6.114
7.925	6.413
7.927	6.264
7.946	6.768
7.946	9.009
7.948	6.600
7.966	7.198
7.967	7.048
7.980	5.891
8.040	7.142
8.083	7.647
8.211	7.162
8.338	8.918
8.373	7.947
8.414	8.713
8.417	8.470
8.418	8.321
8.435	6.809
8.486	8.826
8.501	7.425
8.537	6.399
8.546	7.818
8.622	7.576
8.667	7.893
8.685	8.528
8.730	8.902
8.753	9.014
8.758	6.325
8.784	8.398
8.823	9.332
8.866	7.615
8.872	7.054
8.881	8.511
8.904	8.660
8.905	6.326
8.906	6.177
8.923	6.887
8.950	6.644
8.955	8.455
8.959	8.026
8.961	7.895
8.993	7.223
8.998	9.016
9.013	7.597
9.025	8.792
9.032	5.898
9.047	8.941
9.060	7.765
9.106	8.083
9.120	6.739
9.281	7.711
9.330	9.914
9.350	8.103
9.391	8.850
9.495	8.310
9.516	8.590
9.532	9.337
9.584	6.872
9.586	8.870
9.608	9.113
9.655	9.338
9.690	8.292
9.750	9.525
9.762	8.442
9.782	8.872
9.817	7.938
9.880	8.872
9.894	7.547
9.926	9.097
9.997	9.321
10.010	8.145
10.033	8.313
10.036	7.958
10.044	9.490
10.053	8.724
10.076	8.855
10.144	9.359
10.291	9.286
10.294	8.987
10.384	7.494
10.434	9.679
10.454	7.793
10.456	9.866
10.489	9.044
10.531	9.679
10.541	8.765
10.550	7.980
10.686	8.990
10.727	9.718
10.729	9.531
10.774	9.849
10.830	9.177
10.833	8.953
10.898	9.757
10.922	7.535
10.934	8.674
10.981	8.842
11.020	9.701
11.051	9.160
11.098	9.328
11.114	7.853
11.144	9.571
11.166	9.777
11.227	8.713
11.362	9.778
11.376	8.490
11.456	7.912
11.472	8.696
11.478	8.136
11.484	7.538
11.510	9.630
11.532	9.929
11.590	9.089
11.659	9.481
11.671	8.361
11.718	8.548
11.746	8.212
11.809	9.128
11.821	10.323
11.829	9.595
11.851	7.503
11.909	8.923
12.043	7.860
12.044	10.082
12.078	9.167
12.097	9.634
12.107	8.756
12.230	8.701
12.244	9.616
12.324	9.056
12.472	8.908
12.510	9.954
12.634	9.787
12.665	9.152
12.692	8.965
12.780	9.881
12.818	8.630
12.839	8.910
12.856	9.601
12.912	8.948
12.948	10.181
12.959	9.173
13.000	9.864
13.055	9.323
13.105	9.155
13.183	8.801
13.416	9.885
13.487	10.035
13.712	9.570
13.751	10.541
13.757	9.999
13.833	9.757
13.852	10.205
13.934	9.440
13.953	9.926
13.957	9.553
13.976	10.076
14.084	9.161
14.087	8.881
14.208	8.975
14.304	9.181
14.591	9.744
14.609	10.379
14.659	10.211
14.661	10.061
14.806	10.249
14.835	9.820
14.910	9.708
15.077	10.064
15.518	9.974
15.522	9.619
15.668	9.676
15.786	10.125
15.857	10.293
15.888	9.677
15.910	9.958
15.914	9.547
16.201	10.146
16.203	9.997
16.721	9.590
16.918	9.423
17.059	10.003
17.064	9.573];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL   = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Iver1991';
comment.tL = 'Data for females';

% wet weight - clutch wet weight
data.WwWwR = [ ... % wet weight (g), clutch wet weight (g)
182.495	16.977
184.248	16.506
188.802	12.209
195.832	15.830
198.071	17.708
199.496	18.916
210.137	19.247
217.729	22.130
232.271	21.587
237.054	23.128
243.747	18.159
250.521	25.270
250.566	26.411
251.378	22.048
252.880	25.202
253.885	25.739
254.715	26.812
255.045	25.201
261.040	32.514
267.414	24.458
269.804	30.161
270.813	25.799
272.334	24.456
275.379	26.803
278.308	31.232
278.567	27.809
282.779	29.820
288.143	31.093
288.646	28.878
288.721	25.791
288.850	34.046
294.816	30.621
303.012	38.872
307.207	35.448
308.265	27.326
310.268	28.198
310.686	33.836
318.195	29.604
320.274	22.422
330.729	38.055];
units.WwWwR  = {'g', 'g'};  label.WwWwR = {'wet weight', 'clutch wet weight'};  
temp.WwWwR   = C2K(25);  units.temp.WwWwR = 'K'; label.temp.WwWwR = 'temperature';
bibkey.WwWwR = 'Iver1991';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'males tend to be larger than females';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R869'; % Cat of Life
metaData.links.id_ITIS = '173766'; % ITIS
metaData.links.id_EoL = '792967'; % Ency of Life
metaData.links.id_Wiki = 'Kinosternon_flavescens'; % Wikipedia
metaData.links.id_ADW = 'Kinosternon_flavescens'; % ADW
metaData.links.id_Taxo = '48337'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Kinosternon&species=flavescens'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kinosternon_flavescens}}';
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
bibkey = 'Iver1991'; type = 'Article'; bib = [ ... 
'author = {John B. Iverson}, ' ... 
'year = {1991}, ' ...
'title = {Life History and Demography of the Yellow Mud Turtle, \emph{Kinosternon flavescens}}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {25(1)}, ' ...
'pages = {373-395}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/792967}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Kinosternon_flavescens/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

