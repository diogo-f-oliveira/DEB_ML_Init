function [data, auxData, metaData, txtData, weights] = mydata_Apogon_imberbis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Kurtiformes'; 
metaData.family     = 'Apogonidae';
metaData.species    = 'Apogon_imberbis'; 
metaData.species_en = 'Cardinalfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 24];

%% set data
% zero-variate data

data.am = 5*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(16.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'Rave2007'; 
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.438e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MazzRand2008';
  comment.Wwb = 'based on egg diameter  650 mum: pi/6*0.065^3';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time (yr), total length (cm)
0.146	5.126
0.153	3.692
0.154	3.243
0.155	5.540
0.156	5.298
0.157	4.262
0.158	3.830
0.159	3.623
0.160	2.932
0.164	5.644
0.178	2.707
0.318	6.040
0.397	6.645
0.404	6.541
0.626	6.108
0.650	6.626
0.651	5.607
0.656	6.523
0.662	6.298
0.902	7.783
0.963	7.921
0.969	8.007
0.975	7.800
1.068	7.972
1.240	8.421
1.486	8.713
1.560	9.214
1.578	8.592
1.658	9.127
1.732	9.196
1.733	8.747
1.734	8.540
1.812	9.748
1.818	9.196
1.819	8.712
1.917	8.522
1.979	8.884
1.997	9.402
2.065	8.729
2.249	9.350
2.471	9.522
2.477	9.038
2.563	9.608
2.570	8.900
2.576	9.210
2.588	8.986
2.649	9.711
2.656	8.312
2.662	8.709
2.736	9.175
2.737	8.709
2.822	8.968
2.914	9.589
2.915	9.296
2.969	9.624
2.982	9.382
2.983	9.244
2.987	9.157
2.988	9.071
2.989	9.002
3.049	9.779
3.073	10.245
3.074	10.107
3.075	9.986
3.076	9.450
3.086	9.882
3.142	10.072
3.153	10.210
3.154	10.020
3.155	9.744
3.160	9.502
3.246	10.089
3.474	9.466
3.659	10.398
3.720	11.383
3.905	10.950
3.991	11.105
4.071	10.794
4.132	11.537
4.133	10.742
4.564	10.672
4.570	10.792];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth','total length','females'};  
temp.tL_f    = C2K(16.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Rave2007';
%
data.tL_m = [ ... % time (yr), total length (cm)
0.558	5.504
0.564	5.659
0.570	6.229
0.828	7.645
0.976	7.385
0.977	7.143
0.982	7.610
1.240	8.213
1.332	8.956
1.486	8.592
1.560	7.970
1.640	8.920
1.671	8.022
1.715	7.642
1.720	8.073
1.726	8.246
1.732	9.075
1.813	8.021
1.831	9.058
1.855	8.902
1.911	8.919
1.972	8.522
1.973	8.314
1.979	8.245
1.984	10.041
1.991	8.176
1.992	8.021
2.065	8.470
2.471	8.537
2.484	8.693
2.485	8.192
2.486	8.036
2.576	8.744
2.661	9.849
2.674	8.986
2.730	8.864
2.748	9.780
2.816	9.365
2.914	9.106
2.963	10.021
2.970	9.278
2.975	10.228
2.982	9.710
2.983	9.157
2.984	8.984
2.985	8.518
2.986	8.225
3.056	9.761
3.062	9.623
3.068	8.932
3.129	9.848
3.135	10.020
3.203	9.847
3.228	9.571
3.493	10.019
3.561	9.207
3.658	10.623
3.979	10.242
3.985	11.019
3.986	10.035
3.991	10.380
4.058	10.535
4.059	9.620
4.139	11.001
4.145	10.483
4.151	11.226
4.662	11.017];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth','total length','males'};  
temp.tL_m    = C2K(16.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Rave2007';

% length-weight
data.LW_f = [ ... % total length (cm), wet weight (g)
6.694	2.380
7.005	3.921
7.085	3.658
7.685	5.159
7.902	6.786
7.909	6.216
7.967	5.734
7.967	5.690
8.083	6.218
8.098	3.980
8.126	5.956
8.495	7.541
8.495	6.532
8.502	8.770
8.503	6.049
8.698	6.622
8.878	8.468
8.885	9.961
8.980	7.065
8.994	8.163
9.017	6.100
9.088	9.130
9.095	10.183
9.110	8.077
9.110	7.638
9.182	9.877
9.197	9.131
9.211	8.649
9.212	7.815
9.283	9.659
9.291	9.133
9.298	8.826
9.378	7.730
9.385	8.959
9.385	8.651
9.392	9.749
9.399	10.319
9.493	11.374
9.493	10.233
9.494	8.390
9.494	8.346
9.501	9.136
9.508	9.531
9.580	9.883
9.609	8.962
9.616	10.366
9.674	9.884
9.710	11.553
9.710	10.719
9.724	11.992
9.797	11.949
9.804	13.266
9.804	10.281
9.811	12.871
9.812	10.413
9.818	12.476
9.891	11.906
9.891	11.116
9.898	10.634
9.906	10.502
9.978	10.415
9.984	13.663
9.992	12.742
9.992	12.083
9.999	11.469
10.000	11.162
10.000	10.942
10.086	13.709
10.092	15.684
10.093	12.173
10.188	10.375
10.282	11.649
10.288	13.536
10.289	12.307
10.304	10.771
10.469	15.689
10.483	16.260
10.484	12.442
10.491	13.671
10.491	13.232
10.499	11.827
10.671	15.692
10.708	14.332
10.802	13.851
10.990	16.750
10.996	18.374
10.997	15.960
11.091	15.215
11.473	22.024
11.482	17.591
11.489	16.494
11.691	18.735];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight','females'};  
bibkey.LW_f = 'Rave2007';
%
data.LW_m = [ ... % total length (cm), wet weight (g)
6.795	2.820
7.012	3.218
7.107	3.132
7.982	6.217
8.285	6.485
8.307	7.012
8.394	7.320
8.597	6.884
8.604	6.314
8.683	8.378
8.683	7.939
8.683	7.412
8.792	7.589
8.799	7.063
8.871	8.424
8.900	7.459
9.009	7.593
9.016	9.348
9.168	8.297
9.204	10.799
9.204	10.580
9.226	8.956
9.298	9.484
9.392	10.626
9.392	9.749
9.392	8.300
9.399	8.608
9.486	8.521
9.501	9.487
9.580	11.595
9.602	9.225
9.609	9.840
9.681	10.455
9.681	9.928
9.688	12.649
9.717	10.587
9.797	9.579
9.862	12.871
9.862	12.257
9.862	11.292
9.869	10.984
9.891	10.678
9.891	10.019
9.978	11.952
9.992	12.654
9.992	11.557
10.000	10.942
10.000	9.845
10.079	12.611
10.086	14.455
10.086	13.050
10.101	12.041
10.108	10.505
10.173	11.428
10.187	12.745
10.202	13.535
10.202	12.350
10.288	14.282
10.317	14.809
10.505	14.812
10.520	15.119
10.541	15.339
10.570	15.822
10.585	14.418
10.585	13.584
10.693	15.956
10.694	14.069
10.788	14.860
10.794	17.098
10.896	14.203
10.990	15.082
11.091	18.112
11.113	16.840
11.192	18.596
11.199	17.148
11.272	17.193
11.286	18.247
11.489	17.372
11.604	18.953
11.792	21.326
11.981	18.388];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight','males'};  
bibkey.LW_m = 'Rave2007';

% length-fecundity
data.LN = [ ... % time (d), total length (cm)
7.383	4041.401
7.992	6893.360
8.391	8094.855
8.588	7897.796
8.774	9100.487
8.896	2017.380
8.988	8147.504
8.988	9631.172
9.079	11086.342
9.184	7502.546
9.287	11225.145
9.292	10917.183
9.485	14331.347
9.489	11000.062
9.496	14919.153
9.585	12539.182
9.598	16990.122
9.686	9655.260
9.979	14160.614
9.987	19227.448
9.995	10969.234
11.003	14490.807];
units.LN   = {'cm', '#'};  label.LN = {'total length', 'eggs in mouth of male'};  
temp.LN    = C2K(16.3);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Rave2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Male tends the eggs by storing them in his mouth; internal fertilisation';
metaData.bibkey.F1 = 'Rave2007'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'FSF8'; % Cat of Life
metaData.links.id_ITIS = '168247'; % ITIS
metaData.links.id_EoL = '46577578'; % Ency of Life
metaData.links.id_Wiki = 'Apogon_imberbis'; % Wikipedia
metaData.links.id_ADW = 'Apogon_imberbis'; % ADW
metaData.links.id_Taxo = '45163'; % Taxonomicon
metaData.links.id_WoRMS = '273021'; % WoRMS
metaData.links.id_fishbase = 'Apogon-imberbis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apogon_imberbis}}';
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
bibkey = 'Rave2007'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2007.00847.x}, ' ...
'author = {N. Raventos}, ' ... 
'year = {2007}, ' ...
'title = {Age, growth and reproductive parameters of the {M}editerranean cardinal fish, \emph{Apogon imberbis}}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {23}, ' ...
'pages = {675–678}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MazzRand2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2007.00847.x}, ' ...
'author = {C. Mazzoldi and A. Randieri and E. Mollica and M. B. Rasotto}, ' ... 
'year = {2008}, ' ...
'title = {NOTES ON THE REPRODUCTION OF THE CARDINALFISH \emph{Apogon imberbis} FROM {L}ACHEA {I}SLAND, {C}ENTRAL {M}EDITERRANEAN, {S}ICILY, {I}TALY}, ' ...
'journal = {Vie et Milieu - Life and Environment}, ' ...
'volume = {58(1)}, ' ...
'pages = {675–678}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Apogon-imberbis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
