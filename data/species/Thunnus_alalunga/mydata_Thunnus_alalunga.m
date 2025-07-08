function [data, auxData, metaData, txtData, weights] = mydata_Thunnus_alalunga
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Thunnus_alalunga'; 
metaData.species_en = 'Albacore'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 20];


%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'Wiki';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12 * 365;   units.am = 'd';    label.am = 'life span';            bibkey.am = 'ZaraBabc2016';   
  temp.am = C2K(17.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 85;    units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 140;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'Wiki';

data.Wwb  = 4.63e-4;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';   bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter of 0.96 mm for Thunnus albacares: pi/6*0.096^3';
data.Wwi  = 60.3e3;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'fishbase';

data.Ri = 3e6/365;    units.Ri = '#/d';    label.Ri = 'max reproduction rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.990	50.663
0.990	51.598
0.990	52.906
0.990	53.467
1.180	54.592
1.224	48.051
1.224	50.667
1.224	51.602
1.224	55.340
1.239	47.677
1.239	56.462
1.239	57.770
1.239	60.948
1.253	58.705
1.253	59.079
1.253	59.827
1.268	49.920
1.268	54.593
1.268	56.089
1.268	57.584
1.268	58.519
1.297	52.351
1.297	56.463
1.312	49.547
1.444	65.251
1.473	56.840
1.473	57.588
1.473	58.896
1.473	59.083
1.473	59.831
1.488	50.485
1.488	52.915
1.488	56.280
1.912	63.764
1.971	58.906
1.985	59.840
1.985	60.588
1.985	61.897
1.985	68.065
2.015	66.196
2.190	70.312
2.190	72.741
2.190	73.115
2.220	58.350
2.220	60.779
2.220	61.901
2.220	62.835
2.220	63.957
2.220	65.452
2.220	66.948
2.220	67.882
2.220	68.443
2.220	68.817
2.220	69.378
2.234	74.425
2.234	75.920
2.264	57.042
2.966	77.242
2.981	66.775
2.996	68.644
2.996	73.130
3.010	69.392
3.010	69.953
3.010	71.822
3.040	78.739
3.201	78.929
3.201	79.302
3.201	80.424
3.201	81.919
3.215	83.415
3.215	84.163
3.215	84.723
3.230	75.938
3.230	76.686
3.230	77.808
3.245	87.528
3.259	69.958
3.259	75.004
3.274	67.715
3.274	71.640
3.274	72.762
3.274	73.883
3.977	79.317
3.977	81.373
3.977	83.055
3.977	84.364
3.977	85.111
3.977	86.046
3.991	71.841
3.991	75.579
4.196	85.676
4.225	86.424
4.240	76.144
4.240	78.013
4.240	84.555
4.240	86.798
4.240	87.546
4.240	87.546
4.255	74.649
4.255	87.733
4.255	88.668
4.255	89.416
4.255	90.537
4.255	94.275
4.255	95.771
4.255	96.892
4.269	79.322
4.269	81.378
4.269	83.061
4.269	92.220
4.972	80.270
4.972	83.074
4.987	86.252
5.001	91.673
5.001	92.046
5.001	93.168
5.001	93.916
5.001	94.663
5.016	87.374
5.016	89.430
5.016	90.738
5.250	81.771
5.250	85.509
5.250	86.817
5.250	93.359
5.250	94.294
5.250	95.229
5.250	95.976
5.250	98.406
5.250	99.528
5.250	100.836
5.265	91.304
5.265	92.425
5.265	103.079
5.265	104.014
5.265	105.509
5.499	86.635
5.499	87.570
5.499	89.439
5.499	90.000
5.499	91.121
5.499	92.243
5.499	93.177
5.499	93.738
5.499	94.112
5.499	94.859
5.499	95.420
5.499	99.532
5.982	89.448
5.982	91.317
5.982	92.439
5.982	96.551
5.982	97.485
5.982	97.485
5.997	96.738
5.997	98.981
6.012	102.159
6.202	96.555
6.217	98.050
6.217	109.452
6.217	110.387
6.217	111.321
6.231	88.331
6.231	90.761
6.231	98.611
6.231	99.546
6.231	100.481
6.231	101.041
6.231	101.228
6.231	102.163
6.231	102.537
6.246	104.219
6.246	105.714
6.290	121.042
6.436	93.569
6.510	99.738
6.963	108.158
6.963	110.588
6.978	93.766
6.978	96.943
6.993	98.813
6.993	99.747
6.993	101.803
6.993	102.551
6.993	103.112
6.993	104.046
6.993	104.607
6.993	105.728
7.242	104.051
7.242	109.471
7.271	102.556
7.300	100.874
7.432	109.849
7.461	108.354
7.476	100.317
7.476	103.308
7.476	113.027
7.476	113.588
7.490	114.897
7.490	119.756
7.974	113.597
8.237	100.518
8.252	105.565
8.266	101.827
8.266	106.313
8.486	97.345
8.486	99.588
8.486	102.579
8.486	105.756
8.984	101.840
9.218	106.144
9.218	108.200
9.233	110.443
9.247	116.051
9.980	104.102
10.214	109.714
11.004	107.859
12.527	112.561];
data.tL(:,1) = (data.tL(:,1) + 0.75) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(17.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZaraBabc2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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
D1 = 'birth is assumed to occur at hatch';
D2 = 'specific density of reserve and structure is taken 0.3 g/cm^3';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '56P6R'; % Cat of Life
metaData.links.id_ITIS = '172419'; % ITIS
metaData.links.id_EoL = '46577333'; % Ency of Life
metaData.links.id_Wiki = 'Thunnus_alalunga'; % Wikipedia
metaData.links.id_ADW = 'Thunnus_alalunga'; % ADW
metaData.links.id_Taxo = '46700'; % Taxonomicon
metaData.links.id_WoRMS = '127026'; % WoRMS
metaData.links.id_fishbase = 'Thunnus-alalunga'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thunnus_alalunga}}';
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
bibkey = 'ZaraBabc2016'; type = 'Article'; bib = [ ... 
'author = {V. Ortiz de Z\''{a}rate and E. A. Babcock}, ' ... 
'year = {2016}, ' ...
'title = {Estimating individual growth variability in albacore (\emph{Thunnus alalunga}) from the {N}orth {A}tlantic stock: {A}ging for assessment purposes}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {180 () }, ' ...
'pages = {54-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Thunnus-alalunga.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

