function [data, auxData, metaData, txtData, weights] = mydata_Testudo_graeca
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Testudo_graeca'; 
metaData.species_en = 'Spur-thighed tortoise'; 

metaData.ecoCode.climate = {'Csa', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 04];

%% set data
% zero-variate data

data.ab_25 = 77;      units.ab_25 = 'd';    label.ab_25 = 'age at birth';         bibkey.ab_25 = 'startortoises';   
  temp.ab_25 = C2K(25.5);  units.temp.ab_25 = 'K'; label.temp.ab_25 = 'temperature';
data.ab_31 = 60;      units.ab_31 = 'd';    label.ab_31 = 'age at birth';         bibkey.ab_31 = 'startortoises';   
  temp.ab_31 = C2K(31.5);  units.temp.ab_31 = 'K'; label.temp.ab_31 = 'temperature';
  comment.ab_31 = 'HichZnar2016 gives 70 d';
data.ap = 4560;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'AnAge';
  temp.ap = C2K(24);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 127*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 12.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'HichZnar2016';

data.Ri  = 14/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Testudo_hermanni';
 
% uni-variate data

% time-weight
data.tW = [ ... % time (d), wet weight (g)
45.894	37.567
45.980	56.364
114.707	68.841
137.396	24.964
217.625	49.964
229.241	87.549
274.906	62.450
321.002	131.336
355.279	118.778
401.287	168.868
412.360	87.405
481.316	150.008
572.817	137.405
641.659	174.945
653.333	225.061
744.777	199.927
802.203	243.742
882.173	212.350
905.207	243.661
951.301	312.547
1043.349	418.991
1111.846	381.344
1386.839	450.051
1478.828	543.964
1489.871	456.235
1501.373	468.758
1673.075	474.889
1788.184	618.909
1913.905	581.217
2051.215	574.843
2120.572	725.165
2223.433	693.756
2372.131	674.843
2545.066	950.396
2624.980	906.474
2750.529	831.188
2854.651	1075.467
2946.210	1075.396
3003.349	1056.554
3140.487	1012.587
3186.782	1125.333
3244.151	1156.616
3290.560	1294.424
3359.000	1244.245
3530.041	1106.267
3577.056	1375.653
3645.897	1413.193
3702.719	1325.430
3748.499	1325.394
3885.522	1256.364
3932.707	1563.345
3978.428	1550.778
4217.939	1368.886
4426.041	1826.116
4437.114	1744.654
4758.689	1988.763
4769.387	1825.847
4941.032	1819.447
5137.316	2195.233
5182.550	2076.150
5273.938	2038.485
5446.127	2151.132
5515.026	2201.203
5537.572	2125.998
5708.729	2013.082
5847.330	2288.662
5892.765	2213.439
5903.865	2138.242
6075.423	2113.045
6167.614	2250.818
6213.794	2338.501
6270.245	2169.284
6430.158	2100.236
6590.414	2106.376
6602.348	2212.883
6784.949	2099.958
6877.627	2344.246];
data.tW(:,1) = data.tW(:,1) - data.tW(1,1); % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'RitzClau2012';
comment.tW = 'temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'If eggs develop below 25 C males hatch, above 30 C females';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'Males are smaller than females and reach puberty earlier';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '55JSJ'; % Cat of Life
metaData.links.id_ITIS = '551865'; % ITIS
metaData.links.id_EoL = '1055221'; % Ency of Life
metaData.links.id_Wiki = 'Testudo_graeca'; % Wikipedia
metaData.links.id_ADW = 'Testudo_graeca'; % ADW
metaData.links.id_Taxo = '607890'; % Taxonomicon
metaData.links.id_WoRMS = '1498232'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Testudo&species=graeca'; % ReptileDB
metaData.links.id_AnAge = 'Testudo_graeca'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Testudo_graeca}}';
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
bibkey = 'RitzClau2012'; type = 'Article'; bib = [ ... 
'author = {J. Ritz and M. Clauss and W. J. Streich and J.-M. Hatt}, ' ... 
'year = {2012}, ' ...
'title = {Variation in Growth and Potentially Associated Health Status in {H}ermann''s and Spur-Thighed Tortoise (\emph{Testudo hermanni} and \emph{Testudo graeca})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {31}, ' ...
'pages = {705-717}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HichZnar2016'; type = 'Article'; bib = [ ... 
'author = {N. Hichami and M. Znari and M. Naimi and S. Namous}, ' ... 
'year = {2016}, ' ...
'title = {Clutch, egg and hatchling characteristics in the {S}ouss Valley tortoises, \emph{Testudo graeca soussensis} {P}ieh, 2001 ({T}estudines: {T}estudinidae) from an arid steppe-land of {W}est-{C}entral {M}orocco, {A}frica}, ' ...
'journal = {Journal of Herpetology}, ' ...
'doi = {10.1080/21564574.2015.1136701}, ' ...
'volume = {65}, ' ...
'pages = {21--32}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Testudo_graeca/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Testudo_graeca}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'startortoises'; type = 'Misc'; bib = ...
'howpublished = {\url{http://startortoises.net/goldengreek-incubation.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

