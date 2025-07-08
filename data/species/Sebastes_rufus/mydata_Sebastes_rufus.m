function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_rufus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_rufus'; 
metaData.species_en = 'Bank rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2024 08 21];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 21];

%% set data
% zero-variate data

data.am = 85*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(9.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 34;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 54;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwi = 2e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';

data.Ri  = 6e5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(9.5);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';

% univariate data
% time-length
data.tL_f = [ ...
5.828	29.005
7.024	23.716
7.024	28.055
7.024	28.690
7.098	26.679
7.771	24.035
7.846	30.490
7.920	24.988
7.920	25.728
8.892	29.328
8.892	29.857
8.966	26.259
9.116	31.021
9.938	27.002
9.938	29.118
9.938	29.330
10.012	30.176
10.012	30.705
10.909	27.215
10.909	29.966
10.909	30.390
10.984	22.982
10.984	26.792
10.984	27.744
10.984	28.802
10.984	29.332
10.984	30.919
11.955	29.016
11.955	29.651
11.955	30.286
11.955	30.921
12.030	28.593
12.852	33.779
12.852	34.837
12.927	28.065
12.927	28.806
12.927	29.547
13.001	30.182
13.001	31.134
13.001	31.769
13.898	35.263
15.019	30.185
15.168	34.524
15.915	29.234
15.990	31.774
15.990	32.198
17.036	34.739
18.755	46.911
18.979	40.033
19.950	47.443
20.025	34.744
20.100	33.898
20.996	40.989
21.893	39.404
22.939	38.771
22.939	40.675
24.807	39.197
24.882	40.573
24.882	48.509
25.031	50.309
25.853	39.834
27.945	40.684
27.945	48.303
30.859	47.991
30.859	48.520
30.934	50.848
32.802	49.264
34.894	48.421
34.894	48.950
34.894	49.585
34.894	50.538
35.791	50.539
37.808	43.982
39.975	50.653
40.722	49.913
42.740	49.493
42.814	48.541
43.786	47.696
45.056	54.683
50.062	47.919];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr 
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(9.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WattKlin2006';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
6.725	28.901
7.696	29.537
8.593	27.634
8.817	28.058
8.817	25.307
9.863	27.531
9.863	28.271
10.087	34.304
11.133	25.734
12.553	27.535
13.973	30.078
13.973	33.464
14.720	33.465
15.915	33.785
15.915	34.314
15.915	35.160
16.887	33.046
19.054	34.319
19.054	34.848
19.054	35.166
20.697	39.296
20.697	39.825
21.818	34.747
22.192	41.097
23.910	40.677
23.910	39.831
27.273	39.731
29.141	38.993
29.141	39.416
35.866	42.709
35.866	43.344
44.981	44.524
45.878	45.054
53.051	43.268];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr 
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(9.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WattKlin2006';
comment.tL_m = 'data for males';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
36.275	105172.414
37.650	227586.215
37.822	75862.072
39.026	218965.546
39.198	132758.614
39.542	191379.299
40.745	229310.358
42.636	349999.992
42.808	217241.402
42.980	137931.044
44.871	406896.558
46.246	422413.801
46.246	384482.765
46.418	293103.474
46.418	284482.757
46.590	193103.442
47.278	298275.857
47.450	349999.992
47.450	267241.371
47.622	439655.187
47.622	344827.586
48.653	432758.637
48.653	424137.944
48.997	610344.837
48.997	349999.992
49.169	431034.494
52.607	487931.036];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(9.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwb = 3 * weights.Wwb;
weights.Ri = 0 * weights.Ri;

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
D2 = 'mod_2: males have equal state variables at b, compared to females';
D3 = 'mod_3: LN data added';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4W7PT'; % Cat of Life
metaData.links.id_ITIS = '166761'; % ITIS
metaData.links.id_EoL = '46568190'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_rufus'; % ADW
metaData.links.id_Taxo = '187329'; % Taxonomicon
metaData.links.id_WoRMS = '274847'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-rufus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes}}';
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
bibkey = 'WattKlin2006'; type = 'Article'; bib = [ ... 
'author = {Diana L. Watters and Donna E. Kline and Kenneth H. Coale and Gregor M. Cailliet}, ' ... 
'year = {2006}, ' ...
'title = {Radiometric age confirmation and growth of a deep-water marine fish species: The bank rockfish, \emph{Sebastes rufus}}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {81}, ' ...
'pages = {251-257}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins},' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-rufus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
