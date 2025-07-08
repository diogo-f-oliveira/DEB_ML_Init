function [data, auxData, metaData, txtData, weights] = mydata_Agapornis_roseicollis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittaculidae';
metaData.species    = 'Agapornis_roseicollis'; 
metaData.species_en = 'Rosy-faced lovebird'; 

metaData.ecoCode.climate = {'Aw','BWh','BSh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'; 't-JOe'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 10];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 23.3;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 42.8;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 128.4;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'AnAge: 150 d';
data.am = 34.1*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 4.21;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'Buch1983';
data.Wwb = 3.82;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Buch1983';
data.Wwi = 56; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	2.392
0.443	2.193
0.499	3.787
0.887	2.591
1.220	3.090
1.386	4.186
1.497	2.591
1.663	4.684
1.940	3.787
2.439	5.980
2.661	2.591
2.882	3.189
2.993	5.681
3.381	6.977
3.548	8.073
3.991	5.482
4.268	6.977
4.435	9.169
4.436	7.674
4.601	4.086
4.656	9.767
4.657	6.379
4.989	9.070
5.377	7.674
5.432	10.963
5.433	5.183
5.543	12.458
5.876	11.462
6.098	10.565
6.541	15.050
6.542	7.375
6.596	9.668
6.818	13.854
6.929	13.056
7.373	11.960
7.428	17.342
7.594	10.266
7.650	8.472
7.871	15.548
7.927	17.940
8.093	14.850
8.204	16.146
8.205	17.442
8.370	12.857
8.481	9.767
8.537	17.243
8.647	12.060
8.703	21.329
8.980	19.734
9.146	18.738
9.313	19.435
9.533	20.532
9.534	15.847
9.535	13.754
9.645	19.236
9.701	24.917
10.421	27.807
10.532	14.651
10.643	19.336
10.698	22.924
10.976	27.508
11.086	22.226
11.364	25.515
11.475	22.226
11.530	17.741
11.585	26.113
11.696	21.528
11.752	29.701
11.973	25.714
12.195	29.003
12.306	27.807
12.361	24.917
12.638	28.405
12.639	23.123
12.694	32.492
12.749	19.834
12.805	27.807
13.082	30.100
13.415	27.807
13.581	32.492
13.636	35.681
13.747	23.721
14.024	35.681
14.579	37.674
15.465	34.385
15.466	25.515
15.576	40.864
15.687	31.993
15.909	38.073
16.463	38.472
16.630	40.764
16.631	26.113
16.741	31.595
16.796	26.910
17.018	41.462
17.461	44.252
17.683	34.983
17.684	31.595
18.071	45.648
18.459	31.495
18.514	41.262
18.625	38.571
18.736	45.249
18.792	31.894
19.180	44.153
19.512	39.767
19.568	30.199
19.789	45.449
19.900	37.176
20.565	43.654
20.621	46.445
20.732	34.983
20.733	33.887
21.120	47.641
21.397	49.136
21.452	46.445
21.508	48.439
21.509	35.681
21.729	51.429
21.951	50.033
21.952	48.738
22.284	52.425
22.616	50.133
22.617	45.349
22.727	37.076
23.282	52.525
23.559	51.628
23.725	46.545
23.726	33.189
23.727	37.575
24.279	51.628
24.667	53.621
24.778	57.209
24.889	37.475
25.499	40.365
25.610	36.877
25.776	46.944
25.942	55.415
26.164	54.817
26.441	41.661
26.608	50.831
26.774	56.312
27.273	55.216
27.439	36.578
28.603	59.302
28.604	48.738
28.605	41.462
29.157	58.106
29.545	42.658
29.601	59.003
29.712	56.213
29.713	54.817
30.377	56.213
30.654	57.807
30.765	56.213
31.098	56.013
31.652	58.405
32.151	56.213
32.705	55.914
32.706	57.110
32.816	48.439
33.204	56.711
33.703	55.914
34.146	56.013
34.645	53.621
35.643	53.123
36.197	53.721
37.417	44.850
37.639	47.641
41.519	51.827
44.623	46.445
46.729	46.445
49.667	40.465];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Buch1983';

