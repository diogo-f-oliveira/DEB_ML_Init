function [data, auxData, metaData, txtData, weights] = mydata_Myotis_lucifugus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Vespertilionidae';
metaData.species    = 'Myotis_lucifugus'; 
metaData.species_en = 'Little brown bat'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 23]; 

%% set data
% zero-variate data

data.tg = 55;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 25;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'BaptRich2000';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '3-4 wk';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Wiki: female become mature in their 1st yr, males in their 2nd yr';
data.am = 34*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 1.96; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'AnAge';
data.Wwi = 12.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
1.048	2.241
2.285	2.518
3.119	2.848
4.357	3.125
5.344	3.310
5.946	3.850
7.177	4.009
7.847	4.339
9.398	4.392
10.152	4.761
10.586	5.223
11.006	5.447
12.076	5.632
13.120	5.395
14.420	5.342
16.137	5.448
17.128	5.699
17.963	6.042
19.002	5.713
19.985	5.805
21.041	5.766
23.029	6.346
24.110	6.729
25.125	5.978
26.115	6.189
28.044	5.754
28.969	6.256
30.268	6.203
32.080	6.546
33.205	6.296];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BaptRich2000';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.tp = 3 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'scaled function response during lactation is assume to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '8LZSQ'; % Cat of Life
metaData.links.id_ITIS = '1180406'; % ITIS
metaData.links.id_EoL = '327247'; % Ency of Life
metaData.links.id_Wiki = 'Myotis_lucifugus'; % Wikipedia
metaData.links.id_ADW = 'Myotis_lucifugus'; % ADW
metaData.links.id_Taxo = '64691'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13802460'; % MSW3
metaData.links.id_AnAge = 'Myotis_lucifugus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myotis_lucifugus}}';
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
bibkey = 'BaptRich2000'; type = 'Article'; bib = [ ... 
'author = {Tony L. Baptista and Christopher S. Richardson and Thomas H. Kunz}, ' ... 
'year = {2000}, ' ...
'title = {Postnatal Growth and Age Estimation in Free-Ranging Bats: {A} Comparison of Longitudinal and Cross-Sectional Sampling Methods}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {81(3)}, ' ...
'pages = {709-718}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Myotis_lucifugus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

