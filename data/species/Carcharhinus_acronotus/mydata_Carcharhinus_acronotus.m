function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_acronotus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_acronotus'; 
metaData.species_en = 'Blacknose shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2019 01 09];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 01 09];


%% set data
% zero-variate data

data.ab = 11*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'Wiki';   
  temp.ab = C2K(25.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5.5 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BarrLess2011';
  temp.tp = C2K(25.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp interpolation in tL data';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(25.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 50;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'BarrLess2011';  
data.Lp  = 115;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = '220  to 300 cm';
data.Li  = 200;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 18.9e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 4.5/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(25.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'varies between 3 and 6 pups per yr';

 % uni-variate data
 
% time-length data post birth
data.tL = [ ... % time since birth (yr), total length (cm)
0.003	61.469
0.006	48.675
0.006	46.668
0.006	45.664
0.006	43.908
0.005	42.653
0.010	60.467
0.010	59.464
0.011	49.679
0.028	57.708
0.028	56.955
0.028	56.705
0.028	56.454
0.028	55.450
0.029	55.199
0.029	53.694
0.029	52.941
0.029	52.690
0.029	52.188
0.029	51.938
0.029	51.436
0.029	50.934
0.029	50.432
0.914	63.005
0.915	62.503
0.915	61.499
0.915	60.245
0.950	58.741
0.951	57.737
0.951	56.483
0.951	54.726
0.969	53.723
0.984	73.795
0.985	69.781
1.961	63.539
1.961	61.281
1.978	65.296
1.995	76.336
2.952	80.882
2.971	75.112
2.972	62.818
2.986	96.941
2.987	88.159
3.961	95.968
3.962	90.699
3.963	82.921
4.953	110.049
4.954	98.508
4.955	95.999
4.972	94.996
4.973	86.967
5.947	100.044
5.948	97.786
5.948	94.023
5.963	113.844
5.982	109.078
5.982	106.067
5.982	105.565
5.982	104.812
6.922	104.842
6.940	108.606
6.940	107.602
6.940	106.097
6.940	105.093
6.940	105.093
6.940	103.839
6.941	96.061
6.974	121.152
6.975	113.123
6.975	111.116
6.994	102.837
6.994	102.084
6.994	101.081
6.994	100.077
6.994	99.074
7.010	114.630
7.933	110.895
7.933	110.142
7.933	110.142
7.933	109.390
7.950	114.157
7.950	111.648
7.951	103.118
7.968	115.161
7.969	108.136
7.986	107.133
7.987	106.130
8.943	120.963
8.979	116.698
8.980	106.161
8.980	105.157
8.996	115.695
8.997	115.194
8.997	112.936
8.997	112.434
8.997	111.179
8.997	110.928
8.997	109.423
9.014	114.692
9.014	114.191
9.014	114.191
9.936	121.997
9.936	120.241
9.936	118.234
9.936	117.732
9.936	116.729
9.937	115.976
9.972	115.475
9.972	113.468
9.988	127.770
9.990	114.221
9.990	112.214
9.990	110.960
9.991	107.447
9.991	105.942
10.912	119.268
10.912	118.264
10.912	117.261
10.948	115.506
10.982	124.790
10.982	123.034
10.982	122.281
10.982	122.030
10.982	121.277
10.983	120.525
10.983	113.751
11.001	112.246
11.976	116.291
11.977	112.276
11.993	129.338
11.993	127.331
11.993	124.320
11.993	123.567
11.993	122.564
11.993	121.811
11.993	121.811
11.994	120.807
11.994	120.055
11.994	118.048
11.994	115.288
11.995	110.521
12.933	129.618
12.968	126.859
12.969	126.107
12.969	125.354
12.969	125.354
12.969	124.601
12.969	124.350
12.969	123.849
12.969	123.347
12.969	122.343
12.969	122.343
13.961	131.407
13.961	130.654
13.961	130.152
13.961	129.400
13.962	126.389
13.963	115.099
13.980	125.386
13.980	121.371
13.980	119.615
13.998	124.132
14.954	132.943
14.954	131.940
14.955	131.438
14.955	130.434
14.955	129.932];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'BarrLess2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.tp = 0 * weights.tp;

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Placental viviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R3M6'; % Cat of Life
metaData.links.id_ITIS = '160304'; % ITIS
metaData.links.id_EoL = '46559790'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_acronotus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_acronotus'; % ADW
metaData.links.id_Taxo = '106442'; % Taxonomicon
metaData.links.id_WoRMS = '158508'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-acronotus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_acronotus}}';
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
bibkey = 'BarrLess2011'; type = 'Article'; bib = [ ... 
'author = {Rodrigo R. Barreto and Rosangela P. Lessa and Fabio H. Hazin and Francisco M. Santana}, ' ... 
'year = {2011}, ' ...
'title = {Age and growth of the blacknose shark, \emph{Carcharhinus acronotus} ({P}oey, 1860) off the northeastern {B}razilian Coast}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {110}, ' ...
'pages = {170-176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-plumbeus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

