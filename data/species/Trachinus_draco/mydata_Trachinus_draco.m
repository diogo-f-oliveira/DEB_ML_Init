function [data, auxData, metaData, txtData, weights] = mydata_Trachinus_draco
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Trachinidae';
metaData.species    = 'Trachinus_draco'; 
metaData.species_en = 'Greater weever'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 23];

%% set data
% zero-variate data

data.ab = 4.5;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'fishbase';   
  temp.ab = C2K(16.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AkGenc2013';   
  temp.am = C2K(10.9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 53;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.89e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.04 mm: pi/6*0.104^3';
data.Wwp = 11;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00562*Lp^3.05, see F1';
data.Wwi = 1.02e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^3.05, see F1; max published weight 1.9 kg';
 
data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'AkGenc2013';
  temp.GSI = C2K(10.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
    1 13.12 12.73
    2 16.52 15.53
    3 19.04 17.48
    4 21.41 19.37
    5 23.53 21.08
    6 24.95 NaN];  
data.tL_fm(:,1) = (1.8+data.tL_fm(:,1))*365; % convert to yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(10.9);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'AkGenc2013'; treat.tL_fm = {1, {'females','males'}};
  
% length-weight
data.LW_f = [ ... total length (cm), weight (g)
9.987	7.900
10.246	7.162
10.602	7.539
10.990	10.145
11.023	9.032
11.088	10.889
11.281	9.407
11.282	11.635
11.411	10.895
11.443	9.410
11.638	11.270
11.735	11.272
11.735	12.757
12.059	13.134
12.156	15.364
12.187	9.794
12.188	12.393
12.415	13.140
12.448	17.597
12.512	15.370
12.577	13.885
12.738	12.774
12.901	16.119
13.029	13.150
13.030	17.978
13.224	16.124
13.258	22.067
13.289	17.611
13.322	20.954
13.386	18.355
13.484	22.070
13.515	16.501
13.580	14.645
13.581	20.215
13.613	17.988
13.677	15.389
13.743	20.218
13.872	20.592
13.937	19.107
13.970	22.450
14.065	16.510
14.098	18.367
14.132	23.567
14.294	26.912
14.357	18.743
14.358	20.971
14.518	15.775
14.520	23.202
14.553	25.059
14.649	20.233
14.909	26.179
14.941	23.580
15.038	25.810
15.168	27.669
15.264	23.215
15.298	28.414
15.331	31.014
15.523	25.447
15.524	26.932
15.557	29.904
15.652	22.478
15.685	24.707
15.815	28.051
15.816	32.879
15.945	28.425
16.009	25.084
16.204	32.143
16.205	35.114
16.205	36.599
16.268	28.059
16.301	29.174
16.332	24.347
16.429	26.205
16.431	34.746
16.497	37.718
16.560	29.549
16.657	32.151
16.721	29.552
16.757	42.179
16.918	41.067
16.950	39.954
17.145	41.814
17.242	40.330
17.306	37.360
17.436	42.933
17.563	32.909
17.565	38.850
17.693	33.653
17.857	42.569
17.953	41.085
18.083	43.687
18.151	55.200
18.243	34.777
18.246	48.888
18.277	42.947
18.280	54.088
18.442	54.090
18.571	54.093
18.635	50.752
18.665	39.611
18.798	56.325
18.830	52.240
18.927	53.727
18.994	63.384
19.057	57.814
19.088	50.388
19.183	43.334
19.251	56.332
19.443	48.537
19.541	50.767
19.542	55.966
19.571	39.998
19.606	54.110
19.864	49.287
19.869	70.083
19.967	73.055
20.029	63.401
20.060	57.089
20.253	52.264
20.480	55.982
20.543	44.842
20.742	66.755
21.160	57.850
21.229	75.676
21.554	82.737
21.649	71.970
21.905	61.576
21.907	70.860
22.169	82.748
22.263	69.380
22.457	67.156
22.625	97.981
22.748	70.503
23.008	74.963
23.043	83.505
23.372	108.020
23.505	123.248
23.562	88.713
24.023	124.742
24.991	114.732
25.382	125.136
25.572	108.057
25.804	132.942];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'AkGenc2013';
%
data.LW_m = [ ... total length (cm), weight (g)
9.475	6.371
9.795	7.854
10.435	7.495
10.595	9.345
10.723	10.455
10.979	10.460
11.043	8.244
11.202	13.419
11.235	10.464
11.299	11.573
11.491	10.468
11.587	13.056
11.619	11.579
11.747	10.473
11.875	10.844
11.939	14.539
12.067	13.064
12.259	14.914
12.355	13.807
12.451	12.701
12.547	16.396
12.675	13.813
12.770	18.616
12.868	13.447
12.931	17.511
13.027	14.927
13.091	16.775
13.220	14.561
13.250	20.102
13.443	15.673
13.475	19.736
13.539	18.629
13.731	16.786
13.859	18.265
13.987	19.376
14.114	22.333
14.148	15.315
14.243	18.641
14.244	17.902
14.339	20.859
14.370	25.292
14.403	22.707
14.562	24.557
14.564	17.908
14.595	20.125
14.658	26.775
14.721	28.623
14.723	20.866
14.850	24.562
14.978	25.303
15.043	21.610
15.107	22.350
15.170	29.000
15.235	24.199
15.297	31.588
15.330	27.525
15.491	24.572
15.521	33.438
15.524	21.987
15.554	30.484
15.682	28.639
15.714	30.856
15.715	26.054
15.779	26.424
15.843	23.839
15.970	29.752
16.002	30.861
16.130	31.602
16.163	24.214
16.193	34.558
16.225	37.144
16.353	35.669
16.353	33.822
16.386	29.389
16.577	36.781
16.578	32.717
16.608	41.583
16.611	29.763
16.641	35.304
16.643	27.177
16.672	38.999
16.801	36.784
16.993	36.049
16.994	33.463
16.994	32.355
17.024	41.590
17.057	38.636
17.153	39.376
17.154	33.466
17.345	39.379
17.376	41.227
17.378	33.839
17.442	32.732
17.537	37.535
17.600	45.663
17.665	39.015
17.760	45.296
17.953	40.498
18.047	50.473
18.047	49.734
18.114	37.545
18.145	41.609
18.465	42.723
18.786	39.403
19.008	48.642
20.126	59.743
20.288	52.727
20.542	64.182
20.959	57.910
21.980	77.135
22.493	73.819];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'AkGenc2013';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'I had to add 1.8 yr to ages estimates in tL data';
D3 = 'The incubationtime 4.5 d leads to an estimate for v of 0.12 cm/d, which seems large; ab is ignored';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: weight in g = 0.00562*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PDQ'; % Cat of Life
metaData.links.id_ITIS = '170992'; % ITIS
metaData.links.id_EoL = '46573179'; % Ency of Life
metaData.links.id_Wiki = 'Trachinus_draco'; % Wikipedia
metaData.links.id_ADW = 'Trachinus_draco'; % ADW
metaData.links.id_Taxo = '46392'; % Taxonomicon
metaData.links.id_WoRMS = '127082'; % WoRMS
metaData.links.id_fishbase = 'Trachinus-draco'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachinus_draco}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Trachinus-draco.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AkGenc2013'; type = 'article'; bib = [ ...  
'author = {Orhan Ak and Yasar Gen\c{c}}, ' ...
'year = {2013}, ' ...
'title  = {Growth and reproduction of the greater weever (\emph{Trachinus draco} {L}., 1758) along the eastern coast of the {B}lack {S}ea}, ' ...
'journal = {J. Black Sea/Mediterranean Environment}, ' ...
'volume = {19(1)}, ' ...
'pages = {95-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
