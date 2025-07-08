function [data, auxData, metaData, txtData, weights] = mydata_Larus_glaucescens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Larus_glaucescens'; 
metaData.species_en = 'Glaucous-winged gull'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN', 'MN'};
metaData.ecoCode.habitat = {'0iMm', 'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCi', 'biSi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 08 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 27;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. 26 to 28 d';
data.tx = 45;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '35-54 d';
data.tp = 135;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '35-54 d';
data.tR = 5.5*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 32*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 95.7;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 70.75; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 946.1; units.Wwi = 'g';   label.Wwi = 'ultimate wet weightof females';     bibkey.Wwi = 'avibase';
data.Wwim = 1180; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males';     bibkey.Wwim = 'avibase';

data.Ri  = 2.7/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-3 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.135	65.271
2.047	82.316
3.069	104.413
4.095	104.456
5.051	112.979
6.953	199.578
7.977	206.407
8.863	226.802
9.948	294.705
10.979	255.731
11.991	349.077
12.949	344.028
15.123	442.513
15.874	447.635
17.029	503.666
18.127	471.480
19.009	520.714
20.099	551.296
20.775	600.521
21.932	641.284
22.820	648.108
23.769	707.523
24.868	666.855
25.742	773.767
26.911	729.710
27.862	773.857
28.681	784.071
29.843	785.816
30.724	838.443
31.826	784.204
32.843	847.015
33.942	811.437
34.963	843.712
35.770	935.353
36.945	850.582
37.885	964.282
39.114	979.602
39.937	960.977];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', '1 chick/nest'};  
temp.tW1    = C2K(40.9);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Verm1963';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
0.135	63.574
1.775	72.126
3.140	89.148
4.503	116.349
6.003	145.252
7.023	186.009
8.113	218.288
9.477	237.006
10.227	254.002
11.183	260.829
11.997	306.667
13.293	328.775
14.108	366.131
14.853	415.359
16.082	427.286
17.036	452.773
17.991	471.474
18.950	456.247
19.828	532.624
21.055	559.819
21.734	590.383
22.964	595.525
23.923	587.083
24.395	629.514
24.936	675.340
26.033	651.637
27.874	689.036
28.891	750.151
29.712	745.097
30.668	750.226
31.764	741.791
32.783	782.548
34.911	730.049
35.860	784.375
37.020	803.085
38.865	811.645
39.966	764.192];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', '2 chicks/nest'};  
temp.tW2    = C2K(40.9);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'Verm1963';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
0.135	63.574
2.047	80.620
3.001	104.410
4.026	104.454
5.252	138.434
6.683	172.423
8.318	218.296
10.090	253.996
11.047	257.430
11.998	301.577
13.021	320.281
13.904	362.730
14.853	417.056
15.809	425.578
16.695	447.669
17.854	473.165
18.882	456.244
20.034	527.543
20.845	593.738
21.941	580.213
22.896	593.825
23.847	634.580
24.737	629.528
25.891	688.952
26.852	663.547
27.998	773.863
28.827	714.523
29.850	736.620
31.628	733.303
32.649	765.578
33.951	745.276
34.767	777.543
35.727	757.227
36.682	775.928
37.780	747.135
39.142	782.818
39.958	818.477];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', '3 chicks/nest'};  
temp.tW3    = C2K(40.9);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3 = 'Verm1963';

%% set weights for all real data
weights = setweights(data, []);
weights.tW3 = weights.tW3 * 2;
weights.tW2 = weights.tW2 * 2;
weights.tW1 = weights.tW1 * 2;

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
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data for 1,2,3 chicks/nest'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Feeding is slightly reduced towards end of nestling period';
D2 = 'Long tp cannot be captured by std model';
D3 = 'males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '3SBQB'; % Cat of Life
metaData.links.id_ITIS = '176814'; % ITIS
metaData.links.id_EoL = '45509294'; % Ency of Life
metaData.links.id_Wiki = 'Larus_glaucescens'; % Wikipedia
metaData.links.id_ADW = 'Larus_glaucescens'; % ADW
metaData.links.id_Taxo = '53809'; % Taxonomicon
metaData.links.id_WoRMS = '343911'; % WoRMS
metaData.links.id_avibase = '03AC32BA532FB6E3'; % avibase
metaData.links.id_birdlife = 'glaucous-winged-gull-larus-glaucescens'; % birdlife
metaData.links.id_AnAge = 'Larus_glaucescens'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Larus_glaucescens}}';
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
bibkey = 'Verm1963'; type = 'Article'; bib = [ ... 
'author = {Vermeer, K.}, ' ... 
'year = {1963}, ' ...
'title = {The breeding ecology of the Glaucous-winged Gull (\emph{Larus glaucescens}) on {M}andarte {I}sland, {B}.{C}.}, ' ...
'journal = {Occ. Pap. Br. Columb. prov. Mus.}, ' ...
'volume = {13}, ' ...
'pages = {187--194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Larus_glaucescens}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=03AC32BA532FB6E3&sec=lifehistory}}';
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

