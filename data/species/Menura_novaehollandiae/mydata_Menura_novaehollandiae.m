function [data, auxData, metaData, txtData, weights] = mydata_Menura_novaehollandiae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Passeriformes'; 
metaData.family     = 'Menuridae';
metaData.species    = 'Menura_novaehollandiae'; 
metaData.species_en = 'Superb lyrebird';

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTht', '0iThh'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHs','biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.6); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 09 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 07];

%% set data
% zero-variate data

data.ab = 50;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'avibase';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 47;        units.tx = 'd';    label.tx = 'time since birth at fledging';  bibkey.tx = 'avibase';   
  temp.tx = C2K(41.6); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 141;        units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(41.6); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 6.5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'Wiki';
  temp.tR = C2K(41.6); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 17.9*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(41.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 61.5;     units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';      bibkey.Ww0 = 'avibase';
data.Wwb = 41;      units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Lill1979';
data.Wwi = 680.2;    units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 1099.7;  units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';
 
data.Ri  = 1/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(41.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 egg per clutch; 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
1.110	47.524
4.174	75.951
6.883	105.577
9.120	137.596
11.121	166.056
12.650	194.531
14.651	228.934
16.415	263.344
18.180	294.188
20.652	332.142
22.888	371.291
25.006	408.067
27.243	436.520
30.186	479.212
32.306	507.669
35.839	547.965
39.377	564.493
41.736	572.739
43.740	583.372
44.563	602.362];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(41.6);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'Lill1979';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
0.874	48.720
4.292	73.570
6.411	105.592
8.411	142.372
10.175	175.593
12.529	217.116
14.882	255.073
17.471	300.153
19.589	338.117
22.061	374.882
24.532	418.778
30.187	476.835
34.550	494.525
38.554	543.127
40.443	543.068];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(41.6);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'Lill1979';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
1.819	41.559
6.416	73.504
9.242	112.634
11.715	145.834
13.008	175.505
14.891	205.157
17.009	241.933
18.773	276.343
21.245	314.296
23.481	352.257
24.776	370.043
26.778	393.750
28.781	417.456
30.902	431.651
34.083	464.829
37.972	495.607
41.039	503.830
42.691	503.778
44.458	522.738];
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight'};  
temp.tW3    = C2K(41.6);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'Lill1979';
%
data.tW4 = [ ... % time since birth (d), wet weight (g)
1.556	49.936
5.523	85.493
8.768	118.691
10.569	145.982
12.728	194.656
16.090	245.678
18.249	295.541
20.049	328.774
21.368	360.830
24.250	399.980
26.652	437.952
26.652	437.952
29.053	475.924
32.296	519.818
35.779	568.460
38.062	595.740
40.708	613.502
42.991	636.028
46.116	668.040
50.206	685.768
51.889	703.554];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};  
temp.tW4    = C2K(41.6);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4  = 'Lill1979';
%
data.tW5 = [ ... % time since birth (d), wet weight (g)
0.835	46.388
3.602	57.017
5.521	96.189
8.165	127.025
10.566	167.374
13.328	206.526
15.849	246.873
18.491	288.404
20.892	326.377
24.015	367.897
27.139	402.286
30.384	437.861
33.871	460.357
36.036	474.566
37.478	493.547
40.006	494.674
42.049	516.016];
units.tW5   = {'d', 'g'};  label.tW5 = {'time since birth', 'wet weight'};  
temp.tW5    = C2K(41.6);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
bibkey.tW5  = 'Lill1979';

%% set weights for all real data
weights = setweights(data, []);weights.tW5 = weights.tW5 * 0.1;
weights.tW4 = weights.tW4 * 2;
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
set1 = {'tW1','tW2','tW3','tW4','tW5'}; subtitle1 = {'Different individuals'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are supposed to differ fro females by {p_Am} only';
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3ZSN6'; % Cat of Life
metaData.links.id_ITIS = '561097'; % ITIS
metaData.links.id_EoL = '45518046'; % Ency of Life
metaData.links.id_Wiki = 'Menura_novaehollandiae'; % Wikipedia
metaData.links.id_ADW = 'Menura_novaehollandiae'; % ADW
metaData.links.id_Taxo = '56249'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '952F56822FA3776E'; % avibase
metaData.links.id_birdlife = 'superb-lyrebird-menura-novaehollandiae'; % birdlife
metaData.links.id_AnAge = 'Menura_novaehollandiae'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Menura_novaehollandiae}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Menura_novaehollandiae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lill1979'; type = 'article'; bib = [ ... 
'author = {Alan Lill}, ' ...
'title = {Nest Inattentiveness and Its Influence on Development of the Young in the Superb Lyrebird}, ' ...
'journal = {The Condor}, ' ...
'year = {1979}, ' ...
'volume = {81(3)}, ' ...
'pages = {225-231}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=952F56822FA3776E&sec=lifehistory}}';
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

