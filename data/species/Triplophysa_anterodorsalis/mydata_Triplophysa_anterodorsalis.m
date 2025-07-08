  function [data, auxData, metaData, txtData, weights] = mydata_Triplophysa_anterodorsalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Triplophysa_anterodorsalis'; 
metaData.species_en = 'Crested loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 10 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 10 12];

%% set data
% zero-variate data
data.tp = 3*365;      units.tp = 'd';  label.tp = 'age at puberty for females';  bibkey.tp = 'guess';
  temp.tp = C2K(10); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Li = 9.88;    units.Li = 'cm'; label.Li = 'ultimate std length';            bibkey.Li = 'WangLian2017';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwi = 11.7;     units.Wwi = 'g';  label.Wwi = 'ultimate weight';               bibkey.Wwi = 'WangLian2017';
 
data.Ri = 1200/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'guess';
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length-weight
data.tLW = [ ... % time since birth (yr), std length (cm), weight (g)
    1  4.69  1.67
    2  5.39  2.29
    3  5.88  2.90
    4  6.72  4.36
    5  7.36  4.98];
data.tLW (:,1) = (.5 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'std length', 'weight'};  
temp.tLW = C2K(10);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
treat.tLW = {1, {'std length', 'weight'}};
bibkey.tLW = 'WangLian2017';

% length-weight
data.LWw = [ ... % std length (cm), wet weight (g)
4.617	1.539
4.623	1.256
4.693	1.479
4.699	1.584
4.725	1.360
4.801	1.480
4.899	1.689
4.904	1.808
5.007	1.734
5.083	2.136
5.088	2.017
5.104	1.868
5.136	1.689
5.202	2.017
5.207	2.166
5.212	1.838
5.304	2.181
5.304	2.300
5.331	2.032
5.375	2.226
5.418	2.182
5.424	2.539
5.429	2.301
5.499	2.435
5.504	2.212
5.526	2.510
5.569	2.361
5.580	2.599
5.618	2.152
5.618	2.465
5.640	2.316
5.678	2.748
5.699	2.331
5.705	2.942
5.715	2.510
5.764	2.704
5.775	2.481
5.802	3.151
5.807	2.317
5.813	2.853
5.824	2.540
5.824	2.734
5.824	3.017
5.899	2.675
5.905	2.570
5.905	2.779
5.905	2.972
5.911	3.226
5.927	3.330
5.997	2.883
6.019	3.032
6.019	3.315
6.078	3.613
6.089	3.360
6.100	2.884
6.121	3.122
6.208	3.331
6.213	3.197
6.214	3.480
6.224	3.644
6.235	3.822
6.316	3.569
6.316	3.644
6.408	3.793
6.419	3.600
6.424	3.391
6.430	3.242
6.495	4.136
6.522	3.853
6.527	3.630
6.576	4.166
6.603	4.315
6.609	4.643
6.614	4.449
6.619	3.958
6.619	4.002
6.711	3.913
6.711	4.047
6.712	4.509
6.722	3.869
6.728	4.211
6.733	4.315
6.901	4.182
6.907	5.224
6.923	4.703
6.998	4.599
6.999	5.478
7.009	5.120
7.118	5.508
7.123	5.180
7.198	4.883
7.199	5.329
7.199	5.836
7.209	5.225
7.312	5.613
7.486	6.477
7.513	6.269
7.605	6.209
7.611	6.686
7.691	5.927
7.718	5.748];
units.LWw = {'cm', 'g'}; label.LWw  = {'std length', 'wet weight'};  
bibkey.LWw = 'WangLian2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 2 * weights.tLW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'endemic species inhabiting the western plateau region of Sichuan Province';
metaData.bibkey.F1 = 'WangLian2017'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58YPN'; % Cat of Life
metaData.links.id_ITIS = '688207'; % ITIS
metaData.links.id_EoL = '222118'; % Ency of Life
metaData.links.id_Wiki = 'Triplophysa_anterodorsalis'; % Wikipedia
metaData.links.id_ADW = 'Triplophysa_anterodorsalis'; % ADW
metaData.links.id_Taxo = '189522'; % Taxonomicon
metaData.links.id_WoRMS = '1383965'; % WoRMS
metaData.links.id_fishbase = 'Triplophysa-anterodorsalis'; % fishbase

%% References
bibkey = 'WangLian2017'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13466}, ' ...
'author = {C. Wang and Y.-Q. Liang}, ' ...
'year = {2017}, ' ...
'title = {Age and growth of \emph{Triplophysa anterodorsalis} {Z}hu \& {C}ao, 1989 in the {H}eishui {R}iver, {C}hina}, ' ... 
'journal = {J Appl Ichthyol.}, ' ...
'volume = {33}, '...
'pages = {1215–1217}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Triplophysa-anterodorsalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
