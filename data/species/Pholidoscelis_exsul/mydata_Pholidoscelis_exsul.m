function [data, auxData, metaData, txtData, weights] = mydata_Pholidoscelis_exsul
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Teiidae';
metaData.species    = 'Pholidoscelis_exsul'; 
metaData.species_en = 'Common Puerto Rican ameiva'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTa', '0iTf'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 08];

%% set data
% zero-variate data

data.ab = 64;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wiki';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'Wiki';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 4.1;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Lewi1986';  
data.Lp  = 6.4;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'Lewi1986';  
data.Li  = 16;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Lewi1986';  
  comment.Lim = 'Wiki & ReptileDB give 9.9 cm';
data.Lim = 20.1;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim = {'Wiki','ReptileDB'};

data.Wwb = 2;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Lewi1986';
  comment.Wwb = 'based on (Lb/Lp)^3*Wwp: (4.1/6.4)^3*7.9';
data.Wwp = 7.9; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'Lewi1986';
data.Wwi = 135;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Lewi1986';

data.Ri  = 14/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(28);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-7 egggs per clutch, assumed: 2 clutches per yr';
  
% univariate data
% length-weight
data.LW_f = [ ... % SVL (cm), weight (g)
6.796	11.063
7.531	13.105
8.212	12.143
8.840	18.237
8.894	27.383
9.064	25.065
9.783	26.206
9.855	32.567
10.067	39.509
10.301	29.454
10.502	28.295
10.504	40.807
10.580	35.163
10.683	40.810
10.695	46.982
10.720	31.291
10.819	24.285
10.880	34.327
10.905	32.317
11.016	39.680
11.035	48.916
11.075	38.424
11.085	42.662
11.091	45.682
11.259	36.467
11.289	50.520
11.551	37.664
11.585	38.275
11.721	40.495
11.814	53.672
12.083	53.676
12.380	66.709
15.993	134.477];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight', 'females'}; 
bibkey.LW_f = 'Lewi1986'; 
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % SVL (cm), weight (g)
7.741	12.141
7.988	18.085
8.450	18.088
8.623	19.293
9.121	19.219
9.473	22.487
9.479	24.372
9.695	24.472
9.895	26.525
10.045	30.051
10.126	28.520
10.266	27.396
11.403	43.709
11.472	46.057
11.702	46.619
12.071	47.381
12.075	49.326
12.361	55.214
12.460	52.190
12.525	70.012
12.579	59.604
12.585	63.059
12.831	60.332
13.001	76.811
13.094	65.130
13.258	75.895
13.623	94.704
14.217	100.207
14.416	98.612
14.775	90.264
14.827	98.621
14.842	111.276
15.342	103.512
15.399	114.930
15.455	127.096];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight', 'males'}; 
bibkey.LW_m = 'Lewi1986'; 
comment.LW_m = 'data for males';

% length-change in length
data.LdL_Pf = [... % SVL (cm), change in SVL (cm/d)
7.07007	0.01085
8.16104	0.01481
8.83639	-0.00084
10.21269	0.01023
10.27121	0.01207
10.54156	0.00987
10.60452	0.00299
10.85797	-0.00407
10.97699	0.01018
11.38969	0.00394];
units.LdL_Pf  = {'cm', 'cm/d'};  label.LdL_Pf = {'SVL', 'change in SVL', 'females'};  
temp.LdL_Pf = C2K(28); units.temp.LdL_Pf = 'K'; label.temp.LdL_Pf = 'temperature';
bibkey.LdL_Pf = 'Lewi1986'; comment.LdL_Pf = 'Females at Pinero, Mayaguez, Puerto Rico';
%
data.LdL_Pm = [... % SVL (cm), change in SVL (cm/d)2.39451	0.01078
8.87026	0.02391
9.22222	0.02019
9.50335	0.02110
10.26859	0.01132
10.27331	0.00267
10.42592	0.01659
10.90005	0.01304
11.47013	0.00209
11.78216	0.01189
12.41496	0.00899
12.49937	0.00328
13.40042	0.00759
13.46186	0.01027];
units.LdL_Pm  = {'cm', 'cm/d'};  label.LdL_Pm = {'SVL', 'change in SVL', 'males'};  
temp.LdL_Pm = C2K(28); units.temp.LdL_Pm = 'K'; label.temp.LdL_Pm = 'temperature';
bibkey.LdL_Pm = 'Lewi1986'; comment.LdL_Pm = 'Males at Pinero, Mayaguez, Puerto Rico';
%
data.LdL_Jf = [... % SVL (cm), change in SVL (cm/d)
5.34131	0.01085
6.03463	0.00881
7.18653	0.00827
7.44459	0.01306
8.16892	0.00336
8.42180	0.00630
8.46975	0.00470
8.63202	0.00023
8.65702	0.00293
8.67285	0.00234
9.21479	0.00241
9.60152	0.00947
9.61717	0.00256
9.85946	0.00171];
units.LdL_Jf  = {'cm', 'cm/d'};  label.LdL_Jf = {'SVL', 'change in SVL', 'females'};  
temp.LdL_Jf = C2K(28); units.temp.LdL_Jf = 'K'; label.temp.LdL_Jf = 'temperature';
bibkey.LdL_Jf = 'Lewi1986'; comment.LdL_Jf = 'Females at Joyuda';
%
data.LdL_Jm = [... % SVL (cm), change in SVL (cm/d)
6.17861	0.01655
7.60250	0.01954
7.66510	0.01693
7.84538	0.00640
7.92757	0.00455
8.42344	0.00689
9.43131	0.00484
9.64553	0.00021
10.25496	0.00566
10.29273	0.00667
12.04587	0.00241
13.12693	0.00154];
units.LdL_Jm  = {'cm', 'cm/d'};  label.LdL_Jm = {'SVL', 'change in SVL', 'males'};  
temp.LdL_Jm = C2K(28); units.temp.LdL_Jm = 'K'; label.temp.LdL_Jm = 'temperature';
bibkey.LdL_Jm = 'Lewi1986'; comment.LdL_Jm = 'Males at Joyuda';

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

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LdL_Pf','LdL_Pm'}; subtitle2 = {'Data for females, males at Pinero'};
set3 = {'LdL_Jf','LdL_Jm'}; subtitle3 = {'Data for females, males at Joyuda'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'They are the only known reptiles to be partly endothermic during reproductive period';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8GQ72'; % Cat of Life
metaData.links.id_ITIS = '1172723'; % ITIS
metaData.links.id_EoL = '53792909'; % Ency of Life
metaData.links.id_Wiki = 'Pholidoscelis_exsul'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4684289'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pholidoscelis&species=exsul'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pholidoscelis_exsul}}';
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
bibkey = 'Lewi1986'; type = 'Article'; bib = [ ... 
'author = {Allen R. Lewis}, ' ... 
'year = {1986}, ' ...
'title = {Body Size and Growth in Two Populations of the {P}uerto {R}ican Ground Lizard ({T}eiidae)}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {20(2)}, ' ...
'pages = {190-195}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Pholidoscelis&species=exsul}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

