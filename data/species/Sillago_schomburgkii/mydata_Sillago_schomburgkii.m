function [data, auxData, metaData, txtData, weights] = mydata_Sillago_schomburgkii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sillaginidae';
metaData.species    = 'Sillago_schomburgkii'; 
metaData.species_en = 'Yellowfin sillago';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINE'};
metaData.ecoCode.habitat = {'biMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
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

data.ab = 7;       units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;   units.am = 'd';    label.am = 'life span';              bibkey.am = 'HyndPott1996';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 22.5; units.Lp  = 'cm'; label.Lp  = 'fork length at puberty';     bibkey.Lp  = 'fishbase'; 
data.Li  = 42;     units.Li  = 'cm'; label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.5e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.66 mm of Sillago sihama: pi/6*0.066^3';
data.Wwi = 466;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00575*Li^3.076, see F1';
 
data.Ri  = 217e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Fecundity 217000';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
0.013	4.908
0.021	6.284
0.021	5.367
0.045	6.820
0.071	5.750
0.095	6.362
0.096	5.139
0.144	8.273
0.145	7.280
0.147	4.300
0.147	3.918
0.172	3.765
0.196	4.606
0.218	9.574
0.220	6.976
0.220	6.976
0.220	6.899
0.244	7.817
0.246	4.989
0.273	2.773
0.294	7.741
0.320	6.901
0.320	5.678
0.345	5.755
0.346	4.762
0.368	8.430
0.369	7.437
0.391	11.793
0.391	11.105
0.416	10.876
0.417	9.883
0.442	10.342
0.446	4.229
0.466	11.030
0.467	9.425
0.492	9.884
0.518	8.739
0.541	11.032
0.565	12.178
0.567	10.344
0.568	8.281
0.593	7.670
0.618	8.893
0.618	8.053
0.618	7.976
0.639	13.479
0.640	11.874
0.643	8.053
0.664	13.785
0.667	9.505
0.689	13.327
0.690	11.569
0.692	10.117
0.717	9.735
0.739	14.168
0.740	12.563
0.740	11.952
0.741	10.729
0.742	9.277
0.765	11.876
0.814	12.947
0.815	11.266
0.817	8.897
0.862	15.546
0.863	14.782
0.911	17.534
0.913	14.095
0.937	15.547
0.938	14.936
0.938	14.325
0.938	13.866
0.939	12.643
0.989	13.332
1.011	17.000
1.012	15.243
1.035	17.918
1.035	17.612
1.036	16.848
1.059	20.135
1.059	19.905
1.085	18.836
1.085	18.454
1.087	15.550
1.132	21.970
1.181	23.881
1.209	19.144
1.232	22.048
1.234	19.603
1.234	18.915
1.281	22.737
1.307	22.202
1.332	21.591
1.358	20.293
1.380	24.496
1.381	23.426
1.381	22.356
1.382	21.057
1.408	20.752
1.430	24.268
1.432	20.752
1.456	22.969
1.457	21.211
1.482	21.976
1.506	23.123
1.555	24.576
1.558	19.456
1.579	24.958
1.632	21.291
1.706	22.515
1.707	20.757
1.731	21.598
1.732	20.146
1.755	23.891
1.755	23.433
1.781	22.516
1.782	20.377
1.783	19.460
1.783	18.925
1.804	24.351
1.807	20.835
1.831	22.364
1.855	22.823
1.881	22.212
1.905	23.206
1.929	24.888
1.929	23.971
1.978	25.042
1.979	23.742
1.981	21.756
2.003	24.889
2.005	22.062
2.031	21.069
2.055	22.445
2.057	20.229
2.077	26.037
2.079	23.973
2.079	23.286
2.102	26.725
2.130	21.835
2.202	26.880
2.228	24.435
2.328	24.818
2.453	24.897
2.550	27.879
2.576	27.268
2.602	25.817
2.702	24.443
2.727	25.208
2.727	24.902
2.728	24.061
2.753	22.839
2.775	27.960
2.850	26.738
2.876	26.127
2.925	27.045
2.974	29.033
3.049	28.041
3.052	24.220
3.075	26.131
3.125	27.278
3.300	26.899
3.323	28.351
3.351	24.989
3.424	27.742
3.624	27.210
3.694	33.631
3.771	30.270
3.772	28.971
3.773	28.130
3.847	29.507
3.921	29.737
3.922	28.668
3.972	28.057
3.996	29.433
4.020	31.115
4.022	28.440
4.098	26.531
4.397	27.988
4.420	30.205
4.446	28.600
4.495	29.748
4.546	28.144
4.744	30.134
4.770	29.065
4.893	31.971
4.994	30.062
5.192	32.205
5.441	32.515
5.518	30.300
5.666	31.832
5.691	32.978
6.763	34.143
7.660	34.847
12.875	35.015];
data.tL_f(:,1) = (data.tL_f(:,1) + 0) * 365;
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'std length','females'};  
temp.tL_f  = C2K(18); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HyndPott1996';
%
data.tL_m = [ ... % time since birth (d), std length (cm)
0.078	3.830
0.101	6.881
0.125	7.491
0.177	4.823
0.200	7.340
0.201	5.510
0.249	7.951
0.251	6.121
0.252	4.519
0.252	3.757
0.274	8.409
0.275	6.884
0.275	6.655
0.276	5.892
0.276	5.130
0.278	2.766
0.298	9.477
0.299	8.180
0.300	7.113
0.302	3.910
0.347	11.003
0.347	10.469
0.348	10.164
0.348	9.478
0.349	8.639
0.352	4.521
0.401	5.818
0.423	9.250
0.447	10.166
0.452	4.142
0.471	11.996
0.476	5.591
0.523	9.633
0.524	7.803
0.546	11.692
0.598	9.101
0.622	9.940
0.648	9.254
0.672	10.322
0.696	11.543
0.697	10.780
0.698	9.331
0.719	14.441
0.720	12.611
0.721	11.772
0.746	11.162
0.747	10.171
0.767	16.576
0.769	13.526
0.792	16.272
0.796	11.773
0.796	11.697
0.818	15.815
0.845	12.613
0.868	15.053
0.870	12.461
0.871	11.012
0.873	8.572
0.894	13.376
0.944	13.529
0.945	12.767
0.992	16.885
0.992	16.428
0.992	15.818
0.995	12.082
1.116	17.345
1.118	14.981
1.140	18.108
1.141	16.964
1.141	16.812
1.167	16.507
1.167	16.202
1.315	18.340
1.337	21.772
1.363	20.400
1.364	19.180
1.387	21.849
1.388	21.163
1.413	20.629
1.414	19.485
1.436	23.375
1.464	19.639
1.489	18.801
1.538	21.089
1.611	23.073
1.613	20.862
1.662	21.930
1.687	22.083
1.688	19.795
1.689	19.338
1.713	20.253
1.714	18.499
1.761	22.542
1.788	20.331
1.788	19.721
1.812	21.856
1.812	20.941
1.838	19.188
1.887	21.095
1.937	21.477
1.963	19.495
1.987	20.944
2.037	19.954
2.086	21.937
2.086	21.327
2.087	20.946
2.088	19.192
2.112	21.023
2.112	20.184
2.210	22.321
2.259	24.533
2.360	21.866
2.384	23.696
2.384	23.315
2.433	24.994
2.433	24.460
2.759	23.017
2.783	23.551
2.785	21.645
2.858	23.781
2.884	22.714
3.331	25.467
3.357	24.019
3.455	26.079
3.502	30.731
3.704	27.380
3.755	25.474
3.756	24.407
3.778	27.915
4.104	26.472
4.304	25.942
4.674	31.896
4.723	32.888
4.877	26.714
5.672	32.295
5.772	31.534
6.718	34.524
7.694	30.119];
data.tL_m(:,1) = (data.tL_m(:,1) + 0) * 365;
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'std length','males'};  
temp.tL_m  = C2K(18); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HyndPott1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 1;

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
F1 = 'length-weight: W in g = 0.00575*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4XDQF'; % Cat of Life
metaData.links.id_ITIS = '168535'; % ITIS
metaData.links.id_EoL = '46579910'; % Ency of Life
metaData.links.id_Wiki = 'Sillago_schomburgkii'; % Wikipedia
metaData.links.id_ADW = 'Sillago_schomburgkii'; % ADW
metaData.links.id_Taxo = '187659'; % Taxonomicon
metaData.links.id_WoRMS = '273953'; % WoRMS
metaData.links.id_fishbase = 'Sillago-schomburgkii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sillago_schomburgkii}}';
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
bibkey = 'HyndPott1997'; type = 'Article'; bib = [ ... 
'doi = {10.1023/a:1007357410143}, ' ...
'author = {Glenn A. Hyndes and Ian C. Potter}, ' ... 
'year = {1997}, ' ...
'title = {Age, growth and reproduction of \emph{Sillago schomburgkii} in south-western {A}ustralian, nearshore waters and comparisons of life history styles of a suite of Sillago species}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {49(4)}, ' ...
'pages = {435–447}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sillago-schomburgkii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
