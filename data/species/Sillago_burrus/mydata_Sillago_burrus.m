function [data, auxData, metaData, txtData, weights] = mydata_Sillago_burrus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_burrus'; 
metaData.species_en = 'Western trumpeter sillago';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MINE'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 14];

%% set data
% zero-variate data

data.ab = 3;       units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 8*365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'HyndPott1996';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'at least 5 yrs';

data.Lp  = 13.4; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 36;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'HyndPott1996';
  comment.Wwb = 'Oocyte diameter 0.93 mm, assumed hedrated egg diameter of 0.66 mm of Sillago sihama: pi/6*0.066^3';
data.Wwi = 510.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00851*Li^3.07, see F1';
 
data.Ri  = 150e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity 150000';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
0.058	3.201
0.116	2.042
0.154	6.922
0.174	6.591
0.174	6.260
0.174	5.847
0.174	5.847
0.174	2.455
0.193	7.418
0.212	7.501
0.232	10.974
0.232	7.831
0.232	5.515
0.232	4.440
0.232	4.192
0.232	3.944
0.251	11.884
0.251	9.237
0.251	8.162
0.251	2.372
0.270	8.575
0.270	4.936
0.270	3.116
0.309	18.004
0.309	13.372
0.328	16.929
0.328	12.462
0.328	12.876
0.367	15.853
0.367	6.176
0.386	16.184
0.386	5.762
0.425	8.409
0.444	13.454
0.444	14.281
0.541	13.122
0.560	12.378
0.560	11.964
0.560	11.716
0.560	9.400
0.560	8.325
0.579	12.957
0.579	11.385
0.618	9.731
0.637	16.347
0.637	17.257
0.657	8.903
0.695	17.588
0.811	19.654
0.830	18.000
0.830	17.256
0.850	18.331
0.869	18.910
0.869	17.586
0.869	12.706
0.888	13.037
0.946	14.194
0.946	17.834
0.965	14.360
0.965	19.405
0.965	16.924
0.965	16.510
0.965	16.262
0.985	20.646
0.985	17.089
1.004	15.352
1.004	18.660
1.004	19.157
1.062	13.697
1.062	15.599
1.081	19.156
1.159	14.606
1.159	17.997
1.159	18.328
1.178	14.771
1.178	16.178
1.178	16.839
1.197	17.501
1.217	15.846
1.255	15.350
1.294	16.590
1.294	18.244
1.294	18.823
1.332	20.477
1.332	17.665
1.352	19.567
1.371	17.003
1.371	16.424
1.429	19.732
1.429	18.491
1.448	18.905
1.448	17.251
1.468	20.807
1.583	16.422
1.583	19.565
1.622	17.663
1.622	18.573
1.641	16.753
1.661	15.512
1.719	18.489
1.834	17.578
1.834	19.563
1.834	19.315
1.873	20.142
1.892	21.134
1.989	16.088
1.989	18.818
2.008	17.163
2.047	18.321
2.066	19.396
2.085	21.546
2.105	17.907
2.124	21.050
2.143	17.410
2.143	19.726
2.163	16.252
2.182	21.463
2.201	19.312
2.279	18.484
2.375	21.296
2.433	20.716
2.896	23.442
2.993	19.223
3.051	21.621
3.070	22.696
3.090	23.275
3.167	22.365
3.321	22.032
3.406	20.502
4.034	24.905];
data.tL_f(:,1) = (data.tL_f(:,1) + 0) * 365;
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length','females'};  
temp.tL_f  = C2K(27.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HyndPott1996';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
0.000	2.489
0.020	5.385
0.078	3.817
0.117	10.684
0.117	7.375
0.117	4.150
0.117	2.909
0.117	2.247
0.137	6.632
0.156	8.287
0.156	6.219
0.176	3.326
0.196	9.695
0.196	6.801
0.196	2.913
0.215	11.433
0.215	7.711
0.215	4.982
0.215	4.568
0.254	12.263
0.274	13.256
0.274	13.587
0.274	13.835
0.293	10.280
0.293	12.182
0.293	14.002
0.293	6.144
0.313	16.319
0.313	6.310
0.333	17.560
0.333	16.485
0.391	14.089
0.391	8.796
0.430	13.264
0.450	15.002
0.450	14.258
0.489	14.673
0.509	13.599
0.509	8.885
0.528	9.795
0.548	12.939
0.548	11.120
0.548	10.789
0.567	16.911
0.567	12.031
0.587	16.002
0.606	18.567
0.626	17.658
0.645	16.005
0.782	18.411
0.782	17.170
0.802	18.991
0.822	20.315
0.822	16.841
0.822	14.608
0.841	12.955
0.861	14.031
0.880	16.431
0.919	14.034
0.939	13.291
0.978	16.601
0.978	16.105
0.978	15.195
0.998	20.324
0.998	14.782
1.076	19.501
1.076	17.516
1.095	16.773
1.095	18.427
1.115	15.202
1.115	16.691
1.115	17.766
1.115	18.097
1.134	14.045
1.134	18.512
1.154	15.121
1.174	18.431
1.174	16.280
1.193	16.695
1.193	15.454
1.193	14.875
1.213	15.703
1.213	13.057
1.252	20.089
1.252	17.691
1.291	17.196
1.311	20.589
1.311	18.355
1.350	19.929
1.350	17.282
1.389	16.705
1.447	18.445
1.467	19.852
1.487	18.861
1.545	16.051
1.584	19.114
1.604	16.303
1.604	16.882
1.604	19.446
1.663	17.794
1.760	21.108
1.800	21.937
1.839	21.526
1.858	20.782
1.976	16.239
1.995	16.985
2.054	18.063
2.093	20.133
2.093	18.892
2.093	18.727
2.112	19.637
2.132	17.819
2.171	18.565
2.347	19.484
2.386	20.727
2.425	20.729
2.504	20.071
2.504	20.402
2.954	17.944
3.130	21.013
3.306	21.271
3.403	21.276
3.834	22.373
4.108	21.974
4.401	22.320];
data.tL_m(:,1) = (data.tL_m(:,1) + 0) * 365;
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length','males'};  
temp.tL_m  = C2K(27.7); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HyndPott1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

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
D1 = 'males are assumed to differ for females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00851*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XDP5'; % Cat of Life
metaData.links.id_ITIS = '646042'; % ITIS
metaData.links.id_EoL = '46579895'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_burrus'; % Wikipedia
metaData.links.id_ADW = 'Sillago_burrus'; % ADW
metaData.links.id_Taxo = '187644'; % Taxonomicon
metaData.links.id_WoRMS = '273938'; % WoRMS
metaData.links.id_fishbase = 'Sillago-burrus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_burrus}}';
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
bibkey = 'HyndPott1996'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00354637}, ' ...
'author = {G. A. Hyndes and I. C. Potter and S. A. Hesp}, ' ... 
'year = {1996}, ' ...
'title = {Relationships between the movements, growth, age structures, and reproductive biology of the teleosts \emph{Sillago burrus} and \emph{S. vittata} in temperate marine waters}, ' ...
'journal = {Marine Biology }, ' ...
'volume = {126(3)}, ' ...
'pages = {549–558}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago-burrus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
