function [data, auxData, metaData, txtData, weights] = mydata_Fulmarus_glacialoides
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Procellariiformes'; 
metaData.family     = 'Procellariidae';
metaData.species    = 'Fulmarus_glacialoides'; 
metaData.species_en = 'Southern fulmar';

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MS', 'MC'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCic', 'biCik', 'bjSv'};
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

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data

data.ab = 46;  units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Creu2010';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp is guessed';
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
  
data.Ww0 = 103;  units.Ww0 = 'g'; label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 60; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Creu2010';
data.Wwi = 745;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 845; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'avibase';

data.Ri  = 1/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data      
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.305	75.529
0.306	90.052
2.750	107.609
2.852	174.419
3.769	180.277
3.972	96.055
6.009	148.445
6.315	203.648
6.721	215.287
6.722	226.906
7.537	261.804
7.637	209.527
7.638	183.386
7.639	319.900
7.741	290.860
8.556	261.857
8.657	357.713
8.759	232.822
9.574	215.438
9.675	357.767
9.676	331.626
9.677	308.389
9.777	224.163
9.778	244.494
9.779	279.349
11.204	436.271
11.407	462.423
11.713	369.493
11.815	314.312
11.917	421.786
12.019	482.787
12.222	320.142
12.731	482.825
13.444	494.481
13.545	355.067
13.546	520.627
13.647	381.213
13.648	401.545
13.852	439.315
14.667	459.690
15.481	599.153
15.582	398.743
15.583	628.204
15.684	424.889
15.685	575.927
15.787	552.696
15.888	509.133
15.889	529.464
16.296	622.432
17.513	506.314
17.514	526.646
17.515	587.642
17.516	616.687
17.517	639.924
17.518	666.065
17.519	764.820
17.722	442.424
17.723	541.180
18.435	645.782
19.250	692.298
19.251	709.725
19.252	727.152
19.353	613.880
19.354	488.983
19.455	779.445
19.556	645.841
19.557	555.799
19.558	854.969
20.472	611.034
21.491	561.711
21.593	628.521
21.594	791.176
21.595	823.127
21.694	590.767
21.796	913.179
22.102	767.967
22.407	709.892
23.630	622.819
23.631	646.056
23.632	811.616
23.733	837.762
23.734	901.663
23.833	727.394
24.444	782.613
25.157	704.228
25.259	773.943
25.361	942.413
25.565	1029.561
25.666	887.242
25.667	1017.948
25.768	712.974
25.769	855.297
26.889	797.265
27.296	756.623
27.398	913.475
27.907	794.415
28.519	843.824
29.333	901.959
29.638	1145.958
29.639	1047.203
29.741	843.889
30.963	820.717
31.675	864.323
31.676	902.082
31.778	814.951
31.880	794.624
32.490	1041.545
32.491	1119.968
32.492	1143.204
32.593	832.421
32.796	951.519
33.611	820.857
34.019	844.115
34.528	864.474
34.529	844.142
34.630	910.952
35.546	1102.702
35.750	1059.144
35.751	1149.186
35.752	844.206
35.753	867.443
36.463	786.153
36.667	696.122
37.481	774.588
37.787	794.936
37.889	832.701
38.398	975.052
38.399	777.541
38.500	1088.335
38.602	824.025
39.213	623.642
40.537	821.223
40.639	803.801
40.740	1056.503
40.741	972.271
40.742	737.001
40.743	763.142
40.744	893.847
40.843	780.575
41.556	684.762
41.861	635.400
42.676	809.717
42.777	710.967
42.778	731.299
42.779	757.441
42.880	879.438
43.491	574.491
44.407	667.485
44.611	609.405
44.713	682.024
45.324	609.442
45.629	699.500
45.630	792.446
45.631	571.699
46.648	461.379];
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
D2 = 'Males as assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6K48R'; % Cat of Life
metaData.links.id_ITIS = '174540'; % ITIS
metaData.links.id_EoL = '45511495'; % Ency of Life
metaData.links.id_Wiki = 'Fulmarus_glacialoides'; % Wikipedia
metaData.links.id_ADW = 'Fulmarus_glacialoides'; % ADW
metaData.links.id_Taxo = '51496'; % Taxonomicon
metaData.links.id_WoRMS = '212638'; % WoRMS
metaData.links.id_avibase = '10C2881A1F9704A0'; % avibase
metaData.links.id_birdlife = 'southern-fulmar-fulmarus-glacialoides'; % birdlife
metaData.links.id_AnAge = 'Fulmarus_glacialoides'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fulmarus_glacialoides}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=10C2881A1F9704A0&sec=lifehistory}}';
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

