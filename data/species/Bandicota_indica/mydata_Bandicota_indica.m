function [data, auxData, metaData, txtData, weights] = mydata_Bandicota_indica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Bandicota_indica'; 
metaData.species_en = 'Greater bandicoot rat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Ri'}; 
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

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Stem1988';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Based on Rattus rattus';
data.tx = 25;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'HuanLiao1980';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 160;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'Stem1988';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki gives 60 d';
data.am = 365+160;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'adult lifespan 1 yr';
  
data.Wwb = 9.43; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Stem1985';
data.Wwbm = 10.54; units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';          bibkey.Wwbm = 'Stem1985';

data.Ri  = 12*9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8-14 pups per litter; 8-10 litters per life time';
   
% univariate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
0        9.43
9.317	15.000
18.738	24.884
28.167	74.935
37.594	114.945
47.025	172.527
56.925	225.081
66.125	307.773
75.324	385.443
85.226	445.528
94.184	498.098
103.850	555.677
121.997	633.197
141.313	668.021
160.149	655.153
178.749	637.269];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = [... % time since birth (d), body temp (C)
0	30.428
2	29.518
4	31.496
6	33.017
8	34.018
10	33.024
12	34.503
14	34.964
16	35.009
17	35.533
20	35.494
22	35.498
24	35.501];
units.temp.tW_f = 'C'; label.temp.tW_f = 'temperature'; 
bibkey.tW_f = 'Stem1985';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
 0      10.54 
10.260	17.494
19.211	34.918
28.639	77.438
37.832	127.493
47.265	197.628
56.698	267.763
66.133	350.450
76.044	455.724
85.011	550.971
94.449	646.211
103.884	726.388
122.979	836.528
141.366	936.639
160.218	1004.106
178.830	1054.004];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = temp.tW_f;  units.temp.tW_m = 'C'; label.temp.tW_m = 'temperature'; 
bibkey.tW_m = 'Stem1985';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;

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
D2 = 'Body temperature was measured during development';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = 'KK82'; % Cat of Life
metaData.links.id_ITIS = '585161'; % ITIS
metaData.links.id_EoL = '1179009'; % Ency of Life
metaData.links.id_Wiki = 'Bandicota_indica'; % Wikipedia
metaData.links.id_ADW = 'Bandicota_indica'; % ADW
metaData.links.id_Taxo = '62947'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001247'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bandicota_indica}}';
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
bibkey = 'Stem1985'; type = 'Article'; bib = [ ... 
'author = {Stempel, N.}, ' ... 
'year = {1985}, ' ...
'title = {Fortpflanzung und {J}ugendentwicklung der {P}estratte \emph{Bandicota indica} ({B}echstein)}, ' ...
'journal = {Bonn. zool. Beitr.}, ' ...
'volume = {36}, ' ...
'number = {1/2}, ' ...
'pages = {9-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HuanLiao1980'; type = 'Article'; bib = [ ... 
'author = {Huang, T. and Liao, C. and Qin, Y. and Huang, J.}, ' ... 
'year = {1980}, ' ...
'title = {Growth and development of the bandicoot rat \emph{Bandicota indica}}, ' ...
'journal = {Acta Zoologica Sinica}, ' ...
'volume = {26}, ' ...
'number = {4}, ' ...
'pages = {386-3926}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

