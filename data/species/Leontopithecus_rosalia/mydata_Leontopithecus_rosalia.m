function [data, auxData, metaData, txtData, weights] = mydata_Leontopithecus_rosalia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Callitrichidae';
metaData.species    = 'Leontopithecus_rosalia'; 
metaData.species_en = 'Golden lion tamarin'; 
metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHn', 'xiHs', 'xiCii', 'xiCvbe'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(39.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 

%% set data
% zero-variate data

data.tg = 128;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(39.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'ThomPowe1994: 39.6C day, 37.4C night';
data.tx = 131;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 547;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for female, 730 d for male';
data.am = 31.6*365; units.am = 'd';  label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(39.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 26.1;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';

data.Wwb = 55.3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 165;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwi = 645.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/189; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ThomPowe1994';   
  temp.Ri = C2K(39.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
8.166	60.461
8.166	63.104
8.166	68.840
8.166	78.878
32.662	106.135
48.993	152.030
48.993	164.936
48.993	169.238
65.324	174.981
57.159	183.582
57.159	187.884
65.324	202.228
65.324	206.530
57.159	217.999
57.159	225.169
81.655	243.821
97.987	258.168
89.821	275.373
89.821	298.318
97.987	316.963
138.814	325.584
155.145	357.139
114.318	381.501
122.483	395.845
163.311	397.295
163.311	405.899
204.139	450.370
171.477	456.093
302.125	457.579
293.960	464.746
163.311	473.299
195.973	474.746
204.139	479.051
269.463	479.077
195.973	499.124
204.139	507.732
269.463	510.625
228.635	514.911
228.635	519.213
261.298	547.907
179.642	555.045
269.463	559.382
293.960	563.694
293.960	569.430
318.456	570.874
326.622	572.311
375.615	575.199
302.125	583.774
302.125	589.510
318.456	590.950
334.787	592.391
220.470	592.346
253.132	593.793
269.463	602.403
293.960	602.413
326.622	615.332
383.781	588.108
449.105	601.040
391.946	619.660
383.781	625.393
408.277	646.913
351.119	687.044
506.264	661.292
555.257	664.179
498.098	675.629
571.588	681.394
555.257	697.162
579.754	712.946
465.436	634.029
538.926	635.492
555.257	644.103
596.085	654.157
628.747	657.038
702.237	659.935
612.416	638.389
628.747	632.659
628.747	624.055
612.416	612.576
751.230	639.878
816.555	635.601
865.548	639.923
832.886	654.250
963.535	675.812
906.376	684.394
865.548	687.246
890.045	703.030
988.031	700.200
1020.694	721.723
1159.508	749.025
1200.336	743.305
1641.275	750.648
1567.785	727.675
1535.123	706.151
1388.143	703.225
1388.143	720.434
1175.839	704.576
1175.839	711.746
1135.011	687.352
1094.183	670.127
1330.984	684.560
1347.315	671.661
1290.157	651.562
1559.620	668.876
1567.785	694.692
1673.937	711.942
1869.911	694.810
1771.924	643.147
1788.255	647.455
1804.586	647.462
1902.573	633.160
1894.407	598.740
1584.116	600.052
1510.626	625.836
1551.454	625.852
1592.282	635.906
1388.143	634.392];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(39.0);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BlomKowa2013';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '3T6ZV'; % Cat of Life
metaData.links.id_ITIS = '572922'; % ITIS
metaData.links.id_EoL = '323897'; % Ency of Life
metaData.links.id_Wiki = 'Leontopithecus_rosalia'; % Wikipedia
metaData.links.id_ADW = 'Leontopithecus_rosalia'; % ADW
metaData.links.id_Taxo = '65681'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100214'; % MSW3
metaData.links.id_AnAge = 'Leontopithecus_rosalia'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leontopithecus_rosalia}}';
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
bibkey = 'ThomPowe1994'; type = 'Article'; bib = [ ... 
'author = {Thompson S. D. and Power M. L. and Rutledge C. E. and Kleiman D. G.}, ' ... 
'year = {1994}, ' ...
'title = {Energy metabolism and thermoregulation in the golden lion tamarin (\emph{Leontopithecus rosalia})}, ' ...
'journal = {Folia Primatol (Basel)}, ' ...
'volume = {63}, ' ...
'number = {3}, '...
'pages = {131--143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BlomKowa2013'; type = 'Incollection'; bib = [ ... 
'author = {G. E. Blomquist and M. M. Kowalewski and S. R. Leigh}, ' ... 
'year = {2013}, ' ...
'title = {Demographic and Morphological Perspectives on Life History Evolution and Conservation of New World Monkeys}, ' ...
'booktitle = {South American Primates}, ' ...
'howpublished = {\url{http://publish.illinois.edu/martinkowalewski/files/2013/03/Blomquistetal2009.pdf}}, ' ...
'publisher = {Illinois Univ Press}, ' ...
'editor = {P. A. Garber}, '...
'pages = {117--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Leontopithecus_rosalia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

