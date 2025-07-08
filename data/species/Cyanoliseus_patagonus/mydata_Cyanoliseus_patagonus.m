function [data, auxData, metaData, txtData, weights] = mydata_Cyanoliseus_patagonus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Cyanoliseus_patagonus'; 
metaData.species_en = 'Burrowing parrot'; 

metaData.ecoCode.climate = {'Cfa', 'Cwa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTi'};
metaData.ecoCode.embryo  = {'Tntf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 08 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2022 12 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 07 05];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 24;    units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'MaseQuil2002';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 62.7;    units.tx = 'd';    label.tx = 'time since birth at fledging';      bibkey.tx = 'MaseQuil2002';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 188.1;    units.tp = 'd';    label.tp = 'time since birth at puberty';      bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 19.5*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 50;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'MaseQuil2002';
data.Wwi = 350;  units.Wwi = 'g';   label.Wwi = 'asymptotic  weight of nesting';              bibkey.Wwi = 'MaseQuil2002';
 comment.Wwi = 'typical adult weight 270.7';

data.Ri = 3.8/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'MaseQuil2002';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0       50
2.998	51.900
4.967	74.152
7.971	100.124
8.903	132.546
8.907	115.880
9.954	64.970
10.878	133.503
10.879	127.947
11.905	166.852
12.839	193.718
12.844	173.348
13.871	203.919
15.749	215.985
15.841	226.172
16.050	135.434
16.869	252.114
16.877	218.780
16.976	198.412
17.897	279.907
17.904	248.426
18.004	226.205
18.940	242.886
19.028	268.814
19.031	258.628
19.793	215.122
19.872	279.938
19.874	270.679
19.876	262.345
19.892	195.679
19.896	177.160
20.078	203.089
20.608	350.319
20.822	239.212
20.901	304.028
20.911	262.361
20.913	251.250
21.850	266.079
22.045	237.379
22.781	304.983
22.787	282.761
22.872	321.651
22.883	271.651
22.889	248.503
22.891	237.392
22.972	295.726
23.722	304.071
23.725	290.182
23.743	213.331
23.927	231.852
24.019	241.113
24.750	330.013
24.752	321.680
24.756	307.791
24.761	283.717
24.763	278.161
24.776	221.680
24.863	250.385
25.141	270.760
25.785	328.177
25.788	318.918
25.789	314.288
25.792	300.399
25.795	285.585
25.796	280.955
25.798	273.548
25.799	268.918
25.895	263.364
25.900	240.216
25.901	235.586
26.819	330.045
26.822	317.082
26.824	311.527
26.825	305.045
26.827	297.638
26.829	289.304
26.941	211.528
27.672	304.132
27.674	293.021
27.760	330.059
27.774	268.949
27.776	263.393
27.967	248.581
27.975	215.248
28.704	315.259
28.705	308.778
28.791	344.890
28.803	293.039
28.805	285.631
28.879	369.892
28.881	362.484
28.910	237.485
29.000	256.005
29.821	362.499
29.838	289.351
29.846	257.869
29.919	345.834
29.920	341.204
30.016	331.946
30.022	307.872
30.775	304.180
30.778	291.217
30.788	248.625
30.790	242.143
30.797	210.662
31.893	348.642
31.896	337.531
31.899	325.494
31.900	319.012
31.904	305.123
31.907	292.161
31.910	276.420
31.916	250.494
32.017	223.644
32.941	292.176
33.024	341.252
33.026	330.141
33.029	319.956
33.030	315.326
33.033	302.363
33.034	295.882
33.682	341.262
33.702	256.077
33.876	317.191
33.877	311.635
34.068	298.675
34.071	288.490
34.634	291.277
34.730	282.019
34.903	347.762
34.906	335.725
34.910	319.059
34.912	310.725
35.656	343.144
35.663	315.367
35.860	278.333
36.793	308.903
36.795	300.569
36.796	295.940
36.798	289.458
36.871	377.422
36.877	352.422
36.882	330.200
36.884	320.015
36.990	271.869
37.182	256.131
37.830	298.733
37.909	362.624
37.913	346.883
37.916	333.920
37.916	332.068
37.917	329.290
37.919	319.105
38.845	381.156
38.866	293.194
38.867	285.786
39.044	333.937
39.046	325.604
39.049	315.419
39.049	311.715
39.051	305.234
39.803	304.319
39.806	294.134
39.870	420.987
39.985	333.026
40.923	344.152
40.934	297.855
40.935	293.226
41.117	315.451
41.119	309.895
41.687	295.089
41.688	290.460
41.871	310.833
41.872	305.277
41.986	222.872
42.049	352.502
42.819	276.588
42.822	266.403
42.903	319.182
42.905	310.849
42.908	300.664
43.671	253.453
43.857	263.641
43.939	315.494
43.940	309.939
43.943	296.050
43.945	289.569
43.949	273.828
44.776	354.396
44.968	337.732
44.973	316.436
44.978	295.140
44.979	289.584
44.984	271.066
45.068	311.808
45.081	257.179
45.823	303.486
46.007	319.230
46.008	315.526
46.010	308.119
46.763	305.353
46.853	319.243
46.855	313.687
46.855	311.836
47.704	298.886
47.706	293.330
47.707	287.775
47.796	308.146
47.812	239.628
47.885	332.222
48.738	304.457
48.739	297.050
48.919	334.090
48.920	328.534
48.922	321.127
48.924	311.868
49.028	270.203
49.591	274.841
49.684	278.546
49.864	314.660
49.951	345.217
49.955	325.772
49.963	291.513
50.726	245.229
50.803	319.304
50.805	310.971
50.913	251.713
51.092	291.531
51.094	282.271
51.665	253.577
51.758	258.208
51.841	306.357
51.842	300.801
51.847	280.431
51.848	273.950
51.849	271.172
52.972	293.412
52.979	264.708
52.982	251.745
52.988	224.893
52.995	195.264
53.910	304.537
53.914	289.722
53.916	280.463
53.917	274.908
53.920	260.093
53.923	250.834
54.021	232.317
54.951	276.775
54.954	265.664
54.955	261.961
54.957	252.701
54.957	249.924
54.960	237.887
54.965	217.516
55.043	286.962
55.136	289.741
55.887	295.308
55.889	286.049
55.988	267.532
55.990	256.421
55.993	245.310
55.995	236.977
55.998	224.014
55.999	219.384
56.733	297.173
56.735	288.840
56.929	261.991
56.930	260.139
56.936	234.213
57.867	275.894
57.868	269.413
57.876	237.932
57.957	293.488
58.810	262.946
58.906	254.614
58.911	233.318
58.914	222.207
58.915	218.503
58.931	148.133
58.991	295.356
59.939	262.038
59.942	248.149
59.947	225.927
59.950	214.816
59.952	204.630
60.028	281.483
60.964	300.942
61.827	230.585
61.916	252.809
63.049	231.530
65.027	222.301];
n = size(data.tW,1); for i=2:n; if data.tW(i,1) <= data.tW(i-1,1); data.tW(i,1) = data.tW(i-1,1) + 1e-4; end; end
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'MaseQuil2002';

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
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: more flexibility in food intake allowed and Wwb data added to tW and v fixed';
D3 = 'mod_2: v is reduced';
D4 = 'mod_3: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '32NN5'; % Cat of Life
metaData.links.id_ITIS = '177697'; % ITIS
metaData.links.id_EoL = '45510853'; % Ency of Life
metaData.links.id_Wiki = 'Cyanoliseus_patagonus'; % Wikipedia
metaData.links.id_ADW = 'Cyanoliseus_patagonus'; % ADW
metaData.links.id_Taxo = '54421'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '1A7D8F6BCD3DFE25'; % avibase
metaData.links.id_birdlife = 'burrowing-parrot-cyanoliseus-patagonus'; % birdlife
metaData.links.id_AnAge = 'Cyanoliseus_patagonus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyanoliseus_patagonus}}';
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
bibkey = 'MaseQuil2002'; type = 'Article'; bib = [ ... 
'author = {J. F. Masello and P. Quillfeldt}, ' ... 
'year = {2002}, ' ...
'title = {CHICK GROWTH AND BREEDING SUCCESS OF THE BURROWING PARROT}, ' ...
'journal = {The Condor}, ' ...
'volume = {104}, ' ...
'pages = {574-586}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cyanoliseus_patagonus}}';
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

