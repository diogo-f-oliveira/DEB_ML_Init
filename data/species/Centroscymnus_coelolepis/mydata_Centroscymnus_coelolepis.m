function [data, auxData, metaData, txtData, weights] = mydata_Centroscymnus_coelolepis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Somniosidae';
metaData.species    = 'Centroscymnus_coelolepis'; 
metaData.species_en = 'Portuguese dogfish'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.9); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 11];

%% set data
% zero-variate data;
data.ab = 2*365; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Mour2011';   
  temp.ab = C2K(3.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(3.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 30;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'Veri2003';
data.Lp = 98.5;   units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'Veri2003';
data.Lpm = 85;   units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'fishbase';
data.Li  = 121;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
data.Lim  = 92; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'fishbase';

data.Wwp = 6.45e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','Veri2003'};
  comment.Wwp = 'based on 0.00389*Lp^3.12, see F1';
data.Wwi  = 12.25e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F3';
data.Wwim  = 5.2e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = 'fishbase';
  comment.Wwim = 'based on 0.00389*Lim^3.12, see F3';

data.Ri  = 13.2/365/3;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Veri2003';   
  temp.Ri = C2K(3.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '13-29 pups per litter, mean, 13.2 pups/litter, assumed 1 litter per at 3 yr';
  
% univariate data

% length-weight for embryos
data.LWe = [ ... %  total length (cm), weight (g)
5.469	0.278
5.963	0.864
7.691	3.128
9.049	3.666
10.778	7.665
11.210	8.810
11.457	11.117
11.951	12.260
12.198	15.146
12.630	10.504
13.000	15.701
13.000	10.493
13.370	10.482
13.556	19.157
14.173	17.981
14.358	22.026
14.728	17.386
15.160	21.424
15.346	18.525
15.593	28.934
15.716	25.458
15.901	28.925
16.148	20.237
16.395	24.859
16.457	31.802
16.889	27.738
17.012	31.207
17.321	42.772
17.321	36.985
17.383	72.862
17.568	37.556
17.630	41.605
17.938	33.494
18.000	43.330
18.309	46.793
18.370	40.426
18.432	39.845
18.556	41.577
18.802	48.514
18.864	38.675
18.988	39.828
18.988	36.356
19.049	48.507
19.111	54.292
19.173	61.235
19.173	41.559
19.358	62.387
19.481	44.443
19.543	53.122
19.728	45.593
20.037	51.371
20.160	65.256
20.160	57.155
20.160	49.053
20.346	69.881
20.469	47.307
20.531	86.658
20.593	61.771
20.654	51.932
20.840	76.232
20.840	55.977
20.901	66.971
20.963	80.279
21.210	74.485
21.210	60.596
21.272	93.580
21.272	87.214
21.333	110.360
21.457	97.625
21.457	70.426
21.457	58.852
21.519	80.262
21.519	55.957
21.580	66.950
21.765	98.774
21.889	82.566
22.012	90.664
22.074	106.866
22.074	75.037
22.074	68.093
22.259	64.037
22.321	95.863
22.383	106.857
22.506	74.446
22.691	68.075
22.753	95.851
22.815	53.603
22.877	110.893
22.877	84.273
22.877	90.060
22.938	135.776
23.247	124.192
23.309	116.667
23.309	98.149
23.309	87.732
23.309	76.158
23.370	106.828
23.370	103.355
23.432	143.863
23.494	126.500
23.679	111.448
23.741	122.442
23.864	91.767
24.049	130.534
24.111	94.653
24.173	104.489
24.235	125.320
24.358	88.858
24.420	143.833
24.481	169.873
24.481	135.730
24.481	96.378
24.667	141.511
24.728	106.787
24.790	99.262
24.852	113.728
24.914	155.393
24.914	145.555
24.975	133.979
25.037	95.783
25.160	169.274
25.222	158.856
25.222	151.333
25.222	124.134
25.284	139.178
25.407	165.795
25.469	143.223
25.469	131.071
25.654	161.158
25.778	128.747
25.901	162.887
25.963	152.468
25.963	139.737
26.025	168.670
26.025	146.679
26.148	160.564
26.210	178.502
26.210	134.521
26.457	167.500
26.457	140.301
26.519	175.021
26.519	148.979
26.765	155.338
26.765	144.921
26.889	161.700
26.951	177.323
27.074	151.278
27.136	169.216
27.198	195.255
27.444	154.160
27.630	165.729
27.630	158.784
27.753	191.188
27.815	172.089
28.185	154.717
28.247	166.289
28.556	172.646
28.679	189.424
28.864	202.729
29.481	187.664
29.975	196.330];
units.LWe = {'cm', 'g'};     label.LWe = {'total embryo length', 'embryo weight'};  
bibkey.LWe = 'Veri2003';
comment.LWe = 'Data for embryos';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'deepest shark; ovoviviparous';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'bathydemersal; depth range 200 - 2490 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00457 * (TL in cm)^3.14';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'SBFL'; % Cat of Life
metaData.links.id_ITIS = '160724'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Centroscymnus_coelolepis'; % Wikipedia
metaData.links.id_ADW = 'Centroscymnus_coelolepis'; % ADW
metaData.links.id_Taxo = '41812'; % Taxonomicon
metaData.links.id_WoRMS = '105907'; % WoRMS
metaData.links.id_fishbase = 'Centroscymnus-coelolepis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centroscymnus_coelolepis}}';  
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
bibkey = 'Veri2003'; type = 'article'; bib = [ ... 
'doi = {10.1016/s1054-3139(03)00146-2}, ' ...
'author = {Ver\''{i}ssimo, A.}, ' ...
'year = {2003}, ' ...
'title  = {Reproductive biology and embryonic development of \emph{Centroscymnus coelolepis} in {P}ortuguese mainland waters}, ' ...
'volume = {60(6)}, ' ...
'pages = {1335–1341}, ' ...
'journal = {ICES Journal of Marine Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mour2011'; type = 'techreport'; bib = [ ... 
'author = {Moura, Maria Teresa Narciso Simões da Silva}, ' ...
'year = {2011}, ' ...
'title  = {Reproductive strategy and population structure of \emph{Centroscymnus coelolepis} ({C}hondrichthyes: {S}omniosidae): a scientific support for management advice}, ' ...
'howpublished = {\url{http://hdl.handle.net/10451/5485}}, ' ...
'institution = {University of Lisboa}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Centroscymnus-coelolepis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

