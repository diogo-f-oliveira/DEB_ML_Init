  function [data, auxData, metaData, txtData, weights] = mydata_Acanthocobitis_mooreh
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Acanthocobitis_mooreh'; 
metaData.species_en = 'Hill stream loach'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 26];

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.7;    units.Lp = 'cm'; label.Lp = ' total length at puberty'; bibkey.Lp = 'guess';
data.Li = 6;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'KharDaha2007';

data.Wwb = 1.13e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'VinySost2010';
  comment.Wwb = 'based on egg diameter of 0.6 mm of Barbatula barbatula: pi/6*0.06^3';
data.Wwp = 0.82;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'KharDaha2007','fishbase'};
  comment.Wwp = 'Based on (Lp/Li)^3*Wwi: (3.7/6)^3*3.5';
data.Wwi = 3.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'KharDaha2007';

data.Ri = 6e3/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Barbatula barbatula';

% univariate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
1.074	3.669
59.699	4.200
90.079	4.226
122.143	4.323
181.639	4.340
212.844	4.728
244.489	4.778
273.183	4.769
303.562	4.830
334.362	4.880
365+30.949	5.260
365+59.640	5.309];
data.tL(:,1) = data.tL(:,1)+470; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KharDaha2007';

% length-weight
data.LW_f = [ ... % time since birth (d), std length (cm)
2.900	0.499
3.004	0.640
3.392	0.705
3.399	0.575
3.406	0.802
3.489	0.727
3.503	0.867
3.540	1.084
3.570	1.052
3.637	0.857
3.689	0.987
3.704	1.258
3.704	1.117
3.704	0.911
3.778	1.247
3.786	1.149
3.801	0.998
3.875	1.236
3.890	1.355
3.890	1.182
3.890	0.922
3.891	0.846
3.898	1.041
3.905	1.095
3.986	1.767
3.986	1.420
3.987	1.345
4.001	1.605
4.002	1.084
4.009	1.269
4.009	1.139
4.083	1.345
4.097	2.212
4.106	1.464
4.179	1.930
4.180	1.323
4.181	1.160
4.187	1.833
4.202	1.431
4.203	1.247
4.217	1.572
4.276	1.833
4.292	1.605
4.306	1.692
4.380	2.158
4.388	1.887
4.388	1.551
4.389	1.518
4.403	1.778
4.462	1.876
4.463	1.464
4.471	1.355
4.476	2.537
4.477	1.800
4.478	1.702
4.484	2.288
4.484	2.234
4.492	2.071
4.492	2.006
4.493	1.648
4.493	1.540
4.565	2.646
4.566	1.995
4.581	2.201
4.581	2.158
4.581	2.125
4.589	1.919
4.596	2.060
4.597	1.811
4.597	1.323
4.603	2.375
4.603	2.245
4.678	2.082
4.685	2.223
4.692	2.765
4.692	2.678
4.715	2.006
4.782	2.353
4.782	2.320
4.782	2.201
4.804	2.624
4.886	2.299
4.892	3.047
4.893	2.646
4.908	2.516
4.967	2.949
4.968	2.602
4.968	2.527
4.968	2.494
4.975	2.841
4.976	2.299
4.976	2.201
4.976	2.049
4.977	1.681
4.982	2.776
4.983	2.429
4.983	2.136
4.990	2.711
4.999	1.973
5.004	3.296
5.056	3.242
5.078	3.210
5.080	2.342
5.086	3.014
5.087	2.266
5.095	2.440
5.182	3.795
5.182	3.698
5.190	3.069
5.198	2.863
5.199	2.537
5.205	2.982
5.206	2.765
5.207	2.028
5.272	3.112
5.296	2.429
5.296	2.364
5.385	2.277
5.392	2.527
5.393	2.386
5.406	3.199
5.474	2.852
5.489	2.689
5.503	3.155
5.578	2.754
5.585	2.993
5.592	3.557
5.592	3.372
5.593	2.819
5.675	2.982
5.689	3.123
5.781	1.952
6.001	3.806
6.002	3.329];
units.LW_f = {'cm','g'}; label.LW_f = {'std length', 'weight', 'females'};  
bibkey.LW_f = 'KharDaha2007';
%
data.LW_m = [ ... % time since birth (yr), std length (cm)
2.418	0.291
2.501	0.464
2.537	0.323
2.605	0.431
2.918	0.419
3.017	1.047
3.113	0.841
3.231	0.732
3.291	0.721
3.292	0.894
3.388	0.699
3.410	0.764
3.523	0.915
3.523	1.088
3.523	1.186
3.530	0.818
3.597	0.915
3.605	1.099
3.606	1.218
3.628	1.131
3.694	0.991
3.702	1.261
3.791	1.120
3.889	1.444
3.896	1.358
3.902	0.871
3.903	1.185
3.904	1.282
3.910	0.958
3.993	1.141
3.993	1.217
4.003	2.180
4.009	1.596
4.022	1.076
4.023	1.336
4.031	1.455
4.121	1.584
4.128	1.433
4.187	1.433
4.211	1.768
4.211	1.822
4.225	1.714
4.234	1.974
4.255	1.541
4.308	2.027
4.398	2.092
4.405	1.919
4.412	1.735
4.412	1.951
4.501	1.756
4.501	1.832
4.508	1.508
4.508	1.616
4.509	1.962
4.510	2.113
4.510	2.232
4.517	2.049
4.518	2.276
4.605	1.745
4.606	2.070
4.607	2.330
4.607	2.362
4.615	2.448
4.619	1.486
4.622	2.232
4.623	2.589
4.638	2.524
4.710	1.972
4.711	2.070
4.711	2.124
4.719	2.286
4.719	2.372
4.721	2.892
4.726	2.221
4.727	2.437
4.800	2.123
4.802	2.653
4.809	2.524
4.821	1.572
4.831	2.351
4.898	2.448
4.905	2.372
4.906	2.513
4.908	3.043
4.919	1.961
4.919	2.080
4.926	1.896
4.927	2.166
4.990	3.280
4.993	1.842
4.996	2.783
5.003	2.653
5.004	2.869
5.006	3.518
5.011	2.729
5.017	2.253
5.017	2.469
5.019	3.042
5.020	3.356
5.033	2.512
5.094	3.020
5.109	3.129
5.116	2.912
5.211	2.490
5.212	2.858
5.214	3.334
5.227	2.750
5.229	3.399
5.234	2.598
5.235	2.966
5.235	3.031
5.313	3.896
5.321	1.895
5.322	2.349
5.392	3.074
5.421	2.998
5.430	3.182
5.496	2.890
5.497	3.333
5.498	3.474
5.505	3.549
5.928	2.910];
units.LW_m = {'cm','g'}; label.LW_m = {'std length', 'weight', 'males'};  
bibkey.LW_m = 'KharDaha2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.2; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00871*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6P7MW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '988219'; % Ency of Life
metaData.links.id_Wiki = 'Acanthocobitis_mooreh'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1802767'; % Taxonomicon
metaData.links.id_WoRMS = '1026429'; % WoRMS
metaData.links.id_fishbase = 'Acanthocobitis-mooreh'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acanthocobitis_mooreh}}';
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
bibkey = 'KharDaha2007'; type = 'Article'; bib = [ ...  
'doi = {10.11609/JoTT.o3301.4562-8}, ' ...
'author = {Sanjay S. Kharat and Neelesh Dahanukar}, ' ...
'year = {2007}, ' ...
'title = {Population dynamics of the Hill Stream Loach \emph{Acanthocobitis mooreh} ({S}ykes, 1839) ({C}ypriniformes: {N}emacheilidae) from northern {W}estern {G}hats of {I}ndia}, ' ... 
'journal = {Journal of Threatened Taxa}, ' ...
'volume = {5(11)}, '...
'pages = {4562–4568}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VinySost2010'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2010.02653.}, ' ...
'author = {D. Vinyoles and A. de Sostoa and C. Franch and A. Maceda-Veiga and F. Casals and N. Caiola}, ' ...
'year = {2010}, ' ...
'title = {Life-history traits of the stone loach \emph{Barbatula barbatula}}, ' ... 
'journal = {Journal of Fish Biology () , }, ' ...
'volume = {77}, '...
'pages = {20–32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acanthocobitis-mooreh}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

