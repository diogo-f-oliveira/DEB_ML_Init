function [data, auxData, metaData, txtData, weights] = mydata_Heterodon_nasicus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Heterodon_nasicus'; 
metaData.species_en = 'Western hognose snake'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTg', 'biTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 56;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'AnAge';
  temp.ab = C2K(24.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '49-63 d';
data.tp = 730;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19.8*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 18;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'Wiki';
  comment.Lb = '13-23 cm';
data.Li  = 154;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'WallEcke1999';
data.Lim  = 66.3;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male'; bibkey.Lim  = 'WallEcke1999';

data.Wwb = 2.3;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'guess';
  comment.Wwi = 'based on (Lb/Li)^3*Wwi=(18/116)^3*601';
data.Wwi = 1498;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Li and LW data: (154/80)^3*210';
  
data.Ri  = 12/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '13 eggs per clutch, 1 clutch per yr assumed';

% univariate data
% length-weight
data.LW_f = [ ... % time lengthh (cm), wet weight (g)
29.545	10.471
29.797	23.238
30.202	16.773
30.467	17.871
30.982	12.107
31.325	15.254
32.056	19.219
32.873	14.915
32.905	12.001
34.185	14.918
34.279	15.752
34.668	18.711
34.968	20.485
35.154	24.113
35.229	14.920
35.700	22.227
35.814	21.243
36.091	28.775
36.361	20.769
36.564	22.946
36.569	22.230
36.592	19.318
36.884	24.671
37.183	60.212
37.209	26.050
37.448	23.903
37.706	19.763
38.346	26.054
38.360	24.014
39.285	25.244
39.387	27.889
39.479	32.385
39.725	30.952
39.755	26.176
40.474	26.900
40.527	20.040
40.575	30.262
40.899	38.473
40.907	36.936
41.570	29.188
41.598	49.359
41.807	31.382
42.511	42.704
42.518	41.184
42.660	38.306
42.739	49.814
43.483	30.134
43.674	43.490
43.850	34.678
43.915	48.926
44.139	60.533
44.221	39.726
44.400	31.391
44.746	41.947
44.871	43.891
44.905	37.120
44.915	35.316
45.725	36.622
45.967	43.304
46.081	48.937
46.524	43.306
46.912	50.977
47.031	56.574
47.076	45.727
48.017	60.831
48.921	53.108
49.074	51.685
49.262	43.122
49.338	60.018
49.390	47.210
49.504	55.320
49.549	45.121
49.679	49.176
50.037	74.935
50.407	55.075
50.570	52.399
50.767	42.933
50.919	85.073
50.974	66.919
51.006	57.891
51.177	53.602
51.600	64.250
51.689	43.524
51.991	45.541
52.325	82.056
52.346	74.951
52.743	53.126
52.868	61.412
53.220	105.275
53.397	97.918
53.464	73.947
53.493	65.435
53.963	69.722
54.035	101.536
54.162	59.772
54.177	56.100
54.260	78.436
54.350	106.243
55.025	50.326
55.458	65.743
55.681	103.406
55.778	69.732
56.106	72.307
56.229	87.062
56.386	91.510
57.310	69.426
57.475	71.663
58.994	45.362
59.215	76.019
59.410	140.742
59.561	79.543
61.177	85.145
61.193	80.277
62.264	94.074
62.462	90.727
62.986	105.357
63.842	149.327
64.080	127.440
65.558	169.537
66.264	228.612
70.776	245.868
72.763	108.331
73.875	207.976
73.902	191.695
74.864	156.360
76.777	120.254
79.284	149.477
80.122	210.900];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight'};  
bibkey.LW_f = 'Plat1969'; 
comment.LW_f = 'Data for females';
%
data.LW_m = [ ... % time lengthh (cm), wet weight (g)
28.367	14.905
28.586	10.235
28.750	10.955
29.473	18.195
30.441	11.008
30.851	15.959
31.115	17.873
31.829	24.543
32.219	12.055
33.235	19.135
33.730	20.205
34.323	11.788
34.501	14.323
34.872	19.401
35.268	22.838
35.746	16.559
36.368	19.850
36.483	37.933
36.558	23.900
37.101	25.467
37.183	30.525
37.474	20.492
37.691	21.637
37.985	28.782
38.317	30.807
38.354	24.900
38.354	24.900
38.441	29.443
38.857	19.856
39.276	26.653
39.287	25.016
39.323	20.312
39.416	23.479
39.472	33.732
39.694	36.931
39.809	19.238
40.459	29.184
40.481	25.825
40.546	35.620
40.644	40.620
40.690	31.521
40.713	27.641
40.794	34.824
41.050	33.132
41.340	26.181
41.987	46.328
42.029	36.941
42.139	40.443
42.578	29.995
42.762	22.246
43.069	34.052
43.143	45.502
43.359	29.062
43.863	32.400
44.054	47.400
44.193	45.921
44.495	38.314
44.563	53.568
44.789	33.752
45.472	32.998
45.522	50.739
45.683	45.104
45.984	39.914
47.093	42.147
47.486	49.389
47.528	40.466
48.038	55.063
48.316	58.139
48.508	46.993
49.162	68.131
49.202	56.842
49.290	74.930
49.476	63.084
50.683	62.522
50.895	48.080
51.264	72.277
51.747	66.621
52.362	70.028
52.725	57.378
52.879	58.428
52.929	93.155
53.443	80.591
53.826	62.540
54.064	89.849
54.138	66.035
55.315	117.916
55.421	76.341
56.076	81.712
58.986	92.362
62.443	97.105
63.149	115.870
64.092	121.797
64.701	110.752
65.886	108.281
66.458	118.016];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight'};  
bibkey.LW_m = 'Plat1969'; 
comment.LW_m = 'Data for males';

% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.103	15.486
0.758	24.356
0.804	29.547
0.831	22.627
0.886	34.046
0.906	31.763
1.009	34.187
1.724	37.175
1.797	35.308
1.865	36.762
1.873	43.683
1.880	38.424
1.896	40.085
1.988	36.349
2.020	38.841
2.032	42.855
2.697	44.597
2.785	43.837
2.802	44.806
2.835	46.468
2.851	47.022
3.013	43.979
3.039	38.028
3.727	48.352
3.939	47.317
4.095	48.427
4.797	48.509
4.884	49.064];
data.tL_f(:,1) = data.tL_f(:,1)* 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)* 1.14; % convert SVL to total length
units.tL_f  = {'yr', 'cm'};  label.tL_f = {'time since birth', 'total length'};  
temp.tL_f   = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Plat1969'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.079	15.212
0.736	20.841
1.747	30.717
1.799	31.938
1.826	32.735
1.879	30.558
1.905	32.947
2.090	31.885
2.643	33.000
2.722	34.327
2.788	33.478
2.789	32.628
2.828	33.903
2.840	35.124
2.854	33.053
2.959	34.965
2.960	33.690
2.998	36.664
3.710	36.664
3.829	35.814
3.830	35.283
4.013	38.097
4.752	38.841
4.778	37.673
5.712	43.991];
data.tL_m(:,1) = data.tL_m(:,1)* 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)* 1.21; % convert SVL to total length
units.tL_m  = {'yr', 'cm'};  label.tL_m = {'time since birth', 'total length'};  
temp.tL_m   = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Plat1969'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lim = 0 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Lim is ignored due to inconsistency with tL_f vs tL_m data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = '';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3L997'; % Cat of Life
metaData.links.id_ITIS = '174155'; % ITIS
metaData.links.id_EoL = '793277'; % Ency of Life
metaData.links.id_Wiki = 'Heterodon_nasicus'; % Wikipedia
metaData.links.id_ADW = 'Heterodon_nasicus'; % ADW
metaData.links.id_Taxo = '49943'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Heterodon&species=nasicus'; % ReptileDB
metaData.links.id_AnAge = 'Heterodon_nasicus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterodon_nasicus}}';
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
bibkey = 'Plat1969'; type = 'Article'; bib = [ ... 
'author = {Dwight R. Platt}, ' ... 
'year = {1969}, ' ...
'title = {Natural History of the Hognose Snakes \emph{Heterodon platyrhinos} and \emph{Heterodon nasicus}}, ' ...
'journal = {University of Kansas Publications, Museum of Natural History}, ' ...
'volume = {18(4)}, ' ...
'pages = {253-420}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallEcke1999'; type = 'incollection'; bib = [ ... 
'howpublished = {https://repositories.lib.utexas.edu/bitstream/handle/2152/45254/0698_Heterodon_nasicus.pdf?sequence=1}, ' ...
'author = {Walley, Harlan D. and Eckerman, Curtis M.}, ' ... 
'year = {1999}, ' ...
'title = {\emph{Heterodon nasicus}}, ' ...
'booktitle = {Catalogue of American Amphibians and Reptiles (CAAR)}, ' ...
'volume = {698}, ' ...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Heterodon_nasicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Heterodon_nasicus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];