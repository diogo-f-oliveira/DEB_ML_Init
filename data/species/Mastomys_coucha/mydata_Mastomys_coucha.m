function [data, auxData, metaData, txtData, weights] = mydata_Mastomys_coucha
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Mastomys_coucha'; 
metaData.species_en = 'Southern multimammate mouse'; 

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
data.tp = 112;  units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(36.2); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.0;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'JackAard2003';
data.Wwi = 36;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';

data.Ri  = 3.9/30;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';
  temp.Ri = C2K(36.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.9 pups per litter; 1 litter per 30 d';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.536	1.996
3.715	2.564
6.456	3.417
8.751	4.366
10.124	4.840
11.977	5.979
14.718	6.832
17.922	7.970
20.217	8.919
27.531	11.289
34.884	14.515
42.232	17.646
49.096	20.017
56.422	22.672
63.634	22.760
69.952	23.040
77.224	24.459
84.486	25.688
91.294	26.823
98.604	29.098
105.339	28.616
112.112	28.990
118.916	30.030
125.655	29.643
132.395	29.256
140.485	28.868
147.242	28.862
154.020	29.331
160.789	29.609
167.580	30.364
175.271	31.117
182.088	32.442];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(36.3);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'JackAard2003';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
0.536	1.996
1.913	2.566
5.100	3.323
7.829	3.891
9.223	4.841
12.406	5.503
14.696	6.357
17.888	7.210
21.092	8.348
27.982	11.289
34.901	14.895
42.262	18.312
49.649	22.298
56.088	25.240
62.522	28.086
70.239	29.410
77.039	30.355
84.327	32.154
91.126	33.099
97.977	35.184
104.798	36.604
112.502	37.643
119.709	37.636
126.041	38.200
132.857	39.525
140.540	40.088
146.911	41.508
154.160	42.452
160.985	43.967
167.772	44.627
175.009	45.285
182.220	45.373];
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
metaData.links.id_CoL = '3YDJN'; % Cat of Life
metaData.links.id_ITIS = '585318'; % ITIS
metaData.links.id_EoL = '1179166'; % Ency of Life
metaData.links.id_Wiki = 'Mastomys_coucha'; % Wikipedia
metaData.links.id_ADW = 'Mastomys_coucha'; % ADW
metaData.links.id_Taxo = '63023'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001468'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mastomys_coucha}}';
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

