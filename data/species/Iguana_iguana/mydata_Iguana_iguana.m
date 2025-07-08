function [data, auxData, metaData, txtData, weights] = mydata_Iguana_iguana
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Iguanidae';
metaData.species    = 'Iguana_iguana'; 
metaData.species_en = 'Green iguana'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTd', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Wwe','t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 09]; 


%% set data
% zero-variate data

data.ab = 105;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '90 to 120 d';
data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'ADW';
  temp.ap = C2K(27);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 19.8*365;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'RickCull1973';
  comment.Wwb = 'iguanahut gives 90 g, but this is inconsistent with SVL';
data.Wwi = 3.5e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'Wiki';
data.Wwim = 9.1e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for females';    bibkey.Wwim = 'Wiki';

data.Ri  = 71/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '20 to 71 eggs per clutch, 1 clutch per yr'; 

% uni-variate data

% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
0 (6.5+9)/2
1 (20+23)/2
2 (28+30.5)/2
3 (30.5+35.5)/2
4 (35.5+41)/2
5 (45.72+50.8)/2
6 (50.8+55.88)/2
7 (50.8+60.96)/2];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'iguanahut';
comment.tL = 'in view of max size, data probably concerns a male';

% time-weight
data.tW = [ ... % time since birth (yr), weight (g)
0 90
1 (450+680)/2
2 (910+1810)/2
3 (1810+2720)/2
4 (2720+3630)/2
5 (4540+6800)/2
6 (6350+8160)/2
7 (6800+9070)/2];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'iguanahut';
comment.tW = 'in view of max size, data probably concerns a male';

% time-weight for embryo
data.tWwe = [ ... % age (d), wet weight (g)
0.167413	0.078020
0.247703	0.031755
0.266494	0.036725
0.292119	0.044778
0.770441	0.086703
3.488333	0.067373
3.536165	0.097549
8.304009	0.146680
8.341591	0.196185
8.784039	0.287790
16.517477	0.499876
16.835219	0.279388
16.872801	0.373681
19.594111	0.298151
24.584032	0.546588
25.825960	0.890964
26.210326	0.833852
26.611774	0.890686
27.963033	0.739808
38.614234	1.025198
49.853088	1.401697
50.637194	1.382860
51.248762	1.641742
51.815915	1.382213
55.801361	2.134711
56.962999	1.869519
56.998873	2.467647
57.128704	1.473549
59.118864	1.795295
64.207866	1.549206
65.067137	2.734140
67.416038	2.556888
71.927638	2.420867
74.495201	2.688166
76.886809	3.498345
81.963853	2.752021
85.014863	6.156338
85.028529	6.843014
87.145103	4.848629
87.165603	5.682069
87.522636	4.304132
91.899280	6.559056
92.078651	5.746471
95.859101	8.307990
98.412998	8.299580
98.419831	8.750213
102.910930	7.069527];
units.tWwe   = {'d', 'g'};  label.tWwe = {'age', 'embryo wet weight'};  
temp.tWwe    = C2K(28);  units.temp.tWwe = 'K'; label.temp.tWwe = 'temperature';
bibkey.tWwe = 'RickCull1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'ab data is ignored';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '6MV3G'; % Cat of Life
metaData.links.id_ITIS = '173930'; % ITIS
metaData.links.id_EoL = '793235'; % Ency of Life
metaData.links.id_Wiki = 'Iguana_iguana'; % Wikipedia
metaData.links.id_ADW = 'Iguana_iguana'; % ADW
metaData.links.id_Taxo = '49090'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Iguana&species=iguana'; % ReptileDB
metaData.links.id_AnAge = 'Iguana_iguana'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Iguana_iguana}}';
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
bibkey = 'RickCull1973'; type = 'Article'; bib = [ ... 
'author = {R. E. Ricklefs and John Cullen}, ' ... 
'year = {1973}, ' ...
'title = {Embryonic growth of the green iguana \emph{Iguana ignuana}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1973(2)}, ' ...
'pages = {296-305}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iguanahut'; type = 'Misc'; bib = ...
'howpublished = {\url{https://iguanahut.com/green-iguana-growth-chart/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Iguana_iguana/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Iguana_iguana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

