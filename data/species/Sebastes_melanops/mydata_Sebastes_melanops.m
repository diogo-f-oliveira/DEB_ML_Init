function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_melanops
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_melanops'; 
metaData.species_en = 'Black rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 22];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 22];

%% set data
% zero-variate data

data.am = 50*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(5.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 40.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMorr1990'; 
data.Li  = 63;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 913;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMorr1990'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 3.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';

data.Ri  = 1.2e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(5.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
  0  9.5
  1 15.7
  2 17.8
  3 25.9
  4 29.6  
  5 31.9
  6 32.5
  7 34.9
  8 38.2
  9 42.3
 10 52.3
 11 50.4
 13 52.2];
data.tL(:,1) = 365*(0.8+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(5.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LeaMcAl1999'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
9.648	8.834
13.239	29.256
13.873	29.145
15.634	44.626
16.268	65.567
16.408	86.595
16.901	39.140
17.113	86.471
17.254	70.657
17.394	81.159
17.746	91.623
17.746	65.308
18.451	91.500
18.451	80.973
19.155	96.639
19.789	117.581
19.789	112.318
20.141	112.256
20.493	138.510
20.493	117.457
21.127	122.609
21.268	175.216
21.549	138.325
22.183	180.319
22.394	185.545
22.465	159.217
22.606	159.192
23.028	138.065
23.521	180.084
24.014	206.313
24.225	306.276
24.507	222.016
24.789	279.862
25.070	290.338
25.352	300.815
25.423	232.382
25.493	253.422
25.845	200.729
25.915	279.664
25.915	311.243
26.056	263.850
26.197	326.983
26.268	305.918
26.338	300.642
26.408	347.998
26.549	405.869
26.549	326.921
26.690	316.370
26.901	379.491
27.042	353.150
27.042	284.729
27.113	358.401
27.394	384.668
27.394	279.404
27.465	321.497
27.676	437.250
27.817	421.436
27.887	358.265
28.239	373.993
28.239	400.309
28.239	410.835
28.310	342.402
28.451	416.061
28.451	316.061
28.521	416.049
28.521	347.628
28.662	437.077
28.662	452.866
28.662	405.498
28.803	358.105
29.085	437.003
29.155	379.096
29.225	389.610
29.225	452.767
29.366	536.953
29.437	410.625
29.577	431.653
29.577	442.179
29.648	494.798
29.718	473.734
29.718	463.207
29.930	473.696
29.930	384.223
30.000	526.316
30.070	347.356
30.141	536.817
30.352	431.517
30.352	410.464
30.493	520.966
30.493	457.808
30.634	552.520
30.704	536.718
30.845	484.062
30.845	510.378
30.915	505.102
30.986	589.301
31.338	547.133
31.338	447.134
31.408	589.226
31.549	568.149
31.620	483.926
31.690	483.914
31.831	673.363
31.972	494.391
31.972	478.601
32.042	547.010
32.113	604.892
32.113	599.629
32.183	636.459
32.254	531.183
32.254	568.026
32.606	536.385
32.676	604.794
32.746	488.992
32.817	578.453
32.887	788.967
32.958	594.218
33.099	746.825
33.099	536.298
33.099	525.772
33.239	636.274
33.310	678.367
33.803	615.122
33.873	767.741
33.944	651.940
34.085	830.862
34.225	604.522
34.366	846.602
34.577	814.986
34.789	709.686
35.211	778.033
35.211	846.454
35.352	841.166
35.634	720.064
35.634	756.906
36.549	819.904
36.549	688.324
36.761	730.393
37.113	940.857
37.113	856.647
37.465	909.217
37.606	961.824
38.028	861.749
38.451	766.938
38.592	930.072
42.887	1592.476
42.887	1518.792
44.155	1429.095
45.493	1602.545
45.704	1739.350
46.761	1518.112
48.662	2149.357
48.944	2396.676
49.296	1965.036
51.479	2348.863
52.254	2538.201
52.394	2527.650];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LeaMcAl1999';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwp = 0 * weights.Wwp;
%weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
%set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
%set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
%metaData.grp.sets = {set2};
%metaData.grp.subtitle = {subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7NB'; % Cat of Life
metaData.links.id_ITIS = '166727'; % ITIS
metaData.links.id_EoL = '46568162'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_melanops'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_melanops'; % ADW
metaData.links.id_Taxo = '187295'; % Taxonomicon
metaData.links.id_WoRMS = '274817'; % WoRMS
metaData.links.id_fishbase = 'Sebastes_melanops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_melanops}}';
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
bibkey = 'LeaMcAl1999'; type = 'techreport'; bib = [ ... 
'author = {Lea, R.N. and R.D. McAllister and D.A. VenTresca},' ...
'year = {1999}, ' ...
'title = {Biological Aspects of Nearshore Rockfishes of the Genus \emph{Sebastes} from {C}entral {C}alifornia With Notes On Ecologically Related Sport Fishes}, ' ...
'institution = {State of California, the Resources Agency, Department of Fish and Game}, ' ...
'volume = {Fish Bulletin 177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes_melanops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
