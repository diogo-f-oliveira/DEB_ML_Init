function [data, auxData, metaData, txtData, weights] = mydata_Dasymys_incomtus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Dasymys_incomtus'; 
metaData.species_en = 'African marsh rat'; 

metaData.ecoCode.climate = {'Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf','0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Pill2003';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 24;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Pill2003';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 117;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'Pill2003';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 42;   units.tpm = 'd';     label.tpm = 'time since birth at puberty in males'; bibkey.tpm = 'Pill2003';
  temp.tpm = C2K(36); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 1.5*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 8.8;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Pill2003';
  comment.Wwb = '6.1-10.3 g';
data.Wwi = 140;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Pill2003';
  comment.Wwi = '118-171 g';

data.Ri  = 2.9*6/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Pill2003';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.9 pups per litter; 6 litters in 9 mnth';
  
% univariate data
% time-weight
data.tWw_f = [ ... % time since birth (wk), weight (g)
0.000	8.880
6.532	16.741
13.770	25.627
21.009	34.171
28.071	51.277
34.956	61.877
42.371	69.735
49.079	80.678
56.318	86.824
63.380	94.341
70.441	101.173
76.620	108.350
84.388	110.386
91.097	113.794
98.159	118.229
105.221	121.636
112.282	124.359
118.815	127.082
126.230	131.859
132.938	130.815
140.177	136.962];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f    = C2K(36);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature'; 
bibkey.tWw_f = 'Pill2003';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (wk), weight (g)
0.000	8.880
7.062	17.767
14.124	26.311
20.656	36.569
27.894	49.565
35.309	60.506
42.194	69.736
49.079	80.678
55.788	85.798
63.203	94.684
69.912	101.175
77.327	107.321
84.035	115.181
91.097	120.986
97.806	124.394
105.221	131.225
112.282	131.208
119.344	137.013
126.230	141.790
133.468	143.142
140.177	146.893];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m    = C2K(36);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature'; 
bibkey.tWw_m = 'Pill2003';
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
  
%% Facts
F1 = 'Lives is Pandanus stands';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3496R'; % Cat of Life
metaData.links.id_ITIS = '585215'; % ITIS
metaData.links.id_EoL = '47051023'; % Ency of Life
metaData.links.id_Wiki = 'Dasymys_incomtus'; % Wikipedia
metaData.links.id_ADW = 'Dasymys_incomtus'; % ADW
metaData.links.id_Taxo = '89090'; % Taxonomicon
metaData.links.id_MSW3 = '13001322'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasymys_incomtus}}';
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
bibkey = 'Pill2003'; type = 'Article'; bib = [ ... 
'author = {Neville Pillay}, ' ... 
'year = {2003}, ' ...
'title = {Reproductive Biology of a Rare {A}frican Rodent, the Water Rat, \emph{Dasymys incomtus}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {84(2)}, ' ...
'pages = {505-512}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

