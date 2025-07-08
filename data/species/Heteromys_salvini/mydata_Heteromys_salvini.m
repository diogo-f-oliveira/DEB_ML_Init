function [data, auxData, metaData, txtData, weights] = mydata_Heteromys_salvini

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Heteromyidae';
metaData.species    = 'Heteromys_salvini'; 
metaData.species_en = 'Salvin''s spiny pocket mouse'; 

metaData.ecoCode.climate = {'Aw','Am','Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 04]; 

%% set data
% zero-variate data

data.tg = 27.5;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Flem1977';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '27-28 d';
data.tx = 29;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Flem1977';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '28-30 d';
data.tp = 193;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 18*30.5;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 1.9;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Flem1977';
data.Wwx = 26;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'Flem1977';
data.Wwi = 65;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';
  comment.Wwi = '30-65 g';

data.Ri  = 1.5*3.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 litters per yr, 3.8 pups per litter';

% uni-variate data

% time-length data
data.tL = [ ... % time since birth (d), hind-foot length (cm)
1.135	0.228
1.986	0.270
2.837	0.320
4.043	0.464
4.894	0.514
4.894	0.514
5.957	0.615
6.879	0.725
7.943	0.817
8.936	0.919
9.929	1.028
10.993	1.146
11.702	1.307
12.837	1.425
13.901	1.526
15.816	1.677
19.787	1.989
21.844	2.098
23.830	2.148
25.887	2.198];
units.tL  = {'d', 'cm'};  label.tL = {'time', 'hind-foot length'};  
temp.tL  = C2K(37.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Flem1977';

% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.862	1.574
1.925	2.423
2.846	2.989
3.839	2.984
4.972	4.261
6.034	5.395
6.813	6.531
7.876	6.669
8.868	7.661
9.861	7.656
10.852	9.076
11.844	9.499
12.694	10.492
13.758	10.487
15.812	11.759
18.645	15.164
19.776	17.438
21.757	20.848
23.954	21.977
25.937	23.962
27.920	25.804];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(37.9);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Flem1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;

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

%% Discussion points
D1 = 'males are assumed to not differ from females due to lack of data; males grow somewhat larger';
D2 = 'Hind-foot length does not grow isomorphically';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3V6TB'; % Cat of Life
metaData.links.id_ITIS = '625237 '; % ITIS
metaData.links.id_EoL = '311780'; % Ency of Life
metaData.links.id_Wiki = 'Heteromys_salvini'; % Wikipedia
metaData.links.id_ADW = 'Liomys_salvini'; % ADW
metaData.links.id_Taxo = '62086'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12700197'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heteromys_salvini}}';
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
bibkey = 'Flem1977'; type = 'Article'; bib = [ ... 
'author = {Theodore H. Fleming}, ' ... 
'year = {1977}, ' ...
'title = {Growth and Development of Two Species of Tropical {H}eteromyid Rodents}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {98(1)}, ' ...
'pages = {109-123}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Liomys_salvini/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

