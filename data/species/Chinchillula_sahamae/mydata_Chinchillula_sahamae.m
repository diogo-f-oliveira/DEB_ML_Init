function [data, auxData, metaData, txtData, weights] = mydata_Chinchillula_sahamae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Chinchillula_sahamae'; 
metaData.species_en = 'Altiplano chinchilla mouse'; 

metaData.ecoCode.climate = {'Cwb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 06 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 21]; 

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'guess';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 22;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AliaRios2009';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 100;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AliaRios2009';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.2*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 6.0;   units.Lb = 'cm';   label.Lb = 'total length at birth'; bibkey.Lb = 'AliaRios2009';
  comment.Lb = 'extrapolated from tL data';
data.Li = 26.2;   units.Li = 'cm';   label.Li = 'ultimate total';       bibkey.Li = 'AliaRios2009';

data.Wwi = 149;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'AliaRios2009';

data.Ri  = 6*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 pups per litter; 6 litters per yr';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
6.430	7.325
6.709	11.104
7.268	7.892
13.698	9.972
13.978	12.996
14.257	10.539
20.687	12.620
20.966	16.069
21.246	12.242
27.676	18.244
27.676	15.362
28.235	14.890
34.944	19.143
34.944	17.915
35.224	17.443
40.815	19.995
41.933	18.767
42.212	20.704
48.642	20.470
48.642	19.856
49.201	22.785
55.911	23.023
55.911	22.078
55.911	21.511
62.061	23.119
62.620	22.789
63.458	22.222
69.888	22.791
69.888	23.357
76.597	23.076
76.597	23.359
76.597	25.107
83.586	25.723
83.586	24.070
91.134	25.536
91.134	25.867
97.284	25.538
97.564	26.058
104.553	25.635
104.832	26.107
111.262	25.825
111.542	26.203
118.251	25.733
118.530	26.252
125.799	25.782
125.799	26.302
131.949	25.831
132.228	26.445
139.497	25.975
140.335	26.447
146.486	25.788
146.486	26.780
154.593	25.931];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(37.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AliaRios2009';
comment.tL = 'Sexes combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Body temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '69S4V'; % Cat of Life
metaData.links.id_ITIS = '633105'; % ITIS
metaData.links.id_EoL = '1179883'; % Ency of Life
metaData.links.id_Wiki = 'Chinchillula_sahamae'; % Wikipedia
metaData.links.id_ADW = 'Chinchillula_sahamae'; % ADW
metaData.links.id_Taxo = '88809'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000636'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chinchillula_sahamae}}';
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
bibkey = 'AliaRios2009'; type = 'Article'; bib = [ ... 
'author = {Enzo Aliaga-Rossel and Boris Rios-Uzeda  and Jorge Salazar-Bravo}, ' ... 
'year = {2009}, ' ...
'title = {Observations on the growth of \emph{Chinchillula sahamae} ({R}odentia, {S}igmodontinae) in captivity}, ' ...
'journal = {Mammalia}, ' ...
'volume = {73}, ' ...
'pages = {261–263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

