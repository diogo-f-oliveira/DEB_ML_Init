function [data, auxData, metaData, txtData, weights] = mydata_Petrus_rupestris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Petrus_rupestris'; 
metaData.species_en = 'Red steenbras'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'WWp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 06];

%% set data
% zero-variate data

data.am = 33*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'SmalPunt1991';   
  temp.am = C2K(24.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 57.5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 200;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum of Acanthopagrus_berda: pi/6*0.075^3';
data.Wwp = 3463; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01549*Li^3.04, see F1';
data.Wwi = 153e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.04, see F1; max. published weight: 80.0 kg';

data.GSI  = 0.06; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'Smal1988';   
  temp.GSI = C2K(24.3); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
0.543	18.469
0.684	10.360
1.460	20.719
1.690	19.991
1.917	24.427
1.965	19.265
2.010	22.217
2.284	25.179
2.420	30.595
2.421	28.382
2.560	24.453
2.650	28.391
2.834	26.431
2.876	36.515
2.877	34.794
2.923	33.074
2.970	30.125
3.380	38.749
3.381	34.569
3.792	41.225
3.885	37.294
3.932	33.853
4.022	39.021
4.066	44.187
4.070	34.351
4.346	30.920
4.434	41.497
4.570	44.453
4.753	46.182
4.797	50.118
4.798	48.151
4.802	39.299
4.888	53.565
4.892	43.237
4.940	37.829
5.350	45.469
5.353	36.371
5.439	52.112
5.531	49.903
5.578	47.937
5.756	62.699
5.808	47.701
5.849	60.243
5.855	42.785
5.901	44.262
5.941	57.788
5.943	53.854
5.944	50.903
5.946	45.739
5.993	41.315
6.219	51.652
6.262	59.031
6.357	49.691
6.401	54.856
6.449	50.432
6.719	62.492
6.721	57.820
6.768	54.871
6.770	50.199
6.860	53.646
6.861	51.678
6.899	72.336
6.904	60.533
6.948	65.452
7.412	50.717
7.686	52.696
7.779	50.732
7.863	71.883
7.864	68.933
7.865	66.474
7.866	63.769
7.914	57.869
7.958	61.559
7.959	59.592
8.052	56.891
8.229	73.374
8.322	70.427
8.508	63.795
8.509	61.336
8.778	78.068
8.830	61.841
8.832	56.923
8.917	74.386
8.919	68.976
8.920	65.533
8.964	69.961
9.012	64.062
9.055	72.424
9.376	73.421
9.515	69.738
9.517	65.066
9.835	71.718
9.879	75.900
9.882	69.999
9.966	88.691
9.968	84.265
9.969	83.281
9.970	79.593
9.972	72.953
10.015	81.562
10.016	77.381
10.477	73.220
10.703	81.836
10.842	78.399
10.885	84.794
10.886	83.073
10.930	87.255
11.026	76.193
11.027	74.226
11.028	73.243
11.029	71.521
11.621	79.906
11.849	84.096
11.850	81.145
11.896	79.918
11.897	77.213
11.985	88.774
11.990	75.495
12.029	91.480
12.077	87.548
12.857	86.842
12.862	73.072
12.900	93.729
12.947	91.272
12.949	85.125
12.993	89.307
13.042	83.407
13.081	100.868
13.725	95.484
13.908	96.721
13.909	93.279
13.953	98.936
15.009	97.996
15.010	94.307
15.011	90.619
15.833	101.964
15.881	95.573
15.922	108.361
15.926	98.771
15.927	98.034
16.015	103.939
16.061	105.416
17.027	97.095
17.941	105.985
17.990	97.626
18.035	101.563
18.078	107.958
18.171	104.273
18.900	118.319
18.905	105.041
18.953	99.141
18.996	106.520
19.041	109.227
19.043	102.588
21.930	112.296
22.844	119.956
22.888	124.876
22.889	122.909
22.940	110.124
22.984	115.044
23.948	112.379
23.949	109.920
23.991	118.774
24.038	115.579
24.956	116.600
24.958	110.945
26.925	125.288
27.979	127.790
28.030	113.038
28.990	123.159
30.964	118.322
32.936	118.403];
data.tL(:,1) = 365 * (data.tL(:,1) + 0.1);
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL  = C2K(24.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SmalPunt1991'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01549*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76VTH'; % Cat of Life
metaData.links.id_ITIS = '647966'; % ITIS
metaData.links.id_EoL = '46580019'; % Ency of Life
metaData.links.id_Wiki = 'Petrus_rupestris'; % Wikipedia
metaData.links.id_ADW = 'Petrus_rupestris'; % ADW
metaData.links.id_Taxo = '183610'; % Taxonomicon
metaData.links.id_WoRMS = '218611'; % WoRMS
metaData.links.id_fishbase = 'Petrus-rupestris'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Petrus_rupestris}}';
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
bibkey = 'SmalPunt1991'; type = 'article'; bib = [ ... 
'doi = {10.2989/02577619109504626}, ' ...
'author = {M. J. Smale and A. E. Punt}, ' ... 
'year = {1991}, ' ...
'title = {AGE AND GROWTH OF THE RED STEENBRAS \emph{Petrus rupestris} ({P}ISCES: {S}PARIDAE) ON THE SOUTH-EAST COAST OF {S}OUTH {A}FRICA}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'chapter = {10}, ' ...
'pages = {131-139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smal1988'; type = 'article'; bib = [ ... 
'author = {M. J. Smale}, ' ... 
'year = {1988}, ' ...
'title = {Distribution and reproduction of the reef fish \emph{Petrus rupestris} ({P}isces: {S}paridae) off the coast of South Africa}, ' ...
'journal = {S.-Afr. Tydskr. Dierk.}, ' ...
'chapter = {23(4)}, ' ...
'pages = {272-287}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Petrus-rupestris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

