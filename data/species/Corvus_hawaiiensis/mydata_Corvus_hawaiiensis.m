function [data, auxData, metaData, txtData, weights] = mydata_Corvus_hawaiiensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Corvidae';
metaData.species    = 'Corvus_hawaiiensis'; 
metaData.species_en = 'Hawaiian crow'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TOh'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 08];

%% set data
% zero-variate data

data.ab = 20;    units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 40;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 120;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;    units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'AnAge';
  temp.tR = C2K(41.6);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(41.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data for Corvus frugilegus';

data.Wwb = 14;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'KuehKuhn1004';
data.Wwi = 520;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(41.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ...
0.947	13.777
1.145	15.908
1.344	13.812
1.691	17.014
1.691	14.899
1.939	13.864
2.138	13.882
2.782	13.938
2.831	17.114
3.326	21.386
3.376	18.219
3.476	15.057
3.773	19.311
3.922	19.324
4.863	22.578
4.963	18.359
5.112	17.315
5.805	22.661
6.152	22.692
6.598	28.017
6.746	29.087
7.092	34.403
7.092	33.346
7.589	28.104
7.786	35.521
7.985	32.367
8.629	35.595
9.223	41.990
9.223	39.876
9.868	40.990
10.014	53.688
10.758	52.696
11.004	62.231
11.005	55.889
11.102	66.468
11.746	69.696
11.943	78.170
11.945	69.714
11.992	81.346
12.686	83.521
12.935	77.201
13.030	97.294
13.031	90.951
13.724	96.298
13.822	104.763
14.018	114.294
14.121	97.390
14.168	109.022
14.911	112.258
15.006	137.637
15.060	111.215
15.305	126.035
15.750	135.588
15.844	158.852
15.999	129.268
16.342	149.382
16.783	174.791
16.937	151.549
16.978	193.836
17.032	171.642
17.235	145.233
17.530	161.115
17.777	163.251
17.969	197.094
18.065	210.845
18.616	185.523
18.659	217.240
18.913	186.607
19.102	236.306
19.702	207.818
19.797	232.139
20.139	257.539
20.441	236.424
20.788	232.227
20.884	248.091
20.984	248.100
21.077	279.821
21.921	274.610
21.975	252.416
22.173	252.433
22.213	301.062
22.318	270.416
22.612	286.298
22.766	261.999
22.957	296.900
23.103	311.712
23.104	308.540
23.407	280.026
23.895	320.238
23.940	345.612
24.051	284.311
24.091	331.883
24.248	290.671
24.295	304.417
24.591	312.900
24.794	286.491
24.931	346.756
24.990	298.136
25.929	317.246
26.165	377.520
26.769	330.005
26.815	345.865
26.908	377.586
27.163	344.839
27.309	357.537
27.458	357.550
27.552	380.814
27.903	362.874
27.997	388.253
28.254	341.764
28.791	385.151
28.846	357.672
28.941	379.879
28.945	360.852
29.097	343.952
29.244	351.365
29.284	398.937
29.736	369.378
29.782	390.524
29.830	396.871
30.026	411.687
30.038	350.377
30.076	408.520
30.375	399.033
30.633	349.373
30.673	399.059
30.819	409.643
31.070	395.923
31.266	405.454
31.414	411.809
31.862	402.335
31.917	378.027
31.921	357.943
31.959	411.858
32.901	412.998
33.003	398.207
33.010	365.438
33.050	414.068
33.051	407.725
33.105	384.474
33.743	418.357
33.941	421.546
33.947	390.891
33.951	368.693
34.092	408.874
34.238	422.629
34.883	422.686
34.986	402.610
35.032	421.642
35.042	370.903
35.527	425.914
35.985	366.758
36.023	424.900
36.074	418.562
36.120	437.594
36.127	402.711
36.615	438.695
36.916	422.865
36.923	389.039
36.964	431.326
36.976	371.073
37.161	439.800
37.360	432.418
37.953	444.098
37.956	429.299
37.962	397.587
37.967	375.389
38.152	439.887
38.549	438.865
38.550	432.523
38.907	383.928
38.996	435.733
39.004	397.679
39.392	439.996
39.542	431.553
39.800	382.950
39.893	414.671
39.939	430.531
39.987	438.992
40.929	440.132
40.935	410.534
40.941	380.936
41.079	433.803
41.424	445.461
41.624	434.908
41.870	446.557
41.926	411.678
41.932	381.024
42.021	436.000
42.118	443.408
42.863	441.359
43.023	383.234
43.066	413.893
43.110	445.609
43.112	435.039
43.260	438.223
43.359	440.346
43.506	448.815
43.914	389.655
44.003	440.403
44.059	411.866
44.100	452.039
44.249	453.109
44.300	443.600
44.695	451.034
44.995	439.433
45.001	410.892
45.006	386.580
45.090	459.526
45.093	445.784
45.490	443.705
45.689	440.551
46.041	415.212
46.046	389.843
46.131	464.903
46.136	440.590
46.182	456.451
46.183	450.108
46.679	452.266
46.989	385.697
47.075	456.529
47.083	414.247
47.122	466.047
47.126	448.077
47.222	462.885
48.017	454.498
48.074	416.448
48.079	390.022
48.265	452.406
48.267	445.007
48.923	385.868
48.962	439.782
49.057	459.875
49.059	450.362
49.060	448.248
49.309	441.927
50.050	453.620];
n = size(data.tW,1);
for i = 2:n
  if data.tW(i,1) <= data.tW(i-1,1)
    data.tW(i,1) = max(data.tW(i-1,1),data.tW(i,1)) + 1e-8;
  end
end
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(41.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KuehKuhn1004';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'tW data suggests varying food availebility, which has been implemented';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'YNHV'; % Cat of Life
metaData.links.id_ITIS = '179742'; % ITIS
metaData.links.id_EoL = '45510013'; % Ency of Life
metaData.links.id_Wiki = 'Corvus_hawaiiensis'; % Wikipedia
metaData.links.id_ADW = 'Corvus_hawaiiensis'; % ADW
metaData.links.id_Taxo = '87773'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '2CDECD36D1A0E5F3'; % avibase
metaData.links.id_birdlife = 'hawaiian-crow-corvus-hawaiiensis'; % birdlife
metaData.links.id_AnAge = 'Corvus_hawaiiensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corvus_hawaiiensis}}';
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
bibkey = 'KuehKuhn1004'; type = 'Article'; bib = [ ... 
'author = {C. Kuehler and M. Kuhn and B. Mcllraith and G. Campbell}, ' ... 
'year = {1992}, ' ...
'title = {Artificial incubation and hand-rearing of ''Alala (\emph{Corvus hawaiiensis}) eggs removed from the wild}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {13}, ' ...
'pages = {257--266}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Corvus_hawaiiensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

