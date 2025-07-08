function [data, auxData, metaData, txtData, weights] = mydata_Sillago_robusta

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_robusta'; 
metaData.species_en = 'Stout whiting'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011


metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 03 06];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 7 * 365;  units.am = 'd';      label.am = 'life span';                 bibkey.am = 'HyndPott1996';   
  temp.am = C2K(23.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.3;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'HyndPott1996';  
data.Lpm  = 12.0;   units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'HyndPott1996';  
data.Li  = 30;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'HyndPott1996';
  comment.Wwb = 'based on egg diameter of 0.88 mm: pi/6*0.088^3';
data.Wwp = 18.5;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','HyndPott1996'};
  comment.Wwi = 'based on 0.00832*Lp^3.07, see F1';
data.Wwi = 285;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^3.07, see F1';

data.Ri = 8e6/365;   units.Ri = 'g';  label.Ri = 'Reprod rate max rate';           bibkey.Ri = 'guess';
  temp.Ri = C2K(23.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.566	7.121
0.659	6.700
0.679	7.610
0.680	9.641
0.924	11.178
0.943	11.528
0.944	12.578
0.960	9.497
0.961	9.777
0.982	12.928
0.983	13.978
0.998	9.076
1.018	11.597
1.019	13.347
1.036	10.196
1.039	14.468
1.055	10.826
1.055	11.176
1.056	12.297
1.074	11.666
1.131	12.366
1.169	13.836
1.204	10.054
1.204	10.334
1.205	12.084
1.206	13.345
1.207	13.555
1.207	14.325
1.208	15.166
1.208	15.936
1.224	11.944
1.242	10.823
1.242	11.173
1.243	12.364
1.262	13.344
1.280	12.083
1.281	12.854
1.281	12.994
1.281	13.694
1.300	13.344
1.300	14.254
1.356	12.853
1.393	12.992
1.430	12.852
1.449	13.552
1.450	13.622
1.486	12.291
1.486	12.571
1.504	11.660
1.504	12.010
1.506	13.621
1.525	13.971
1.561	13.200
1.562	13.970
1.599	13.760
1.600	14.530
1.618	14.249
1.619	14.600
1.673	13.128
1.693	13.898
1.694	15.019
1.711	13.688
1.730	14.248
1.804	13.266
1.805	13.547
1.805	13.687
1.806	14.737
1.806	15.367
1.825	15.227
1.825	16.277
1.826	16.768
1.880	14.176
1.884	19.358
1.901	17.467
1.919	16.276
1.935	13.405
1.956	15.925
1.956	16.486
1.957	17.466
1.974	14.665
1.992	13.894
2.010	13.824
2.013	16.975
2.028	12.423
2.030	14.664
2.032	17.465
2.049	15.714
2.068	15.294
2.085	13.683
2.086	14.243
2.103	12.912
2.106	16.343
2.106	16.764
2.159	12.561
2.159	12.911
2.178	12.491
2.178	13.261
2.181	17.043
2.181	17.113
2.215	12.000
2.216	14.031
2.216	14.381
2.217	14.801
2.217	15.432
2.218	15.922
2.236	14.871
2.236	15.711
2.252	12.490
2.253	13.400
2.254	14.381
2.272	13.400
2.293	16.271
2.347	14.379
2.384	13.398
2.422	13.958
2.439	12.487
2.477	13.047
2.481	17.599
2.481	18.439
2.497	14.937
2.516	15.287
2.517	15.707
2.517	16.198
2.517	16.408
2.534	13.606
2.553	13.956
2.574	17.317
2.592	16.337
2.610	15.356
2.611	16.757
2.627	14.025
2.628	14.866
2.629	16.476
2.629	16.476
2.666	15.845
2.687	19.066
2.704	17.035
2.705	18.156
2.798	17.244
2.835	16.263
2.927	14.721
2.948	18.292
3.002	15.070
3.002	15.210
3.021	15.000
3.022	16.961
3.040	15.630
3.059	16.750
3.076	14.089
3.077	14.999
3.078	16.330
3.094	12.618
3.097	17.590
3.114	14.509
3.114	14.929
3.134	16.259
3.170	14.508
3.171	15.418
3.190	16.398
3.209	17.028
3.210	17.588
3.227	15.908
3.228	17.938
3.302	16.187
3.415	17.025
3.488	15.344
3.490	17.515
3.507	15.764
3.527	16.744
3.528	18.074
3.528	18.564
3.546	17.164
3.584	17.863
3.638	15.902
3.638	16.252
3.825	16.039
4.068	15.476
4.198	14.633
4.198	15.334
4.199	15.474
4.500	19.111
4.517	15.890
4.518	17.570
4.535	15.609
4.536	16.309
4.947	16.374
5.249	19.871
5.454	19.378
5.583	17.695
6.481	18.243];
data.tL_f(:,1) = 365 * (0.3 + data.tL_f(:,1));
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(23.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'HyndPott1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.495	7.181
0.495	7.462
0.572	9.562
0.589	6.831
0.590	7.531
0.590	8.581
0.591	9.002
0.802	14.112
0.817	9.770
0.818	10.260
0.818	10.330
0.837	11.101
0.857	13.201
0.892	8.999
0.893	10.750
0.894	11.310
0.895	12.431
0.895	13.131
0.895	13.551
0.896	13.761
0.896	14.041
0.931	11.310
0.951	11.800
0.970	12.430
1.008	12.850
1.064	12.360
1.084	13.270
1.119	10.749
1.120	11.309
1.120	11.659
1.120	11.869
1.122	14.110
1.122	14.180
1.122	15.020
1.123	15.580
1.137	9.838
1.140	13.269
1.140	13.620
1.177	12.639
1.177	12.639
1.178	13.199
1.195	11.868
1.196	12.219
1.197	14.179
1.216	13.619
1.217	15.580
1.233	11.168
1.235	13.829
1.366	13.828
1.384	12.567
1.385	13.478
1.402	11.377
1.402	11.517
1.422	12.077
1.422	13.197
1.423	13.477
1.423	13.968
1.441	12.357
1.441	12.847
1.460	12.987
1.461	14.458
1.463	16.839
1.498	13.967
1.518	14.457
1.555	14.667
1.556	14.877
1.556	15.297
1.556	15.858
1.572	12.356
1.573	12.846
1.574	14.667
1.592	12.986
1.592	13.266
1.592	13.616
1.592	13.686
1.593	14.177
1.593	14.247
1.725	15.226
1.726	15.786
1.742	13.055
1.743	13.475
1.743	13.895
1.743	14.176
1.744	14.666
1.745	16.206
1.745	16.486
1.763	14.806
1.765	17.467
1.836	12.424
1.873	11.163
1.874	12.914
1.876	14.735
1.876	15.225
1.876	15.575
1.877	17.256
1.894	14.525
1.896	16.345
1.913	13.964
1.913	14.174
1.931	12.914
1.931	13.544
1.932	14.594
1.932	15.295
1.933	15.715
1.949	11.933
1.988	13.474
1.989	15.014
1.990	16.555
2.029	17.815
2.099	11.302
2.102	14.733
2.102	15.504
2.103	16.974
2.119	13.122
2.138	13.613
2.139	13.893
2.159	16.484
2.178	16.133
2.179	17.394
2.196	14.943
2.196	15.223
2.198	18.164
2.403	14.731
2.403	15.011
2.423	15.921
2.441	15.641
2.441	15.991
2.442	16.412
2.442	16.692
2.462	18.442
2.480	17.252
2.480	17.322
2.518	17.812
2.553	14.380
2.554	15.430
2.554	15.921
2.556	17.671
2.593	16.480
2.593	16.761
2.593	17.321
2.613	18.511
2.704	14.169
2.724	15.989
2.742	15.079
2.839	19.000
2.854	13.888
2.856	16.339
2.857	18.089
2.874	14.728
2.875	17.039
2.876	17.249
2.911	14.517
2.912	15.778
2.948	13.887
2.949	14.517
3.006	15.147
3.025	15.917
3.027	18.088
3.120	16.617
3.138	15.776
3.156	15.076
3.176	16.056
3.194	14.796
3.194	15.076
3.195	16.056
3.291	18.576
3.367	19.276
3.439	15.424
3.440	15.844
3.440	16.124
3.440	16.475
3.440	16.965
3.461	18.925
3.478	16.614
3.478	16.964
3.498	18.575
3.535	17.804
3.552	15.844
3.572	16.544
3.572	16.684
3.685	16.963
3.798	17.032
3.838	20.113
3.856	18.713
3.948	16.261
4.061	16.260
4.064	19.201
4.117	15.279
4.343	14.788
4.437	15.277
4.438	15.767
4.589	16.677
5.004	17.234];
data.tL_m(:,1) = 365 * (0.3 + data.tL_m(:,1));
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(23.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'HyndPott1996';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;
weights.Ri =  0 * weights.Ri;

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
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';    
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Z2HT'; % Cat of Life
metaData.links.id_ITIS = '168534'; % ITIS
metaData.links.id_EoL = '46579909'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_robusta'; % Wikipedia
metaData.links.id_ADW = 'Sillago_robusta'; % ADW
metaData.links.id_Taxo = '187658'; % Taxonomicon
metaData.links.id_WoRMS = '273952'; % WoRMS
metaData.links.id_fishbase = 'Sillago-robusta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_robusta}}';
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
'author = {G. A. Hyndes and I. C. Potter}, ' ... 
'year = {1996}, ' ...
'title = {Comparisons between the age structures, growth and reproductive biology of two co-occurring sillaginids, \emph{Sillago robusta} and \emph{S. bassensis}, in temperate coastal waters of {A}ustralia}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {49}, ' ...
'pages = {14-32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sillago-robusta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
