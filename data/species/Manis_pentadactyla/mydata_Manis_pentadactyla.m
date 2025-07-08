function [data, auxData, metaData, txtData, weights] = mydata_Manis_pentadactyla

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pholidota'; 
metaData.family     = 'Manidae';
metaData.species    = 'Manis_pentadactyla'; 
metaData.species_en = 'Chinese pangolin'; 

metaData.ecoCode.climate = {'Cfa', 'Cfb', 'Cfc'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'JO'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 09 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2021 12 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 012 16]; 

%% set data
% zero-variate data

data.tg = 200;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'ZhanWu2016';   
  temp.tg = C2K(33.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Wiki: 182 to 225 d';
data.tx = 87; units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(33.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 0.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ZhanWu2016';
  temp.tp = C2K(33.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15.3*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(33.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'one individual was still alive at 15.3 yr';
   
data.Wwb = 104;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ZhanWu2016';
data.Wwp = 2e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'ZhanWu2016';
data.Wwi = 7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '2 to 7 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'AnAge','ZhanWu2016'};   
  temp.Ri = C2K(33.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'savepangolins: 2 and 3 young have been reported';

data.jO  = 3.06; units.jO  = 'ml/min.kg'; label.jO  = 'specific O2 consumption rate';  bibkey.jO  = 'HeatHamm1986';   
  temp.jO = C2K(33.4);  units.temp.jO = 'K'; label.temp.jO = 'temperature';
  comment.jO = 'resting metabolic rate';
  
% univariate data
% time-weight
data.tW = [ ... % time (d), female body weight (g)
16.881	214.917
18.747	246.338
21.621	246.767
26.194	288.973
31.782	334.790
33.482	386.947
35.682	397.656
40.422	426.046
43.811	471.535
47.710	527.480
51.947	583.477
56.862	649.955
61.268	702.516
63.818	785.942
65.508	779.274
68.222	824.662
70.760	835.421
72.958	835.750
75.840	877.703
78.716	885.053
80.742	864.594
85.987	886.139
88.011	855.299
90.560	924.884
93.609	959.941
95.984	1005.279
98.187	1033.290
100.223	1071.656
102.758	1061.654
105.468	1089.740
110.529	1014.372
112.916	1135.836
117.673	1264.574
120.185	1119.620
121.730	1258.259
122.757	1331.077
125.131	1366.034
127.840	1387.200
130.197	1328.728
132.565	1329.082
134.599	1357.067
137.147	1426.652
139.895	1676.197
142.788	1787.356
144.813	1759.977
147.534	1850.349
149.395	1857.547
152.300	2037.912];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(33.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Masu1967';

   
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;
weights.jO = 3 * weights.jO;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: respiration and Wwp data added; tg, tp, Wwb and Wwi data modified';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7VRV8'; % Cat of Life
metaData.links.id_ITIS = '584931'; % ITIS
metaData.links.id_EoL = '337658'; % Ency of Life
metaData.links.id_Wiki = 'Manis_pentadactyla'; % Wikipedia
metaData.links.id_ADW = 'Manis_pentadactyla'; % ADW
metaData.links.id_Taxo = '168636'; % Taxonomicon
metaData.links.id_MSW3 = '13900013'; % Mammal Spec World
metaData.links.id_AnAge = 'Manis_pentadactyla'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Manis_pentadactyla}}';
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
bibkey = 'Masu1967'; type = 'Article'; bib = [ ... 
'author = {Masui, M.}, ' ... 
'doi = {10.1111/j.1748-1090.1967.tb00340.x}, ' ...
'year = {1967}, ' ...
'title = {Birth of a Chinese pangolin \emph{Manis pentadactyle} at {U}eno {Z}oo, {T}okyo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {7}, ' ...
'pages = {114-116}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeatHamm1986'; type = 'Article'; bib = [ ... 
'author = {Heath, M.E. and Hammel, H.T.}, ' ... 
'year = {1986}, ' ...
'title = {Body temperature and rate of {O}2 consumption in {C}hinese pangolins}, ' ...
'journal = {Am. J. Physiol.-Regul., Integr. Comp. Physiol.}, ' ...
'volume = {250(3)}, ' ...
'pages = {R377-R382}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ZhanWu2016'; type = 'Article'; bib = [ ... 
'doi = {10.3897/zookeys.618.8886}, ' ...
'author = {Fuhua Zhang and Shibao Wu and Cuiyun Zou and Qiaoyun Wang and Shaoshan Li and Ruyong Sun1}, ' ... 
'year = {2016}, ' ...
'title = {A note on captive breeding and reproductive parameters of the {C}hinese pangolin, \emph{Manis pentadactyla} {L}innaeus, 1758}, ' ...
'journal = {ZooKeys}, ' ...
'volume = {618}, ' ...
'pages = {129–144}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Manis_pentadactyla}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/337658/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Manis_pentadactyla/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'savepangolins'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.savepangolins.org/what-is-a-pangolin/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

