function [data, auxData, metaData, txtData, weights] = mydata_Thalassoica_antarctica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Thalassoica_antarctica'; 
metaData.species_en = 'Antarctic petrel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCik', 'biCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.4); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 48;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Creu2010';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Wiki: 44 to 52 d, temp is guessed';
data.tx = 53; units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Creu2010';   
  temp.tx = C2K(39.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '43 to 60 d';
data.tp = 159; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(39.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '43 to 60 d';
data.tR = 3*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(39.4); units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'based on similar sized petrels';
data.am = 25*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'guess';   
  temp.am = C2K(39.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 73; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Creu2010';
data.Wwi = 1.6e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Creu2010';
  comment.Wwi = 'Asymptotic mass prior to fledging, mean adult mass EoL: 780 g (female) 805 g (male)';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.412	63.768
0.413	75.362
0.414	95.652
0.415	107.246
0.615	52.174
0.617	89.855
1.026	118.841
1.027	124.638
1.126	84.058
1.435	133.333
1.737	84.058
1.840	98.551
1.842	118.841
2.252	156.522
2.556	142.029
2.655	95.652
2.760	142.029
3.064	121.739
3.170	171.014
3.267	104.348
3.474	156.522
3.675	121.739
3.882	165.217
3.884	185.507
4.088	200.000
4.290	168.116
4.491	127.536
4.497	214.493
4.696	144.928
4.701	220.290
4.903	200.000
5.206	159.420
5.313	237.681
5.516	223.188
5.716	168.116
5.922	197.101
6.233	272.464
6.536	237.681
6.537	257.971
6.736	191.304
6.844	278.261
6.942	217.391
7.554	234.783
7.557	281.159
7.763	304.348
7.764	318.841
8.574	252.174
8.578	310.145
8.579	330.435
8.677	266.667
9.499	365.217
9.596	298.551
9.599	342.029
9.801	318.841
9.803	353.623
9.806	394.203
10.519	385.507
10.617	342.029
10.622	411.594
10.624	434.783
11.023	318.841
11.342	501.449
11.537	382.609
11.539	411.594
11.838	318.841
11.853	530.435
11.941	336.232
12.252	417.391
12.561	457.971
12.564	504.348
12.668	527.536
12.669	542.029
12.757	356.522
12.759	382.609
12.764	443.478
12.965	417.391
13.483	539.130
13.678	411.594
13.679	431.884
13.681	457.971
13.790	553.623
13.887	492.754
13.888	501.449
14.302	585.507
14.699	449.275
14.710	597.101
14.805	507.246
14.807	527.536
14.911	562.319
15.423	597.101
15.515	469.565
15.522	556.522
15.531	686.957
15.535	733.333
15.723	521.739
15.925	498.551
16.149	779.710
16.432	469.565
16.441	585.507
16.446	663.768
16.652	695.652
16.656	753.623
16.744	562.319
16.749	628.986
17.561	588.406
17.562	605.797
17.571	727.536
17.675	750.725
18.781	562.319
18.787	631.884
18.792	713.043
18.796	756.522
18.890	657.971
19.000	765.217
19.400	666.667
19.497	602.899
19.503	678.261
19.508	747.826
19.510	771.014
19.607	704.348
19.818	808.696
20.432	846.377
20.518	626.087
20.842	881.159
20.933	733.333
20.948	944.928
21.039	797.101
21.456	918.841
21.639	646.377
21.648	762.319
21.654	846.377
21.752	794.203
22.060	828.986
22.567	791.304
22.663	721.739
22.677	913.043
22.678	924.638
22.680	956.522
22.681	968.116
22.683	985.507
22.869	750.725
22.876	849.275
23.383	808.696
23.678	669.565
23.695	898.551
23.698	942.029
23.894	831.884
23.994	805.797
24.529	1171.014
24.814	881.159
24.821	979.710
24.903	710.145
24.911	817.391
24.927	1028.986
25.027	1011.594
25.122	921.739
25.330	971.014
25.519	771.014
25.729	863.768
25.731	886.957
25.856	1202.899
25.943	1000.000
26.142	942.029
26.536	756.522
26.666	1133.333
26.668	1165.217
26.756	982.609
26.953	886.957
26.956	918.841
26.957	944.928
26.968	1089.855
27.763	817.391
27.775	982.609
27.776	997.101
27.788	1156.522
27.872	918.841
28.083	1020.290
28.090	1115.942
28.712	1263.768
28.880	765.217
28.894	959.420
28.896	994.203
28.906	1130.435
29.001	1031.884
29.195	898.551
29.197	933.333
29.311	1098.551
29.407	1011.594
29.722	1142.029
29.917	1026.087
29.921	1078.261
30.217	944.928
30.531	1060.870
30.542	1223.188
30.941	1098.551
30.947	1188.406
31.014	710.145
31.030	921.739
31.134	956.522
31.546	1014.493
31.646	997.101
31.849	979.710
31.857	1095.652
31.859	1121.739
31.955	1037.681
31.957	1060.870
31.968	1223.188
32.051	953.623
32.146	863.768
32.359	997.101
32.378	1252.174
32.654	852.174
32.659	915.942
32.677	1165.217
32.679	1188.406
32.772	1066.667
33.282	1072.464
33.779	915.942
33.785	994.203
33.789	1052.174
33.794	1118.841
33.903	1214.493
34.011	1304.348
34.296	1020.290
34.496	968.116
34.513	1200.000
34.607	1095.652
34.689	823.188
34.704	1026.087
34.707	1060.870
34.723	1281.159
34.724	1295.652
35.119	1127.536
35.317	1046.377
35.514	956.522
35.618	988.406
35.733	1168.116
35.838	1214.493
35.840	1237.681
35.933	1124.638
36.327	939.130
36.337	1078.261
36.434	1011.594
36.451	1237.681
36.739	991.304
36.944	1020.290
36.945	1049.275
37.146	991.304
37.347	950.725
37.558	1049.275
37.571	1237.681
37.669	1185.507
37.670	1194.203
37.972	1139.130
38.070	1095.652
38.465	921.739
38.672	971.014
38.674	997.101
38.679	1060.870
38.683	1121.739
38.693	1255.072
39.191	1095.652
39.594	1043.478
39.613	1307.246
39.701	1107.246
40.409	1049.275
40.626	1220.290
40.807	913.043
40.808	921.739
40.811	968.116
40.812	991.304
40.813	1002.899
40.921	1081.159
40.932	1226.087
41.231	1136.232
41.617	849.275
41.635	1098.551
41.643	1200.000
41.743	1182.609
41.831	991.304
41.936	1031.884
42.458	1202.899
42.546	1017.391
42.562	1231.884
42.641	921.739
42.642	939.130
42.651	1066.667
42.745	953.623
42.756	1101.449
43.058	1049.275
43.654	849.275
43.668	1034.783
43.689	1321.739
43.767	997.101
43.876	1095.652
44.484	1052.174
44.580	971.014
44.588	1089.855
44.881	913.043
44.882	913.043
45.597	950.725
45.793	846.377
45.814	1136.232
45.900	913.043
45.906	997.101
45.907	1014.493
46.722	1011.594
46.920	942.029
47.827	811.594
48.235	808.696
48.441	846.377
48.762	1052.174
49.254	826.087
49.360	884.058
49.760	782.609
49.966	811.594
50.482	901.449
52.708	692.754];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(39.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Creu2010';
comment.tW = 'data of 1998';
  
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

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '55ZMF'; % Cat of Life
metaData.links.id_ITIS = '174608'; % ITIS
metaData.links.id_EoL = '45512102'; % Ency of Life
metaData.links.id_Wiki = 'Thalassoica_antarctica'; % Wikipedia
metaData.links.id_ADW = 'Thalassoica_antarctica'; % ADW
metaData.links.id_Taxo = '51505'; % Taxonomicon
metaData.links.id_WoRMS = '212639'; % WoRMS
metaData.links.id_avibase = '535186178E86447B'; % avibase
metaData.links.id_birdlife = 'antarctic-petrel-thalassoica-antarctica'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thalassoica_antarctica}}';
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
bibkey = 'Creu2010'; type = 'PhDthesis'; bib = [ ... 
'author = {J. C. S. Creuwels}, ' ... 
'year = {2010}, ' ...
'title = {Breeding ecology of {A}ntarctic petrels and {S}outhern fulmars in coastal {A}ntarctica}, ' ...
'school = {Groningen Univ}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049507/overview}}';
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

