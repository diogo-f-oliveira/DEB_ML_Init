function [data, auxData, metaData, txtData, weights] = mydata_Mastomys_natalensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Mastomys_natalensis'; 
metaData.species_en = 'Natal multimammate mouse'; 

metaData.ecoCode.climate = {'A','B','C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf','0iTh','0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 12];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 15];

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(36.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 21;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'JackAard2003';   
  temp.tx = C2K(36.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 112;  units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 840;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'Olif1953';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'JackAard2003';
data.Wwi = 40;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'JackAard2003';

data.Ri  = 3.3/38;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Olif1953';
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.9 pups per litter; 1 litter per 30 d';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.103	2.377
3.286	3.040
3.766	3.705
5.598	4.369
7.880	5.032
9.261	5.696
11.093	6.360
12.929	7.119
14.752	7.593
15.683	8.258
17.506	8.731
19.334	9.300
20.264	9.965
28.089	13.666
35.926	17.652
42.395	21.259
49.666	22.679
56.032	24.004
63.753	25.423
70.587	27.128
76.987	29.214
84.216	29.682
91.440	30.056
97.771	30.620
104.558	31.279
112.237	31.747
119.036	32.692
126.256	32.970
133.055	33.915
140.300	34.764
147.078	35.233
154.345	36.557
160.673	37.026
167.446	37.400
175.086	37.013
182.769	37.576];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(36.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'JackAard2003';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
1.021	2.757
2.865	3.706
5.589	4.179
8.348	5.412
11.539	6.265
15.194	7.402
18.411	8.826
21.187	10.439
27.673	14.427
36.050	20.409
42.622	26.299
49.172	31.712
55.602	34.464
62.929	37.119
70.174	37.968
77.034	40.244
83.884	42.329
92.031	43.177
98.414	44.883
105.222	46.017
111.575	47.057
118.816	47.811
125.585	48.090
133.290	49.128
140.981	49.882
146.837	49.876
154.494	49.869
160.847	50.909
168.084	51.568
175.308	51.941
182.048	51.554];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(36.3);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'JackAard2003';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3YDJT'; % Cat of Life
metaData.links.id_ITIS = '585321'; % ITIS
metaData.links.id_EoL = '1179169'; % Ency of Life
metaData.links.id_Wiki = 'Mastomys_natalensis'; % Wikipedia
metaData.links.id_ADW = 'Mastomys_natalensis'; % ADW
metaData.links.id_Taxo = '63026'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001472'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mastomys_natalensis}}';
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
bibkey = 'JackAard2003'; type = 'Article'; bib = [ ...  
'doi = {10.1002/jez.1402280312}, ' ...
'author = {Tim P. Jackson and Rudi J. van Aarde}, ' ...
'year = {2003}, ' ...
'title  = {Sex- and Species-Specific Growth Patterns in Cryptic {A}frican Rodents, \emph{Mastomys natalensis} and \emph{M. coucha}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {84(3)}, ' ...
'pages = {851-860}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Olif1953'; type = 'Article'; bib = [ ...  
'author = {W. D. Oliff}, ' ...
'year = {1953}, ' ...
'title  = {The Mortality, Fecundity and Intrinsic Rate of Natural Increase of the Multimammate Mouse, \emph{Rattus (Mastomys) natalensis} ({S}mith) in the Laboratory}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {22(2)}, ' ...
'pages = {217-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