% time - embryo weight
data.tWe = [ ...
5.618	0.037
6.367	0.043
7.656	0.059
8.489	0.152
8.530	0.099
9.990	0.319
10.404	0.255
10.528	0.220
11.448	0.469
12.444	0.381
12.529	0.445
12.651	0.341
12.696	0.480
13.698	0.688
13.987	0.595
14.369	0.948
14.575	0.861
14.908	0.907
15.532	0.890
15.619	1.075
18.661	1.409
19.039	1.577
19.711	1.890
20.132	2.151
20.427	2.342
21.289	1.820
21.346	2.533
21.582	1.889
21.590	2.283
21.690	3.089
21.851	2.828];
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'embryo wet weight'};  
temp.tWe    = C2K(41.3);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'Buch1983';
 
% time - O2 consumption of embryo
data.tJOe = [ ...
3.578	1.266
3.679	0.815
4.494	1.245
4.496	1.917
5.617	2.565
5.623	4.805
6.381	2.996
6.640	4.559
7.251	4.769
7.715	6.999
7.864	5.652
7.920	7.667
8.329	8.554
8.633	7.651
8.678	5.633
9.498	7.856
9.508	11.889
9.603	9.198
9.810	10.314
10.006	7.396
10.316	9.182
10.618	8.055
10.623	10.071
10.776	9.844
11.241	12.747
11.592	10.722
11.643	10.945
11.801	12.734
12.098	9.590
12.502	8.237
12.515	13.615
12.610	10.923
12.669	14.059
12.674	15.852
12.826	15.848
13.485	14.489
13.487	15.385
13.494	18.298
13.533	13.592
13.561	24.571
13.598	18.968
13.742	15.828
13.802	19.412
14.627	23.427
15.388	22.514
15.455	28.787
15.543	23.407
15.704	26.764
15.744	22.506
16.063	27.653
16.438	35.039
16.581	31.451
16.669	26.070
16.711	22.484
16.714	23.829
16.828	28.532
17.388	28.743
17.511	36.808
17.544	29.860
17.604	33.444
17.649	30.978
17.782	43.525
17.808	33.440
17.842	26.941
17.857	52.711
18.443	23.342
18.463	51.128
18.502	46.197
18.554	26.700
18.561	29.613
18.595	43.058
18.636	39.024
18.706	46.641
18.719	31.627
18.827	34.089
18.849	42.604
19.028	32.964
19.035	35.877
19.047	40.583
19.447	37.661
19.582	30.711
19.614	43.483
19.675	47.516
19.701	37.655
19.745	34.741
19.866	42.357
19.872	44.598
19.944	53.112
20.081	46.834
20.619	38.531
20.628	61.836
20.661	54.889
20.699	49.958
20.705	51.974
20.772	58.472
20.795	47.491
21.108	50.397
21.151	47.483
21.438	60.249
21.454	66.299
21.484	58.231
21.551	64.729
21.704	44.781
21.742	79.738
21.763	68.085
21.845	60.016
21.888	56.878
21.981	53.739
22.155	61.802
22.200	79.728
22.564	62.689
22.618	83.752
22.659	60.222
22.740	91.817
22.966	60.887];
units.tJOe   = {'d', 'ml/d'};  label.tJOe = {'age', 'O2 consumption'};  
temp.tJOe    = C2K(41.3);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = 'Buch1983';
 
%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tWe = weights.tWe * 2;
weights.Ww0 = weights.Ww0 * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '65MG4'; % Cat of Life
metaData.links.id_ITIS = '177626'; % ITIS
metaData.links.id_EoL = '45510814'; % Ency of Life
metaData.links.id_Wiki = 'Agapornis_roseicollis'; % Wikipedia
metaData.links.id_ADW = 'Agapornis_roseicollis'; % ADW
metaData.links.id_Taxo = '54233'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '31C03CB89EC331D6'; % avibase
metaData.links.id_birdlife = 'rosy-faced-lovebird-agapornis-roseicollis'; % birdlife
metaData.links.id_AnAge = 'Agapornis_roseicollis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Agapornis_roseicollis}}';
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
bibkey = 'Buch1983'; type = 'Article'; bib = [ ... 
'doi = {10.1086/physzool.56.3.30152612}, ' ...
'author = {Bucher, T. L.}, ' ... 
'year = {1983}, ' ...
'title = {Parrot Eggs, Embryos, and Nestlings: {P}atterns and Energetics of Growth and Development}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {56(3)}, ' ...
'pages = {465–483}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Agapornis_roseicollis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=31C03CB89EC331D6&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

