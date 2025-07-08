function [data, auxData, metaData, txtData, weights] = mydata_Testudo_hermanni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Testudinidae';
metaData.species    = 'Testudo_hermanni'; 
metaData.species_en = 'Hermann''s tortoise'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
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

data.ab = 90;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '80 till 100 d; all temps are guessed';
data.ap = 4560;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'AnAge';
  temp.ap = C2K(24);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 31.7*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'life span is probably underestimated';

data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'ADW'; 
data.Li  = 23;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';bibkey.Li  = 'ADW';

data.Wwb = 12.8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';   bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Testudo_graeca';
data.Wwi = 2500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'ADW';

data.Ri  = 14/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 till 3 clutches per yr, 7 eggs per clutch';
  
% uni-variate data

% time-weight
data.tW = [ ... % time (d), wet weight (g)
28.070	9.627
294.737	134.778
336.842	182.912
364.912	33.695
378.947	120.337
463.158	197.353
477.192	139.591
589.473	192.539
645.613	139.591
701.754	178.099
701.754	221.420
729.824	62.576
757.894	279.182
842.105	182.912
870.175	259.928
926.315	240.674
940.350	192.539
1052.631	245.488
1108.771	283.995
1150.877	96.270
1150.877	62.576
1192.982	221.420
1192.982	317.690
1207.017	274.368
1319.297	91.456
1361.403	255.115
1375.438	192.539
1389.473	279.182
1459.649	428.400
1459.649	389.892
1459.649	235.861
1473.684	288.809
1614.034	351.384
1628.070	269.555
1628.070	404.332
1698.245	336.944
1712.280	235.861
1712.280	389.892
1810.526	476.535
1824.561	332.130
1824.561	399.519
1936.841	457.281
1978.947	312.876
1978.947	413.959
2105.263	293.622
2105.263	399.519
2203.508	481.348
2217.543	553.550
2273.684	206.980
2301.754	346.571
2329.824	476.535
2357.894	524.669
2385.964	361.011
2428.070	462.094
2456.139	519.856
2456.139	187.726
2512.280	452.467
2540.350	582.431
2554.386	630.566
2568.420	298.436
2694.736	423.586
2694.736	592.058
2708.771	548.737
2764.912	481.348
2764.912	283.995
2807.017	370.638
2919.297	794.224
2919.297	803.851
2947.368	702.768
2961.403	423.586
3045.613	466.907
3059.649	731.649
3073.684	539.110
3073.684	413.959
3087.718	707.581
3129.824	490.975
3298.245	900.120
3312.280	948.255
3326.315	563.177
3340.350	515.042
3396.490	572.804
3438.595	876.053
3452.631	539.110
3452.631	577.618
3480.701	818.292
3522.806	515.042
3635.087	1073.406
3705.263	669.074
3719.297	1160.048
3817.543	543.923
3873.684	572.804
3887.718	669.074
3901.753	972.323
3915.789	529.483
3999.999	861.613
4014.034	1102.287
4028.069	986.763
4042.105	789.411
4126.315	1251.504
4140.350	986.763
4140.350	601.685
4210.526	755.716
4210.526	1092.660
4252.631	986.763
4266.666	572.804
4294.736	1039.711
4364.911	1174.489
4364.911	697.954
4407.016	755.716
4421.052	1294.826
4435.087	909.747
4463.157	611.312
4505.263	1020.457
4519.297	1121.540
4519.297	640.193
4547.368	900.120
4603.508	601.685
4645.613	933.815
4687.718	1092.660
4729.824	1203.370
4743.859	717.208
4757.894	1025.271
4757.894	1294.826
4757.894	746.089
4856.139	1049.338
4870.174	620.939
4870.174	673.887
4926.315	1198.556
4982.455	611.312
5024.561	1030.084
5038.595	1150.421
5052.631	640.193
5136.841	1222.624
5164.911	717.208
5192.982	1352.587
5235.087	1270.758
5249.122	1155.235
5263.157	1135.981
5277.192	664.260
5347.368	606.498
5375.438	1217.810
5403.508	1044.525
5431.578	1419.976
5543.859	1294.826
5599.999	1275.572
5922.806	1371.841
6259.648	1569.194
6385.964	1506.619
6610.526	1660.650
6750.876	1583.634
7003.508	1617.329
7115.788	1569.194
7214.034	1790.614
7312.279	1598.075
7340.350	1670.277
7452.630	1588.448
7677.192	1723.225
7845.613	1679.904
8056.139	1699.158
8252.630	1564.380
8407.016	1718.412
8617.542	1776.173
8799.999	1891.697
8912.279	1800.241
9080.700	1978.339
9136.841	1891.697
9305.262	1862.816];
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
F1 = 'If eggs develop mostly in males between 31.5 and 33.5 C, at 31.5 and 34 C the sex ratio is 50/50';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'Males are smaller than females and reach puberty earlier';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7C3D6'; % Cat of Life
metaData.links.id_ITIS = '551866'; % ITIS
metaData.links.id_EoL = '1055218'; % Ency of Life
metaData.links.id_Wiki = 'Testudo_hermanni'; % Wikipedia
metaData.links.id_ADW = 'Testudo_hermanni'; % ADW
metaData.links.id_Taxo = '607892'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Testudo&species=hermanni'; % ReptileDB
metaData.links.id_AnAge = 'Testudo_hermanni'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Testudo_hermanni}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Testudo_hermanni/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Testudo_hermanni}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1055218/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

