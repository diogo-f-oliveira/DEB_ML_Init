function [data, auxData, metaData, txtData, weights] = mydata_Leptoptilos_crumeniferus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Ciconiiformes'; 
metaData.family     = 'Ciconiidae';
metaData.species    = 'Leptoptilos_crumeniferus'; 
metaData.species_en = 'Marabou stork'; 

metaData.ecoCode.climate = {'A', 'BSh', 'Cwb', 'Cwc'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs'};
metaData.ecoCode.embryo  = {'Tnpfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCv', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 08 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 10];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'AnAge';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 100;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Terk1994';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '95 till 108 d';
data.tp = 300;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '95 till 108 d';
data.tR = 1460;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'sexually matury in 3 mnth in captivity';
data.am = 44.7*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 68;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Terk1994';
data.Wwi = 7000; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 4.5 till 9 kg; females are smaller than males, so Wwi is adujsted from Wwim';
data.Wwim = 8500; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';       bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: 4.5 till 9 kg';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % age (d) weight (g)
0.243	68.319
1.444	74.238
2.549	74.859
3.559	106.895
4.712	118.033
5.674	134.307
7.164	166.613
8.464	225.036
9.908	299.274
11.161	394.384
12.754	547.377
13.866	700.099
15.218	858.202
16.329	995.190
17.200	1121.553
17.922	1158.672
18.117	1232.209
18.893	1374.253
19.664	1432.379
20.583	1569.259
20.826	1627.088
22.030	1706.436
22.798	1691.133
24.824	1875.838
25.068	1949.401
25.935	2002.336
27.685	2433.389
28.025	2512.252
28.985	2507.546
29.757	2581.407];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(40.5);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Terk1994';
comment.tW_f = 'Data for females, digitized from drawn curve';
%
data.tW_m = [ ... % age (d) weight (g)
0.196	78.781
1.493	95.245
2.166	100.868
3.513	138.338
4.859	165.318
5.822	213.062
7.555	297.952
8.662	356.266
9.959	356.995
11.647	515.286
12.758	641.785
13.725	773.447
14.742	941.850
15.710	1099.737
16.818	1184.276
17.594	1336.810
17.883	1357.951
18.708	1526.247
19.147	1662.857
19.878	1888.793
21.516	1989.363
22.679	2215.542
23.264	2399.437
24.093	2641.161
25.104	2709.911
25.684	2767.929];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(40.5);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Terk1994';
comment.tW_m = 'Data for males, digitized from drawn curve';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = weights.tW_f * 2;
weights.tW_m = weights.tW_m * 2;

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
D2 = 'scaled functional response turned out to vary during handrearing';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: males have equal state variables at b, compared to females';
D5 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);  

%% Links
metaData.links.id_CoL = '6PHMD'; % Cat of Life
metaData.links.id_ITIS = '174919'; % ITIS
metaData.links.id_EoL = '51900591'; % Ency of Life
metaData.links.id_Wiki = 'Leptoptilos_crumeniferus'; % Wikipedia
metaData.links.id_ADW = 'Leptoptilos_crumeniferus'; % ADW
metaData.links.id_Taxo = '51878'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = '03C0F97C496962D8'; % avibase
metaData.links.id_birdlife = 'marabou-leptoptilos-crumenifer'; % birdlife
metaData.links.id_AnAge = 'Leptoptilos_crumeniferus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leptoptilos_crumenifer}}';
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
bibkey = 'Terk1994'; type = 'Article'; bib = [ ... 
'author = {A. Terkel}, ' ... 
'year = {1994}, ' ...
'title = {Breeding the Marabou stork at the {Zoological Center Tel Aviv and Noorder Zoo, Emmen} \emph{Leptoptilos crumeniferus}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {33}, ' ...
'pages = {55--62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1049138/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Leptoptilos_crumenifer}}';
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

