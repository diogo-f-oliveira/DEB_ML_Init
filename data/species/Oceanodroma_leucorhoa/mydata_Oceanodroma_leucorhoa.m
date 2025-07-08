function [data, auxData, metaData, txtData, weights] = mydata_Oceanodroma_leucorhoa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Hydrobatidae';
metaData.species    = 'Oceanodroma_leucorhoa'; 
metaData.species_en = 'Leach''s  storm petrel'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 41;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 70; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'RickWhit1980';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 210; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 36*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 8.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RickWhit1980';
data.Wwi = 87; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'RickWhit1980';
  comment.Wwi = 'asymptote for nestling; mean adult weight is 46.6 (AnAge)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.410	9.076
2.111	10.934
3.232	13.205
3.647	10.732
4.764	9.704
6.032	17.543
7.145	14.041
7.983	13.838
10.101	29.514
10.234	24.978
10.372	23.741
10.517	27.453
10.649	21.680
11.211	23.744
11.361	31.579
11.486	20.858
11.497	29.106
11.633	26.219
11.641	31.580
12.208	37.768
13.168	24.781
13.750	41.071
13.878	33.030
13.883	36.329
14.287	25.402
14.301	35.712
14.316	46.021
14.446	39.217
14.996	33.033
15.425	39.839
15.544	25.406
15.700	36.747
15.985	40.665
15.989	43.758
16.263	40.047
16.815	34.688
17.525	43.144
17.537	51.598
17.809	46.444
18.636	37.993
18.643	43.147
18.644	43.972
18.647	46.446
18.654	51.395
19.615	38.614
19.629	49.130
19.766	47.274
20.334	53.874
20.336	54.699
20.459	42.946
21.446	49.547
21.597	57.177
21.857	43.569
21.864	48.724
21.868	51.198
22.287	51.199
22.422	48.107
22.425	49.756
22.554	42.540
22.575	57.386
23.675	44.812
23.688	53.884
23.695	58.832
23.825	52.235
24.102	50.586
24.391	56.979
24.524	52.649
24.794	45.640
24.807	54.712
24.821	64.815
25.502	52.240
25.632	45.642
25.647	56.158
25.784	53.890
25.935	61.932
26.488	58.016
26.750	45.852
26.761	53.274
26.905	56.161
27.058	66.059
27.447	44.204
27.603	56.163
27.739	53.277
27.887	59.051
28.178	67.505
28.592	64.001
28.712	49.775
28.719	54.723
28.722	56.991
29.130	48.951
29.283	58.643
29.709	63.180
29.837	54.727
29.840	56.789
30.260	57.821
30.534	53.492
30.824	61.121
30.830	65.864
30.961	59.678
31.372	53.494
31.669	65.866
31.797	57.825
31.802	61.124
31.939	59.681
32.215	57.208
32.626	51.436
33.210	68.757
33.463	49.995
33.612	57.006
33.755	59.274
34.038	61.956
34.736	61.339
34.874	60.102
34.879	63.814
35.006	54.742
35.027	69.381
35.564	53.919
35.574	60.929
35.711	58.868
35.995	62.167
36.003	67.941
36.681	53.304
36.693	61.963
36.836	64.026
37.264	70.419
37.811	61.967
37.814	64.028
38.220	54.751
38.229	60.937
38.240	68.978
38.791	63.207
38.793	64.650
38.797	67.743
39.202	57.435
39.225	73.930
39.480	56.405
39.629	63.003
39.910	64.653
40.460	58.263
40.613	67.542
42.011	68.165
42.286	64.866
42.428	66.722
42.558	59.713
43.536	59.303
43.687	67.963
43.823	64.871
44.105	66.727
44.115	73.738
44.946	68.792
44.953	73.946
45.105	82.194
45.509	71.474
46.067	70.857
46.074	75.805
46.225	84.053
46.349	73.126
46.765	70.447
46.781	81.993
46.908	73.127
47.035	64.056
47.052	75.808
47.590	60.758
47.607	73.542
48.020	68.595
48.023	70.863
48.455	80.348
48.726	74.164
48.850	63.030
48.863	71.896
48.999	69.628
49.016	82.000
49.712	79.527
49.835	67.981
49.978	69.838
50.105	60.972
50.120	72.106
50.968	78.500
51.092	67.779
51.095	69.841
51.098	72.109
51.654	69.636
51.785	63.657
52.077	72.318
53.053	71.084
53.057	73.970
53.183	63.868
53.211	84.074
53.341	77.064
53.903	79.540
54.175	73.767
54.178	76.242
54.331	85.727
54.585	67.377
54.742	79.542
54.862	65.728
55.012	72.945
55.450	86.555
55.858	78.721
55.991	73.567
55.994	75.628
56.147	85.320
56.540	66.764
56.831	75.012
57.118	80.580
57.241	68.416
57.255	78.313
57.267	86.972
57.809	74.603
58.085	72.129
58.101	83.676
58.355	65.532
58.371	77.079
58.647	74.605
58.914	65.740
58.930	77.287
59.063	72.545
59.358	83.680
60.029	63.888
60.050	78.733
60.317	70.280
60.737	70.488
61.001	59.767
61.009	65.540
61.163	75.644
61.287	64.510
61.291	67.190
61.713	69.047
61.977	57.914
62.282	76.059
62.684	64.308
62.831	69.257
63.106	66.371
63.259	75.237
63.375	58.537
63.937	60.600
64.083	65.343
64.090	70.498
64.506	67.818
65.068	70.501
65.201	65.552
65.354	75.037
65.614	61.224
65.903	68.029
66.036	63.081
66.172	60.607
66.318	65.143
66.601	67.618
66.743	69.475
66.877	64.733
67.024	70.506
67.153	62.878
67.298	66.383
67.301	68.651
67.851	62.467
67.855	65.148
67.992	63.293
68.137	67.004
68.405	58.964
68.970	62.677
68.971	63.914
69.107	61.028
69.245	59.791
69.382	57.730
69.664	59.792
69.801	57.937
69.935	53.608
70.076	54.845
70.084	60.618];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'RickWhit1980';
  
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
D1 = 'Feeding is reduced towards end of nestling period';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '48C48'; % Cat of Life
metaData.links.id_ITIS = '174628'; % ITIS
metaData.links.id_EoL = '45509015'; % Ency of Life
metaData.links.id_Wiki = 'Oceanodroma_leucorhoa'; % Wikipedia
metaData.links.id_ADW = 'Oceanodroma_leucorhoa'; % ADW
metaData.links.id_Taxo = '51618'; % Taxonomicon
metaData.links.id_WoRMS = '137192'; % WoRMS
metaData.links.id_avibase = 'C5FB15C6D112FE91'; % avibase
metaData.links.id_birdlife = 'leachs-storm-petrel-hydrobates-leucorhous'; % birdlife
metaData.links.id_AnAge = 'Oceanodroma_leucorhoa'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oceanodroma_microsoma}}';
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
bibkey = 'RickWhit1980'; type = 'Article'; bib = [ ... 
'author = {R. E. Ricklefs and S. White and J. Cullen}, ' ... 
'year = {1980}, ' ...
'title = {POSTNATAL DEVELOPMENT OF LEACH''S STORM-PETREL}, ' ...
'journal = {The Auk}, ' ...
'volume = {97}, ' ...
'pages = {768-781}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Oceanodroma_leucorhoa}}';
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

