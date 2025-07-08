function [data, auxData, metaData, txtData, weights] = mydata_Eunymphicus_cornutus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Psittaciformes'; 
metaData.family     = 'Psittaculidae';
metaData.species    = 'Eunymphicus_cornutus'; 
metaData.species_en = 'Horned parakeet'; 

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
metaData.date_subm   = [2018 08 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 06];

%% set data
% zero-variate data

data.ab = 21.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 42;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'RobiSala2008';   
  temp.tx = C2K(41.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 126;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(41.3);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 19.7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(41.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'RobiSala2008';
  comment.Wwb = 'egg length 2.71 cm, width 2.25 cm, weight: pi/6*2.71*2.25^2=7.2 g';
data.Wwi = 120; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'RobiSala2008';
  comment.Wwi = 'asymptotic weight of nestling, adult weight lower: 125 g for (hbw)';
data.Wwim = 140; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'RobiSala2008';
  comment.Wwim = 'asymptotic weight of nestling, adult weight lower: 167 g (hbw)';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(41.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 to 4 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), wet weight (g)
0        5 % added from Wwb
5.018	24.117
6.628	32.917
6.862	17.620
6.864	19.384
7.796	29.665
8.795	45.827
9.852	57.576
9.892	30.516
9.917	62.281
11.025	60.500
11.834	71.076
12.867	51.943
13.916	53.104
13.986	64.574
16.016	58.662
16.955	78.059
16.959	83.354
16.962	87.471
16.966	92.765
18.013	91.573
19.121	89.204
19.980	84.486
20.182	107.130
20.929	116.236
20.970	89.177
22.144	92.689
22.152	103.277
23.086	116.205
23.133	96.498
23.136	100.322
23.139	105.321
23.267	110.320
24.188	106.777
24.323	121.775
24.995	113.824
25.122	118.528
25.919	113.516
25.974	104.692
26.046	118.220
26.053	126.749
27.086	108.205
27.105	132.910
28.084	123.484
28.200	113.776
29.015	131.412
29.063	113.764
29.986	111.691
29.995	124.338
30.005	137.279
32.078	108.131
33.993	113.691
35.975	126.309
36.035	123.367
36.947	108.060
37.877	114.811
37.881	119.516
37.883	123.046
38.862	113.620
39.905	106.840
39.971	112.427
41.932	98.280
42.005	112.691];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'RobiSala2008';
comment.tW_f = 'data for females';
%
data.tW_m = [ ... % time since birth (d), wet weight (g)
0        5 % added from Wwb
4.831	20.297
5.700	29.107
5.828	35.282
6.624	28.800
6.815	36.444
6.994	28.794
7.850	19.370
7.860	33.193
7.867	42.017
9.910	54.045
11.083	56.381
12.811	59.297
13.890	98.987
14.863	82.796
14.916	71.913
14.998	97.500
15.782	75.136
16.958	81.589
17.947	85.692
17.958	100.398
19.991	98.015
21.067	134.764
22.042	120.926
22.094	107.984
22.180	140.041
23.106	142.087
23.147	114.733
23.212	119.732
24.019	126.779
24.154	141.777
24.197	117.365
26.867	143.502
26.996	151.735
27.103	129.675
28.225	146.717
28.229	151.423
29.009	123.765
29.270	143.172
29.338	151.407
29.805	117.282
34.446	141.038
35.059	137.205
35.984	137.191
36.780	131.003
38.947	143.913
40.913	135.354
40.966	124.177
40.971	131.236
41.162	138.292
41.890	123.575
43.065	128.264];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'RobiSala2008';
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
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3CG7W'; % Cat of Life
metaData.links.id_ITIS = '177585'; % ITIS
metaData.links.id_EoL = '45517961'; % Ency of Life
metaData.links.id_Wiki = 'Eunymphicus_cornutus'; % Wikipedia
metaData.links.id_ADW = 'Eunymphicus_cornutus'; % ADW
metaData.links.id_Taxo = '54293'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'FC7AB945C8292D66'; % avibase
metaData.links.id_birdlife = 'horned-parakeet-eunymphicus-cornutus'; % birdlife
metaData.links.id_AnAge = 'Eunymphicus_cornutus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eunymphicus_cornutus}}';
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
bibkey = 'RobiSala2008'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1474-919X.1999.tb07374.x}, ' ...
'author = {O. Robinet and M. Salas}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive biology of the endangered {O}uvea Parakeet \emph{Eunymphicus cornutus uvaeensis}}, ' ...
'journal = {Ibis}, ' ...
'volume = {141}, ' ...
'pages = {660--669}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eunymphicus_cornutus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'hbw'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.hbw.com/species/horned-parakeet-eunymphicus-cornutus}}';
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

