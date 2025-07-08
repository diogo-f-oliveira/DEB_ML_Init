function [data, auxData, metaData, txtData, weights] = mydata_Thymallus_nigrescens
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Thymallus_nigrescens'; 
metaData.species_en = 'Kosogol grayling'; 

metaData.ecoCode.climate = {'BW'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2024 12 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 26]; 

%% set data
% zero-variate data

data.ab = 15;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';   
  temp.ab = C2K(9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20*365;     units.am = 'd';    label.am = 'life span'; bibkey.am = 'TsogMend2017';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'fishbase'; 
data.Li  = 48.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm) for Prosopium cylindraceum: pi/6*0.21^3';
data.Wwp  = 32.3; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase'; 
  comment.Wwp = 'based on 0.00468*Lp^3.12, see F1';
data.Wwi  = 845; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.00468*Li^3.12, see F1';

data.Ri  = 8000/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(21.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Thymallus_tugarinae';
  
% uni-variate data
% time-length
data.tL_f = [... %  time since birth (yr), total length (cm)
1.016	13.458
3.894	20.575
3.936	19.704
4.027	22.793
4.069	21.525
4.938	21.363
4.939	22.235
4.981	20.809
5.115	24.610
5.158	23.739
5.988	27.458
6.031	26.745
6.034	29.280
6.070	22.943
6.072	24.606
6.204	25.715
6.986	25.395
6.987	26.345
7.035	30.781
7.114	23.493
8.073	25.311
8.114	23.727
8.167	32.281
8.946	28.397
9.028	24.436
9.941	23.720
9.986	25.383
11.085	37.022
12.028	24.345
12.080	32.424
12.085	36.543
12.118	27.038
13.086	37.489];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TsogMend2017';
%
data.tL_m = [... %  time since birth (yr), total length (cm)
2.934	17.648
3.897	23.268
4.029	25.010
4.031	26.674
4.109	18.990
4.986	25.799
4.987	26.591
5.067	19.779
5.070	23.026
5.078	30.472
5.558	31.579
6.068	20.725
6.069	21.834
6.113	22.626
6.902	28.009
6.903	29.356
6.951	33.078
6.990	28.880
6.995	33.632
7.040	35.612
7.072	24.286
7.689	32.283
7.899	25.787
7.985	24.361
7.990	29.668
8.069	21.668
8.163	28.638
8.167	31.727
8.867	35.764
8.998	36.714
9.115	23.802
12.119	28.068
15.173	37.402
17.161	26.147];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TsogMend2017';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
13.246	17.077
14.234	26.213
15.073	22.614
15.681	29.006
17.889	32.742
18.036	50.931
19.018	78.248
19.177	56.437
19.784	64.647
20.475	47.405
20.545	69.227
20.857	44.696
20.928	61.062
21.077	72.887
21.540	52.908
21.606	84.730
21.688	67.461
21.689	63.824
21.848	42.922
22.066	78.387
22.214	92.939
22.371	74.764
22.377	56.583
22.493	176.588
22.519	89.317
22.604	60.229
22.754	70.236
22.826	82.967
22.897	99.334
23.054	84.795
23.246	206.622
23.664	82.096
23.732	111.190
23.736	96.645
23.971	77.564
24.031	129.385
24.050	68.477
24.051	63.023
24.189	112.120
24.191	104.847
24.339	119.399
24.427	78.494
24.500	90.316
24.558	151.227
24.577	87.592
24.641	126.686
24.803	97.602
24.857	167.605
24.877	104.878
25.189	80.347
25.247	138.531
25.330	115.808
25.412	98.539
25.473	148.542
25.568	84.910
25.632	127.640
25.642	93.095
25.702	144.916
25.776	154.919
25.856	139.468
25.914	202.198
26.020	104.021
26.246	110.395
26.310	150.398
26.320	117.671
26.693	144.961
26.696	133.143
26.907	194.061
26.999	140.429
27.002	129.520
27.062	183.159
27.069	159.523
27.082	116.797
27.140	177.708
27.162	104.982
27.220	166.803
27.240	98.622
27.294	173.170
27.528	154.090
27.769	114.101
27.832	157.740
27.837	140.467
27.880	249.560
27.919	121.380
28.054	179.568
28.057	167.750
28.456	110.495
28.508	188.680
28.664	178.687
28.677	135.051
28.730	212.326
28.747	155.054
28.888	193.242
29.048	165.977
29.112	206.889
29.288	130.533
29.350	176.900
29.500	185.088
29.583	161.456
29.715	228.734
29.795	216.920
29.877	196.924
30.026	207.840
30.112	176.934
30.488	193.315
30.631	223.322
30.778	239.692
30.781	232.419
30.874	174.242
31.085	234.251
31.225	275.167
31.381	260.628
31.385	250.629
31.548	215.181
31.627	203.367
32.158	211.573
32.296	259.761
32.308	219.761
32.543	200.681
32.668	287.960
32.890	310.697
33.045	300.704
33.287	257.079
33.506	290.725
33.588	271.638
33.596	243.456
33.655	301.641
33.942	358.927
33.945	348.018
34.498	285.316
34.564	318.955
34.708	346.234
35.013	343.521
35.383	378.992
35.454	396.268
35.462	369.905
35.550	332.636
35.925	352.653
36.005	339.020
36.156	343.573
36.238	323.576
36.452	373.586
36.456	360.859
36.616	333.594
37.275	422.714
37.439	382.722
37.597	366.365
37.728	437.281
38.646	422.777];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'TsogMend2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwi = 0 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D2 = 'Data Wwi is ignorned due to incinsistency with LW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00468*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase';
F2 = 'endemic to Lake Khuvsgul, Mongolia';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '7C9SG'; % Cat of Life
metaData.links.id_ITIS = '162021'; % ITIS
metaData.links.id_EoL = '214999'; % Ency of Life
metaData.links.id_Wiki = 'Thymallus_nigrescens'; % Wikipedia
metaData.links.id_ADW = 'Thymallus_nigrescens'; % ADW
metaData.links.id_Taxo = '189044'; % Taxonomicon
metaData.links.id_WoRMS = '1424352'; % WoRMS
metaData.links.id_fishbase = 'Thymallus-nigrescens'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thymallus_nigrescens}}';
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
bibkey = 'TsogMend2017'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.13247?msockid=0c7692ac275d65161cc287ef2626644e}, ' ...
'author = {Tsogtsaikhan, P. and B. Mendsaikhan and G. Jargalmaa and B. Ganzorig and B.C. Weidel and C.M. Filosa and C.M. Free and T. Young and O.P. Jensen}, ' ... 
'year = {2017}, ' ...
'title = {Age and growth comparisons of {H}ovsgol grayling (\emph{Thymallus nigrescens} {D}orogostaisky, 1923), {B}aikal grayling (\emph{T. baicalensis} {D}ybowski, 1874), and lenok (\emph{Brachymystax lenok} {P}allas, 1773) in lentic and lotic habitats of {N}orthern {M}ongolia}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {33}, ' ...
'pages = {108-115}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Thymallus-nigrescens.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

