function [data, auxData, metaData, txtData, weights] = mydata_Eulemur_flavifrons

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Lemuridae';
metaData.species    = 'Eulemur_flavifrons'; 
metaData.species_en = 'Blue-eyed black lemur'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiHs','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 25]; 


%% set data
% zero-variate data

data.tg = 125;   units.tg = 'd';    label.tg = 'age at birth';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '120-129 d';
data.tx = 5.5*30.5;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '5-6 mnth';
data.tp = 540;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 266;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'Wiki';   
  temp.am = C2K(36.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 58;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'Wiki';
  comment.Li = '51–65 cm';

data.Wwb = 70; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'QuinPeti2017';
data.Wwi = 1850; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '1.8-1.9 kg';

data.Ri  = 1.5/225; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-weight
data.tWw = [ ... % time since conception (d), weight (g)
1.281	72.709
2.910	74.134
5.278	81.263
7.054	86.965
8.238	86.965
10.310	96.945
11.494	98.371
12.085	106.925
13.269	106.925
14.897	112.627
17.561	122.607
18.448	131.161
19.927	139.715
21.258	146.843
22.592	142.566
23.182	153.971
25.253	165.377
26.438	165.377
28.065	175.356
28.805	176.782
30.283	189.613
32.059	195.316
33.685	209.572
34.574	208.147
35.608	220.978
36.643	228.106
37.828	228.106
38.715	233.809
40.788	236.660
41.972	240.937
43.154	252.342
44.339	252.342
45.526	245.214
46.708	258.045
48.631	266.599
49.666	276.578
50.255	290.835
52.033	289.409
53.216	295.112
53.953	313.646
54.989	315.071
55.578	329.328
56.909	340.733
58.390	342.159
59.124	369.246
60.164	354.990
61.939	363.544
63.124	362.118
63.868	347.861
64.607	356.415
66.384	357.841
68.009	374.949
69.193	377.800
70.374	396.334
71.562	380.652
73.928	397.760
75.109	416.293
76.884	426.273
80.435	440.530
81.173	453.360
82.358	453.360
84.278	477.597
85.759	477.597
87.829	491.853
88.720	483.299
90.041	536.049
91.081	523.218
93.300	536.049
94.634	530.346
95.815	546.029
96.850	554.582
97.886	557.434
98.920	570.265
101.585	574.542
103.360	584.521
104.542	595.927
105.280	607.332
106.314	620.163
107.796	618.737
108.534	627.291];
units.tWw  = {'d', 'g'}; label.tWw = {'time sinc birth', 'wet weight'};  
temp.tWw   = C2K(36.6);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'QuinPeti2017';
comment.tWw = 'Mulhouse 1 data';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6GXMK'; % Cat of Life
metaData.links.id_ITIS = '944079'; % ITIS
metaData.links.id_EoL = '7022955'; % Ency of Life
metaData.links.id_Wiki = 'Eulemur_flavifrons'; % Wikipedia
metaData.links.id_ADW = 'Eulemur_macaco'; % ADW
metaData.links.id_Taxo = '1684505'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100043'; % MSW3
metaData.links.id_AnAge = 'Eulemur_macaco'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eulemur_flavifrons}}';
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
bibkey = 'QuinPeti2017'; type = 'Article'; bib = [ ... 
'doi = {10.1002/ajpa.1330750307}, ' ...
'author = {B. Quintard and T. Petit and B. Lefau}, ' ... 
'year = {2017}, ' ...
'title = {Hand-rearing the critically endangered blue-eyed black lemur (\emph{Eulemur flavifrons}): milk formula, feeding and socialisation protocols}, ' ...
'journal = {Journal of Zoo and Aquarium Research 5(1)  }, ' ...
'volume = {5}, ' ...
'number = {1}, '...
'pages = {76-81}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eulemur_macaco}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

