function [data, auxData, metaData, txtData, weights] = mydata_Rhabdophis_tigrinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Rhabdophis_tigrinus'; 
metaData.species_en = 'Tiger keelback'; 

metaData.ecoCode.climate = {'Cwa', 'Cfa', 'Dwa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFm'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f';'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 13];

%% set data
% zero-variate data

data.ap = 4*365;     units.ap = 'd';      label.ap = 'age at puberty';       bibkey.ap = 'guess';
  temp.ap = C2K(22); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 33*365;    units.am = 'd';      label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 21.5;   units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';           bibkey.Lb  = 'Mori1987';
data.Li  = 130;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'EoL';
data.Lim  = 90;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'EoL';

data.Wwb = 6.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Mori1987';
data.Wwi = 800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';
data.Wwim = 260;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'EoL';
  
data.Ri  = 27/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Mori1987';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'litter from a single mother in captivity';
  
% univariate data
% time-length
data.tL2 = [ ... % time since birth (d), SVL (cm), hatch (time 0) at 15 Aug
0.000	21.505
9.622	22.549
16.457	23.658
24.619	24.115
39.615	25.682
45.031	25.421
66.747	25.554
73.552	26.011
80.322	25.685
99.344	26.274
118.332	26.080
144.119	26.213
150.891	25.953
165.829	26.215
171.245	25.954
201.096	25.957
218.730	25.828
236.393	26.352
240.457	26.221
250.003	27.266
258.179	28.049
267.695	28.441
274.509	29.094
285.373	29.291
292.172	29.617
297.591	29.422
307.071	29.032
317.953	29.620
323.392	29.881
335.646	30.795
349.306	32.818
376.567	35.560
398.316	36.410
407.808	36.280
426.807	36.347
439.034	36.674
440.382	36.478
452.600	36.610
475.667	36.612
487.879	36.613
502.814	36.810
508.235	36.680
529.948	36.747
542.160	36.748
548.945	36.749
557.083	36.685
567.962	37.207
580.185	37.469
591.064	37.992
599.241	38.775
619.647	39.951
626.461	40.604
633.240	40.474
648.224	41.780
657.749	42.367
665.893	42.433
669.990	43.021
684.907	42.826
688.996	43.218
699.868	43.610
716.183	44.329
720.254	44.330
728.422	44.917
732.487	44.787
741.994	44.984
747.412	44.789
754.214	45.180
765.058	44.921
780.001	45.313
789.488	45.053
805.761	44.859];
units.tL2  = {'d', 'cm'};  label.tL2 = {'time since birth', 'SVL', 'fed each 2 d'};  
temp.tL2   = C2K(30);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Mori1987';
comment.tL2 = 'fed every 2 d, 22-37C in summer, 3-13C in winter';
%
data.tL4 = [ ... % time since birth (d), SVL (cm), hatch (time 0) at 15 Aug
0.000	21.440
10.973	22.418
21.858	23.072
24.595	23.594
43.615	24.117
61.272	24.510
68.051	24.380
82.988	24.642
101.984	24.644
122.341	24.711
138.623	24.712
149.475	24.648
164.398	24.584
179.315	24.390
192.881	24.326
201.019	24.261
214.588	24.263
226.803	24.329
236.301	24.330
245.838	25.179
255.330	25.049
263.524	26.224
264.864	25.832
275.733	26.159
294.736	26.292
302.850	25.705
310.986	25.576
321.823	25.185
344.890	25.187
361.220	26.232
377.520	26.625
397.935	27.996
407.434	27.997
423.731	28.325
446.795	28.262
469.871	28.459
491.584	28.527
518.724	28.594
552.638	28.402
567.584	28.859
573.023	29.121
578.460	29.317
587.993	30.100
602.922	30.167
611.099	30.950
621.960	31.082
627.423	31.865
645.086	32.388
660.029	32.781
662.761	33.172
681.766	33.370
687.179	33.044
708.898	33.242
715.703	33.699
726.555	33.634
741.504	34.158
748.271	33.767
756.415	33.833
765.901	33.573
779.479	33.770
784.895	33.509
795.753	33.575
806.605	33.511];
units.tL4  = {'d', 'cm'};  label.tL4 = {'time since birth', 'SVL', 'fed each 4 d'};  
temp.tL4   = C2K(30);  units.temp.tL4 = 'K'; label.temp.tL4 = 'temperature';
bibkey.tL4 = 'Mori1987';
comment.tL4 = 'fed every 4 d, 22-37C in summer, 3-13C in winter';

