function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_robustus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_robustus'; 
metaData.species_en = 'Robust tongue sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.9); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 16];

%% set data
% zero-variate data
data.ab = 2.5;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(21.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(21.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'BaecKim2004';
  comment.Lp = '15-19 cm';
data.Li = 40;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 2.245e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'BaecKim2004';
  comment.Wwb = 'based on egg diameter of 0.35 mm: pi/6*0.035^3';
data.Wwp = 26.9;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'fishbase','BaecKim2004'};  
  comment.Wwp = 'based on 0.00437*Lp^3.08, see F1';
data.Wwi = 375.7; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00437*Li^3.08, see F1';

% uni-variate data
% time-length        
data.tL_f = [ ... % age (yrs), total length (cm) 
0.449	17.852
0.474	17.392
0.487	19.307
0.744	19.612
0.808	16.317
1.064	19.074
1.154	26.200
1.154	24.820
1.154	22.981
1.295	17.157
1.308	32.099
1.321	28.421
1.346	23.440
1.359	30.106
1.397	32.711
1.410	31.485
1.410	26.888
1.423	28.114
1.436	33.248
1.449	24.205
1.449	30.182
1.462	29.646
1.462	23.362
1.462	26.428
1.462	29.033
1.474	31.255
1.487	28.343
1.513	30.718
1.526	33.783
1.526	30.029
1.526	23.669
1.526	25.891
1.526	28.113
1.551	28.802
1.590	24.511
1.628	27.653
1.641	31.101
1.654	19.070
1.654	18.763
1.654	29.645
1.667	30.258
1.667	25.966
1.667	28.878
1.692	29.031
1.692	23.667
1.705	31.943
1.718	28.188
1.718	27.958
1.731	27.422
1.744	30.487
1.744	30.717
1.744	25.659
1.744	22.748
1.756	29.414
1.756	32.173
1.756	26.809
1.782	32.402
1.833	25.199
1.885	26.042
1.897	25.352
1.910	30.103
1.923	32.018
1.936	32.631
1.949	29.260
1.949	33.091
1.962	30.486
1.962	29.336
1.974	30.486
1.974	27.804
2.013	31.328
2.013	28.723
2.090	33.550
2.115	30.178
2.128	31.174
2.141	29.029
2.141	32.707
2.154	31.864
2.154	32.017
2.167	30.408
2.205	29.565
2.218	26.959
2.218	30.331
2.244	30.177
2.244	31.250
2.256	33.779
2.269	30.943
2.372	34.544
2.372	33.472
2.397	33.088
2.423	35.157
2.423	36.000
2.449	29.256
2.462	28.797
2.474	34.314
2.526	25.041
2.526	33.087
2.551	29.103
2.590	29.102
2.590	34.083
2.603	30.022
2.615	29.255
2.628	34.083
2.641	33.240
2.654	30.558
2.654	31.631
2.654	32.320
2.667	24.581
2.667	27.799
2.667	29.562
2.667	31.094
2.667	33.470
2.692	35.309
2.705	28.718
2.782	33.622
2.936	36.456
3.013	31.552
3.038	31.705
3.064	34.310
3.077	36.379
3.077	32.931
3.090	31.781
3.115	35.382
3.141	32.547
3.154	33.773
3.167	34.999
3.167	34.616
3.167	31.397
3.179	33.160
3.179	32.623
3.205	36.608
3.205	35.765
3.231	30.937
3.462	38.829
3.513	33.234
3.526	37.219
3.538	34.920
3.577	33.694
3.628	35.839
3.667	34.459
3.679	36.222
3.692	32.927
3.756	31.853
3.821	35.685
3.821	35.225
3.821	35.071
3.897	40.128
4.090	34.610
4.103	36.219
4.115	33.767
4.115	33.384
4.154	36.449
4.205	36.985
4.538	37.596
4.564	35.220
4.705	36.522
5.154	40.274
5.590	38.202
6.077	38.812
6.103	38.429
6.154	40.114
6.487	38.886
7.205	36.582
7.667	36.579];
data.tL_f(:,1) = 365 * (0.2+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-5; end ;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(21.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KataYama2012';
%
data.tL_m = [ ... % age (yrs), total length (cm) 
0.321	15.170
0.410	12.258
0.436	16.932
0.449	14.710
0.500	16.165
0.603	18.081
0.654	20.149
0.692	25.436
1.000	20.683
1.013	18.997
1.141	25.127
1.141	23.441
1.167	24.514
1.321	16.084
1.333	27.884
1.372	22.827
1.436	24.895
1.436	26.274
1.462	27.807
1.654	25.967
1.667	27.422
1.692	23.821
1.769	24.970
1.782	24.510
1.872	28.417
1.910	31.635
2.013	29.489
2.038	27.880
2.064	26.960
2.115	28.033
2.128	27.573
2.141	30.944
2.192	28.798
2.192	29.641
2.244	27.802
2.359	31.096
2.385	29.180
2.397	28.261
2.410	30.100
2.436	29.563
2.474	29.410
2.500	30.865
2.513	29.946
2.526	27.723
2.551	25.961
2.590	26.420
2.615	29.792
2.641	31.018
2.641	34.543
2.705	26.803
2.718	24.504
2.756	30.404
2.756	33.086
2.782	27.645
2.859	31.476
2.872	37.989
2.949	32.931
2.962	32.165
2.987	30.173
2.987	30.479
3.090	34.003
3.103	29.635
3.141	33.390
3.218	32.547
3.231	30.478
3.244	34.232
3.269	27.949
3.269	34.539
3.282	31.857
3.423	32.699
3.538	34.230
3.590	31.318
3.603	32.238
3.603	31.548
3.667	30.015
3.718	33.693
3.718	31.624
3.718	28.865
3.731	32.467
3.744	30.934
3.756	32.850
3.808	37.830
3.821	36.604
4.064	30.932
4.077	31.698
4.077	34.687
4.090	32.541
4.115	34.150
4.167	35.452
4.179	33.843
4.179	34.609
4.218	33.153
4.679	33.074
4.705	31.388
4.705	32.690
4.718	31.694
5.051	32.688
5.090	33.607
5.103	31.002
5.205	33.070
5.244	32.227
5.590	32.608
5.744	32.530
5.833	34.369
6.141	34.597
6.154	33.371
7.090	33.058
7.679	32.288];
data.tL_m(:,1) = 365 * (0.2+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-5; end ;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(21.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KataYama2012';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
12.461	6.087
15.347	14.783
15.759	16.522
16.222	15.652
16.224	19.130
16.482	22.609
16.738	17.391
16.841	17.391
17.409	22.609
18.027	22.609
18.394	40.870
18.439	22.609
18.651	38.261
18.958	34.783
19.264	27.826
19.575	31.304
19.832	31.304
20.506	42.609
22.670	49.565
22.774	51.304
23.037	66.087
23.241	60.870
23.303	86.957
23.397	64.348
23.651	56.522
23.656	69.565
23.857	57.391
23.964	66.957
23.968	78.261
24.177	84.348
24.224	73.913
24.376	66.957
24.380	76.522
24.488	91.304
24.535	80.000
24.584	71.304
24.641	86.957
24.788	68.696
24.795	86.957
24.895	77.391
25.362	86.957
25.366	97.391
25.462	79.130
25.512	75.652
25.570	92.174
25.575	106.087
25.617	82.609
25.788	125.217
25.826	89.565
25.932	97.391
25.933	99.130
25.939	116.522
26.033	91.304
26.037	101.739
26.185	85.217
26.188	93.043
26.197	115.652
26.252	126.087
26.295	104.348
26.443	86.087
26.501	104.348
26.652	95.652
26.657	107.826
26.866	116.522
26.966	108.696
27.170	104.348
27.173	111.304
27.173	111.304
27.180	129.565
27.230	126.087
27.239	148.696
27.294	157.391
27.332	123.478
27.436	126.087
27.484	117.391
27.594	135.652
27.634	105.217
27.648	142.609
27.690	118.261
27.694	128.696
27.702	148.696
27.799	132.174
27.816	176.522
27.843	112.174
27.901	129.565
27.909	151.304
28.046	105.217
28.050	116.522
28.106	128.696
28.202	109.565
28.213	139.130
28.262	131.304
28.309	120.870
28.470	138.261
28.538	180.870
28.587	173.913
28.619	124.348
28.643	184.348
28.669	118.261
28.732	150.435
28.776	129.565
28.778	135.652
28.781	143.478
28.936	143.478
29.048	166.957
29.146	154.783
29.196	152.174
29.349	146.957
29.360	176.522
29.398	140.000
29.556	150.435
29.565	172.174
29.612	162.609
29.662	157.391
29.711	152.174
29.760	145.217
29.773	179.130
29.820	166.957
29.918	153.043
29.972	160.000
30.074	159.130
30.079	171.304
30.185	179.130
30.191	194.783
30.223	144.348
30.234	172.174
30.272	138.261
30.281	161.739
30.373	133.913
30.423	127.826
30.431	149.565
30.493	175.652
30.497	186.957
30.505	206.957
30.533	147.826
30.537	156.522
30.599	183.478
30.643	164.348
30.736	140.000
30.749	172.174
30.795	158.261
30.803	180.870
30.912	196.522
30.948	156.522
30.968	207.826
31.006	171.304
31.024	218.261
31.052	157.391
31.055	166.087
31.057	171.304
31.059	175.652
31.173	205.217
31.207	158.261
31.216	181.739
31.219	190.435
31.235	232.174
31.413	160.000
31.422	181.739
31.427	194.783
31.526	186.957
31.570	166.087
31.592	223.478
31.597	236.522
31.629	185.217
31.630	188.696
31.678	179.130
31.737	199.130
31.737	200.000
31.769	148.696
31.778	172.174
31.786	191.304
31.796	219.130
31.892	200.870
31.908	242.609
31.933	173.913
31.976	151.304
31.998	206.957
32.045	196.522
32.155	213.913
32.260	220.000
32.300	189.565
32.401	184.348
32.408	204.348
32.408	204.348
32.461	206.957
32.471	233.913
32.557	190.435
32.559	194.783
32.568	217.391
32.632	249.565
32.726	226.087
32.783	241.739
32.823	211.304
32.843	262.609
32.878	220.000
32.890	251.304
32.921	200.000
32.968	186.087
32.982	224.348
32.986	234.783
32.998	264.348
33.012	167.826
33.018	182.609
33.042	244.348
33.236	215.652
33.294	231.304
33.318	294.783
33.336	206.087
33.451	237.391
33.454	245.217
33.482	185.217
33.498	226.087
33.512	263.478
33.589	195.652
33.591	200.000
33.592	204.348
33.611	253.043
33.646	208.696
33.724	279.130
33.758	232.174
33.820	260.870
33.864	240.870
33.918	247.826
33.970	247.826
34.011	222.609
34.018	240.000
34.030	270.435
34.119	235.652
34.163	214.783
34.337	266.087
34.372	222.609
34.380	244.348
34.473	218.261
34.485	248.696
34.583	236.522
34.591	258.261
34.704	282.609
34.747	261.739
34.796	253.913
34.857	280.000
34.904	266.957
34.996	240.000
35.039	218.261
35.052	250.435
35.093	223.478
35.163	273.043
35.203	243.478
35.311	256.522
35.430	298.261
35.518	259.130
35.636	297.391
35.715	233.913
35.734	284.348
35.895	302.609
35.919	229.565
35.932	264.348
35.932	264.348
35.933	266.957
35.989	279.130
35.996	295.652
36.050	302.609
36.354	289.565
36.511	296.522
36.520	320.870
36.569	313.043
36.680	334.783
36.728	324.348
36.768	296.522
36.872	299.130
36.909	260.870
36.917	281.739
37.023	290.435
37.357	354.783
37.516	366.957
37.721	364.348
38.017	329.565
38.117	323.478
38.436	349.565
38.698	361.739
38.808	378.261
39.135	425.217
40.066	303.478
40.373	433.913
40.472	421.739];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'weight'};  
bibkey.LW = 'KataYama2012';

% length-fecundity
data.LN = [ ... toltal length (cm), fecundity (#)
26.622	255554.526
28.425	255729.919
29.224	275267.126
30.064	346700.170
34.649	397416.589
39.387	443282.991];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(21.9);  units.temp.LN = 'K'; label.temp.Ln = 'temperature';
bibkey.LN = 'BaecKim2004';
    

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

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
F1 = 'Length-Weight relationship: W in g = 0.00437*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6C5Z9'; % Cat of Life
metaData.links.id_ITIS = '616343'; % ITIS
metaData.links.id_EoL = '46570070'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_robustus'; % ADW
metaData.links.id_Taxo = '172578'; % Taxonomicon
metaData.links.id_WoRMS = '274222'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-robustus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus}}';
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
bibkey = 'KataYama2012'; type = 'article'; bib = [ ...
'doi = {10.33997/j.afs.2012.25.2.009}, ' ...
'author = {Satochi Katayama and Masayuki Yamamoto}, ' ...
'year = {2012}, ' ...
'title = {Age, Growth and Stock Status of Robust Tongue Sole \emph{Cynoglossus robustus} {G}\"{u}nther, 1873 in {J}apan Determined by a New Otolith Observation Technique}, ' ... 
'journal = {Asian Fisheries Science}, ' ...
'volume = {25}, ' ...
'pages = {206-217}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaecKim2004'; type = 'article'; bib = [ ...
'author = {Gun wool Baeck and Jae Won Kim}, ' ...
'year = {2004}, ' ...
'title = {Maturation and spawning of robust tonguefish (\emph{Cynoglossus robustus} ({S}oleidae; {T}eleostei))}, ' ... 
'journal = {J. Fish. Sci. Tech.}, ' ...
'volume = {7(3)}, ' ...
'pages = {136-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-robustus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
