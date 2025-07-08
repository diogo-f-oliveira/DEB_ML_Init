function [data, auxData, metaData, txtData, weights] = mydata_Bitis_arietans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Bitis_arietans'; 
metaData.species_en = 'Puff adder'; 

metaData.ecoCode.climate = {'A', 'Cw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O', 'Apa'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f','L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 27];

%% set data
% zero-variate data

data.ab = 136;     units.ab = 'd';    label.ab = 'age at puberty for females';  bibkey.ab = 'ADW';
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '136 to 159 d';
data.tp = 4*365;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'ADW';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15.8*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 15;    units.Lb  = 'cm';  label.Lb  = 'total length oat birth';  bibkey.Lb  = 'Wiki';
  comment.Lb = '12.5 to 17.5 cm; ADW gives 23.5 to 25.5 cm';
data.Li  = 190;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki';

data.Wwb = 3.5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based om (Lb/Li)^3*Wwi; ADW gives 14 to 25 g';
data.Wwi = 6.8e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'ADW';
  
data.Ri  = 156/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '156 young per litter in a zoo, the largest litter of any snake species';

% univariate data
% time-length data 
data.tL_f1 = [ ... % time (d), total length (cm)
0.001	35.054
0.107	38.964
0.164	40.919
0.230	44.015
0.393	46.131
0.499	48.899
0.508	52.975
0.549	56.235
0.590	58.517
0.720	60.143
0.826	61.771
0.915	63.399
0.957	66.333
1.014	68.288
1.168	70.892
1.339	71.540
1.640	73.488
1.786	74.788
2.185	78.854
2.640	82.265
3.412	85.831
4.330	90.045
5.224	94.260
5.996	97.826];
data.tL_f1(:,1) = 365 * data.tL_f1(:,1);
units.tL_f1  = {'d', 'cm'};  label.tL_f1 = {'time', 'total length', 'female 1'};  
temp.tL_f1   = C2K(24);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'Jaco1986';
comment.tL_f1 = 'data for female 1';
%
data.tL_f2 = [ ... % time (d), total length (cm)
0.002	38.315
0.059	41.738
0.157	45.485
0.230	47.113
0.425	47.760
0.499	49.389
0.556	52.648
0.606	57.049
0.655	60.308
0.737	62.752
0.810	65.848
0.884	68.943
0.957	70.246
1.080	73.340
1.169	74.316
1.332	74.801
1.526	75.448
1.632	76.260
1.771	78.539
1.795	80.658
1.828	82.939
2.007	84.565
2.226	85.211
2.422	87.489
2.609	89.440
2.853	91.064
3.137	92.523
3.422	93.657
3.649	94.792
3.844	95.765
4.112	96.899
4.397	98.196
4.665	99.004
4.957	100.789
5.209	102.576
5.477	103.384
5.746	104.681
5.973	105.979];
data.tL_f2(:,1) = 365 * data.tL_f2(:,1);
units.tL_f2  = {'d', 'cm'};  label.tL_f2 = {'time', 'total length', 'female 1'};  
temp.tL_f2   = C2K(24);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'Jaco1986';
comment.tL_f2 = 'data for female 2';
%
data.tL_m1 = [ ... % time (d), total length (cm)
0.009	35.054
0.075	37.987
0.156	42.224
0.263	45.482
0.409	48.250
0.508	55.584
0.549	59.822
0.583	63.897
0.697	68.948
0.804	74.489
0.902	77.258
1.024	80.190
1.292	81.976
1.487	83.927
1.707	86.856
1.911	90.437
2.041	94.347
2.237	96.787
2.489	99.389
2.708	101.502
3.131	103.121
3.748	105.387
4.472	108.628
5.251	111.216
6.007	113.804];
data.tL_m1(:,1) = 365 * data.tL_m1(:,1);
units.tL_m1  = {'d', 'cm'};  label.tL_m1 = {'time', 'total length', 'male 1'};  
temp.tL_m1   = C2K(24);  units.temp.tL_m1 = 'K'; label.temp.tL_m1 = 'temperature';
bibkey.tL_m1 = 'Jaco1986';
comment.tL_m1 = 'data for male 1';
%
data.tL_m2 = [ ... % time (d), total length (cm)
0.002	42.554
0.157	46.137
0.255	49.558
0.393	50.044
0.483	52.976
0.524	55.094
0.590	58.517
0.850	62.096
0.915	63.725
0.948	66.822
1.046	68.776
1.168	70.892
1.404	72.027
1.697	73.813
1.949	76.088
2.160	78.365
2.599	78.679
3.127	80.295
4.053	83.205
5.003	86.440
5.978	90.001];
data.tL_m2(:,1) = 365 * data.tL_m2(:,1);
units.tL_m2  = {'d', 'cm'};  label.tL_m2 = {'time', 'total length', 'male 2'};  
temp.tL_m2   = C2K(24);  units.temp.tL_m2 = 'K'; label.temp.tL_m2 = 'temperature';
bibkey.tL_m2 = 'Jaco1986';
comment.tL_m2 = 'data for male 2';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
    40   87
    50  167
    60  270
    70  400
    80  600
    84  840
    90 1010
   100 1135
   110 1230];
units.LW  = {'cm', 'g'};  label.LW = {'total length','wet weight'};  
bibkey.LW = 'Jaco1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f1 = 5 * weights.tL_f1;
weights.tL_f2 = 5 * weights.tL_f2;
weights.tL_m1 = 10 * weights.tL_m1;
weights.tL_m2 = 5 * weights.tL_m2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f1','tL_f2','tL_m1','tL_m2'}; subtitle1 = {'Data for female 1,2, male 1,2'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LXKX'; % Cat of Life
metaData.links.id_ITIS = '634949'; % ITIS
metaData.links.id_EoL = '1057058'; % Ency of Life
metaData.links.id_Wiki = 'Bitis_arietans'; % Wikipedia
metaData.links.id_ADW = 'Bitis_arietans'; % ADW
metaData.links.id_Taxo = '50307'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Bitis&species=arietans'; % ReptileDB
metaData.links.id_AnAge = 'Bitis_arietans'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bitis_arietans)}}';
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
bibkey = 'Jaco1986'; type = 'Article'; bib = [ ... 
'author = {N.H.G. Jacobsen}, ' ... 
'year = {1986}, ' ...
'title = {GROWTH OF PUFF ADDERS (\emph{Bitis arietans)}) IN CAPTIVITY}, ' ...
'journal = {J. Herp. Assoc. Afr.}, ' ...
'volume = {32}, ' ...
'pages = {341-351}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bitis_arietans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Bitis_arietans/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

