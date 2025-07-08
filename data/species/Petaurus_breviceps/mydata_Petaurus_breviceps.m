function [data, auxData, metaData, txtData, weights] = mydata_Petaurus_breviceps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Petauridae';
metaData.species    = 'Petaurus_breviceps'; 
metaData.species_en = 'Sugar glider'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 07]; 

%% set data
% zero-variate data

data.tg = 16;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Wiki: 58 d';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 236;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 456;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(35.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 17.8*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(35.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.194; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 25; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 110;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 1.3*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.3 litters per yr; 2 pups per litter';

% univariate data

% time-weight
data.tWw = [ ...
1.277	1.789
2.731	2.485
40.119	3.878
41.029	4.585
47.926	4.803
48.836	5.511
49.735	3.313
49.751	7.671
50.290	6.206
52.290	7.254
52.845	10.148
54.836	8.653
56.287	8.623
57.735	7.503
58.655	11.115
60.290	11.444
60.843	13.975
62.836	12.843
63.915	10.278
65.373	12.064
67.768	21.820
67.939	18.910
69.393	19.606
74.511	29.668
75.964	30.001
76.882	32.887
80.002	42.628
81.439	38.602
81.791	35.689
83.254	38.564
88.550	47.896
89.268	45.702
91.261	44.933
95.464	52.835
96.734	52.809
96.895	46.994
101.649	57.064
101.839	59.239
103.088	53.401
109.476	63.437
110.927	63.406
117.127	71.629
117.132	73.082
125.867	79.799
125.875	81.978
130.788	85.507
130.964	84.050
139.887	92.579
151.166	100.332
166.267	110.911
172.815	115.131
185.362	122.131
186.667	131.547];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(35.9);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Smit1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 50 * weights.tWw;
weights.Wwx = 0 * weights.Wwx;

%% set weights for all real data
weights = setweights(data, []);

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

%% Discussion points
D1 = 'Males are assumed to differ from females by E_hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4FD5J'; % Cat of Life
metaData.links.id_ITIS = '609841'; % ITIS
metaData.links.id_EoL = '323825'; % Ency of Life
metaData.links.id_Wiki = 'Petaurus_breviceps'; % Wikipedia
metaData.links.id_ADW = 'Petaurus_breviceps'; % ADW
metaData.links.id_Taxo = '112677'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000157'; % MSW3
metaData.links.id_AnAge = 'Petaurus_breviceps'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Petaurus_breviceps}}';
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
bibkey = 'Smit1979'; type = 'Article'; bib = [ ... 
'doi = {10.1071/wr9790141}, ' ...
'author = {Smith, M.}, ' ... 
'year = {1979}, ' ...
'title = {Observations on Growth of Petaurus Breviceps and P. Norfolcensis (Petauridae : Marsupialia) in Captivity}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {6(2)}, ' ...
'pages = {141-150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Petaurus_breviceps}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

