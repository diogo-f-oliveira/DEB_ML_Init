function [data, auxData, metaData, txtData, weights] = mydata_Hydromys_chrysogaster

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Hydromys_chrysogaster'; 
metaData.species_en = 'Rakali'; 

metaData.ecoCode.climate = {'BS', 'Cs', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iFm', '0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 12 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 12 28]; 

%% set data
% zero-variate data

data.tg = 34;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'Olse1982';   
  temp.tg = C2K(36.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 29;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'Olse1982';   
  temp.tx = C2K(36.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 124;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'Olse1982';
  temp.tp = C2K(36.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 135;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male'; bibkey.tpm = 'Olse1982';
  temp.tpm = C2K(36.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 7.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 31.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Olse1982';
data.Wwx = 150;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';        bibkey.Wwx = 'AnAge';
data.Wwp = 433;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'Olse1982';
data.Wwi = 850;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'AnAge';

data.Ri  = 3.29*2.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Olse1982';   
  temp.Ri = C2K(36.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.29 pups per litter; 2.6 litters per yr';

% uni-variate data
% time - weight
data.tW = [ ... % time since birth (d), weight (g)
0.030	31.444
0.919	31.437
1.864	34.574
3.440	39.280
3.753	42.422
4.697	47.132
5.331	45.555
5.960	48.694
6.269	56.554
7.216	58.119
8.478	61.254
10.676	76.961
10.992	76.958
12.255	78.521
12.884	81.661
13.515	83.229
14.457	89.511
15.403	92.648
16.029	98.933
16.658	102.073
17.917	108.353
18.557	100.486
19.492	114.630
20.753	117.765
21.065	122.480
22.649	119.323
24.845	136.602
24.851	130.313
25.794	136.595
27.054	141.303
27.365	146.017
27.995	149.157
28.940	152.295
30.197	160.147
32.407	163.275
37.458	171.098
42.468	221.375
47.489	260.645
52.844	281.045
57.573	295.160
61.956	340.725
67.003	351.693
72.339	392.533
77.399	390.923
82.748	417.612
86.532	427.017
92.190	461.566
96.893	502.411
101.652	485.079
107.020	491.328
111.694	563.620
116.158	522.705
124.041	544.659
133.789	599.616
143.528	664.008
153.612	698.523
163.730	696.875
174.161	698.368
183.612	732.888
193.713	748.535
203.878	698.144
213.957	737.376
234.116	814.268
244.297	746.581
254.015	832.986
263.177	839.206
273.300	832.840
283.415	834.336
294.159	838.972
303.619	864.058];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(36.6);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Olse1982';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3N7RM'; % Cat of Life
metaData.links.id_ITIS = '585251'; % ITIS
metaData.links.id_EoL = '46559458'; % Ency of Life
metaData.links.id_Wiki = 'Hydromys_chrysogaster'; % Wikipedia
metaData.links.id_ADW = 'Hydromys_chrysogaster'; % ADW
metaData.links.id_Taxo = '63239'; % Taxonomicon
metaData.links.id_WoRMS = '404082'; % WoRMS
metaData.links.id_MSW3 = '13001380'; % MSW3
metaData.links.id_AnAge = 'Hydromys_chrysogaster'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydromys_chrysogaster}}';
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
bibkey = 'Olse1982'; type = 'Article'; bib = [ ... 
'author = {P. D. Olsen}, ' ... 
'year = {1982}, ' ...
'title = {Reproductive Biology and Development of the Water Rat, \emph{Hydromys chrysogaster}, in Captivity}, ' ...
'journal = {Aust. Wildl. Res.}, ' ...
'volume = {9}, ' ...
'pages = {39--53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hydromys_chrysogaster}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

