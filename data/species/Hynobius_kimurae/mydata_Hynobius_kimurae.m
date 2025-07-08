function [data, auxData, metaData, txtData, weights] = mydata_Hynobius_kimurae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Hynobius_kimurae'; 
metaData.species_en = 'Hida salamander'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 60;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 7*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'MisaMats1999';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'MisaMats1999';
  temp.tpm = C2K(12);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MisaMats1999';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.05;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'MisaMats1997';
data.Lj  = 2.95;   units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'MisaMats1997'; 
data.Li  = 9.7;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'amphibiaweb';

data.Wwb = 7.7e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MisaMats1997';
  comment.Wwb = 'based on egg diameter of 2.45 mm: pi/6*0.245^3';
data.Wwi = 7.6;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Onychodactylus_japonicus, using F1: 9.65*(17*0.527/9.7)^3';

data.Ri  = 51/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '13 to 51 eggs per clutch, in a pair of sacs, 1 clutch per yr';

% univariate data
% time-length
data.tL_fT = [... % time since birth (yr), SVL (cm)
0.398	2.621
0.400	3.039
0.401	3.170
0.401	3.248
0.402	3.418
0.571	3.288
0.572	3.379
1.397	3.471
1.397	3.549
1.398	3.601
1.398	3.667
1.400	3.980
1.400	4.046
1.447	3.758
1.472	3.915
7.698	7.222
8.717	7.379
8.741	7.275
9.640	7.575
9.687	7.366
9.785	7.484
10.706	7.523
10.708	7.784
10.780	7.654
10.781	7.941
11.680	8.216
11.801	8.137
12.699	8.425];
data.tL_fT(:,1) = data.tL_fT(:,1) * 365; % convert yr to d
units.tL_fT  = {'d', 'cm'}; label.tL_fT = {'time since birth', 'SVL', 'female'};  
temp.tL_fT   = C2K(12); units.temp.tL_fT = 'K'; label.temp.tL_fT = 'temperature';
bibkey.tL_fT = 'MisaMats1999';
comment.tL_fT = 'Data for females from Tokyo, temp varies between 5 and 17 C';
%
data.tL_mT = [... % time since birth (yr), SVL (cm)
5.731	6.673
5.949	6.569
6.702	6.778
6.800	7.065
6.848	6.961
7.697	7.000
7.699	7.314
7.795	7.118
7.842	6.948
7.940	7.092
8.861	7.105
8.862	7.235
8.911	7.340
9.055	7.052
9.759	7.248
9.857	7.353
10.706	7.444
10.898	7.261
10.924	7.444
10.972	7.314
11.652	7.523
11.653	7.654
11.918	7.458
12.719	7.601
12.720	7.784
12.721	7.876
12.864	7.510
13.716	8.176
13.958	8.033
14.757	7.954];
data.tL_mT(:,1) = data.tL_mT(:,1) * 365; % convert yr to d
units.tL_mT  = {'d', 'cm'}; label.tL_mT = {'time since birth', 'SVL', 'male'};  
temp.tL_mT   = C2K(12); units.temp.tL_mT = 'K'; label.temp.tL_mT = 'temperature';
bibkey.tL_mT = 'MisaMats1999';
comment.tL_mT = 'Data for males from Tokyo, temp varies between 5 and 17 C';
%
data.tL_fK = [... % time since birth (yr), SVL (cm)
0.150	1.810
0.152	2.111
0.295	1.706
0.296	1.915
0.298	2.124
0.344	1.771
0.347	2.216
0.372	2.399
0.393	1.784
0.441	1.824
0.490	1.876
0.491	1.967
0.491	2.046
7.719	6.608
8.690	6.882
8.691	6.961
8.762	6.778
9.661	7.026
9.662	7.196
9.708	6.856
9.733	6.895
10.656	7.261
10.705	7.418
11.700	7.575
11.748	7.497
17.692	8.190];
data.tL_fK(:,1) = data.tL_fK(:,1) * 365; % convert yr to d
units.tL_fK  = {'d', 'cm'}; label.tL_fK = {'time since birth', 'SVL', 'female'};  
temp.tL_fK   = C2K(12); units.temp.tL_fK = 'K'; label.temp.tL_fK = 'temperature';
bibkey.tL_fK = 'MisaMats1999';
comment.tL_fK = 'Data for females from Kyoto, temp varies between 3 and 18 C';
%
data.tL_mK = [... % time since birth (yr), SVL (cm)
6.646	5.680
6.671	5.784
6.721	5.928
6.743	5.588
6.745	6.020
7.643	6.163
7.667	6.085
8.687	6.346
8.710	6.203
8.856	6.268
9.680	6.216
9.682	6.529
9.705	6.412
9.777	6.281
10.700	6.438
10.701	6.569
10.822	6.686
11.671	6.778
11.696	6.843
11.697	6.882
12.691	7.105
12.692	7.157
12.715	7.052
12.739	6.987
12.886	7.144
16.719	7.627
20.817	7.797];
data.tL_mK(:,1) = data.tL_mK(:,1) * 365; % convert yr to d
units.tL_mK  = {'d', 'cm'}; label.tL_mK = {'time since birth', 'SVL', 'male'};  
temp.tL_mK   = C2K(12); units.temp.tL_mK = 'K'; label.temp.tL_mK = 'temperature';
bibkey.tL_mK = 'MisaMats1999';
comment.tL_mK = 'Data for males from Kyoto, temp varies between 3 and 18 C';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 3 * weights.Li;
weights.tL_fT = 5 * weights.tL_fT;
weights.tL_mT = 3 * weights.tL_mT;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fT','tL_mT'}; subtitle1 = {'Data for females, males from Tokyo'};
set2 = {'tL_fK','tL_mK'}; subtitle2 = {'Data for females, males from Kyoto'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';     
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% facts
F1 = 'length-length: TL 184 mm corresponds with SVL 97 mm, so SVL = 0.527*TL';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6MQLC'; % Cat of Life
metaData.links.id_ITIS = '668212'; % ITIS
metaData.links.id_EoL = '1019482'; % Ency of Life
metaData.links.id_Wiki = 'Hynobius_kimurae'; % Wikipedia
metaData.links.id_ADW = 'Hynobius_kimurae'; % ADW
metaData.links.id_Taxo = '159234'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hynobius+kimurae'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hynobius_kimurae}}';
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
bibkey = 'MisaMats1997'; type = 'Article'; bib = [ ... 
'author = {Yasuchika Misawa and Masafumi Matsui}, ' ... 
'year = {1997}, ' ...
'title = {Larval life history variation in two populations of the Japanese Salamander \emph{Hynobius kimurae} ({A}mphibia, {U}rodela)}, ' ...
'journal = {Zoological Science}, ' ...
'volume = {14}, ' ...
'pages = {257-262}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MisaMats1999'; type = 'Article'; bib = [ ... 
'author = {Yasuchika Misawa and Masafumi Matsui}, ' ... 
'year = {1999}, ' ...
'title = {Age Determination by Skeletochronology of the Japanese Salamander \emph{Hynobius kimurae} ({A}mphibia, {U}rodela)}, ' ...
'journal = {Zoological Science}, ' ...
'volume = {16}, ' ...
'pages = {845-851}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Hynobius+kimurae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

