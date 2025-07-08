function [data, auxData, metaData, txtData, weights] = mydata_Notoscopelus_resplendens
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Notoscopelus_resplendens'; 
metaData.species_en = 'Patchwork lampfish'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.2); % in K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 22]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.tp = 2.05*365; units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'SarmTria2018';  
  temp.tp = C2K(4.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1.7*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'SarmTria2018';  
  temp.tpm = C2K(4.2); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 4*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SarmTria2018';  
  temp.am = C2K(4.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 8.2;   units.Li = 'cm';   label.Li = 'ultimate standard length for females';    bibkey.Li = 'SarmTria2018';
data.Lim = 8.4;   units.Lim = 'cm';   label.Lim = 'ultimate standard length for males';    bibkey.Lim = 'SarmTria2018';

data.Wwb = 1.95e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 0.784 mm and egg width of 0.688 mm of Lampanyctodes hectoris: 4/3*pi*0.0392*0.0344^2';

data.Ri = 6e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(4.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.9';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (yr), otolith weight (mg)
0.845	0.431
0.863	0.248
0.863	0.600
0.863	0.707
0.869	0.324
1.060	0.693
1.067	0.907
1.067	1.030
1.067	1.106
1.073	0.800
1.073	1.244
1.344	1.306
1.356	1.429
1.356	1.536
1.363	0.724
1.363	1.076
1.862	1.093
1.862	1.185
1.862	1.246
1.862	1.308
1.862	1.446
1.868	1.660
1.887	3.253
1.911	2.166
2.047	1.706
2.047	2.901
2.053	5.076
2.176	3.667
2.182	3.867
2.195	5.169
2.201	3.070
2.207	3.668
2.207	4.204
2.213	3.943
2.213	4.020
2.213	4.066
2.213	4.663
2.219	3.300
2.226	3.545
2.861	3.470
2.861	4.864
2.867	3.287
2.873	3.624
3.052	4.314
3.064	3.747
3.064	5.416
3.181	3.870
3.187	4.115
3.194	5.907
3.194	5.953
3.200	4.712
3.206	4.008
3.206	6.091
3.206	6.229
3.212	4.605
3.212	5.356
3.218	4.865
3.218	4.927
3.218	5.156
3.218	6.014
3.366	4.146
3.366	5.724
3.379	4.743
3.379	6.015
3.866	4.576
3.866	5.204
3.896	4.975
3.903	6.338
3.921	4.975
4.186	5.343
4.205	5.190
4.205	5.297
4.211	5.711
4.353	5.037
4.365	6.002
4.365	6.217
4.889	5.713];
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
n=size(data.tW_f,1); for i=2:n; if data.tW_f(i,1)<=data.tW_f(i-1,1); data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3; end; end
data.tW_f(:,2) = data.tW_f(:,2) * 5.5/6.3; % convert otolith weight in mg to wet weight in g
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f = C2K(4.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SarmTria2018';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (yr), otolith weight (mg)
0.857	0.983
0.863	1.060
0.863	1.167
0.863	0.263
0.863	0.340
0.894	0.524
0.894	0.830
1.011	1.228
1.030	0.662
1.030	0.769
1.036	1.489
1.048	1.244
1.054	0.892
1.054	0.984
1.054	1.029
1.060	1.351
1.184	0.754
1.184	0.861
1.190	0.969
1.202	1.030
1.208	1.137
1.208	1.214
1.208	1.597
1.332	0.586
1.356	0.755
1.356	0.984
1.363	1.092
1.369	0.877
1.375	1.505
1.375	1.888
1.381	1.199
1.856	1.645
1.862	2.441
1.874	0.940
1.874	1.032
1.874	1.308
1.874	1.415
1.887	1.966
1.893	2.043
1.899	1.170
1.899	1.262
1.899	2.993
2.047	1.492
2.053	2.717
2.053	2.656
2.053	2.549
2.170	3.101
2.170	3.943
2.189	4.219
2.195	4.372
2.195	3.943
2.201	3.070
2.201	3.453
2.207	2.350
2.207	3.239
2.219	2.565
2.355	2.090
2.367	3.806
2.374	3.454
2.374	3.561
2.873	4.772
2.885	4.007
2.904	3.884
2.910	3.287
3.021	4.068
3.039	5.003
3.064	3.287
3.064	4.099
3.206	4.191
3.206	5.248
3.206	5.585
3.206	5.677
3.206	5.769
3.218	5.065
3.224	5.003
3.224	4.728
3.360	5.295
3.372	4.866
3.372	6.214
3.385	3.947
3.385	4.223
3.896	4.730
3.915	5.480
4.051	6.338
4.051	6.155
4.199	4.807
4.199	4.623
4.205	4.302
4.217	6.155
4.217	5.864
4.217	4.087
4.359	6.094
4.365	5.865
4.371	4.425
4.889	5.070];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
data.tW_m(:,2) = data.tW_m(:,2) * 5.5/6.3; % convert otolith weight in mg to wet weight in g
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m = C2K(4.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SarmTria2018';
comment.tW_m = 'data for males';

% length-weight
data.LW_f = [ ... % standard length (cm), wet weight (g)
1.912	0.078
1.934	0.105
1.979	0.091
2.024	0.091
2.080	0.078
2.124	0.051
2.124	0.105
2.191	0.064
2.203	0.037
2.292	0.037
2.303	0.077
2.348	0.104
2.348	0.158
2.460	0.091
2.460	0.158
2.527	0.104
2.583	0.158
2.605	0.104
2.650	0.131
2.952	0.184
3.030	0.211
3.231	0.211
3.232	0.265
3.321	0.319
3.354	0.170
3.522	0.305
3.578	0.386
3.578	0.440
3.690	0.372
3.768	0.372
3.846	0.250
3.903	0.399
3.914	0.264
4.037	0.371
4.037	0.439
4.037	0.533
4.227	0.439
4.272	0.587
4.306	0.695
4.518	0.465
4.574	0.492
5.123	1.354
5.582	1.744
6.029	1.582
6.052	1.757
6.131	2.323
6.232	2.485
6.321	2.026
6.321	2.188
6.400	2.471
6.411	2.512
6.490	2.970
6.511	2.512
6.556	2.660
6.634	2.309
6.635	2.538
6.668	2.471
6.668	2.660
6.713	2.484
6.724	2.579
6.745	2.066
6.746	2.633
6.747	3.037
6.947	2.174
6.949	3.118
7.082	2.740
7.117	3.212
7.117	3.562
7.126	2.524
7.139	3.279
7.161	3.090
7.172	2.794
7.183	2.632
7.205	2.955
7.206	2.996
7.216	2.713
7.216	2.848
7.217	3.144
7.240	3.495
7.251	3.252
7.262	3.023
7.317	2.874
7.407	3.360
7.442	3.670
7.474	3.063
7.530	3.333
7.554	3.912
7.587	3.750
7.608	2.928
7.631	3.481
7.653	3.332
7.676	3.656
7.710	3.818
7.720	3.319
7.742	3.116
7.811	3.818
7.844	3.858
7.889	3.966
7.890	4.249
7.936	5.004
8.124	3.992
8.261	5.489];
units.LW_f = {'cm', 'g'}; label.LW_f = {'standard length','wet weight', 'female'};  
bibkey.LW_f = 'SarmTria2018';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % standard length (cm), wet weight (g)
2.818	0.198
3.008	0.238
3.108	0.198
3.131	0.198
3.131	0.400
3.142	0.319
3.153	0.319
3.366	0.265
3.366	0.319
3.388	0.103
3.399	0.265
3.422	0.332
3.444	0.426
3.511	0.372
3.556	0.210
3.634	0.345
3.679	0.251
3.679	0.305
3.724	0.439
3.813	0.250
3.813	0.345
3.813	0.439
3.858	0.385
3.858	0.480
3.880	0.480
3.903	0.372
3.959	0.412
3.992	0.318
4.003	0.493
4.126	0.371
4.126	0.425
4.126	0.479
4.127	0.574
4.171	0.371
4.171	0.587
4.227	0.506
4.305	0.479
4.350	0.533
4.383	0.425
4.395	0.695
4.428	0.573
4.462	0.425
4.462	0.479
4.462	0.694
4.484	0.546
4.495	0.357
4.540	0.573
4.574	0.694
4.618	0.492
5.021	0.842
5.044	1.112
5.112	1.233
5.190	1.138
5.313	1.475
5.358	1.583
5.436	1.219
5.570	1.394
5.738	1.286
5.760	1.313
5.917	1.393
5.963	1.892
6.018	1.865
6.086	2.229
6.141	1.798
6.298	1.730
6.421	1.892
6.421	1.986
6.455	2.242
6.467	2.593
6.578	2.067
6.578	2.228
6.578	2.363
6.724	2.417
6.859	3.023
6.948	2.673
6.971	2.942
6.971	3.279
7.026	2.592
7.059	2.592
7.094	2.956
7.116	2.861
7.127	2.592
7.171	2.200
7.171	2.457
7.250	3.009
7.262	3.306
7.262	3.400
7.363	3.333
7.419	3.778
7.451	2.901
7.476	4.088
7.496	2.766
7.542	3.333
7.576	3.858
7.597	3.184
7.610	4.114
7.622	4.627
7.655	4.033
7.678	4.317
7.712	4.573
7.754	3.305
7.765	3.170
7.854	3.238
7.890	4.519
7.899	3.386
8.203	4.289
8.439	5.178];
units.LW_m = {'cm', 'g'}; label.LW_m = {'standard length','wet weight', 'male'};  
bibkey.LW_m = 'SarmTria2018';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 5 * weights.tW_f;
weights.tW_m = 5 * weights.tW_m;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6SDBL'; % Cat of Life
metaData.links.id_ITIS = '162654'; % ITIS
metaData.links.id_EoL = '47262033'; % Ency of Life
metaData.links.id_Wiki = 'Notoscopelus_resplendens'; % Wikipedia
metaData.links.id_ADW = 'Notoscopelus_resplendens'; % ADW
metaData.links.id_Taxo = '181459'; % Taxonomicon
metaData.links.id_WoRMS = '158916'; % WoRMS
metaData.links.id_fishbase = 'Notoscopelus-resplendens'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notoscopelus_resplendens}}';
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
bibkey = 'SarmTria2018'; type = 'article'; bib = [ ...
'author = {Airam-Nauzet Sarmiento-Lezcano and Ra|"{u}l Triay-Portella and Jos\''{e} Juan Castro and Uriel Rubio-Rodr\''{i}guez and Jos\''{e} G. Pajuelo}, ' ... 
'year   = {2018}, ' ...
'title  = {Age-based life-history parameters of the mesopelagic fish \emph{Notoscopelus resplendens} ({R}ichardson, 1845) in the {C}entral {E}astern {A}tlantic}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {412-423}, ' ...
'volume = {204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/2735}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

