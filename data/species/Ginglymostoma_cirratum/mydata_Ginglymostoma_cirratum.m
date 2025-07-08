function [data, auxData, metaData, txtData, weights] = mydata_Ginglymostoma_cirratum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Orectolobiformes'; 
metaData.family     = 'Ginglymostomatidae';
metaData.species    = 'Ginglymostoma_cirratum'; 
metaData.species_en = 'Nurse shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MA','MPE'};
metaData.ecoCode.habitat = {'0iMr','0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 01];


%% set data
% zero-variate data

data.ab = 5.5*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'Cast2000';   
  temp.ab = C2K(27.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '5-6 mnth';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(27.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 28;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ADW';  
  comment.Lp = '27-30 cm';
data.Lp  = 235;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = '230-240 cm';
data.Li  = 430;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Ri  = 24/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '21-28 pups per litter, 1 litter each  yr';

% uni-variate data
 
% time - length
data.tL_1 = [ ... % time (d), total length (cm)
0.000	73.191
252.871	86.832
286.008	87.671
320.390	89.395
352.385	90.767
381.978	91.611
416.387	93.689
448.355	94.707
483.906	96.252
511.360	100.114
543.328	101.132
576.491	102.325
607.291	103.522
642.934	106.308
671.280	106.267
704.482	107.992
738.721	107.765
770.637	108.073
803.773	108.912
835.846	111.348
869.061	113.251
902.211	114.267
929.520	116.178
963.864	117.370
999.336	117.851
1028.942	118.872
1065.622	119.705
1097.498	119.481
1128.246	119.969];
units.tL_1   = {'d', 'cm'};  label.tL_1 = {'time', 'total length'};  
temp.tL_1    = C2K(25);  units.temp.tL_1 = 'K'; label.temp.tL_1 = 'temperature';
bibkey.tL_1  = 'CarrLuer1990';
comment.tL_1 = 'Data for individual 1';
%
data.tL_2 = [ ... % time (d), total length (cm)
0.000	82.059
287.474	107.536
319.403	108.021
351.319	108.330
383.366	110.412
417.683	111.248
445.058	114.047
479.494	116.480
511.671	120.335
546.068	122.236
576.946	124.497
607.773	126.049
639.820	128.131
671.749	128.616
703.626	128.393
736.762	129.231
772.287	130.421
799.570	131.978
835.239	135.119
869.687	137.729
901.629	138.392
932.456	139.944
964.555	142.735
998.794	142.508
1029.555	143.172
1060.277	143.305
1096.904	143.429
1126.458	143.741];
units.tL_2   = {'d', 'cm'};  label.tL_2 = {'time', 'total length'};  
temp.tL_2    = C2K(25);  units.temp.tL_2 = 'K'; label.temp.tL_2 = 'temperature';
bibkey.tL_2  = 'CarrLuer1990';
comment.tL_2 = 'Data for individual 2';
%
data.tL_3 = [ ... % time (d), total length (cm)
0.000	84.365
253.248	107.941
282.894	109.494
318.327	109.442
352.710	111.166
381.069	111.302
416.502	111.250
443.864	113.871
479.415	115.416
514.021	120.155
545.884	119.753
571.895	120.070
608.718	122.855
637.183	124.410
667.904	124.542
703.521	126.974
737.825	127.633
767.444	128.832
801.840	130.733
836.354	134.230
869.530	135.601
897.903	135.914
932.246	137.106
966.577	138.120
1002.206	140.729
1027.049	141.225
1060.185	142.063
1093.387	143.789
1126.484	144.095];
units.tL_3   = {'d', 'cm'};  label.tL_3 = {'time', 'total length'};  
temp.tL_3    = C2K(25);  units.temp.tL_3 = 'K'; label.temp.tL_3 = 'temperature';
bibkey.tL_3  = 'CarrLuer1990';
comment.tL_3 = 'Data for individual 3';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
79.276	3694.195
86.149	3428.326
90.950	4186.492
91.404	4665.991
94.614	4259.095
102.162	5157.246
103.989	5638.312
103.995	5090.908
104.210	6459.679
104.215	5980.702
105.138	5297.490
105.820	5777.253
107.636	7421.553
108.785	7012.306
109.251	6260.148
109.475	6670.962
111.526	7699.694
112.903	7427.560
112.906	7085.432
114.732	7771.774
114.966	7224.634
114.972	6677.230
116.330	8252.583
117.479	7843.336
118.164	8049.396
118.618	8460.471
119.540	7845.686
119.773	7435.395
121.139	8326.491
122.499	9696.568
122.503	9286.015
122.516	7985.930
126.621	9701.269
126.630	8811.736
126.825	12301.695
128.212	11003.179
129.805	11962.963
130.017	13673.859
131.652	10459.692
131.874	11212.634
133.230	12993.262
133.244	11624.752
134.606	12789.553
135.992	11559.464
136.900	12450.036
137.595	11561.292
143.750	14510.634
150.136	17186.539
152.179	19036.376
153.168	11579.051
165.203	21993.556
168.383	24597.378
172.076	21727.689
174.044	31172.748];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f  = 'CarrLuer1990';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
83.040	3375.732
87.403	4011.742
90.609	4011.742
94.512	4549.901
96.339	4305.284
97.042	5185.910
97.264	4794.520
97.482	4158.513
99.342	5724.069
100.020	5185.910
101.172	5577.298
103.007	5772.994
103.010	5919.765
105.089	6898.237
105.540	6506.849
105.543	6653.621
108.745	6457.924
108.968	6115.459
110.130	7045.009
110.821	7289.628
111.505	7093.934
112.451	8708.414
113.108	7093.934
113.556	6555.772
114.003	5968.688
114.700	6506.849
115.628	7142.857
115.643	7974.560
117.489	8708.414
118.854	8219.177
120.012	8953.032
121.150	8561.643
121.373	8219.177
121.383	8757.337
122.982	8561.643
123.218	8953.032
123.694	9931.506
125.069	9980.430
125.917	6262.230
126.223	10469.667
126.898	9784.735
127.606	10958.903
128.043	9784.735
128.265	9393.345
128.276	10029.354
128.283	10371.819
128.725	9540.117
128.754	11105.674
129.909	11643.835
130.356	11056.751
131.958	11007.827
132.662	11937.378
133.087	10127.201
133.107	11203.522
133.769	9833.659
134.270	12181.996
134.306	14138.943
136.580	13258.317
137.456	11105.674
142.121	15704.501
142.542	13698.630
143.464	14041.095
144.621	14677.104
146.431	13454.011
148.762	15704.501
148.807	18150.684
148.818	18786.693
150.587	15313.111
152.502	19863.014
152.921	17710.371
153.975	12769.080
163.064	21379.648
166.266	21135.029
170.133	19716.242
172.045	24070.450
176.769	19422.700];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m  = 'CarrLuer1990';
comment.LWw_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_1 = 5 * weights.tL_1;
weights.tL_2 = 5 * weights.tL_2;
weights.tL_3 = 5 * weights.tL_3;
weights.Li = 5 * weights.Li;
weights.Lp = 5 * weights.Lp;
weights.Lb = 5 * weights.Lb;
weights.am = 5 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_3','tL_2','tL_1'}; subtitle1 = {'Data for individual 3,2,1'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6KFCS'; % Cat of Life
metaData.links.id_ITIS = '159977'; % ITIS
metaData.links.id_EoL = '46559677'; % Ency of Life
metaData.links.id_Wiki = 'Ginglymostoma_cirratum'; % Wikipedia
metaData.links.id_ADW = 'Ginglymostoma_cirratum'; % ADW
metaData.links.id_Taxo = '101363'; % Taxonomicon
metaData.links.id_WoRMS = '105846'; % WoRMS
metaData.links.id_fishbase = 'Ginglymostoma-cirratum'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ginglymostoma_cirratum}}';
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
bibkey = 'CarrLuer1990'; type = 'article'; bib = [ ... 
'author = {Jeffrey C. Carrier and Carl A. Luer}, ' ... 
'year = {1990}, ' ...
'title = {Growth Rates in The Nurse Shark, \emph{Ginglymostoma cirratum}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1990(3)}, ' ...
'pages = {686-692}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cast2000'; type = 'article'; bib = [ ... 
'author = {Jos\''{e} I. Castro}, ' ... 
'year = {2000}, ' ...
'title = {The biology of the nurse shark, \emph{Ginglymostoma cirratum}, off the {F}lorida east coast and the {B}ahama {I}slands}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {58}, ' ...
'pages = {1-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Ginglymostoma-cirratum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Ginglymostoma_cirratum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

