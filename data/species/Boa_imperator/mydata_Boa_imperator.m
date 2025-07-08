function [data, auxData, metaData, txtData, weights] = mydata_Boa_imperator

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Boidae';
metaData.species    = 'Boa_imperator'; 
metaData.species_en = 'Common boa'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 26];


%% set data
% zero-variate data

data.ab = 100;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on boa constrictor';
data.ap = 3*365;  units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = 'guess';
  temp.ap = C2K(29);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'based on boa constrictor';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 60;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SteeFrib2022';  
data.Li  = 250;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 95;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'SteeFrib2022';
data.Wwi = 6000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 44/3/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SteeFrib2022';   
temp.Ri = C2K(29);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [ % time since birth (d), weight (g)
 2.184	107.774  99.846  88.766
35.633	133.263 114.250  90.492
85.257	146.138 127.116 100.212
118.731	149.440 139.950 105.080
141.811	155.871 144.782 105.172
149.885	162.242 146.399 108.364
182.186	181.387 159.196 111.662
219.108	197.382 162.512 116.549
274.505	210.279 178.575 116.773
296.393	249.986 204.027 120.025
326.394	261.198 216.824 128.077
344.841	281.873 232.741 123.396
369.026	331.098 247.100 147.250
413.989	381.989 278.974 139.518
450.891	415.416 290.204 150.758
478.577	432.958 320.439 157.206
510.834	490.138 344.343 170.013
547.632	613.897 418.979 212.953
589.159	641.003 474.587 205.189
631.782	718.826 511.225 NaN
664.054	763.328 541.468 238.771
711.192	929.918 608.207 257.980
738.866	956.969 649.521 285.027];
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(30); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SteeFrib2022'; 
treat.tW = {1, {'frequent feeder: 0.05 body mass/7 d','intermediate feeder','infrequent feeder: 0.35 body mass/35 d'}};
comment.tW = '2018 boas';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 3 * weights.Ri;

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'The species is one of only two in snakes to have a confirmed XY sex ';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68LTZ'; % Cat of Life
metaData.links.id_ITIS = '635078'; % ITIS
metaData.links.id_EoL = '49955032'; % Ency of Life
metaData.links.id_Wiki = 'Boa_imperator'; % Wikipedia
metaData.links.id_ADW = 'Boa_imperator'; % ADW
metaData.links.id_Taxo = '3807173'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Boa&species=imperator'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Boa_constrictor}}';
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
bibkey = 'SteeFrib2022'; type = 'misc'; bib = [ ... 
'author = {Carlynn Steele and Courtney Friberg and Ervin Pall and Mara Doughty-Seals and Noah Anderson}, ' ... 
'year = {2022}, ' ...
'institution = {Winona State University}, ' ...
'title = {Preliminary Results on the Influence of Feeding Regime on Growth and Body Size in the Boa (\emph{Boa imperator})}, ' ...
'howpublished = {\url{https://openriver.winona.edu/cgi/viewcontent.cgi?article=1128&context=wsurrc}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