% time-weight
data.tW2 = [ ... % time since birth (d), weight (g), hatch (time 0) at 15 Aug
00.000	7.150
20.699	6.807
26.219	7.658
34.499	6.974
55.198	9.357
62.098	9.015
68.998	9.695
78.658	8.158
97.977	8.409
114.537	7.979
128.336	7.976
146.276	7.630
171.115	7.539
189.055	7.535
211.134	7.615
222.174	7.613
242.873	8.461
252.533	9.311
259.433	10.248
263.573	9.650
271.853	9.307
293.932	9.302
300.832	8.788
316.011	8.955
322.911	8.698
342.231	10.655
351.890	12.956
362.930	13.294
369.830	14.913
378.110	17.726
390.529	19.002
400.189	19.426
407.089	21.727
416.749	20.616
431.928	19.163
440.208	19.502
448.488	18.818
465.047	17.961
492.647	17.613
509.206	17.268
532.665	16.751
540.945	17.090
550.605	16.747
561.645	16.744
580.964	17.678
596.144	20.489
601.664	21.170
607.183	23.386
615.463	22.617
622.363	22.871
630.643	22.272
637.543	23.891
641.682	23.208
652.722	23.205
658.242	23.204
678.941	25.587
685.841	24.221
691.361	25.158
694.121	24.731
705.161	25.325
709.301	24.556
716.200	25.237
724.480	25.235
741.040	27.705
754.839	29.322
761.739	29.661
771.399	31.706
778.299	32.813
789.338	30.593
797.618	31.615
808.658	30.333
816.938	29.904
825.217	28.964
836.257	28.279
848.677	28.447];
units.tW2  = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'fed each 2 d'};  
temp.tW2   = C2K(30);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Mori1987';
comment.tW2 = 'fed every 2 d, 22-37C in summer, 3-13C in winter';
%
data.tW4 = [ ... % time since birth (d), weight (g), hatch (time 0) at 15 Aug
0.000	6.212
22.079	5.954
41.399	5.949
57.958	7.481
66.238	6.967
74.518	7.732
82.798	7.219
106.257	7.213
126.957	7.123
154.556	6.946
179.395	6.770
200.095	6.936
218.034	6.676
233.214	7.269
252.533	8.032
266.333	7.432
280.132	6.832
293.932	6.317
298.072	5.804
311.871	6.142
318.771	5.543
338.091	5.880
349.130	6.986
354.650	6.644
371.210	7.663
378.110	9.367
382.250	8.855
393.289	9.961
397.429	9.960
408.469	11.834
411.229	11.406
420.888	13.025
429.168	12.511
437.448	12.168
447.108	12.422
449.868	11.994
459.527	11.992
470.567	11.393
492.647	10.961
510.586	10.786
528.526	10.526
542.325	10.949
556.125	10.690
569.924	11.199
582.344	11.537
596.144	13.154
600.284	12.983
608.563	13.493
611.323	13.065
619.603	14.343
627.883	13.317
637.543	14.083
641.682	12.973
647.202	12.716
658.242	12.969
680.321	12.708
692.741	13.814
696.881	13.045
707.921	13.640
714.820	12.188
724.480	12.016
735.520	12.439
747.940	14.398
752.079	13.203
770.019	15.331
782.439	14.220
792.098	15.582
803.138	16.006
811.418	15.322
823.837	14.807
836.257	13.610
844.537	14.205];
units.tW4  = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight', 'fed each 4 d'};  
temp.tW4   = C2K(30);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'Mori1987';
comment.tW4 = 'fed every 4 d, 22-37C in summer, 3-13C in winter';

%% set weights for all real data
weights = setweights(data, []);
weights.tL2 = 3 * weights.tL2;
weights.tL4 = 3 * weights.tL4;
weights.tW2 = 3 * weights.tW2;
weights.tW4 = 3 * weights.tW4;

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

%% Group plots
set1 = {'tL2','tL4'}; subtitle1 = {'Data for being fed every 2, 4 d'};
set2 = {'tW2','tW4'}; subtitle2 = {'Data for being fed every 2, 4 d'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-length: SVL = 0.805 * TL - 1.03 cm for females, SVL = 0.768 TL - 3.99 cm for males; SVL and weight were the same for males and females';
metaData.bibkey.F1 = 'Mori1987'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RW5G'; % Cat of Life
metaData.links.id_ITIS = '700839'; % ITIS
metaData.links.id_EoL = '1055425'; % Ency of Life
metaData.links.id_Wiki = 'Rhabdophis_tigrinus'; % Wikipedia
metaData.links.id_ADW = 'Rhabdophis_tigrinus'; % ADW
metaData.links.id_Taxo = '49950'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Rhabdophis&species=tigrinus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhabdophis_tigrinus}}';
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
bibkey = 'Mori1987'; type = 'Article'; bib = [ ... 
'title = {Growth Pattern in the Juvenile {J}apanese Grass Snake, \emph{Rhabdophis tigrinus tigrinus}, in Captivity}, ' ...
'journal = {Japanese Journal of Herpetology}, ' ...
'year = {1987}, ' ...
'author = {Akira Mori}, ' ....
'volume = {11(1)}, ' ...
'pages = {1-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1055425}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

