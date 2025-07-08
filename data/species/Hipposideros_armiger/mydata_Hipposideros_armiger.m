function [data, auxData, metaData, txtData, weights] = mydata_Hipposideros_armiger

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Hipposideridae';
metaData.species    = 'Hipposideros_armiger'; 
metaData.species_en = 'Great roundleaf bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
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

data.tg = 90;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 49;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'ChenLee2002';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 500;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'ChenLee2002';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'females reach maturity in their second yr, males in their 1st yr';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15.9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'ChenLee2002';
  comment.Wwb = '11.2-20.2 g';
data.Wwi = 60;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'ChenLee2002';

data.Ri  = 1.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 2 pups per litter; 1 litter per yr, ChenLee2002: usually 1 pup/litter';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.879	14.342
0.954	12.584
0.958	11.156
1.008	17.969
1.013	16.321
1.072	20.167
1.905	21.048
1.909	19.729
2.198	15.994
2.334	17.203
3.229	20.941
3.235	18.743
3.914	24.899
3.918	23.580
4.130	22.152
4.882	27.538
4.888	25.120
5.036	21.934
5.929	26.441
6.774	23.147
6.975	26.114
7.075	15.235
7.251	26.994
7.813	25.237
8.013	28.314
8.085	27.325
9.817	30.626
10.788	31.947
11.769	30.081
11.909	29.532
11.982	28.323
12.944	33.270
13.916	34.041
13.988	33.272
14.146	26.679
14.901	30.527
16.837	35.367
16.968	38.554
16.980	34.048
16.990	30.751
18.014	38.006
18.026	33.611
18.268	21.743
21.085	35.486
21.812	24.388
21.977	40.213
22.835	32.193
22.959	37.578
22.962	36.809
24.069	39.229
26.006	43.848
26.797	34.839
26.990	40.664
28.106	39.897
28.114	36.930
28.898	30.778
33.947	43.096
35.903	40.683
36.050	38.046
36.894	34.971
38.956	44.646
43.967	45.976];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ChenLee2002';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
%weights.Wwim = 3 * weights.Wwim;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Body temperature is guessed';
D3 = 'scaled function response during lactation is assumed to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3M35X'; % Cat of Life
metaData.links.id_ITIS = '631482'; % ITIS
metaData.links.id_EoL = '327243'; % Ency of Life
metaData.links.id_Wiki = 'Hipposideros_armiger'; % Wikipedia
metaData.links.id_ADW = 'Hipposideros_armiger'; % ADW
metaData.links.id_Taxo = '64203'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800525'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hipposideros_armiger}}';
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
bibkey = 'ChenLee2002'; type = 'Article'; bib = [ ... 
'author = {H. C. Cheng and L. L. Lee}, ' ... 
'year = {2002}, ' ...
'title = {POSTNATAL GROWTH, AGE ESTIMATION, AND SEXUAL MATURITY IN THE {F}ORMOSAN LEAF-NOSED BAT (\emph{Hipposideros terasensis})}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {83(3)}, ' ...
'pages = {785-793}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

