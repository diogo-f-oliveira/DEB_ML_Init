function [data, auxData, metaData, txtData, weights] = mydata_Psittrichas_fulgidus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittrichasiidae';
metaData.species    = 'Psittrichas_fulgidus'; 
metaData.species_en = 'Pesquet''s parrot'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.3); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 30.5;    units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'WitmLewi2000';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at fledging';     bibkey.tx = 'WitmLewi2000';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 270;    units.tp = 'd';    label.tp = 'time since birth at puberty';     bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 3*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'for males 5 yr; data for captive birds, in the wild it could be more';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'WitmLewi2000';
data.Wwi = 865;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'AnAge';

data.Ri = 2/365; units.Ri = '#/d'; label.Ri  = 'maximum reprod rate';               bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs/clutch; breeds once per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.008	15.094
0.820	18.812
1.901	18.737
2.443	20.587
3.525	22.400
4.336	22.344
5.687	22.251
6.364	24.092
7.584	31.555
8.530	33.377
9.479	38.972
10.290	38.917
11.104	44.521
12.187	48.220
13.271	53.806
14.219	59.402
15.303	64.988
15.973	53.621
16.116	68.706
16.651	57.348
16.793	72.433
17.736	64.821
18.285	81.764
19.093	76.048
19.100	91.142
19.901	70.333
20.319	96.719
20.458	104.257
20.853	83.475
21.408	111.739
21.941	96.608
23.173	128.599
23.430	102.166
23.585	141.778
24.517	113.412
24.538	154.920
25.080	158.657
25.604	124.658
26.303	171.780
26.828	139.669
26.849	181.177
27.372	147.179
27.938	198.083
28.324	158.434
29.028	214.990
29.269	158.369
29.709	226.264
30.531	246.962
30.621	158.276
31.701	156.315
31.887	256.303
32.380	163.816
32.844	278.879
33.199	178.854
33.798	293.908
33.880	190.128
34.427	203.298
35.025	316.465
35.381	218.327
35.709	331.512
36.335	235.243
36.747	246.535
37.341	352.155
37.701	263.451
37.726	312.506
38.279	336.996
38.382	274.725
38.824	346.393
38.929	286.008
39.883	302.924
40.189	372.714
40.835	314.179
41.006	385.866
41.515	323.567
41.558	408.469
42.337	344.265
42.616	363.114
42.643	415.942
43.433	374.378
43.727	421.528
44.247	379.983
44.792	389.380
44.951	436.539
45.471	396.880
45.766	444.030
46.151	404.381
47.390	449.579
47.407	483.540
48.887	470.231
48.912	519.286
50.915	471.978
50.959	558.768
51.900	549.269
52.266	471.886
52.408	485.084
52.861	579.392
52.955	498.253
54.572	488.709
55.164	590.555
55.918	477.296
55.969	579.179
57.600	597.935
58.088	494.128
59.473	560.070
59.902	607.211
61.537	633.514
61.772	563.686
62.454	576.847
63.020	625.865
63.270	586.225
63.840	644.676
63.945	584.292
64.779	631.404
65.296	584.199
65.989	618.114
66.812	642.586
67.748	621.767
68.566	636.805
68.707	648.116
75.730	640.087
75.902	713.660
77.776	677.683
78.207	728.596
80.619	688.808
80.892	694.450
83.721	675.388
83.866	696.133
85.063	658.315
85.077	684.729
85.881	671.466
86.953	654.411
86.967	680.826
88.588	680.714
89.252	658.027
93.025	635.127
93.028	642.674
93.975	644.496
93.986	665.250
95.996	633.036
96.015	668.884
98.294	632.879
98.709	651.718
108.836	635.929
108.848	660.456
118.973	640.894
118.986	665.421];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'WitmLewi2000';
  
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
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4PKDJ'; % Cat of Life
metaData.links.id_ITIS = '177544'; % ITIS
metaData.links.id_EoL = '45517892'; % Ency of Life
metaData.links.id_Wiki = 'Psittrichas_fulgidus'; % Wikipedia
metaData.links.id_ADW = 'Psittrichas_fulgidus'; % ADW
metaData.links.id_Taxo = '54276'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '110E01EA39D4647F'; % avibase
metaData.links.id_birdlife = 'pesquets-parrot-psittrichas-fulgidus'; % birdlife
metaData.links.id_AnAge = 'Psittrichas_fulgidus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psittrichas_fulgidus}}';
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
bibkey = 'WitmLewi2000'; type = 'Article'; bib = [ ... 
'author = {P. Witman and E. Lewins}, ' ... 
'year = {2000}, ' ...
'title = {Breeding and hand-rearing Pesquet''s parrot \emph{Psittrichas fulgidus} at the {Zoological Society of San diego}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {37}, ' ...
'pages = {165-171}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Psittrichas_fulgidus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Psittrichas_fulgidus/}}';
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

