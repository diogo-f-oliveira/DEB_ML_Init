function [data, auxData, metaData, txtData, weights] = mydata_Bothus_podas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Bothidae';
metaData.species    = 'Bothus_podas'; 
metaData.species_en = 'Wide-eyed flounder'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 08]; 

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';  label.ab = 'age at birth';              bibkey.ab = 'eol';   
  temp.ab = C2K(17.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'Data for B. mancus';
data.tp = 1.67*365;    units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'MoraAfon2007';   
  temp.tp = C2K(17.5); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6*365;    units.am = 'd';  label.am = 'life span';                bibkey.am = 'MoraAfon2007';   
  temp.am = C2K(17.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 5;  units.Lj  = 'cm';  label.Lj  = 'length at metam';   bibkey.Lj  = 'photomazza';
data.Lp  = 14.1;  units.Lp  = 'cm';  label.Lp  = 'length at puberty';  bibkey.Lp  = 'MoraAfon2007';
data.Li  = 45;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 2e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'eol';
  comment.Wwb = 'based on GSI*Wwi/2.5e6, where 2.5e6 is fecundity of B. mancus, see F3';
data.Wwi = 875;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0096*Li^3';
  
data.GSI  = 0.057; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'MoraAfon2007';   
  temp.GSI = C2K(17.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data 
data.tL = [... % time since birth (yr), total length (cm)
0.073	3.139
0.073	3.316
0.214	4.114
0.231	6.103
0.238	3.451
0.238	3.672
0.238	4.379
0.316	3.585
0.316	3.938
0.317	5.309
0.324	4.204
0.324	4.469
0.325	4.911
0.325	5.132
0.334	6.723
0.496	3.499
0.497	3.808
0.513	4.472
0.528	4.162
0.568	5.268
0.568	5.533
0.568	5.754
0.569	6.019
0.569	6.152
0.569	6.329
0.575	3.456
0.575	4.031
0.575	4.252
0.576	4.561
0.583	3.677
0.585	6.638
0.585	6.859
0.892	8.853
0.905	5.273
0.912	2.710
0.912	4.036
0.913	4.566
0.913	5.494
0.920	3.196
0.920	3.417
0.921	4.875
0.922	6.157
0.922	6.334
0.922	6.864
0.922	7.130
0.922	7.351
0.923	8.279
0.923	8.500
0.929	5.804
0.930	7.307
0.936	3.771
1.056	7.795
1.146	12.879
1.152	10.581
1.160	11.553
1.162	13.233
1.169	12.349
1.169	12.658
1.170	13.586
1.170	13.940
1.175	10.227
1.178	14.161
1.178	14.338
1.178	14.691
1.179	15.531
1.186	15.222
1.238	9.919
1.241	15.355
1.241	15.532
1.246	11.112
1.248	13.455
1.248	13.587
1.253	8.505
1.255	11.952
1.326	12.439
1.327	14.163
1.327	14.340
1.327	14.605
1.331	7.887
1.334	13.279
1.334	13.677
1.335	13.898
1.335	15.003
1.335	15.180
1.337	16.948
1.341	11.732
1.344	15.887
1.344	16.418
1.359	15.622
1.492	14.342
1.493	15.668
1.493	17.039
1.498	11.646
1.498	12.000
1.498	12.221
1.499	13.017
1.499	13.238
1.499	13.635
1.499	14.033
1.500	14.652
1.500	15.050
1.500	15.448
1.501	16.287
1.501	16.597
1.504	9.613
1.505	10.542
1.507	13.856
1.513	10.674
1.516	16.022
1.576	12.045
1.582	8.112
1.582	8.598
1.587	15.626
1.587	16.068
1.587	16.377
1.588	17.615
1.736	16.777
1.743	14.656
1.744	16.600
1.745	17.131
1.745	17.484
1.745	18.368
1.746	18.854
1.758	13.418
1.759	14.921
1.759	15.496
1.767	15.717
1.767	15.938
1.767	16.247
1.830	16.513
1.834	10.767
1.835	11.077
1.835	11.342
1.836	12.933
1.836	13.596
1.836	13.861
1.837	14.613
1.837	14.966
1.837	15.231
1.838	16.248
1.839	16.955
1.839	17.309
1.845	15.629
1.851	12.182
1.853	15.851
2.000	12.759
2.165	13.071
2.175	15.811
2.176	17.712
2.181	13.690
2.247	18.552
2.248	19.171
2.252	12.983
2.254	16.254
2.254	16.873
2.261	14.928
2.261	15.149
2.261	15.370
2.262	17.271
2.263	17.757
2.340	16.963
2.496	15.241
2.496	15.506
2.497	15.904
2.497	17.142
2.582	15.021
2.583	16.436
2.585	19.265
2.586	20.193
2.589	13.872
2.592	17.276
2.592	17.895
2.592	18.204
2.592	18.558
2.665	21.166
2.665	21.343
2.671	18.603
2.678	16.702
2.678	16.923
2.678	17.675
2.680	19.973
2.680	20.371
2.741	18.206
2.748	17.145
2.823	11.843
2.824	12.064
2.825	14.848
2.826	15.113
2.826	15.909
2.826	16.086
2.832	13.213
2.832	13.434
2.832	13.611
2.836	18.650
2.836	18.782
2.836	19.047
2.839	12.373
2.840	12.860
2.841	14.053
2.841	14.451
2.842	16.616
2.843	17.633
2.843	18.384
2.847	12.639
2.999	16.972
3.001	19.271
3.014	15.381
3.181	19.097
3.252	19.363
3.253	21.042
3.259	18.479
3.270	23.474
3.572	17.865
3.573	18.484
3.581	18.660
3.581	19.014
3.581	19.279
3.581	19.456
3.582	20.428
3.669	21.579
3.675	19.015
3.676	19.634
3.676	19.944
3.676	20.120
3.844	12.742
3.845	14.244
3.864	20.212
3.912	20.875
4.248	20.173
4.249	21.411
4.603	22.123
4.688	20.356
4.843	17.795
4.852	20.270
5.174	19.789
5.598	21.607
5.668	20.415
5.700	21.344];
data.tL(:,1) = 365 * (.5 + data.tL(:,1)); 
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(17.5); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoraAfon2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Temperature varies from 15 C in Februari to 20 in August at 25 m deep around the Azores';
metaData.bibkey.F1 = 'MoraAfon2007'; 
F2 = 'Weight (g) - length (cm): 0.0096*L^3';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Bothus mancus, which has similar size, spawns 2 till 3 million eggs';
metaData.bibkey.F3 = 'eol'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'MP63'; % Cat of Life
metaData.links.id_ITIS = '172770'; % ITIS
metaData.links.id_EoL = '46569782'; % Ency of Life
metaData.links.id_Wiki = 'Bothus_podas'; % Wikipedia
metaData.links.id_ADW = 'Bothus_podas'; % ADW
metaData.links.id_Taxo = '46911'; % Taxonomicon
metaData.links.id_WoRMS = '127129'; % WoRMS
metaData.links.id_fishbase = 'Bothus-podas'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bothus_podas}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bothus-podas.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoraAfon2007'; type = 'Article'; bib = [ ... 
'author = {T. Morato and P. Afonso and N. Carvalho and P. Lourinho and R. S. Santos and H. M. Krug and R. D. M. Nash}, ' ... 
'year = {2007}, ' ...
'title = {Growth, reproduction and recruitment patterns of the wide-eyed flounder, \emph{Bothus podas} {D}elaroche ({P}isces: {B}othidae), from the {A}zores}, ' ...
'journal = {Marine Biology Research}, ' ...
'volume = {3}, ' ...
'pages = {403--411}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'photomazza'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.photomazza.com/?Bothus-podas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'eol'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/207793/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

