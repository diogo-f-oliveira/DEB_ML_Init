  function [data, auxData, metaData, txtData, weights] = mydata_Pygocentrus_nattereri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Serrasalmidae';
metaData.species    = 'Pygocentrus_nattereri'; 
metaData.species_en = 'Red-bellied piranha'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L_f'; 'Ww-N_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2022 07 12];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2022 07 12]; 

%% set data
% zero-variate data
data.ab = 9.5;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 28*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 13.5;    units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'DupoLino2007';
data.Li = 50;    units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'DupoLino2007';
  comment.Wwb = 'based on egg diameter of 1.6 mm: pi/6*.16^3';
data.Wwi = 3.5e3;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
data.Wwim = (23/24)^3*3.5e3;  units.Wwim = 'g';    label.Wwim = 'max wet weight';    bibkey.Wwim = 'guess';
  comment.Wwim = 'Based on ratio of Wwi and (tL_Mm(infty)/tL_Mf)^3';
 
% univariate data
% time-length
data.tL_Mf = [ ... % time since birth (yr), standard length (cm)
0.405	8.273
0.567	12.727
0.850	10.182
0.850	9.227
0.850	11.534
0.891	11.057
0.891	14.636
0.891	15.114
0.891	15.511
0.891	16.864
0.911	13.125
0.931	13.761
0.951	14.795
0.972	12.091
0.992	11.057
1.113	19.330
1.134	9.466
1.134	10.102
1.134	10.659
1.134	11.693
1.134	16.148
1.134	15.432
1.134	14.795
1.134	14.477
1.134	14.080
1.134	13.761
1.457	17.261
1.457	16.705
1.579	17.818
1.579	16.705
1.619	18.295
1.619	19.091
1.619	19.966
1.660	16.148
1.660	15.830
1.781	19.011
1.781	17.261
1.822	18.455
1.862	17.341
1.862	16.545
1.862	16.227
1.903	18.773
1.943	17.102
1.964	17.023
2.024	17.818
2.045	18.136
2.065	22.273
2.105	23.148
2.126	20.682
2.308	19.011
2.652	21.000
2.814	20.364
2.814	19.807
2.834	21.239
2.854	19.409
2.955	20.682
3.057	21.955
3.117	20.364
3.239	20.045
3.441	22.909
3.563	24.023
3.806	22.193
3.887	22.989
3.887	23.864
3.947	20.920
3.947	21.159
3.968	22.034
3.968	22.830
4.049	21.636
4.211	22.034
4.453	24.023
4.453	23.227
4.474	22.193
4.534	24.182
4.615	21.875
4.636	23.227
4.636	22.352
4.636	21.477
4.636	21.000
4.656	20.364
4.717	24.261
4.798	22.511
4.818	21.955
4.818	23.545
4.858	21.477
4.858	24.182
4.919	21.955
4.939	22.511
4.939	23.068
4.939	23.705
5.020	20.920
5.121	25.216
5.243	26.011
5.243	22.193
5.486	23.864
5.486	23.545
5.506	24.659
5.567	24.500
5.587	22.830
5.628	23.386
5.668	21.636
5.668	22.273
5.688	23.943
5.709	22.909
5.789	22.034
5.789	22.670
5.810	24.580
5.830	21.318
5.830	23.705
5.850	24.182
5.911	23.386
5.951	22.432
5.972	24.500
6.194	24.182
6.255	24.102
6.457	23.864
6.538	23.545
6.640	20.761
6.680	22.591
6.680	24.500
6.721	24.023
6.802	21.795
6.802	22.034
6.802	22.591
6.842	25.057
6.964	23.148
6.964	23.864
6.984	22.273
6.984	24.977
7.126	24.818
7.409	24.023
7.429	21.398
7.591	24.102
7.611	25.375
7.692	23.227
7.794	23.307
7.854	24.023
7.895	25.773
7.996	23.148
8.219	22.591
8.543	24.182
8.826	22.989
9.008	23.864
9.231	24.977];
data.tL_Mf(:,1) = (1 + data.tL_Mf(:,1)) * 365; % convert yr to d
units.tL_Mf   = {'d', 'cm'};  label.tL_Mf = {'time since birth', 'standard length', 'females, Mamore basin'};  
temp.tL_Mf    = C2K(27);  units.temp.tL_Mf = 'K'; label.temp.tL_Mf = 'temperature';
bibkey.tL_Mf = 'DupoLino2007';
comment.tL_Mf = 'Data for females, Mamore basin (white waters)';
%
data.tL_Mm = [ ... % time since birth (d), standard length (cm)
0.385	8.376
0.769	14.678
0.810	11.647
0.810	12.365
0.850	13.162
0.850	14.120
0.891	15.157
0.972	13.481
1.012	14.279
1.113	15.077
1.113	14.519
1.113	13.960
1.134	17.311
1.134	13.561
1.134	12.764
1.134	12.444
1.417	16.912
1.457	18.587
1.457	15.875
1.498	17.869
1.619	18.028
1.619	15.635
1.640	20.900
1.660	17.231
1.822	17.390
1.842	16.274
1.883	16.274
1.903	16.912
2.024	15.635
2.105	17.550
2.126	19.464
2.126	20.581
2.308	17.869
2.429	18.587
2.470	18.108
2.632	18.507
2.672	20.741
3.279	18.906
3.279	20.182
3.401	20.821
3.421	21.459
3.644	20.661
3.684	18.507
3.806	20.182
3.826	20.741
3.846	19.066
4.291	22.177
4.291	20.900
4.453	21.379
4.656	19.783
4.656	20.422
4.656	21.618
4.777	20.661
4.777	20.980
4.798	18.906
4.798	22.097
4.919	22.416
4.939	21.299
4.960	19.863
5.101	22.256
5.445	22.336
5.466	20.342
5.648	21.858
5.850	20.980
5.870	21.379
6.012	21.299
6.316	22.017
6.316	23.214
6.397	21.060
6.437	19.145
6.640	20.661
6.802	23.293
6.802	20.262
6.822	22.575
7.186	23.613
7.206	20.980
7.267	23.134
7.287	23.214
7.389	20.741
7.551	23.613
7.551	22.974
7.652	24.410
7.773	23.852
7.996	22.336
8.583	23.613];
data.tL_Mm(:,1) = (1 + data.tL_Mm(:,1)) * 365; % convert yr to d
units.tL_Mm   = {'d', 'cm'};  label.tL_Mm = {'time since birth', 'standard length', 'males, Mamore basin'};  
temp.tL_Mm    = C2K(27);  units.temp.tL_Mm = 'K'; label.temp.tL_Mm = 'temperature';
bibkey.tL_Mm = 'DupoLino2007';
comment.tL_Mm = 'Data for females, Mamore basin (white waters)';
%
data.tL_If = [ ... % time since birth (d), standard length (cm)
0.579	12.037
0.580	12.755
0.862	11.873
0.885	15.941
0.902	11.074
0.902	11.314
0.903	12.670
0.903	13.228
0.904	14.265
0.905	14.903
0.924	13.627
0.925	14.584
1.024	12.349
1.046	15.300
1.085	13.624
1.227	14.260
1.228	15.217
1.250	17.929
1.290	17.450
1.309	15.854
1.310	16.173
1.552	15.531
1.676	19.996
1.756	19.038
1.915	15.206
1.955	14.887
1.956	15.684
1.957	17.120
1.958	19.114
2.018	18.076
2.019	19.911
2.038	17.119
2.198	15.840
2.219	17.116
2.220	18.233
2.221	19.509
2.222	20.945
2.301	18.790
2.302	20.066
2.303	21.103
2.361	18.151
2.687	21.975
2.726	18.943
2.726	19.820
2.890	22.131
2.928	19.976
2.929	20.694
3.011	22.049
3.069	18.937
3.089	18.059
3.210	18.057
3.717	21.160
3.897	18.366
3.898	19.642
3.899	20.679
4.060	20.597
4.142	22.191
4.264	22.428
4.888	19.307
4.952	25.129
4.970	21.220
4.970	21.699
5.113	23.133
5.130	19.303
5.131	20.260
5.151	21.058
5.275	23.609
5.312	20.258
5.354	22.171
5.436	23.127
5.920	22.242
5.961	22.800
6.121	20.324
6.121	21.282
6.142	22.159
6.143	23.196
6.930	21.588
7.133	22.941
8.123	24.122];
data.tL_If(:,1) = (1 + data.tL_If(:,1)) * 365; % convert yr to d
units.tL_If   = {'d', 'cm'};  label.tL_If = {'time since birth', 'standard length', 'females, Itenez basin'};  
temp.tL_If    = C2K(27);  units.temp.tL_If = 'K'; label.temp.tL_If = 'temperature';
bibkey.tL_If = 'DupoLino2007';
comment.tL_If = 'Data for females, Itenez basin (clear waters)';
%
data.tL_Im = [ ... % time since birth (d), standard length (cm)
0.848	12.318
0.869	14.871
0.869	13.195
0.889	14.152
0.889	11.520
0.889	10.722
0.949	11.758
1.030	14.788
1.051	15.426
1.051	11.757
1.071	13.112
1.273	16.220
1.273	14.784
1.293	15.502
1.434	15.819
1.475	16.536
1.495	14.542
1.515	17.333
1.899	17.965
1.899	16.849
1.919	15.173
2.081	16.367
2.323	18.756
2.343	17.958
2.343	19.633
2.485	17.637
2.485	18.355
2.889	18.428
2.889	17.870
2.889	17.391
3.354	19.857
3.899	19.050
3.919	20.167
4.061	17.931
4.323	20.958
4.889	20.391
4.909	21.188
5.152	20.147
5.313	22.857
5.313	21.820
5.879	22.369
6.121	21.727
6.303	23.958
7.293	24.660];
data.tL_Im(:,1) = (1 + data.tL_Im(:,1)) * 365; % convert yr to d
units.tL_Im   = {'d', 'cm'};  label.tL_Im = {'time since birth', 'standard length', 'males, Itenez basin'};  
temp.tL_Im    = C2K(27);  units.temp.tL_Im = 'K'; label.temp.tL_Im = 'temperature';
bibkey.tL_Im = 'DupoLino2007';
comment.tL_Im = 'Data for females, Itenez basin (clear waters)';

