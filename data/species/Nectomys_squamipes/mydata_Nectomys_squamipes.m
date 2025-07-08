function [data, auxData, metaData, txtData, weights] = mydata_Nectomys_squamipes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Nectomys_squamipes'; 
metaData.species_en = 'South American water rat'; 

metaData.ecoCode.climate = {'Aw','Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 30;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ADW';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '27-28 d';
data.tx = 23;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '20-25 d';
data.tp = 44.4;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'ADW';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '2-5 yr';
    
data.Wwb = 12.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AndrHort1996';
data.Wwi = 200;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AndrHort1996';
  comment.Wwi = 'ADW: 160-420 g';

data.Ri  = 5*5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 pups per litter, assumed: 5 litters per yr';

% uni-variate data

% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
0.000	12.865
9.571	24.670
17.931	40.381
27.013	62.809
36.100	83.559
47.153	108.236
59.447	131.243
70.270	150.326
86.047	166.084
99.115	178.470
114.916	186.398
129.483	193.200
145.301	195.535
161.121	196.752
177.683	197.974];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'weight', 'female'};  
temp.tWw_f  = C2K(37.9);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'AndrHort1996';
comment.tWw_f = 'Data for females, form drawn curve, so not measurements';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
000.	12.295
7.797	23.588
15.594	39.804
25.842	73.177
34.530	102.487
45.000	139.134
54.356	167.610
64.604	194.426
77.970	218.711
89.777	238.115
102.252	248.486
114.282	258.868
128.317	265.106
143.020	272.148
157.500	275.917
169.530	277.283];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'weight', 'male'};  
temp.tWw_m  = C2K(37.9);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'AndrHort1996';
comment.tWw_m = 'Data for males, form drawn curve, so not measurements';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

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
metaData.links.id_CoL = '6S7HG'; % Cat of Life
metaData.links.id_ITIS = '633159 '; % ITIS
metaData.links.id_EoL = '1179937'; % Ency of Life
metaData.links.id_Wiki = 'Nectomys_squamipes'; % Wikipedia
metaData.links.id_ADW = 'Nectomys_squamipes'; % ADW
metaData.links.id_Taxo = '62324'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000731'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nectomys_squamipes}}';
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
bibkey = 'AndrHort1996'; type = 'Article'; bib = [ ... 
'author = {P. S. D''Andrea and C. Horta and R. Cerqueira and L. Rey}, ' ... 
'year = {1996}, ' ...
'title = {Breeding of the water rat (\emph{Nectomys squamipes}) in the laboratory}, ' ...
'journal = {Laboratory Animals}, ' ...
'volume = {30}, ' ...
'pages = {369-376}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Nectomys_squamipes/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

