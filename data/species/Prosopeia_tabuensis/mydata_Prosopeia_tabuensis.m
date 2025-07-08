function [data, auxData, metaData, txtData, weights] = mydata_Prosopeia_tabuensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittacidae';
metaData.species    = 'Prosopeia_tabuensis'; 
metaData.species_en = 'Maroon shining parrot'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 10 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 18];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 05];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 05];

%% set data
% zero-variate data

data.ab = 24.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = {'Rink1989', 'beautyofbirds'};   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 49;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Rink1989';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 147;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Rink1989';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 23.7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 30;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Rink1989';
  comment.Wwb = 'egg length 3.973 cm, width 3.114 cm. Egg weight: pi/6*3.973*3.114^2=20.17 g; this is inconsistent with tW data';
data.Wwi = 250; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Rink1989';
data.Wwim = 320; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Rink1989';

data.Ri  = 2.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 3 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0.751	39.634
0.754	30.662
1.260	39.640
1.516	36.278
2.448	39.653
2.776	74.423
2.784	49.750
3.204	64.334
3.207	54.802
3.801	57.051
4.900	69.400
4.986	64.915
5.915	77.823
7.945	99.154
8.032	94.669
8.793	103.649
8.879	99.164
10.743	110.400
11.327	138.444
11.668	134.523
11.761	112.655
12.413	186.681
13.026	134.538
13.450	136.786
13.537	131.179
14.386	131.189
14.629	162.033
14.718	150.258
14.720	146.333
15.814	173.261
16.733	215.888
17.767	171.040
18.780	188.434
18.789	160.958
18.876	157.033
19.039	176.101
20.812	201.354
23.863	215.968
23.869	200.267
24.955	249.625
24.972	200.840
25.456	273.743
25.548	251.875
25.610	318.044
25.644	221.035
26.566	255.811
26.912	236.189
27.850	225.545
29.957	268.747
30.817	235.111
32.853	239.620
34.210	244.682
34.797	264.315
35.554	283.950
35.822	244.700
36.839	250.319
37.593	278.926
38.794	244.733
39.798	285.679
39.898	241.942
42.857	276.742
42.870	240.293
43.631	248.152
43.957	287.969
48.216	246.521
48.981	242.605];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Rink1989';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0.495	41.874
0.498	34.024
1.847	60.955
2.869	50.873
3.540	73.871
3.543	65.460
3.715	58.733
4.895	81.736
5.659	83.988
6.074	109.226
6.837	113.721
7.011	101.386
7.178	109.799
8.198	103.643
8.536	109.815
8.617	118.788
8.702	121.032
9.542	144.032
9.800	134.502
10.897	154.701
12.677	160.889
12.680	153.039
13.517	185.572
14.789	189.511
15.551	197.370
15.708	231.577
19.610	240.593
19.768	274.240
20.456	250.135
21.383	268.650
22.738	275.955
23.825	323.070
24.510	307.938
25.359	307.947
27.480	310.214
27.482	304.607
27.739	299.563
28.666	318.639
30.624	302.960
31.722	316.991
31.811	304.655
31.899	297.366
32.750	292.329
33.848	306.360
34.605	327.677
36.731	317.047
37.580	317.056
37.676	285.656
39.531	318.760
39.885	279.512
40.042	315.962
41.828	305.889
43.779	309.275
44.624	321.621
44.976	285.737
47.937	313.808
49.816	281.866];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Rink1989';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'relative food intake decreases towards fledging';
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '4MW3J'; % Cat of Life
metaData.links.id_ITIS = '177547'; % ITIS
metaData.links.id_EoL = '45517959'; % Ency of Life
metaData.links.id_Wiki = 'Prosopeia_tabuensis'; % Wikipedia
metaData.links.id_ADW = 'Prosopeia_tabuensis'; % ADW
metaData.links.id_Taxo = '70613'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'EDBDE745B9A935BC'; % avibase
metaData.links.id_birdlife = 'maroon-shining-parrot-prosopeia-tabuensis'; % birdlife
metaData.links.id_AnAge = 'Prosopeia_tabuensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prosopeia_tabuensis}}';
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
bibkey = 'Rink1989'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1989.tb02766.x}, ' ...
'author = {D. Rinke}, ' ... 
'year = {1989}, ' ...
'title = {The reproductive biology of the Red Shining Parrot \emph{Prosopeia tabuensis} on the island of ''{E}ua, {K}ingdom of {T}onga}, ' ...
'journal = {Ibis}, ' ...
'volume = {131}, ' ...
'pages = {238--249}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Prosopeia_tabuensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'beautyofbirds'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.beautyofbirds.com/incubationparrots.html}}';
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

