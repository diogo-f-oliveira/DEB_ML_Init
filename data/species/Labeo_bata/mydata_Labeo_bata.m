  function [data, auxData, metaData, txtData, weights] = mydata_Labeo_bata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Labeo_bata'; 
metaData.species_en = 'Bata'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 08];

%% set data
% zero-variate data
data.ab = 7;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'SiddChat1976'; 
data.Li = 61;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SiddChat1976';
  comment.Wwb = 'Based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 86;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'SiddChat1976';
data.Wwi = 2.7e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^3.05, see F1';

% univariate data
% time-length
data.tL = [ ... % time (yr), total length (cm)
    1 13.10
    2 17.67
    3 23.16
    4 26.65];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(27.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TahsShah2015'; 

% length-fecundity
data.LN = [ ... % std length (cm), fecundity (#)
20.483	23886.339
20.904	29850.803
22.766	44664.342
23.004	35613.198
23.369	62636.939
24.327	53499.249
25.045	50405.229
25.772	83400.518
26.067	62312.392
26.609	71269.778
27.270	77205.265
27.395	101250.381
27.630	80169.466
28.110	83119.244
28.579	34942.466
28.656	110121.221
28.772	92062.205
29.022	137144.962
29.131	92018.932
29.321	137108.902
29.483	55886.349
29.734	106983.927
29.982	140036.914
30.462	145994.166
30.470	179076.001
31.054	109832.734
31.788	175909.859
31.899	136798.778
32.091	187903.568
32.204	160822.129
32.450	187860.295
32.621	148741.874
33.122	241914.734
33.234	208818.603
33.422	241878.673
33.671	283953.956
33.784	253865.170
34.013	205717.370
34.197	223740.324
35.101	244684.207
35.779	325805.661
36.569	373830.983
36.621	340741.935
36.852	301616.430
37.580	337619.066
37.954	400731.990
38.553	397652.522
40.231	394443.107
41.888	568679.723
42.993	679825.182
43.948	661665.067
44.225	827045.269
44.414	869127.763];
units.LN = {'cm', '#'};  label.LN = {'std length', 'fecundity'};  
temp.LN = C2K(25);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'SiddChat1976';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
86.620	20596.113
86.731	5670.510
107.471	32491.907
110.574	17559.926
140.199	56302.759
140.266	47347.410
181.901	80094.412
206.056	50192.177
232.645	94911.579
241.843	65041.238
244.544	103841.478
271.579	88858.468
271.624	82888.214
274.102	151539.661
280.442	103764.936
301.293	115660.730
319.108	133533.221
328.373	94707.466
330.762	175299.420
333.820	166337.693
334.289	103650.122
346.076	127505.560
349.180	112573.578
372.464	199091.073
375.924	136397.123
384.787	151303.655
396.664	163218.584
398.919	261721.237
399.477	187093.222
408.585	169163.324
413.966	249748.900
482.904	231691.432
505.675	386866.752
509.917	219693.517
517.998	339079.269
521.660	249519.273
556.888	338996.348
640.204	398520.225
721.421	338645.528
864.521	404012.056
962.080	559027.912
1001.997	821629.365
1039.011	672296.721
1149.786	660120.222
1236.494	665905.499];
units.WN = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(25);  units.temp.WN = 'K'; label.temp.WN = 'temperature'; 
bibkey.WN = 'SiddChat1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Wwb = weights.Wwb * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.00977*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RHTB'; % Cat of Life
metaData.links.id_ITIS = '163687'; % ITIS
metaData.links.id_EoL = '205830'; % Ency of Life
metaData.links.id_Wiki = 'Labeo_bata'; % Wikipedia
metaData.links.id_ADW = 'Labeo_bata'; % ADW
metaData.links.id_Taxo = '177875'; % Taxonomicon
metaData.links.id_WoRMS = '1022798'; % WoRMS
metaData.links.id_fishbase = 'Labeo-bata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Labeo_bata}}';  
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
bibkey = 'TahsShah2015'; type = 'article'; bib = [ ...  
'author = {Sufaira Tahseen and Shahin, . and Saita Agrwal and Amitabh Chandra Dwivedi and Ashish Shivam Mishra}, ' ...
'year = {2015}, ' ...
'title = {Studies on age and growth of \emph{Labeo bata} ({H}amilton, 1822) from the middle stretch of the {G}anga river, {I}ndia}, ' ... 
'journal = {Journal of the Kalash Science}, ' ...
'volume = {3(1)}, ' ...
'pages = {61-66}, ' ...
'howpublished = {url{https://aquadocs.org/handle/1834/33381}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SiddChat1976'; type = 'article'; bib = [ ...  
'author = {Abdul Q. Siddiqui and Anil Chatterjee and Asif A. Khan}, ' ...
'year = {1976}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF THE CARP, \emph{Labeo bata} ({H}AM.) FROM THE RIVER {K}ALI, {I}NDIA}, ' ... 
'journal = {Aquaculture}, ' ...
'volume = {7}, ' ...
'pages = {181-191}, ' ...
'howpublished = {url{https://aquadocs.org/handle/1834/33381}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Labeo-bata}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

