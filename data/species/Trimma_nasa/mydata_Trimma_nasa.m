function [data, auxData, metaData, txtData, weights] = mydata_Trimma_nasa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Trimma_nasa'; 
metaData.species_en = 'Nasal-bar pygmygoby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 21];

%% set data
% zero-variate data

data.ab = 6;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 90;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'WintSout2008';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'WintSout2008'; 
data.Li  = 2.3;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 0.0075;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00437*Lp^2.97, see F1';
data.Wwi = 0.052;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00437*Li^2.97, see F1';

data.Ri  = 195/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL_f = [... %  time since birth (d), std length (cm)
29.024	0.978
34.211	0.926
36.635	0.948
37.573	1.079
37.638	1.131
39.053	1.112
39.660	1.082
40.128	1.202
40.999	1.329
41.008	1.067
43.157	1.224
43.162	1.071
43.294	1.149
43.558	1.310
43.565	1.123
44.237	1.157
45.044	1.194
45.114	1.097
45.175	1.302
45.177	1.246
45.181	1.127
46.049	1.344
46.322	1.228
46.325	1.138
46.393	1.119
46.458	1.198
46.522	1.280
46.526	1.164
46.928	1.239
46.998	1.153
47.132	1.172
47.195	1.310
47.265	1.235
48.136	1.351
48.273	1.295
48.275	1.220
48.747	1.194
48.948	1.235
49.147	1.325
49.487	1.235
49.488	1.209
50.024	1.287
50.086	1.426
50.155	1.381
50.157	1.317
50.161	1.224
50.633	1.205
51.102	1.261
52.784	1.313
54.470	1.235
54.535	1.317
55.211	1.231
56.619	1.395
57.091	1.384
58.166	1.459
58.299	1.522
58.640	1.384
59.175	1.503
60.659	1.414
62.069	1.541
62.131	1.701
62.140	1.443
62.544	1.425
62.737	1.694
63.685	1.541
64.966	1.496
65.569	1.593
65.573	1.466
66.516	1.477
67.525	1.514
69.672	1.738
74.525	1.596
74.589	1.697
77.214	1.727
87.111	1.786
87.583	1.763];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'std length', 'females'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WintSout2008';
%
data.tL_m = [ ... %  time since birth (d), std length (cm)
39.465	0.880
42.559	0.985
42.697	0.880
43.572	0.903
43.705	0.940
44.447	0.910
45.186	0.977
47.071	0.970
47.677	0.992
47.679	0.932
48.148	1.011
49.630	0.984
51.918	1.014
52.662	0.939
52.862	0.981
53.672	0.936
53.738	0.969
54.609	1.093
55.084	1.010
55.554	1.036
58.048	0.965
58.715	1.145
59.055	1.047
60.806	1.044
61.275	1.137
65.177	1.238
71.100	1.308
72.246	1.297];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'std length', 'males'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WintSout2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01023*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58V6V'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Trimma_nasa'; % Wikipedia
metaData.links.id_ADW = 'Trimma_nasa'; % ADW
metaData.links.id_Taxo = '3421331'; % Taxonomicon
metaData.links.id_WoRMS = '278506'; % WoRMS
metaData.links.id_fishbase = 'Trimma_nasa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trimma_nasa}}';
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
bibkey = 'WintSout2008'; type = 'Article'; bib = [ ... 
'doi = {10.3354/meps07517}, ' ...
'author = {Richard Winterbottom and Laura Southcott}, ' ... 
'year = {2008}, ' ...
'title = {Short lifespan and high mortality in the western {P}acific coral reef goby \emph{Trimma nasa}}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {366}, ' ...
'pages = {203–208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Trimma-nasa.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
