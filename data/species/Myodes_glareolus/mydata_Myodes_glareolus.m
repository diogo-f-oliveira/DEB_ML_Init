function [data, auxData, metaData, txtData, weights] = mydata_Myodes_glareolus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Myodes_glareolus'; 
metaData.species_en = 'Bank vole'; 

metaData.ecoCode.climate = {'Cfb','Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

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

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'Wiki';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 22;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '20-25 d';
data.tp = 6*7;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '6 weeks for females, 8 for males'; 
data.am = 42*30.5;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'Wiki';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 4.3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Balc2007';
data.Wwi = 36;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Wiki';

data.Ri  = 6*4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-8 pups per litter; 4 litters per yr';
  
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
4.224	4.310
14.783	5.853
24.814	11.396
33.261	14.784
44.876	17.866
54.379	17.255
72.857	18.187
85.000	17.269
94.503	17.889
105.062	16.355
115.093	16.667
124.068	21.287
135.155	17.292
143.602	23.450
155.745	18.532
164.720	23.151
174.752	23.156
183.727	22.237
195.870	21.935
203.789	27.477
214.876	26.251
223.851	28.409
234.938	26.568
244.969	24.726
253.944	25.346
263.447	28.119
274.534	21.970
285.093	28.129
294.596	24.441
303.571	25.060
314.658	22.296
324.161	27.224
333.665	29.382
344.224	28.463
354.783	28.776
363.230	22.011
374.317	22.323
395.435	24.794
414.441	33.111
425.528	23.269
444.534	36.817
454.037	24.513
483.602	25.757
493.634	22.070
544.317	19.323
603.975	31.043
614.534	27.663
625.093	28.898];
units.tWw   = {'d', 'cm'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(37.6);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Balc2007';
comment.tWw = 'Sexes combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Ri = 3 * weights.Ri;
weights.Wwb = 3 * weights.Wwb;

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
metaData.links.id_CoL = '454Q4'; % Cat of Life
metaData.links.id_ITIS = '970613'; % ITIS
metaData.links.id_EoL = '61508114'; % Ency of Life
metaData.links.id_Wiki = 'Myodes_glareolus'; % Wikipedia
metaData.links.id_ADW = 'Myodes_glareolus'; % ADW
metaData.links.id_Taxo = '62602'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000312'; % Mammal Spec World
metaData.links.id_AnAge = 'Myodes_glareolus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myodes_glareolus}}';
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
bibkey = 'Balc2007'; type = 'Article'; bib = [ ... 
'author = {Laima Balc\v{c}iauskien\''{e}}, ' ... 
'year = {2007}, ' ...
'title = {CRANIAL GROWTH OF CAPTIVE BRED BANK VOLES (\emph{Clethrionomys glareolus})}, ' ...
'journal = {Acta Zoologica Lituanica}, ' ...
'volume = {17(1)}, ' ...
'pages = {33-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Myodes_glareolus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

