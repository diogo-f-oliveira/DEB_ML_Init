function [data, auxData, metaData, txtData, weights] = mydata_Ceryle_rudis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Coraciiformes'; 
metaData.family     = 'Alcedinidae';
metaData.species    = 'Ceryle_rudis'; 
metaData.species_en = 'Pied kingfisher'; 

metaData.ecoCode.climate = {'A','BSh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TP'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tntfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvf', 'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww';'t-JX'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 15;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 25;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Dout1976';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 75;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365; units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 8.1; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwi = 86.4; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'avibase';
data.Wwim = 82.4; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'avibase';

data.Ri  = 1.5*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 eggs per clutch, 1.5 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
1.835	17.548
2.919	20.596
3.772	25.043
4.914	28.345
5.941	31.520
7.873	43.467
8.779	50.586
9.798	59.484
10.817	68.383
12.696	76.769
13.725	78.927
14.753	81.084
15.784	81.970
16.697	84.637
17.667	87.304
18.695	90.097
19.611	90.856
20.699	91.742
21.625	85.251
22.656	85.374
23.694	81.045
24.675	76.462
25.653	73.914
26.742	73.909
27.723	69.326
28.640	69.322
29.790	66.901
30.760	69.313];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Dout1976';

% time-food consumption
data.tJX = [ ... % time since birth (d), daily food consumption (g/d)
0.995	3.434
2.081	5.210
2.991	10.421
4.019	12.833
5.105	15.244
5.954	22.617
6.973	31.262
7.827	34.946
8.674	43.973
9.764	43.586
10.910	43.454
11.708	46.503
12.745	42.937
13.944	45.985
14.693	43.056
15.814	60.730
16.748	48.643
17.792	40.626
18.831	35.534
19.808	33.495
20.864	16.574
21.937	27.508
22.854	27.631
23.955	19.104
24.937	13.504
26.024	15.025
26.939	16.548
27.843	25.701
28.821	22.517
29.827	40.700];
units.tJX   = {'d', 'g/d'};  label.tJX = {'time since birth', 'food consumption'};  
temp.tJX    = C2K(40);  units.temp.tJX = 'K'; label.temp.tJX = 'temperature';
bibkey.tJX = 'Dout1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;
weights.tJX = weights.tJX * 2;

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
D1 = 'Food availability varies in time';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = 'T574'; % Cat of Life
metaData.links.id_ITIS = '554636'; % ITIS
metaData.links.id_EoL = '45516506'; % Ency of Life
metaData.links.id_Wiki = 'Ceryle_rudis'; % Wikipedia
metaData.links.id_ADW = 'Ceryle_rudis'; % ADW
metaData.links.id_Taxo = '55193'; % Taxonomicon
metaData.links.id_WoRMS = '212593'; % WoRMS
metaData.links.id_avibase = '8205077FA2E98715'; % avibase
metaData.links.id_birdlife = 'pied-kingfisher-ceryle-rudis'; % birdlife
metaData.links.id_AnAge = 'Ceryle_rudis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ceryle_rudis}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=8205077FA2E98715&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Ceryle_rudis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dout1976'; type = 'Article'; bib = [ ...  
'doi = {10.1080/00306525.1976.9639555}, ' ...
'title = {FISHING TECHNIQUES AND FOODS OF THE PIED KINGFISHER ON {L}AKE {V}ICTORIA IN {U}GANDA}, ' ...
'journal = {Ostrich}, ' ...
'year = {1976}, ' ...
'author = {Douthwaite, R. J.}, ' ...
'volume = {47(4)}, ' ...
'pages = {153–160}'];
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

