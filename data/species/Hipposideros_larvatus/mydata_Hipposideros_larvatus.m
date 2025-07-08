function [data, auxData, metaData, txtData, weights] = mydata_Hipposideros_larvatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Hipposideridae';
metaData.species    = 'Hipposideros_larvatus'; 
metaData.species_en = 'Intermediate roundleaf bat'; 

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

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 26]; 

%% set data
% zero-variate data

data.tg = 45;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 30;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'LinJin2010';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'guess';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'LinJin2010';
  comment.Wwb = '2.31 g for male, 2.36 g for female';
data.Wwi = 13.9;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'LinJin2010';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), weight (g)
0.889	5.004
0.927	5.113
0.928	4.877
0.929	4.768
0.966	5.729
0.967	4.678
1.004	5.602
1.080	5.439
1.081	5.239
3.861	6.488
3.862	6.397
3.937	6.633
3.938	6.288
4.013	6.125
4.051	7.248
4.052	6.850
7.973	8.858
7.974	7.935
7.975	7.790
8.012	8.677
8.013	8.442
8.051	8.224
8.052	8.007
11.936	10.179
11.937	9.997
11.938	9.092
11.972	10.939
11.973	9.762
11.974	9.653
12.012	10.794
12.013	9.544
12.014	9.472
12.015	9.291
15.897	10.520
15.973	11.046
15.974	11.372
16.011	10.701
16.012	10.846
16.013	11.698
16.014	11.988
16.050	11.553
19.935	11.641
19.973	11.279
19.974	13.127
20.011	11.877
20.012	11.931
20.013	12.022
20.014	12.638
20.015	12.782
20.087	12.203
20.088	12.456
23.971	11.729
23.972	11.747
23.973	11.929
23.974	12.074
23.975	12.273
23.976	12.563
23.977	12.961
24.011	11.458
27.972	11.836
27.973	12.687
27.974	12.977
28.010	12.126
28.011	12.252
28.012	12.415
28.086	13.720
31.934	13.252
31.977	13.418
32.020	13.752
32.021	14.835
32.022	15.148
32.065	14.085
32.066	14.585];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LinJin2010';
    
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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
D3 = 'scaled function response during lactation is assumed to be larger than post-weaning';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3M37H'; % Cat of Life
metaData.links.id_ITIS = '631511'; % ITIS
metaData.links.id_EoL = '328251'; % Ency of Life
metaData.links.id_Wiki = 'Hipposideros_larvatus'; % Wikipedia
metaData.links.id_ADW = 'Hipposideros_larvatus'; % ADW
metaData.links.id_Taxo = '64237'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800796'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hipposideros_larvatus}}';
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
bibkey = 'LinJin2010'; type = 'Article'; bib = [ ... 
'author = {Ai-Qing Lin and Long-Ru Jin and Ying Liu and Ke-Ping Sun and Jiang Feng}, ' ... 
'year = {2010}, ' ...
'title = {Postnatal Growth and Age Estimation in {H}orsfield''s Leaf-Nosed Bat \emph{Hipposideros larvatus}}, ' ...
'journal = {Zoological Studies}, ' ...
'volume = {49(6)}, ' ...
'pages = {789-796}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

