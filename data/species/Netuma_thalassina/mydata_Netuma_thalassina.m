function [data, auxData, metaData, txtData, weights] = mydata_Netuma_thalassina
%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ariidae';
metaData.species    = 'Netuma_thalassina'; 
metaData.species_en = 'Giant catfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 04];

%% set data
% zero-variate data;

data.am = 22*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'AlHuAlBa2021';
  temp.am = C2K(26.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 36.3;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 185;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase'; 

data.Wwb = 0.294; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess'; 
  comment.Wwb = 'based on egg diameter of 8.25 mm: pi/6*0.825^3';
data.Wwp  = 466.8; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00759*Lp^3.07, see F1';
data.Wwi  = 69.26e3; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00759*Li^3.07, see F1';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.398	32.139
2.018	36.756
2.453	47.470
3.143	51.035
3.211	58.810
3.301	68.687
3.463	62.380
3.831	63.007
4.841	79.809
4.981	69.720
5.347	78.753
5.531	81.273
5.967	85.261
6.337	77.692
6.774	78.318
7.094	89.453
7.855	81.669
9.052	82.077
9.810	91.946
9.833	88.373
9.881	80.807
9.926	86.901
10.019	79.544
10.064	88.371
10.085	98.458
10.109	90.682
10.293	92.571
10.844	100.341
10.845	95.087
10.846	86.261
10.917	79.745
11.811	96.759
11.812	92.555
11.927	94.235
12.020	87.299
12.824	98.009
12.825	88.762
14.344	92.319
14.989	89.159
15.010	95.464
15.860	103.861
15.887	84.737
17.057	105.950
17.060	91.029
20.902	94.351];
data.tL_f(:,1) = 365 * (0.8 + data.tL_f(:,1)); % conver yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f    = C2K(26.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AlHuAlBa2021';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.316	43.268
3.092	79.197
3.211	55.658
3.808	63.638
3.830	67.631
3.880	50.187
3.922	71.412
3.945	68.470
3.970	59.853
3.993	61.955
3.994	58.172
4.015	65.737
4.266	74.771
4.589	74.137
4.817	82.121
4.842	74.135
4.889	66.148
4.914	60.053
4.915	57.742
4.959	61.944
4.981	68.249
5.003	73.292
5.348	74.129
5.784	79.589
5.878	72.232
5.924	71.601
5.946	76.015
5.950	57.521
6.015	78.536
6.060	82.108
6.154	74.962
6.314	79.373
6.775	74.745
6.865	84.832
6.912	78.526
6.935	80.838
6.982	73.902
7.005	77.054
7.051	75.372
7.234	82.726
7.349	81.044
7.580	77.048
7.922	92.386
7.948	81.458
7.949	76.834
7.992	90.704
8.179	76.201
8.338	85.026
8.890	87.542
8.891	82.499
9.005	89.433
9.029	80.395
9.902	89.213
10.961	88.781
11.308	79.531
12.182	82.044
12.872	85.819
13.884	88.961
14.277	81.181
14.851	84.537
15.862	92.723
17.383	86.192];
data.tL_m(:,1) = 365 * (0.8 + data.tL_m(:,1)); % conver yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m    = C2K(26.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AlHuAlBa2021';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity (#)
3700.124	128.903
3835.920	94.493
3909.756	146.129
4015.386	147.043
4182.499	191.440
4576.194	217.738
4624.077	139.843
5035.394	124.475
5127.712	126.294
5222.425	230.468
5507.043	163.460
5953.026	195.197
6232.472	177.102
6520.250	205.203
6521.208	196.145
6527.433	137.269
7474.274	181.725
7494.577	239.697
7565.731	191.695
7646.942	173.585
8772.004	157.366
8782.155	186.352
9510.362	173.726
9513.139	147.458
10289.326	181.031];
units.WN   = {'g', '#'};  label.WN = {'weight', 'fecundity'};  
temp.WN    = C2K(26.8);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'AlHuAlBa2021';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00759*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.9*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '479RD'; % Cat of Life
metaData.links.id_ITIS = '682412'; % ITIS
metaData.links.id_EoL = '46582089'; % Ency of Life
metaData.links.id_Wiki = 'Netuma_thalassina'; % Wikipedia
metaData.links.id_ADW = 'Netuma_thalassina'; % ADW
metaData.links.id_Taxo = '485477'; % Taxonomicon
metaData.links.id_WoRMS = '281745'; % WoRMS
metaData.links.id_fishbase = 'Netuma-thalassina'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Netuma_thalassina}}';
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
bibkey = 'AlHuAlBa2021'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.rsma.2021.101885}, ' ...
'author = {M. Al-Husaini and A. Al-Baz and T. Dashti and S. Rajab;H. Husain},'...
'title = {Age, growth, and reproductive parameters of four species of sea catfish ({S}iluriformes: {A}riidae) from {K}uwaiti waters },'...
'journal = {Regional Studies in Marine Science}, '...
'volume = {46}, '...
'year = {2021}, '...
'pages = {101885}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Netuma-thalassina.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

