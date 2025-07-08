function [data, auxData, metaData, txtData, weights] = mydata_Martes_melampus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Martes_melampus'; 
metaData.species_en = 'Japanese marten'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv','xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'Tata1994';   
  temp.tg = C2K(39);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '235-250 d with delayed implantation 28-30 d real gestation';
data.tx = 45;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'Tata1994';   
  temp.tx = C2K(39);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '40-50 d';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(39);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tpm';
data.tpm = 1.5*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Wiki';
  temp.tpm = C2K(39);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 12.3*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(39);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 27;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Tata1994';
  comment.Wwb = '25-30 g';
data.Wwi = 1030;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'Tata1994';
  comment.Wwi = 'based on Wwim and tWw_f versus tWw_m data';
data.Wwim = 1500; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Tata1994';
 comment.Wwim = 'Wiki: 1000-1500 g, males being about heavier than females';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Tata1994';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter, 1 litter per yr';
 
% uni-variate data
% time-weight
data.tWw_f = [..., % time since birth (d), body weight (g) 
0.690	27.068
2.299	37.218
2.529	40.602
4.828	40.602
5.977	40.602
7.816	47.368
8.506	67.669
9.195	94.737
9.655	108.271
11.034	121.805
12.184	131.955
13.333	148.872
16.092	155.639
19.080	196.241
22.989	240.226
25.287	257.143
28.736	280.827
32.644	351.880
35.632	399.248
40.460	433.083
45.517	510.902
50.805	581.955
57.011	636.090
65.977	707.143
72.874	744.361
79.540	795.113
87.586	852.632
95.172	913.534
102.529	923.684
109.885	940.602
118.161	960.902
126.897	987.970
129.655	1015.038
136.552	1001.504
143.678	1011.654
151.494	1015.038
154.253	1021.805
164.828	1001.504
181.609	1011.654
191.954	1031.955];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(39);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Tata1994';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [..., % time since birth (d), body weight (g) 
1.839	37.218
15.172	152.256
20.920	203.008
27.586	284.211
31.724	318.045
38.391	416.165
44.828	463.534
47.356	514.286
49.195	558.271
51.954	605.639
58.161	676.692
65.747	740.978
71.724	778.196
79.540	856.015
87.356	937.218
95.632	1001.504
103.218	1099.624
109.885	1177.444
117.011	1306.015
124.368	1383.835
135.632	1448.120
141.839	1461.654
148.046	1502.256
153.793	1495.489
163.218	1488.722
171.264	1512.406
183.218	1488.722
195.402	1502.256];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(39);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Tata1994';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.am = 5 * weights.am;
weights.Ri = 5 * weights.Ri;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  


%% Links
metaData.links.id_CoL = '3Y9W3'; % Cat of Life
metaData.links.id_ITIS = '621944'; % ITIS
metaData.links.id_EoL = '328021'; % Ency of Life
metaData.links.id_Wiki = 'Martes_melampus'; % Wikipedia
metaData.links.id_ADW = 'Martes_melampus'; % ADW
metaData.links.id_Taxo = '66670'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001250'; % MSW3
metaData.links.id_AnAge = 'Martes_melampus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Martes_melampus}}';
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
bibkey = 'Tata1994'; type = 'article'; bib = [ ... 
'author = {Masaya Tatara}, ' ... 
'year = {1994}, ' ...
'title = {Notes on the Breeding Ecology and Behavior of {J}apanese Martens on {T}sushima {I}slands, {J}apan}, ' ...
'journal = {J. Mamm. Soc. Japan}, ', ...
'volume = {19(1)}, ' ...
'pages = {67-74}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Martes_melampus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

