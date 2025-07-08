function [data, auxData, metaData, txtData, weights] = mydata_Duttaphrynus_melanostictus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Duttaphrynus_melanostictus'; 
metaData.species_en = 'Asian common toad'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFl','0iFm','jiTf','jiTs','jiTd','jiTa','jiTi'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 25];

%% set data
% zero-variate data

data.ab = 10;    units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Kuzm2017';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '1-2 wk';
data.tp = 2.5*365;    units.tp = 'd';    label.tp = 'time since metam at puberty for female'; bibkey.tp = 'guess';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 7;   units.Lj  = 'cm';  label.Lj  = 'SVL for females at metam';   bibkey.Lj  = 'amphibiaweb';
data.Li  = 8.5;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'ADW';
  comment.Lim = '6.5 to 8.5 cm';
data.Lim  = 8.3; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'ADW';
  comment.Lim = '5.7 to 8.3 cm';

data.Wwb = 1.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';

data.Ri  = 4e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4e4  eggs per clutch, 2 clutches per yr'; 

% uni-variate data
% time-length
data.tL = [ ... % time (yr), SVL (cm)
0.980	5.173
0.992	3.182
0.992	2.266
1.005	7.045
1.005	6.686
1.005	6.567
1.005	5.850
1.005	3.421
1.005	1.748
1.005	1.430
1.018	4.217
1.018	3.699
1.031	10.230
1.972	6.404
1.985	5.926
1.985	6.921
1.985	7.399
1.985	7.638
1.985	7.997
1.985	8.235
1.985	8.753
1.985	9.550
2.010	4.452
2.010	11.302
2.010	12.895
2.990	10.023
2.990	6.877
3.003	10.422
3.003	8.749
3.003	8.431
3.003	7.674
3.003	7.315
3.003	6.559
3.003	5.484
3.003	4.886
3.003	4.249
3.003	3.692
3.015	7.913
4.008	12.011
4.008	10.457
4.008	8.745
4.020	13.564
4.020	11.453
4.020	10.179
4.020	9.303
4.020	7.988
5.000	7.108
5.000	9.100
5.013	6.033
5.013	11.967
5.025	13.002
9.020	15.176];	
data.tL(:,1) = (data.tL(:,1) + 0.8) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL    = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KumbLad2017'; 

% time-weight
data.tW  = [ ... % time (yr), weight (g)
0.960	4.351
0.960	5.690
0.989	40.502
1.003	10.042
1.003	12.385
1.003	15.398
1.949	20.084
1.977	52.218
1.977	50.209
1.977	45.523
1.977	42.510
1.977	35.146
1.977	30.795
1.977	28.787
1.977	25.105
1.977	23.096
1.977	18.075
1.977	14.728
1.992	9.707
2.020	47.197
2.980	6.360
2.980	46.527
2.994	10.377
2.994	12.050
2.994	25.774
2.994	30.795
2.994	40.167
2.994	41.841
2.994	54.895
3.008	20.753
3.008	38.159
3.969	102.762
3.969	80.669
3.983	70.293
3.983	53.556
3.983	49.540
3.983	48.870
3.997	65.272
3.997	62.929
3.997	45.188
3.997	40.502
4.972	20.084
4.972	70.962
4.972	80.669
5.000	68.285
5.000	93.389
8.983	150.293];	
data.tW(:,1) = (data.tW(:,1) + 0.8) * 365; % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(25); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KumbLad2017'; 

% length-weight
data.LW = [ ... % SVL (cm), weight (g)
1.471	5.210
1.601	6.078
1.904	7.236
2.250	3.763
2.250	5.210
3.159	3.473
3.245	5.789
3.375	6.946
3.462	3.473
3.505	4.920
3.635	4.052
3.678	6.368
3.721	9.262
4.154	42.836
4.154	5.499
4.197	10.709
4.413	10.709
4.500	21.129
4.500	26.049
4.889	11.867
5.149	9.841
5.495	11.288
5.928	16.208
6.058	93.488
6.231	17.366
6.317	35.890
6.404	24.023
6.490	18.813
6.490	25.470
6.534	42.836
6.577	10.999
6.663	30.391
6.663	44.573
6.707	12.735
6.750	16.208
6.793	21.418
6.837	20.550
6.837	38.495
6.880	14.761
6.880	24.602
6.880	30.391
6.923	13.025
7.183	38.495
7.269	20.260
7.312	26.049
7.356	27.786
7.356	29.522
7.399	40.232
7.529	10.130
7.529	30.680
7.615	20.260
7.659	48.046
7.832	22.865
7.875	10.709
7.962	21.129
7.962	40.810
7.962	42.836
8.048	50.941
8.178	46.310
8.221	25.760
8.264	53.546
8.524	40.810
8.697	62.518
8.784	46.599
8.784	54.124
8.827	52.098
8.957	48.915
9.173	69.175
9.389	70.912
9.519	30.391
10.038	55.572
10.212	40.521
10.212	80.463
10.644	46.020
11.250	47.467
11.423	70.912
11.942	65.123
12.072	70.622
12.808	22.287
12.981	80.753
13.587	102.750
15.101	150.507];	
units.LW   = {'cm', 'g'};  label.LW = {'SVL', 'wet weight'};  
bibkey.LW = 'KumbLad2017'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;
weights.ab = 0 * weights.ab;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6DQ3T'; % Cat of Life
metaData.links.id_ITIS = '773557'; % ITIS
metaData.links.id_EoL = '62668182'; % Ency of Life
metaData.links.id_Wiki = 'Duttaphrynus_melanostictus'; % Wikipedia
metaData.links.id_ADW = 'Duttaphrynus_melanostictus'; % ADW
metaData.links.id_Taxo = '988909'; % Taxonomicon
metaData.links.id_WoRMS = '1359445'; % WoRMS
metaData.links.id_amphweb = 'Duttaphrynus+melanostictus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Duttaphrynus_melanostictus}}';
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
bibkey = 'KumbLad2017'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1565404}, ' ...
'author = {Suresh M. Kumbar and Swapnali B. Lad}, ' ... 
'year = {2017}, ' ...
'title = {DETERMINATION OF AGE AND LONGEVITY OF ROAD MORTAL {I}NDIAN COMMON TOAD \emph{Duttaphrynus melanostictus} BY SKELETOCHRONOLOGY}, ' ...
'journal = {Russian Journal of Herpetology}, ' ...
'volume = {24(3)}, ' ...
'pages = {217-222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Duttaphrynus+melanostictus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Duttaphrynus_melanostictus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

