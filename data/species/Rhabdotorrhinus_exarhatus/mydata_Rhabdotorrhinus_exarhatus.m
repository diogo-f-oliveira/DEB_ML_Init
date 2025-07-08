function [data, auxData, metaData, txtData, weights] = mydata_Rhabdotorrhinus_exarhatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Bucerotiformes'; 
metaData.family     = 'Bucerotidae';
metaData.species    = 'Rhabdotorrhinus_exarhatus'; 
metaData.species_en = 'Sulawesi hornbill'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCii', 'biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'}; 

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 22];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 29;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'MaceAzua1997';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '28 till 30 d'; 
data.tx = 60;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'MaceAzua1997';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 180;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 1.5*365;   units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on other Bucerotidae species as presented in AnAge';

data.Wwb = 18;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MaceAzua1997';
data.Wwi = 420; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MaceAzua1997';
  comment.Wwi = 'based on extrapolation of growth curve; Kemp1995 gives 380 g for female (in the wild)';

data.Ri  = 2.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'KlopCuri2000';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Data from Penelopides panini panini';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.034	18.335
0.035	21.545
0.036	21.545
0.915	21.444
0.916	21.444
0.948	19.835
1.927	18.118
1.962	23.732
1.963	24.535
2.974	15.590
3.009	21.204
3.077	27.617
3.954	17.886
3.955	23.504
3.956	27.516
3.957	33.134
4.969	32.216
5.035	20.169
5.139	41.827
5.172	32.192
6.049	24.066
6.118	36.097
6.120	48.135
6.186	40.904
6.962	33.592
6.963	43.223
6.964	49.643
6.965	54.459
8.010	41.498
8.012	53.536
8.014	71.995
9.063	87.926
9.092	52.610
9.093	56.622
9.095	73.476
9.944	103.074
10.042	84.603
10.073	62.930
10.075	71.759
10.926	123.025
10.953	77.276
10.954	83.696
10.990	101.349
11.908	142.977
11.938	111.673
11.969	91.606
11.970	96.421
12.958	166.934
12.984	110.751
12.985	116.369
12.986	124.394
14.008	183.667
14.101	127.477
14.102	133.095
15.016	148.239
15.023	196.392
15.051	153.050
15.052	157.063
15.896	159.374
15.964	164.181
15.965	170.602
16.003	202.700
16.977	165.670
16.980	187.339
16.981	193.760
16.982	196.167
16.986	226.664
17.992	175.185
17.997	212.102
17.998	215.313
18.034	236.978
18.063	202.464
18.977	216.805
18.979	232.856
18.981	244.895
19.008	194.330
19.994	243.976
19.995	247.989
20.030	260.023
20.031	266.444
20.056	200.630
20.971	222.195
21.009	255.096
21.010	263.121
21.078	267.929
21.079	275.152
22.022	257.387
22.024	271.833
22.025	279.056
22.096	302.323
23.005	283.759
23.006	287.772
23.007	291.785
23.078	323.077
24.020	293.274
24.022	306.115
24.023	310.930
24.024	320.561
25.000	294.766
25.002	309.212
25.003	321.251
25.005	336.499
25.006	339.710
25.982	314.718
25.983	321.941
25.986	345.215
25.987	350.833
26.963	328.249
26.965	338.682
27.068	356.327
27.069	361.945
27.983	375.484
28.013	352.206
28.014	354.614
28.045	333.743
28.957	332.836
28.993	354.501
29.028	361.720
29.100	393.815
29.101	399.433];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MaceAzua1997';
  
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
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '76H4M'; % Cat of Life
metaData.links.id_ITIS = '554436'; % ITIS
metaData.links.id_EoL = '1047995'; % Ency of Life
metaData.links.id_Wiki = 'Rhabdotorrhinus_exarhatus'; % Wikipedia
metaData.links.id_ADW = 'Penelopides_exarhatus'; % ADW
metaData.links.id_Taxo = '72968'; % Taxonomicon
metaData.links.id_avibase = 'C0BD105FF3017FFC'; % Avibase
metaData.links.id_birdlife = 'sulawesi-hornbill-rhabdotorrhinus-exarhatus'; % Birdlife

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhabdotorrhinus_exarhatus}}';
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
bibkey = 'Kemp1995'; type = 'Book'; bib = [ ... 
'author = {Kemp, A.}, ' ...
'year = {1995}, ' ...
'title  = {The hornbills}, ' ...
'publisher = {Oxford Univ Press}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MaceAzua1997'; type = 'Article'; bib = [ ... 
'author = {M. Mace and J. Azua}, ' ... 
'year = {1997}, ' ...
'title = {Breeding and hand-rearing of the southern {S}ulawesi hornbill \emph{Penelopides exarhatus sanfordi} for the {Zoological society of San Diego}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {35}, ' ...
'pages = {247--253}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KlopCuri2000'; type = 'Article'; bib = [ ... 
'author = {E. Klop and E. Curio and L. L. Lastimoz}, ' ... 
'year = {2000}, ' ...
'title = {Breeding biology, nest site characteristics and nest spacing of the Visayan Tarictic Hornbill \emph{Penelopides panini panini} on {Panay, Philippines}}, ' ...
'journal = {Bird Conservation International}, ' ...
'volume = {10}, ' ...
'pages = {17--27}'];
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

