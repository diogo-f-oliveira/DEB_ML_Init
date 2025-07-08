function [data, auxData, metaData, txtData, weights] = mydata_Pomacanthus_maculosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pomacanthiformes'; 
metaData.family     = 'Pomacanthidae';
metaData.species    = 'Pomacanthus_maculosus'; 
metaData.species_en = 'Yellowbar angelfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW', 'MPE','MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCis', 'jiCit'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 20];

%% set data
% zero-variate data

data.am = 14*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 21.6; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 50;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'reefbuilders';
  comment.Wwb = 'based on assumed egg diameter of 0.6 mm : 4/3*pi*0.03^3, motivated by being less then 0.9 mm for P. annularis'; 
data.Wwi = 2852; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ChunWoo1999';

data.Ri = 1.8e6/365; units.Ri = '#/d';   label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(27.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'guess based on kap = 0.95';

% uni-variate data
% time-length
data.tL_f = [ ... % age group (yr), total length (cm)
2.015	18.041
3.026	18.507
3.115	15.820
3.222	20.200
4.088	20.315
4.135	20.082
4.242	24.636
4.291	25.045
4.993	17.161
5.091	17.803
5.154	24.109
5.164	27.905
5.193	20.314
5.269	31.584
5.284	18.036
5.288	19.496
5.289	19.905
5.973	24.459
5.975	25.276
6.014	21.656
6.021	24.750
6.057	19.787
6.098	16.750
6.113	22.999
6.145	16.108
6.150	18.327
6.156	20.663
6.199	18.560
6.200	18.969
7.027	23.056
7.036	27.026
7.055	14.647
7.068	20.077
7.069	20.661
7.072	21.888
7.082	26.034
7.090	29.245
7.113	18.909
7.114	19.435
7.120	21.654
7.156	16.574
7.159	17.917
7.160	18.501
7.163	19.610
7.166	20.953
7.174	24.282
7.177	25.508
7.182	27.668
7.206	17.508
7.272	25.041
8.025	18.383
8.030	20.426
8.032	21.361
8.033	21.419
8.036	22.879
8.042	25.448
8.061	13.185
8.074	18.733
8.081	21.711
8.083	22.237
8.083	22.528
8.095	27.200
8.099	28.952
8.119	17.331
8.134	23.521
8.135	24.105
8.136	24.455
8.137	24.689
8.139	25.623
8.140	25.974
8.143	27.492
8.216	17.740
9.000	23.929
9.012	28.892
9.037	19.082
9.046	22.877
9.085	19.432
9.086	19.783
9.095	23.461
9.103	26.556
9.110	29.593
9.136	20.308
9.136	20.542
9.137	20.950
9.138	21.301
9.140	22.060
9.140	22.293
9.152	27.315
9.153	27.666
9.180	18.614
9.225	17.622
9.911	23.051
9.961	23.460
9.967	26.029
10.049	20.248
10.053	22.058
10.054	22.526
10.064	26.555
10.071	29.299
10.098	20.832
10.099	21.066
10.100	21.533
10.108	24.920
10.129	33.445
10.163	27.839
10.240	19.547
10.885	28.189
11.012	20.772
11.057	19.546
11.074	26.729
11.106	19.838
11.107	20.247
11.112	22.349
11.116	24.159
11.117	24.626
11.118	24.918
11.151	18.787
11.160	22.641
11.210	23.108
11.253	21.181
11.983	24.975
12.029	23.807
12.121	22.172
12.122	22.639
12.129	25.442
12.130	25.909
12.134	27.428
12.163	19.895
12.171	23.165
12.175	24.508
12.187	29.588
12.896	24.565
12.978	18.784
12.981	20.069
12.983	20.770
13.027	19.134
13.048	27.718
13.076	19.543
13.084	22.696
13.132	22.988
13.187	25.850
13.232	24.331
13.242	28.360
14.092	22.345
14.094	23.162
14.136	20.417
14.137	21.001
14.138	21.469
14.154	27.833
14.180	18.841
14.200	26.899
14.911	22.752
15.001	20.358
15.048	19.832
15.057	23.628
15.059	24.387
15.060	24.854
15.065	26.723
15.109	25.029
15.110	25.438
15.111	25.905
15.117	28.416
15.139	17.671
15.166	28.825
15.210	27.073
15.247	22.518
16.111	21.991
16.162	23.393
16.204	20.765
16.973	20.647
16.987	26.428
17.070	20.997
17.082	26.077
17.942	23.799
18.029	19.945
18.034	22.222
18.070	17.200
19.097	24.147
19.192	23.563
20.062	25.606
20.093	18.774
20.107	24.496
20.143	19.416
20.254	25.722
20.968	22.568
21.024	25.896
22.026	22.683
22.073	22.216
22.078	24.435
22.119	21.515
25.152	23.321
29.140	22.031
30.199	22.847
33.998	23.133
36.018	23.305];
data.tL_f(:,1) = 365* (data.tL_f(:,1) + 0); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f   = C2K(27.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GranAlAb2010';
%
data.tL_m = [ ... % age group (yr), total length (cm)
1.950	30.946
1.973	20.494
1.974	20.902
1.999	31.647
2.003	33.165
2.018	19.209
2.025	22.304
2.033	25.515
2.035	26.333
2.039	27.968
2.045	30.479
2.055	34.566
2.068	20.202
2.070	20.961
2.082	26.099
2.086	27.501
2.086	27.734
2.097	32.114
2.116	20.026
2.120	21.778
2.122	22.596
2.124	23.296
2.132	26.800
2.171	23.121
2.173	23.705
2.174	24.114
2.174	24.289
2.174	24.464
2.176	25.048
2.181	27.033
2.184	28.318
2.185	29.019
2.187	29.836
2.188	30.012
2.219	23.004
2.234	29.369
2.271	24.756
2.947	25.748
2.991	24.229
2.993	25.164
2.994	25.397
2.996	26.040
2.996	26.332
2.999	27.266
3.034	21.952
3.035	22.302
3.040	24.463
3.046	26.857
3.047	27.558
3.052	29.660
3.053	29.835
3.081	21.543
3.082	21.952
3.096	27.966
3.098	28.784
3.102	30.419
3.104	30.945
3.104	31.178
3.107	32.521
3.108	32.755
3.109	33.163
3.111	34.039
3.151	30.594
3.181	23.353
3.250	31.879
3.975	33.571
3.993	20.899
4.006	26.330
4.016	30.359
4.021	32.578
4.104	27.089
4.108	28.841
4.121	34.038
4.209	30.943
4.223	36.666
4.254	29.600
5.032	33.161
5.117	28.723
5.175	32.810
5.222	32.168
6.048	35.729
6.084	30.823
6.161	22.998
6.181	31.349
6.190	34.736
6.991	28.194
7.246	34.325
8.001	28.134
8.199	30.704
8.268	19.317
9.100	25.330
10.062	25.504
12.132	26.961
14.103	26.724
14.105	27.542
16.027	27.130
17.285	30.457
19.148	25.257
21.042	33.196
22.084	26.771];
data.tL_m(:,1) = 365* (data.tL_m(:,1) + 0); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m   = C2K(27.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GranAlAb2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Ri = 0 * weights.Ri;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 00.03090*(TL in cm)^2.89';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4LQ6P'; % Cat of Life
metaData.links.id_ITIS = '610541'; % ITIS
metaData.links.id_EoL = '46581142'; % Ency of Life
metaData.links.id_Wiki = 'Pomacanthus_maculosus'; % Wikipedia
metaData.links.id_ADW = 'Pomacanthus_maculosus'; % ADW
metaData.links.id_Taxo = '184415'; % Taxonomicon
metaData.links.id_WoRMS = '220005'; % WoRMS
metaData.links.id_fishbase = 'Pomacanthus-maculosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomacanthus_maculosus}}';
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
bibkey = 'GranAlAb2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2009.01380.x}, ' ...
'author = {Grandcourt, E. and Al Abdessalaam, T. Z. and Francis, F. and Al Shamsi, A.}, ' ... 
'year = {2010}, ' ...
'title = {Age-based life history parameters and status assessments of by-catch species (\emph{Lethrinus borbonicus}, \emph{Lethrinus microdon}, \emph{Pomacanthus maculosus} and \emph{Scolopsis taeniatus}) in the southern {A}rabian {G}ulf}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {26(3)}, ' ...
'pages = {381–389}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/Pomacanthus-maculosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

