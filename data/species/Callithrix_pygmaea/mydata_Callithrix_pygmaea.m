function [data, auxData, metaData, txtData, weights] = mydata_Callithrix_pygmaea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Callitrichidae';
metaData.species    = 'Callithrix_pygmaea'; 
metaData.species_en = 'Pygmy marmoset'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiCii', 'xiCvr', 'xiCvbe'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 125;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 91;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 694;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for female, 638 d for male';
data.am = 18.6*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'ADW';

data.Wwb = 16;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 70;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'guess';
data.Wwi = 124;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2/171;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
6.331	15.771
8.166	20.076
16.331	22.954
65.324	24.407
106.152	27.292
155.145	44.519
57.159	45.915
8.166	41.593
40.828	47.342
106.152	55.972
106.152	66.010
73.490	58.827
114.318	64.580
179.642	76.078
179.642	77.512
163.311	81.807
155.145	90.408
130.649	81.794
244.966	87.575
244.966	97.614
212.304	101.903
212.304	107.639
204.139	109.070
195.973	114.803
220.470	116.247
261.298	113.395
310.291	111.980
318.456	101.945
359.284	106.263
383.781	106.272
391.946	112.012
449.105	120.638
416.443	120.626
351.119	123.468
318.456	124.889
318.456	130.625
440.940	136.410
400.112	142.130
383.781	144.991
424.609	147.876
457.271	147.888
424.609	152.178
408.277	152.171
375.615	160.763
375.615	188.009
375.615	192.311
408.277	208.099
563.423	199.555
555.257	163.701
563.423	152.232
538.926	147.920
555.257	139.323
440.940	109.163
440.940	100.559
538.926	110.636
571.588	119.253
645.078	92.035
677.740	114.992
702.237	112.134
751.230	113.587
677.740	149.409
628.747	156.560
645.078	170.907
620.582	169.463
645.078	179.511
726.734	188.147
767.562	188.163
800.224	191.044
865.548	172.427
881.879	173.868
955.369	182.501
1020.694	208.339
1102.349	166.784
1159.508	171.109
1281.991	192.667
1322.819	192.683
1510.626	188.455
1633.110	189.937
2204.698	172.953
2523.154	165.908
2229.195	144.282
2098.546	102.644
2033.221	121.261
2090.380	144.228
2033.221	152.810
1812.752	142.685
1796.421	151.283
1780.089	152.710
1771.924	159.877
1673.937	149.800
1657.606	105.339
1224.832	102.301
1330.984	123.853
1322.819	146.794
1322.819	158.267
1461.633	169.793
1559.620	148.321
1184.004	156.778
996.197	130.892
1028.859	135.207
971.700	117.976
906.376	145.197
890.045	145.190
775.727	133.673
792.058	145.152
783.893	155.187
743.065	162.341
767.562	169.521
808.389	169.537];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(35.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BlomKowa2013';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = 'RYYQ'; % Cat of Life
metaData.links.id_ITIS = '572917'; % ITIS
metaData.links.id_EoL = '323892'; % Ency of Life
metaData.links.id_Wiki = 'Cebuella_pygmaea'; % Wikipedia
metaData.links.id_ADW = 'Callithrix_pygmaea'; % ADW
metaData.links.id_Taxo = '167532'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100206'; % MSW3
metaData.links.id_AnAge = 'Cebuella_pygmaea'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Callithrix_pygmaea}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Callithrix_pygmaea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Callithrix_pygmaea/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

