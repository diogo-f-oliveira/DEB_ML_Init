function [data, auxData, metaData, txtData, weights] = mydata_Ambystoma_macrodactylum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Ambystomatidae';
metaData.species    = 'Ambystoma_macrodactylum'; 
metaData.species_en = 'Long-toed salamander'; 

metaData.ecoCode.climate = {'Dsc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 30]; 


%% set data
% zero-variate data

data.am = 10*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 2.7;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';         bibkey.Lj  = 'RussPowe1996'; 
data.Lp  = 5;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';         bibkey.Lp  = 'RussPowe1996'; 
data.Li  = 8.9;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';            bibkey.Li  = 'EoL';

  
data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm for Ambystoma_mexicanum: pi/6*0.2^3';
data.Wwi = 15.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'EoL';

data.Ri = 411/365; units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';         bibkey.Ri = 'amphibiaweb';
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '90 to 411 eggs per clutch, 1 clutch per yr';


% univariate data
% t-L data
data.tL = [ ... % time since metam (d), SVL (cm)
0.000	3.075
0.000	2.819
0.000	2.709
0.000	2.574
3.003	3.222
3.003	2.965
3.003	2.880
150.162	3.408
156.169	3.787
162.175	3.958
162.175	4.411
171.185	2.993
174.188	2.615
174.188	2.724
177.192	3.299
288.312	3.998
294.318	3.790
297.321	3.607
303.328	3.521
312.338	3.827
315.341	3.998
318.344	3.705
339.367	5.514
339.367	4.390
339.367	3.204
342.370	4.194
342.370	3.925
342.370	4.023
342.370	3.314
348.377	3.803
354.383	3.510
354.383	3.412
354.383	3.021
354.383	2.899
360.390	3.926
360.390	2.692
363.393	4.317
366.396	4.427
375.406	4.073
375.406	4.012
378.409	4.195
378.409	3.877
492.532	3.635
504.545	3.794
510.552	4.185
510.552	5.114
516.558	4.528
519.562	5.725
522.565	3.819
522.565	4.100
522.565	4.650
522.565	4.784
522.565	5.603
522.565	6.300
525.568	5.004
528.571	4.345
528.571	5.224
531.575	4.015
531.575	4.235
531.575	5.102
534.578	5.982
537.581	5.029
540.584	5.322
540.584	5.616
543.588	3.807
543.588	4.284
543.588	4.455
546.591	4.101
549.594	4.614
552.597	4.736
552.597	4.834
555.601	5.714
558.604	5.115
567.614	4.932
663.718	3.846
666.721	6.205
669.724	6.632
675.731	6.034
684.740	6.755
696.753	5.106
699.756	5.032
699.756	4.519
702.760	6.535
702.760	5.839
702.760	4.641
711.769	6.829
714.773	5.729
714.773	5.521
726.786	5.033
732.792	6.059
735.795	4.740
738.799	4.520
834.903	6.013
840.909	6.135
846.916	6.428
864.935	6.086
864.935	6.233
870.942	5.622
882.955	6.013
885.958	6.197
891.964	6.356
897.971	7.114
903.977	5.708
909.984	4.792
909.984	5.941
909.984	6.026
915.990	6.307
918.994	6.246
931.006	5.843
1039.123	7.239
1039.123	6.359
1039.123	6.151
1042.127	6.652
1084.172	7.142
1087.175	6.030
1093.182	6.665
1093.182	6.348
1219.318	6.265
1243.344	7.035
1264.367	6.632
1270.373	6.143
1435.552	6.159
1630.763	6.664
1798.945	6.276];
units.tL  = {'d', 'cm'};  label.tL = {'active time since metam', 'SVL'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RussPowe1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = 'Wiki'; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CQ4G'; % Cat of Life
metaData.links.id_ITIS = '173601'; % ITIS
metaData.links.id_EoL = '1019449'; % Ency of Life
metaData.links.id_Wiki = 'Ambystoma_macrodactylum'; % Wikipedia
metaData.links.id_ADW = 'Ambystoma_macrodactylum'; % ADW
metaData.links.id_Taxo = '47374'; % Taxonomicon
metaData.links.id_WoRMS = '1498305'; % WoRMS
metaData.links.id_amphweb = 'Ambystoma+macrodactylum'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ambystoma_macrodactylum'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ambystoma_macrodactylum}}';
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
bibkey = 'RussPowe1996'; type = 'Article'; bib = [ ... 
'author = {Anthony P. Russell and G. Lawrence Powell and Dean R. Hall}, ' ... 
'year = {1996}, ' ...
'title = {Growth and age of {A}lberta long-toed salamanders (\emph{Ambystoma macrodsctylum krausei}): a comparison of two methods of estimation}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {74}, ' ...
'pages = {397-412}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Ambystoma+macrodactylum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1019449}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Ambystoma_macrodactylum_croceum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ambystoma_macrodactylum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


