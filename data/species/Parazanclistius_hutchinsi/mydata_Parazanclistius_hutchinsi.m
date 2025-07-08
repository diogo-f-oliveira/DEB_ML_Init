function [data, auxData, metaData, txtData, weights] = mydata_Parazanclistius_hutchinsi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acropomatiformes'; 
metaData.family     = 'Pentacerotidae';
metaData.species    = 'Parazanclistius_hutchinsi'; 
metaData.species_en = 'Short boarfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 07];

%% set data
% zero-variate data

data.ab = 7.5;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(17.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 55*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'CoulHall2016';   
  temp.am = C2K(17.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 16;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'guess'; 
data.Li  = 34;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 2.1e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length of 1.1 mm and width of 0.6 mm: pi/6*0.11*0.06^2';
data.Wwp = 84;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01995*Lp^3.01, see F1';
data.Wwi = 812;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for males';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.01, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(17.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acanthurus_nigrofuscus';

% uni-variate data
% time-length
data.tL_f = [... %  yr class (yr), total length (cm)
0.607	8.327
2.298	25.685
3.598	27.379
3.599	25.262
3.858	28.438
5.419	33.306
5.549	28.861
6.069	27.802
6.460	26.532
6.590	29.919
7.110	27.167
7.240	28.438
7.500	35.000
8.410	28.861
8.411	32.036
8.671	27.379
8.931	30.766
9.451	33.518
9.711	29.073
10.751	27.591
10.752	24.627
11.532	28.226
11.922	28.649
12.702	30.978
12.832	27.802
13.092	32.883
13.093	27.167
13.223	30.343
13.353	25.685
14.263	29.284
14.653	31.190
14.913	25.685
14.914	33.095
15.564	27.802
15.694	31.190
15.954	26.321
16.604	29.919
17.514	28.438
17.905	34.153
18.815	28.226
19.465	28.649
19.725	32.883
20.376	28.649
20.506	31.190
20.507	33.942
20.766	27.591
21.286	28.861
21.546	33.095
22.066	30.343
22.587	31.825
22.717	26.744
22.847	34.577
23.757	33.942
23.758	26.956
24.017	31.825
24.538	34.153
24.798	30.766
25.318	33.942
25.838	32.248
26.618	29.919
26.749	26.744
27.269	34.577
27.789	30.343
29.220	28.226
29.480	37.964
30.000	33.730
30.650	29.496
33.251	33.730
33.382	28.649
33.772	30.343
34.552	31.190
34.812	33.730
36.243	30.554
38.064	31.190
40.665	29.919
41.315	30.978
47.688	27.379
49.509	29.919];
data.tL_f(:,1) = (data.tL_f(:,1)+0)*365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f   = C2K(17.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoulHall2016';
%
data.tL_m = [... %  yr class (yr), total length (cm)
0.281	8.293
5.272	26.783
5.789	24.241
6.186	27.638
6.323	30.821
6.703	25.096
8.399	25.320
9.442	25.115
9.446	26.812
10.232	28.939
10.489	26.820
11.142	27.461
11.148	30.218
11.533	26.827
12.059	29.589
13.626	30.236
13.750	26.843
14.411	31.514
14.533	27.273
15.445	26.643
15.582	30.038
17.014	28.351
18.058	28.995
18.576	26.877
18.584	31.120
19.109	32.820
20.140	26.040
21.317	27.745
22.367	31.146
22.488	26.268
22.624	29.027
23.537	29.033
24.710	28.617
25.497	31.168
27.853	35.427
28.882	27.586
30.323	30.778
30.578	27.810
30.837	26.964
34.623	28.900
36.840	28.279
37.631	32.739
48.841	29.000];
data.tL_m(:,1) = (data.tL_m(:,1)+0)*365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m   = C2K(17.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoulHall2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Li = 10 * weights.Li;
weights.Lp = 10 * weights.Lp;
weights.Wwi = 10 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Weight-length: Ww in g = 0.01995*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4DJ69'; % Cat of Life
metaData.links.id_ITIS = '645894'; % ITIS
metaData.links.id_EoL = '46581234'; % Ency of Life
metaData.links.id_Wiki = 'Parazanclistius_hutchinsi'; % Wikipedia
metaData.links.id_ADW = 'Parazanclistius_hutchinsi'; % ADW
metaData.links.id_Taxo = '183158'; % Taxonomicon
metaData.links.id_WoRMS = '282138'; % WoRMS
metaData.links.id_fishbase = 'Parazanclistius-hutchinsi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parazanclistius_hutchinsi}}';
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
bibkey = 'CoulHall2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.13049}, ' ...
'author = {Coulson, P.G. and N.G. Hall and I.C. Potter}, ' ... 
'year = {2016}, ' ...
'title = {Biological characteristics of three co-occurring species of armorhead from different genera vary markedly from previous results for the {P}entacerotidae}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {89(4)}, ' ...
'pages = {1393-1418}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Parazanclistius-hutchinsi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

