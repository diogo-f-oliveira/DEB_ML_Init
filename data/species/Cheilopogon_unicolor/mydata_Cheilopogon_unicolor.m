function [data, auxData, metaData, txtData, weights] = mydata_Cheilopogon_unicolor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Exocoetidae';
metaData.species    = 'Cheilopogon_unicolor'; 
metaData.species_en = 'Limpid-wing flyingfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 07 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   


metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 07 14]; 

%% set data
% zero-variate data

data.ab = 2;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 177;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(28.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Read from tL-curve, given Lp';
data.am = 1.5*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 26.5;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on same relative length compared to Hirundichthys_affinis: 38*20.9/30';
data.Li  = 38.0;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki_t';
  comment.Wwb = 'based on egg diameter of 0.5-0.8 mm for tobiko: pi/6*0.07^3';

data.Ri = 83.5; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(28.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on size-corrected value for Hirundichthys_affinis: (38/30)^3*1.5e4/365';
 
% uni-variate data
% t-L data
data.tL = [... % time since birth (d), fork length (cm)
0.042	1.842
0.059	2.855
0.084	5.526
0.084	2.855
0.087	6.447
0.105	6.632
0.119	7.368
0.136	7.368
0.280	17.776
0.294	18.237
0.301	18.513
0.315	18.697
0.388	19.066
0.490	21.829
0.601	27.263
0.608	26.711
0.629	27.355
0.640	27.632
0.689	27.263
0.696	28.000
0.696	27.539
0.699	27.263
0.741	26.895
0.748	27.816
0.748	28.000
0.776	27.171
0.811	27.632
0.857	27.355
1.066	28.000
1.070	28.737
1.115	25.697
1.150	26.250
1.164	27.263
1.168	31.132
1.168	26.526
1.192	27.908
1.199	27.908
1.210	29.105
1.213	28.276
1.220	28.000
1.231	28.921
1.245	28.000
1.252	29.105
1.269	27.079
1.273	29.750
1.287	30.026
1.294	27.079
1.294	27.263
1.294	27.908
1.297	28.368
1.318	30.211
1.325	30.395
1.325	28.184
1.332	28.921
1.336	27.447
1.336	29.842
1.343	29.289
1.350	30.579
1.350	28.000
1.360	28.737
1.378	28.829
1.385	30.487
1.388	29.658];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChanYuan2022';

% length - weight
data.LWw_f = [ ... % fork length (cm), wet weight (g)
2.097	1.164
2.565	2.379
3.126	4.828
3.127	1.113
3.688	3.562
3.970	1.071
4.999	3.497
5.093	2.254
5.748	3.460
6.311	0.955
6.590	7.134
6.965	5.877
7.620	5.844
12.579	21.698
17.338	92.050
17.625	67.268
17.902	83.353
18.463	84.564
18.466	73.418
18.746	77.120
21.454	106.707
21.733	117.839
22.387	123.998
25.086	193.214
25.271	203.112
25.273	194.443
25.277	178.344
26.673	211.712
27.144	200.543
27.232	226.545
27.426	194.337
27.788	250.046
28.166	235.167
28.361	202.959
28.444	246.299
28.529	283.446
28.533	264.870
28.911	249.991
28.998	278.469
29.107	212.829
29.183	288.367
29.268	326.753
29.272	309.416
29.382	241.299
29.563	264.819
29.651	292.059
29.653	283.391
30.023	299.471
30.028	279.657
30.297	329.179
30.301	313.080
30.399	293.261
30.412	238.771
30.582	315.543
30.760	355.162
30.772	301.911
30.855	345.250
30.953	330.385
31.127	386.104
31.415	355.130
31.512	340.264
31.604	347.690
31.611	315.492
31.888	335.292
31.890	326.623
31.995	277.083
32.056	417.018
32.163	360.046
32.272	294.406
32.343	388.520
32.352	350.130
32.439	378.609
32.531	386.034
32.639	324.109
32.713	410.793
32.723	368.687
32.736	310.482
32.904	393.446
32.911	363.725
32.916	341.433
33.191	367.426
33.748	388.451];
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'fork length','wet weight','females'};  
bibkey.LWw_f = 'ChanYuan2022';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % fork length (cm), wet weight (g)
13.233	30.334
13.982	30.297
15.011	31.484
15.102	45.102
15.103	37.672
15.666	35.167
15.944	48.776
16.223	54.954
16.787	45.019
17.346	57.375
17.621	82.129
17.718	69.740
17.810	73.451
19.208	104.341
21.540	141.378
21.822	136.410
22.941	157.407
22.944	145.023
23.315	156.150
23.876	162.314
24.440	152.379
24.624	165.993
25.095	156.062
25.178	199.402
25.276	180.821
25.276	180.821
25.553	199.383
25.837	182.032
25.922	220.417
26.112	210.501
26.120	177.064
26.208	200.589
26.211	185.728
26.296	221.637
26.300	206.776
26.304	190.677
26.585	190.663
26.666	241.433
26.669	230.288
26.765	221.614
26.770	199.323
26.846	272.384
26.862	205.510
27.049	205.501
27.127	274.847
27.137	230.264
27.141	215.404
27.147	189.397
27.234	217.876
27.404	289.694
27.413	250.065
27.421	215.390
27.423	210.436
27.513	222.815
27.706	200.515
27.784	266.146
27.786	256.238
27.790	240.139
27.791	236.424
27.794	225.278
27.794	225.278
27.795	217.848
27.966	288.428
27.977	240.130
28.073	230.218
28.162	250.028
28.165	238.882
28.173	205.445
28.248	285.937
28.251	269.838
28.271	188.103
28.443	251.252
28.449	224.007
28.534	261.155
28.538	247.532
28.538	246.294
28.539	240.102
28.541	232.672
28.639	215.329
28.717	280.960
28.718	276.007
28.801	323.061
28.901	295.812
28.906	272.282
28.910	257.421
28.911	253.706
29.003	257.417
29.071	370.107
29.076	349.054
29.085	309.425
29.189	266.076
29.194	245.023
29.277	287.124
29.282	266.071
29.365	311.888
29.463	295.784
29.467	277.208
29.470	266.062
29.570	238.813
29.655	273.483
29.745	288.340
29.749	273.479
29.928	306.906
29.929	304.430
30.019	319.286
30.024	295.756
30.033	258.604
30.034	253.650
30.120	285.844
30.208	309.369
30.310	274.689
30.316	249.921
30.402	280.877
30.491	303.163
30.681	289.532
31.049	319.235
31.244	284.550
31.420	334.077
31.518	315.496
31.803	298.145
31.982	334.049];
units.LWw_m = {'cm', 'g'};     label.LWw_m = {'fork length','wet weight','males'};  
bibkey.LWw_m = 'ChanYuan2022';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lp = 3 * weights.Lp;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouped plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Fecundity is assumed to equal that of Cheilopogon melanurus';
D2 = 'shape coefficient for fork length is assumed 0.95 * that for standard length';
D3 = 'Li is given more weight to assure a proper max length';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Preferred temp 24.5 - 29.3 C';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'TSF9'; % Cat of Life
metaData.links.id_ITIS = '645245'; % ITIS
metaData.links.id_EoL = '46566917'; % Ency of Life
metaData.links.id_Wiki = 'Cheilopogon'; % Wikipedia
metaData.links.id_ADW = 'Cheilopogon_unicolor'; % ADW
metaData.links.id_Taxo = '170704'; % Taxonomicon
metaData.links.id_WoRMS = '217858'; % WoRMS
metaData.links.id_fishbase = 'Cheilopogon-unicolor'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cheilopogon}}'];
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
bibkey = 'ChanYuan2022'; type = 'Article'; bib = [ ... 
'doi = {10.3389/fmars.2021.747382}, ' ...
'author = {Shui-Kai Chang and Tzu-Lun Yuan and Simon D. Hoyle and Jessica H. Farley and Jen-Chieh Shiao}, ' ... 
'year = {2022}, ' ...
'title = {Growth Parameters and Spawning Season Estimation of Four Important Flyingfishes in the {K}uroshio Current Off {T}aiwan and Implications From Comparisons With Global Studies}, ' ...
'journal = {Front. Mar. Sci.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Cheilopogon-unicolor.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_t'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Tobiko}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

