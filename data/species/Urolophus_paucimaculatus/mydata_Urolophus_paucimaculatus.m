function [data, auxData, metaData, txtData, weights] = mydata_Urolophus_paucimaculatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urolophidae';
metaData.species    = 'Urolophus_paucimaculatus'; 
metaData.species_en = 'Sparsely-spotted stingaree'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 11*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'WhitPott2005';    
  temp.ab = C2K(16.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'WhitPott2005';   
  temp.am = C2K(16.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 11;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'WhitPott2005';
data.Lp = 22.29;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty for females'; bibkey.Lp  = 'WhitPott2005';
data.Lpm = 20.69;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'WhitPott2005'; 
data.Li  = 27.2;  units.Li  = 'cm';  label.Li  = 'ultimate disc width for females';   bibkey.Li  = 'WhitPott2005';
data.Lim  = 25.6;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'WhitPott2005'; 

data.Wwi = 329; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'WhitPott2005'; 
  comment.Wwi = 'based on 10^-5.20 *(10*Li)^3.17, see F1';
data.Wwim = 340; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'WhitPott2005'; 
  comment.Wwim = 'based on 10^-5.03 *(10*Lim)^3.14, see F1';

data.Ri  = 1.5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'WhitPott2005';   
  temp.Ri = C2K(16.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 to 2 pups per litter';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), disk width (cm)
0.002	11.226
0.001	10.529
0.003	12.241
0.002	10.275
0.003	11.543
0.002	9.577
0.004	13.827
0.004	13.002
0.015	12.431
0.075	11.543
0.076	10.338
0.104	11.860
0.106	10.719
0.135	11.036
0.163	12.368
0.163	12.178
0.251	13.636
0.251	13.129
0.252	12.495
0.253	11.543
0.309	14.905
0.309	14.715
0.340	13.636
0.368	15.666
0.369	14.271
0.399	14.144
0.399	13.636
0.400	12.431
0.427	15.159
0.486	15.920
0.545	15.666
0.576	14.524
0.576	14.397
0.578	13.002
0.663	16.300
0.723	15.983
0.781	16.934
0.782	15.729
0.783	15.222
0.784	14.271
0.812	16.237
0.842	15.095
0.902	15.222
0.929	17.569
0.930	16.934
0.932	14.905
1.049	16.237
1.078	16.554
1.079	15.539
1.255	17.125
1.492	17.378
1.523	15.983
1.550	18.774
1.552	16.871
1.553	16.110
1.641	17.188
1.671	16.871
1.671	16.554
1.701	16.300
1.729	17.569
1.731	15.793
1.732	15.159
1.758	18.964
1.758	18.076
1.788	18.266
1.790	15.983
1.816	19.535
1.816	19.345
1.818	17.505
1.819	16.934
1.965	18.584
1.966	18.203
1.966	17.759
1.967	17.378
1.967	16.934
1.967	16.554
2.054	19.281
2.142	19.408
2.144	18.330
2.171	20.106
2.173	18.584
2.233	18.203
2.233	17.822
2.291	19.154
2.291	18.837
2.469	19.345
2.498	19.852
2.648	18.013
2.734	21.121
2.736	19.091
2.823	20.359
2.825	18.203
2.854	18.837
2.855	18.584
2.855	18.266
3.030	21.057
3.209	20.106
3.210	19.471
3.238	20.423
3.239	19.725
3.299	19.218
3.387	19.662
3.476	19.915
3.684	19.535
3.712	21.438
3.742	20.613
3.770	22.262
3.950	20.296
4.156	21.755
4.275	20.867
4.304	22.008
4.541	21.945
4.570	22.706
4.572	20.930
4.572	20.613
4.747	23.531
4.985	22.833
5.165	20.740
5.372	20.803
5.786	21.691
5.876	21.121
5.902	24.672
6.053	21.755
6.228	24.609
6.290	21.818
6.557	21.945
6.882	23.214
6.969	24.545
7.237	23.404
7.504	23.848
7.531	25.814
7.739	25.687
7.771	23.214
7.829	24.419
7.830	23.848
7.830	23.531
7.976	25.497
8.008	23.658
8.215	23.975
8.778	24.228
9.072	26.956
9.075	24.038
9.103	25.243
9.220	27.146
9.488	25.370
9.784	26.258
9.815	24.355
10.497	24.545
11.176	27.209
11.236	26.448
11.771	24.989
11.799	26.956
11.830	26.068
12.243	27.209
12.246	24.355];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
temp.tL_f = C2K(23.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WhitPott2005'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disk width (cm)
0.011	9.451
0.015	12.939
0.015	12.685
0.016	10.909
0.018	9.070
0.045	11.607
0.074	12.241
0.076	10.465
0.076	9.957
0.077	9.577
0.105	10.782
0.133	13.002
0.134	11.352
0.191	13.699
0.194	10.781
0.222	11.986
0.223	11.606
0.250	13.699
0.252	12.367
0.279	14.523
0.310	13.064
0.338	14.396
0.339	14.206
0.340	12.937
0.367	15.157
0.397	14.840
0.398	13.825
0.456	15.220
0.485	15.537
0.516	14.522
0.517	13.317
0.544	15.727
0.693	14.965
0.693	14.521
0.752	15.409
0.780	16.360
0.782	14.902
0.868	17.248
0.869	16.804
0.869	16.297
0.870	14.838
0.871	14.140
0.899	15.852
0.903	12.174
0.957	17.565
0.987	16.867
1.016	17.184
1.017	16.359
1.019	14.139
1.045	18.262
1.047	15.535
1.076	16.549
1.222	18.134
1.222	17.881
1.251	18.515
1.281	18.959
1.285	14.646
1.308	20.671
1.370	18.007
1.402	15.533
1.489	17.182
1.520	16.103
1.727	16.547
1.756	17.308
1.756	16.737
1.757	16.102
1.758	15.088
1.783	19.527
1.784	18.069
1.791	11.028
1.813	19.147
1.815	17.117
1.816	15.658
1.873	18.258
1.933	17.878
1.934	16.355
1.991	18.639
2.020	19.399
2.020	18.765
2.021	18.194
2.022	17.180
2.022	16.926
2.079	19.146
2.082	16.165
2.196	20.540
2.286	19.335
2.316	19.018
2.493	19.144
2.583	18.446
2.611	19.460
2.672	18.319
2.758	20.982
2.791	17.684
2.819	18.635
2.881	16.351
2.907	20.030
2.995	20.981
3.023	22.059
3.024	21.615
3.084	20.410
3.144	19.648
3.203	19.331
3.233	18.950
3.261	20.346
3.292	19.077
3.352	18.442
3.440	19.647
3.618	19.139
3.706	19.836
3.734	21.612
3.764	20.343
3.793	21.104
3.822	21.992
3.854	19.519
3.968	24.338
3.969	23.387
3.969	22.943
3.972	19.772
3.999	22.562
4.000	21.928
4.031	20.533
4.088	22.308
4.147	21.991
4.178	20.595
4.208	20.278
4.297	20.214
4.356	20.468
4.474	20.975
4.532	21.799
4.593	19.706
4.710	21.862
4.738	22.876
4.768	22.559
4.802	18.690
4.827	22.876
4.828	22.305
4.829	20.973
4.856	23.193
4.945	23.066
4.974	23.510
5.006	21.607
5.006	21.226
5.066	20.719
5.093	22.811
5.183	22.050
5.184	20.972
5.272	21.162
5.273	21.098
5.390	21.922
5.420	21.478
5.478	22.493
5.507	23.317
5.536	23.698
5.537	22.810
5.538	22.239
5.539	20.590
5.774	22.428
5.803	23.062
5.805	21.603
5.953	21.476
5.981	22.554
5.981	22.300
5.982	21.983
5.983	20.968
6.009	24.330
6.010	23.759
6.010	23.505
6.010	23.252
6.010	22.934
6.218	22.109
6.306	22.997
6.455	21.981
6.542	23.820
6.546	20.268
6.778	24.327
6.779	23.692
6.809	22.994
6.898	22.550
6.987	22.169
7.015	24.135
7.016	23.374
7.075	22.930
7.222	24.008
7.224	21.914
7.282	23.690
7.786	22.673
7.990	25.400
7.994	21.975
8.021	24.575
8.022	23.560
8.494	24.129
8.790	24.381
8.790	23.937
8.848	25.206
9.176	23.302
9.530	24.315
9.796	24.060
9.974	23.362
9.975	22.664
10.210	24.819];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
temp.tL_m = C2K(16.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WhitPott2005'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g  = 10^-5.20 * (DW in mm)^3.17 for females; 10^-5.03 * (DW in mm)^3.14 for males';
metaData.bibkey.F1 = 'WhitPott2005'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DW86'; % Cat of Life
metaData.links.id_ITIS = '564432'; % ITIS
metaData.links.id_EoL = '46561061'; % Ency of Life
metaData.links.id_Wiki = 'Urolophus_paucimaculatus'; % Wikipedia
metaData.links.id_ADW = 'Urolophus_paucimaculatus'; % ADW
metaData.links.id_Taxo = '189799'; % Taxonomicon
metaData.links.id_WoRMS = '283108'; % WoRMS
metaData.links.id_fishbase = 'Urolophus-paucimaculatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urolophus_paucimaculatus}}'; 
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
bibkey = 'WhitPott2005'; type = 'Article'; bib = [ ... 
'author = {William T. White and Ian C. Potter}, ' ...
'year = {2005}, ' ...
'title  = {Reproductive biology, size and age compositions and growth of the batoid \emph{Urolophus paucimaculatus}, including comparisons with other species of the {U}rolophidae}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {56}, ' ...
'pages = {101-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Urolophus-paucimaculatus.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 