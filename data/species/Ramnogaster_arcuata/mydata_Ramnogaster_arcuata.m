function [data, auxData, metaData, txtData, weights] = mydata_Ramnogaster_arcuata

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Ramnogaster_arcuata'; 
metaData.species_en = 'Jenyns'' sprat'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 19];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 19];

%% set data
% zero-variate data
data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(15.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 5*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(15.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on  Engraulis encrasicolus';

data.Lp = 7.7;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'CazoSido2009';
data.Li = 12;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'CazoSido2009';

data.Wwb = 3e-4; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.2 mm and width 0.7 mm of Engraulis_anchoita: pi/6*0.12*0.07^2';
data.Wwi = 16; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.11, see F1';
  
data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'CazoSido2009';
  temp.GSI = C2K(15.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL_fm = [ ... % time since birth (d), total length (cm)
    0  7.48 6.61
    1  8.82 8.51
    2  9.73 8.96
    3 10.36 9.43];
data.tL_fm(:,1) = (0.9 + data.tL_fm(:,1))*365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'}; 
temp.tL_fm = C2K(15.7); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
treat.tL_fm = {1, {'females','males'}};
bibkey.tL_fm = 'CazoSido2009';

% time-weight
data.tW_fm = [ ... % time since birth (d), weight (g)
    0 3.6 2.2
    1 5.9 5.3
    2 8.1 6.2
    3 9.0 7.0];
data.tW_fm(:,1) = (0.9 + data.tW_fm(:,1))*365; % convert yr to d
units.tW_fm = {'d', 'cm'};  label.tW_fm = {'time since birth', 'weight'}; 
temp.tW_fm = C2K(15.7); units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
treat.tW_fm = {1, {'females','males'}};
bibkey.tW_fm = 'CazoSido2009';

% length-weight
data.LW_f = [ ... % total length (cm), weight (g)
5.962	1.785
6.088	2.036
6.238	2.037
6.288	1.871
6.338	2.204
6.413	1.788
6.489	2.122
6.589	1.873
6.614	2.456
6.689	2.290
6.764	2.374
6.790	3.040
6.865	2.708
6.940	2.875
6.990	2.458
7.141	3.126
7.266	3.127
7.291	2.627
7.342	3.544
7.441	3.294
7.517	3.795
7.692	2.962
7.768	3.796
7.918	3.964
8.094	4.382
8.193	3.465
8.194	4.882
8.245	4.966
8.272	7.133
8.344	4.466
8.345	5.300
8.520	4.884
8.646	6.051
8.746	5.719
8.822	6.303
8.896	4.803
8.921	5.470
9.048	6.804
9.122	5.554
9.198	6.471
9.324	7.055
9.373	5.972
9.448	6.390
9.548	6.057
9.574	7.140
9.600	7.807
9.751	8.641
9.799	7.058
9.851	8.059
9.900	7.726
9.975	7.226
10.076	8.560
10.127	9.394
10.151	8.227
10.177	9.061
10.327	8.311
10.377	8.895
10.379	10.228
10.428	9.395
10.430	11.312
10.453	9.646
10.603	8.896
10.628	9.230
10.654	10.063
10.655	10.563
10.728	8.981
10.804	10.231
10.856	11.231
10.955	10.399
10.955	10.815
11.104	9.733
11.107	12.399
11.231	11.067
11.232	11.817
11.281	10.734
11.308	13.317
11.333	12.567
11.458	12.152
11.458	12.902
11.507	11.485
11.606	10.069
11.608	12.569
11.610	13.986
11.659	13.069
11.682	11.486
11.711	15.070
11.933	12.238
11.961	14.738
12.036	14.238
12.187	15.073
12.235	13.489
12.263	15.740
12.313	15.823
12.388	15.574
12.436	13.824
12.464	16.741
13.116	17.995];
units.LW_f = {'cm', 'g'};  label.LW_f = {'total length','weight','females'}; 
bibkey.LW_f = 'CazoSido2009';
%
data.LW_m = [ ...
5.815	1.827
5.939	1.495
6.114	1.744
6.264	2.076
6.463	1.910
6.613	2.409
6.763	2.907
6.813	2.575
6.888	2.159
6.988	3.073
7.187	3.239
7.362	3.405
7.512	3.738
7.586	3.488
7.611	3.821
7.811	4.402
7.811	3.571
7.886	3.987
8.061	5.149
8.086	4.319
8.160	4.900
8.260	4.734
8.360	5.399
8.410	5.399
8.460	4.900
8.485	4.651
8.684	5.233
8.684	5.814
8.759	5.980
8.859	5.565
8.884	6.229
9.134	5.980
9.159	5.731
9.234	6.645
9.308	7.309
9.383	7.309
9.508	7.973
9.533	7.392
9.558	6.478
9.633	6.728
9.658	7.641
9.857	8.472
10.057	8.638
10.107	9.302
10.157	9.385
10.182	10.050
10.207	10.465
10.307	8.306
10.431	9.385
10.506	10.382
10.531	9.718
10.581	10.797
10.656	9.801
10.856	11.379
10.856	10.631
10.955	10.133
11.005	11.047];
units.LW_m = {'cm', 'g'};  label.LW_m = {'total length','weight','males'}; 
bibkey.LW_m = 'CazoSido2009';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data from Sout and West coast of S-Africa'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'total length- standard length: SL = 0.86 * TL, based on photo';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '78RDG'; % Cat of Life
metaData.links.id_ITIS = '551241'; % ITIS
metaData.links.id_EoL = '46562550'; % Ency of Life
metaData.links.id_Wiki = 'Ramnogaster_arcuata'; % Wikipedia
metaData.links.id_ADW = 'Ramnogaster_arcuata'; % ADW
metaData.links.id_Taxo = '185742'; % Taxonomicon
metaData.links.id_WoRMS = '282546'; % WoRMS
metaData.links.id_fishbase = 'Ramnogaster-arcuata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ramnogaster_arcuata}}';  
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
bibkey = 'CazoSido2009'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S1755267209001286}, ' ...
'author = {Andrea Lopez Cazorla and Nora Sidorkewicj}, ' ...
'year = {2009}, ' ...
'title = {Some biological parameters of Jenyns'' sprat \emph{Ramnogaster arcuata} ({P}isces: {C}lupeidae) in south-western {A}tlantic waters}, ' ... 
'journal = {Marine Biodiversity Records}, ' ...
'volume = {2}, '...
'pages = {e127}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ramnogaster-arcuata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
