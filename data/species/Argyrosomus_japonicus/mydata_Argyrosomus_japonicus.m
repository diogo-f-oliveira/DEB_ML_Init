function [data, auxData, metaData, txtData, weights] = mydata_Argyrosomus_japonicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Argyrosomus_japonicus'; 
metaData.species_en = 'Mulloway'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab';  'am'; 'Lp'; 'Li';  'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 06]; 

%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'LikaKooy2014';   
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(25);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 52;   units.Lp   = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SilbGray2009'; 
data.Lpm = 68;   units.Lpm   = 'cm';  label.Lpm  = 'total length at puberty'; bibkey.Lpm  = 'SilbGray2009'; 
data.Li  = 181;  units.Li   = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 0.37e-3; units.Wwb = 'g';label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'LikaKooy2014';
  comment.Wwb = 'Value for Argyrosomus_regius';
data.Wwi = 75e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri = 1e6/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';     bibkey.Ri = 'fishbase';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
data.tL =	[ ... % year class (yr), total length (cm)
0.008	31.034
0.007	27.215
0.004	17.666
0.002	9.549
0.043	13.848
0.045	7.164
0.086	23.876
0.087	21.489
0.821	46.346
0.866	49.212
0.869	37.753
0.870	33.456
0.911	55.421
0.914	43.962
0.914	41.575
0.917	30.594
0.964	27.731
0.965	25.343
0.965	22.956
0.966	20.091
0.967	18.182
1.829	79.330
1.878	72.170
1.879	68.351
1.879	65.486
1.880	63.576
1.880	60.711
1.923	76.947
1.928	55.939
1.928	54.029
1.929	52.119
1.929	50.209
1.930	47.822
1.932	40.660
1.932	38.273
1.933	34.931
1.969	74.561
1.977	44.482
1.980	34.933
1.980	31.591
1.982	26.816
2.888	97.993
2.890	92.741
2.890	91.786
2.891	88.444
2.891	86.057
2.892	82.715
2.893	78.895
2.894	76.508
2.894	74.598
2.895	72.688
2.895	70.301
2.935	95.607
2.942	67.915
2.942	67.438
2.943	65.528
2.943	64.096
2.944	62.664
2.944	59.799
2.993	48.342
3.038	56.938
3.038	54.551
3.039	50.731
3.858	103.761
3.858	101.851
3.861	92.302
3.861	90.392
3.861	89.915
3.862	88.960
3.904	105.673
3.905	98.988
3.906	95.169
3.915	61.747
3.916	59.360
3.959	69.388
3.960	66.046
4.001	86.578
4.001	84.668
4.002	80.849
4.003	78.939
4.004	76.552
4.004	75.120
4.004	73.210
4.005	71.777
4.005	71.300
4.832	92.341
4.832	90.431
4.838	67.513
4.874	106.666
4.875	102.847
4.876	99.027
4.877	96.162
4.916	124.811
4.918	117.649
4.920	109.055
4.925	88.047
4.925	88.047
4.926	85.183
4.927	83.273
4.927	82.318
4.959	137.704
4.965	113.354
4.966	111.444
4.974	79.933
4.975	75.158
4.976	72.293
5.854	75.193
5.854	72.806
5.855	70.896
5.888	120.553
5.889	117.210
5.890	115.301
5.890	112.913
5.891	111.481
5.891	109.571
5.892	106.707
5.892	104.797
5.893	103.364
5.893	100.500
5.894	96.680
5.895	92.383
5.896	89.996
5.899	78.537
5.990	86.180
5.990	84.748
5.991	82.360
6.871	76.666
6.905	122.025
6.906	119.161
6.907	116.773
6.907	114.864
6.907	113.431
6.908	111.522
6.909	106.747
6.909	105.792
6.910	101.973
6.912	94.333
6.913	91.946
6.914	89.081
6.914	86.217
6.915	83.352
6.915	81.920
6.916	80.010
7.793	84.342
7.871	141.639
7.874	129.226
7.877	121.109
7.882	98.192
7.883	95.804
7.924	117.291
7.924	116.336
7.927	103.923
7.971	114.906
7.972	108.699
8.018	112.043
8.018	111.566
8.018	109.656
8.803	115.417
8.845	130.697
8.849	117.328
8.893	124.492
8.894	121.150
8.894	120.672
8.897	107.781
8.899	102.052
8.904	81.999
9.862	131.215
9.907	135.991
9.918	95.408
9.919	90.633
9.920	85.859
9.921	81.562
9.960	112.598
10.004	119.284
10.832	138.415
10.833	132.686
10.835	125.046
10.836	121.227
10.846	83.508
11.015	146.062
11.028	94.020
11.851	130.816
11.940	144.666
11.945	123.658
11.947	115.064
11.948	111.722
11.949	108.857
11.952	98.354
11.955	84.985
11.956	82.598
11.956	80.688
12.878	91.706
12.918	117.490
12.918	115.580
12.958	140.409
13.882	146.653
13.884	137.104
13.884	136.149
13.886	129.465
13.887	127.078
13.887	124.690
13.888	121.826
13.889	118.006
13.894	98.431
13.895	96.044
13.896	90.314
13.936	113.234
13.938	107.504
13.968	168.619
14.857	129.026
14.860	117.090
14.899	145.739
14.906	119.479
17.870	101.931
17.906	140.606
20.869	129.265
20.870	124.013
23.969	122.704];
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SilbGray2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = 'GKJ5'; % Cat of Life
metaData.links.id_ITIS = '169369'; % ITIS
metaData.links.id_EoL = '46578924'; % Ency of Life
metaData.links.id_Wiki = 'Argyrosomus_japonicus'; % Wikipedia
metaData.links.id_ADW = 'Argyrosomus_japonicus'; % ADW
metaData.links.id_Taxo = '161638'; % Taxonomicon
metaData.links.id_WoRMS = '218633'; % WoRMS
metaData.links.id_fishbase = 'Argyrosomus-japonicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Argyrosomus_japonicus}}';
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
bibkey = 'SilbGray2009'; type = 'Article'; bib = [ ... 
'author = {V. Silberschneider and C. A. Gray and J. Stewart}, ' ... 
'year = {2009}, ' ...
'title = {Age, growth, maturity and the overfishing of the iconic sciaenid, \emph{Argyrosomus japonicus}, in south-eastern, {A}ustralia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {95}, ' ...
'pages = {220-229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LikaKooy2014'; type = 'Article'; bib = [ ... 
'author = {Lika, K. and Kooijman, S. A. L. M. and Papandroulakis, N.}, ' ... 
'year = {2014}, ' ...
'title = {Metabolic acceleration in {M}editerranean {P}erciformes}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {94}, ' ...
'pages = {37--46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Argyrosomus-japonicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

