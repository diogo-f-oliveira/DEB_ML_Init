function [data, auxData, metaData, txtData, weights] = mydata_Coreobagrus_ichikawai

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Bagridae';
metaData.species    = 'Coreobagrus_ichikawai'; 
metaData.species_en = 'Neko-gigi'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 01];

%% set data
% zero-variate data;

data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';  
data.am = 4*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishbase';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6;   units.Lp  = 'cm';	label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 10.8;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 
  
data.Wwb = 3.6e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wata1994a'; 
  comment.Wwb = 'based on egg diameter of 1.6-2.1 mm: pi/6*0.19^3';
data.Wwp = 1.64;   units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.00832*Lp^2.95, see F1';
data.Wwi = 9.3; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00832*Li^2.95, see F1';
 
data.Ri = 1751/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';        bibkey.Ri = 'fishbase';
  temp.Ri = C2K(29.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time (mnth), total length (cm)
5.477	2.836
5.954	2.830
6.671	2.940
12.448	3.209
12.836	3.321
13.181	3.787
13.774	3.819
14.184	3.735
14.642	4.082
15.602	4.579
16.381	5.196
16.861	5.308
17.545	5.377
25.257	5.323
26.142	5.868
26.649	5.904
27.264	5.900
27.827	6.211
28.148	6.405
28.709	6.402
35.983	6.783
36.489	6.778
36.994	6.811
38.086	6.877
38.488	7.343
39.207	7.375
40.244	7.245
40.936	7.277
41.735	7.346
42.134	7.263
48.281	7.713
48.655	7.942
49.212	7.619
50.169	7.406
50.597	7.791
51.209	7.781
51.767	7.615
52.141	7.844
52.672	7.560
53.391	7.784];
data.tL_f(:,1) = 30.5 * (0 + data.tL_f(:,1)); % convert mnth to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'females'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Wata1994'; 
%
data.tL_m = [ ... % time (mnth), total length (cm)
5.418	2.578
5.958	2.852
6.657	2.734
12.486	3.398
13.122	3.242
13.468	3.828
14.290	3.711
14.582	3.789
15.166	3.984
16.175	4.531
17.077	4.688
17.635	5.195
18.060	5.664
24.257	6.168
24.658	6.283
25.272	6.162
26.101	6.236
26.661	5.920
27.170	6.659
27.841	7.593
28.161	7.240
28.695	7.198
37.001	7.332
38.486	7.589
39.123	7.738
40.185	8.273];
data.tL_m(:,1) = 30.5 * (0 + data.tL_m(:,1)); % convert mnth to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'males'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Wata1994'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;
weights.Li = 5 * weights.Li;

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
F1 = 'length-weight: Ww in g = 0.00832*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6B42Z'; % Cat of Life
metaData.links.id_ITIS = '201964'; % ITIS
metaData.links.id_EoL = '216298'; % Ency of Life
metaData.links.id_Wiki = 'Coreobagrus_ichikawai'; % Wikipedia
metaData.links.id_ADW = 'Coreobagrus_ichikawai'; % ADW
metaData.links.id_Taxo = 'Coreobagrus_ichikawai'; % Taxonomicon
metaData.links.id_WoRMS = '1013949'; % WoRMS
metaData.links.id_fishbase = 'Coreobagrus_ichikawai'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coreobagrus_ichikawai}}';
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
bibkey = 'Wata1994'; type = 'Article'; bib = [ ... 
'author = {Watanabe, K.}, ' ...
'year = {1994}, ' ...
'title = {Growth, maturity and population structure of the bagrid catfish, \emph{Psedobagrus ichikawai}, in the {T}agiri river, {M}ie {P}refecture, {J}apan}, ' ...
'journal = {Jap. J. Ichthyol.}, ' ...
'volume = {41(1)}, ' ...
'pages = {15-22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wata1994a'; type = 'Article'; bib = [ ... 
'author = {Watanabe, K.}, ' ...
'year = {1994}, ' ...
'title = {Mating Behavior and Larval Development of \emph{Pseudobagrus ichikawai} ({S}iluriformes: {B}agridae)}, ' ...
'journal = {Jap. J. Ichthyol.}, ' ...
'volume = {41(3)}, ' ...
'pages = {243-251}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Coreobagrus-ichikawai.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