% weight - fecundity
data.WwN_M = [ ... % wet weight (g), fecundity (#)
177.049	11667.679
258.548	5937.648
313.817	8598.811
353.162	15283.964
378.454	13402.306
414.052	14091.340
453.396	25059.150
472.131	27116.830
476.815	17095.918
496.487	13757.555
517.096	19841.131
553.630	14534.551
599.532	21734.324
607.026	22677.312
618.267	26447.252
633.255	16770.056
656.675	35701.899
677.283	22427.875
751.288	22178.839];
units.WwN_M   = {'g', '#'};  label.WwN_M = {'wet weight', 'fecundity', 'Mamore basin'};  
temp.WwN_M    = C2K(27);  units.temp.WwN_M = 'K'; label.temp.WwN_M = 'temperature';
bibkey.WwN_M = 'DupoLino2007';
comment.WwN_M = 'Mamore basin (white waters)';
%
data.WwN_I = [ ... % wet weight (g), fecundity (#)
125.527	3782.080
160.187	7211.914
263.232	11591.255
272.600	7223.949
348.478	10058.626
355.972	9545.509
378.454	7834.853
406.557	11263.985
438.408	15036.133
451.522	9555.739
467.447	9814.404
485.246	9987.613
498.361	12044.692
518.033	21297.334
524.590	14788.401
543.326	12135.162
565.808	19246.774];
units.WwN_I   = {'g', '#'};  label.WwN_I = {'wet weight', 'fecundity', 'Itenez basin'};  
temp.WwN_I    = C2K(27);  units.temp.WwN_I = 'K'; label.temp.WwN_I = 'temperature';
bibkey.WwN_I = 'DupoLino2007';
comment.WwN_I = 'Itenez basin (clear waters)';

%% set weights for all real data
weights = setweights(data, []);
weights.WwN_M = 2 * weights.WwN_M;
weights.WwN_I = 2 * weights.WwN_I;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;
weights.Li = 3 * weights.Li;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 200 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Group plots
set1 = {'tL_Mf','tL_Mm'}; subtitle1 = {'Females, males from Mamore basin'};
set2 = {'tL_If','tL_Im'}; subtitle2 = {'Females, males from Itenez basin'};
set3 = {'WwN_M','WwN_I'}; subtitle3 = {'Mamore, Itenez basin'};
metaData.grp.sets = {set1, set2, set3};
metaData.grp.subtitle = {subtitle1, subtitle2, subtitle3};

%% Facts
F1 = 'Preferred temp: 23-27 C';
metaData.bibkey.F1    = 'fishbase';
F2 = 'Weight (g) = 0.02089*(TL in cm)^3.17 ';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4QP42'; % Cat of Life
metaData.links.id_ITIS = '641816'; % ITIS
metaData.links.id_EoL = '1004114'; % Ency of Life
metaData.links.id_Wiki = 'Pygocentrus_nattereri'; % Wikipedia
metaData.links.id_ADW = 'Pygocentrus_nattereri'; % ADW
metaData.links.id_Taxo = '185642'; % Taxonomicon
metaData.links.id_WoRMS = '1018170'; % WoRMS
metaData.links.id_fishbase = 'Pygocentrus-nattereri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Pygocentrus_nattereri}}';  
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
bibkey = 'DupoLino2007'; type = 'Article'; bib = [ ...  
'author = {F. Duponchelle and F. Lino and N. Huberts and J. Panfili and J.-F. Renno and E. Baras and J. P. Torrico andR. Dugue and J. Nu\~{n}ez}, ' ...
'year  = {2007}, ' ...
'title = {Environment-related life-history trait variations of the red-bellied piranha \emph{Pygocentrus nattereri} in two river basins of the {B}olivian {A}mazon}, ' ...  
'doi = {1111/j.1095-8649.2007.01583.x}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {71}, ' ...
'pages = {1113–1134}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pygocentrus-nattereri.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

