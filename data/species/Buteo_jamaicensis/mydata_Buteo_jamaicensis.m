function [data, auxData, metaData, txtData, weights] = mydata_Buteo_jamaicensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Accipitriformes'; 
metaData.family     = 'Accipitridae';
metaData.species    = 'Buteo_jamaicensis'; 
metaData.species_en = 'Red-tailed hawk';

metaData.ecoCode.climate = {'BWh','BSk','Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn','TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 08 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 03];

%% set data
% zero-variate data

data.ab = 31;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'AnAge';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 45.5;       units.tx = 'd';     label.tx = 'time since birth at fledging';  bibkey.tx = 'avibase';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 136.5;       units.tp = 'd';     label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 730;     units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'AnAge';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 30.7*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 57.6;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'AnAge';
data.Wwi = 1224;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'avibase';
data.Wwim = 1028;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'avibase';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 clutch per yr, 1-5 eggs/clutch';
  
% uni-variate data
% time-weight
data.tW1 = [ ... % time since birth (d), wet weight (g)
0.000	164.802
2.165	300.096
4.012	326.922
5.102	376.829
7.028	487.121
10.048	580.536
12.219	788.874
14.238	767.672
14.992	803.026
18.092	954.863
19.267	981.800
19.769	1027.630
20.950	966.914
21.954	1037.705
26.071	1066.244
26.908	1122.454
28.169	1115.985
28.926	1120.035
30.607	1119.757
31.955	1088.231
34.050	1175.538
37.998	1227.062];
data.tW1(:,1) = data.tW1(:,1) + 2; % match weight at 0 to hatch weight
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'ind 1'};  
temp.tW1    = C2K(40);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1  = 'FitcSwen1946';
%
data.tW2 = [ ... % time since birth (d), wet weight (g)
0.000	166.875
2.166	277.139
4.181	314.372
5.103	364.307
7.284	428.644
9.881	557.607
12.059	667.857
14.076	677.959
14.997	740.416
18.101	829.644
18.936	917.159
20.026	956.631
21.039	889.682
21.959	956.313
25.822	1020.372
26.993	1112.005
28.002	1103.491
29.010	1120.021
30.863	1075.889
31.874	1042.331
33.885	1127.565
38.003	1151.930];
data.tW2(:,1) = data.tW2(:,1) + 2; % match weight at 0 to hatch weight
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight', 'ind 2'};  
temp.tW2    = C2K(40);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2  = 'FitcSwen1946';
%
data.tW3 = [ ... % time since birth (d), wet weight (g)
0.000	102.165
2.002	222.905
2.003	222.905
4.102	249.690
5.107	305.872
6.867	378.625
10.303	538.755
11.894	628.232
14.080	621.611
14.998	721.634
18.103	796.252
19.026	821.144
19.948	862.731
19.949	862.731
21.125	862.537
21.964	895.790
25.915	901.400
26.831	1013.945
27.930	928.199
28.771	936.408
30.962	856.743
31.884	896.243
34.154	895.869
37.935	924.463];
data.tW3(:,1) = data.tW3(:,1) + 2; % match weight at 0 to hatch weight
units.tW3   = {'d', 'g'};  label.tW3 = {'time since birth', 'wet weight', 'ind 3'};  
temp.tW3    = C2K(40);  units.temp.tW3 = 'K'; label.temp.tW3 = 'temperature';
bibkey.tW3  = 'FitcSwen1946';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = 2 * weights.tW1;
weights.tW2 = 2 * weights.tW2;
weights.tW3 = 2 * weights.tW3;

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
set1 = {'tW1','tW2','tW3'}; subtitle1 = {'Data for individual 1,2,3'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1,'D2',D2);  

%% Links
metaData.links.id_CoL = '69669'; % Cat of Life
metaData.links.id_ITIS = '175350'; % ITIS
metaData.links.id_EoL = '45511426'; % Ency of Life
metaData.links.id_Wiki = 'Buteo_jamaicensis'; % Wikipedia
metaData.links.id_ADW = 'Buteo_jamaicensis'; % ADW
metaData.links.id_Taxo = '52641'; % Taxonomicon
metaData.links.id_WoRMS = '159109'; % WoRMS
metaData.links.id_avibase = '536A5157A50E1F3C'; % avibase
metaData.links.id_birdlife = 'red-tailed-hawk-buteo-jamaicensis'; % birdlife
metaData.links.id_AnAge = 'Buteo_jamaicensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buteo_jamaicensis}}';
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
bibkey = 'FitcSwen1946'; type = 'Article'; bib = [ ... 
'title = {BEHAVIOR AND FOOD HABITS OF THE RED-TAILED HAWK}, ' ...
'author = {Henry S. Fitch and Freeman Swenson and Daniel Tillotson}, ' ...
'journal = {The Condor}, ' ...
'year = {1946}, ' ...
'volume = {48(5)}, ' ...
'pages = {205-237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=536A5157A50E1F3C&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Buteo_jamaicensis}}';
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

