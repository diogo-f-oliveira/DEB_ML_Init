function [data, auxData, metaData, txtData, weights] = mydata_Nesokia_indica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Nesokia_indica'; 
metaData.species_en = 'Short-tailed bandicoot rat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'THp','TPi'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 15];

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'IdriTrip2012';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Based on Rattus rattus';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'IdriTrip2012';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 140;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'guess';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365+160;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'adult lifespan 1 yr';
  
data.Wwb = 4.20; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'IdriTrip2012';
data.Wwbm = 5.95; units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';          bibkey.Wwbm = 'IdriTrip2012';
data.Wwim = 388; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';          bibkey.Wwim = 'Wiki';

data.Ri  = 12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-5 pups per litter; 3 litters per yr';
   
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
3.853	6.122
10.275	11.671
18.410	20.281
25.902	30.709
32.324	40.516
39.817	41.211
46.667	47.373
54.159	55.975
61.223	59.707
68.930	62.837
76.208	66.571
83.058	70.300
90.122	70.382
97.187	73.505
105.535	74.210
112.171	76.720
119.450	80.454
126.514	81.753
134.220	85.492
141.284	88.007
148.135	91.736
156.055	99.127
162.905	101.639
170.183	107.806
176.820	110.924
185.596	112.243
192.018	114.750
198.869	117.871
206.361	123.432
213.639	127.774
220.917	128.467];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(35); units.temp.tW_f = 'C'; label.temp.tW_f = 'temperature'; 
bibkey.tW_f = 'IdriTrip2012';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
3.853	7.947
10.703	14.109
18.410	23.323
25.474	28.879
32.538	36.260
39.602	47.291
47.309	58.329
54.801	72.406
61.865	80.396
68.716	84.733
76.422	94.554
83.486	98.286
90.336	102.623
97.829	104.535
105.749	107.668
111.957	107.740
119.450	113.301
127.156	120.690
134.006	125.027
141.284	137.277
148.563	151.960
156.269	158.740
163.119	171.593
169.969	183.838
177.462	186.358
184.954	187.661
191.804	192.607
199.511	203.645
206.575	218.325
214.495	227.541
220.917	235.523];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(35);  units.temp.tW_m = 'C'; label.temp.tW_m = 'temperature'; 
bibkey.tW_m = 'IdriTrip2012';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Body temperature is guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '477X2'; % Cat of Life
metaData.links.id_ITIS = '585422'; % ITIS
metaData.links.id_EoL = '1179270'; % Ency of Life
metaData.links.id_Wiki = 'Nesokia_indica'; % Wikipedia
metaData.links.id_ADW = 'Nesokia_indica'; % ADW
metaData.links.id_Taxo = '63079'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001595'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nesokia_indica}}';
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
bibkey = 'IdriTrip2012'; type = 'Article'; bib = [ ... 
'author = {Mohd. Idris and R. S. Tripathi and Vipin Chaudhary}, ' ... 
'year = {2012}, ' ...
'title = {Breeding and Post Natal Development of the Short Tailed Mole Rat, \emph{Nesokia indica} in {A}rid {Z}one}, ' ...
'journal = {Indian Journal of Plant Protection}, ' ...
'volume = {40}, ' ...
'number = {4}, ' ...
'pages = {287-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
