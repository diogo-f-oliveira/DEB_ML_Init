function [data, auxData, metaData, txtData, weights] = mydata_Haemulon_flaviguttatum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Haemulon_flaviguttatum'; 
metaData.species_en = 'Yellowspotted grunt'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 18]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 18];

%% set data
% zero-variate data

data.am = 17*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CruzEspi1993';   
  temp.am = C2K(25.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 21; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 42;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 145.6;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01479*Lp^3.02, see F1';
data.Wwi = 1181; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^3.02, see F1; max. published weight: 2.3 kg';

data.Ri  = 4.4e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Haemulon_album: 2.2e6*1181/5926';
  
% uni-variate data
% time-length
data.tL = [ ... % time (D), total length (cm)
    1  4.28
    2  8.42
    3 12.11
    4 15.04
    5 18.34
    6 20.95
    7 23.28
    8 25.36
    9 27.21
   10 28.86
   11 30.33
   12 31.64
   13 32.81];
data.tL(:,1) = (data.tL(:,1) + 0.1)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CruzEspi1993';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
10.970	49.283
11.000	66.320
13.577	75.978
13.901	98.716
14.984	91.227
15.336	102.610
15.862	100.757
16.067	98.880
16.390	110.261
16.859	123.546
17.066	146.274
17.537	186.057
17.741	170.931
18.152	191.782
18.299	191.793
18.622	212.638
18.624	239.137
18.797	195.617
18.825	184.262
19.002	201.310
19.528	186.208
19.826	252.477
19.923	386.869
20.291	212.764
20.441	261.987
20.618	282.821
20.880	262.020
20.977	388.842
21.351	290.447
21.417	392.660
21.673	294.257
21.978	460.842
22.230	313.227
22.321	354.874
22.443	415.451
22.671	337.866
22.873	290.562
22.905	335.991
23.027	396.568
23.258	354.945
23.263	417.406
23.555	407.964
23.760	419.336
23.814	353.094
24.046	319.042
24.601	302.050
24.642	470.507
24.814	417.523
25.216	303.989
25.429	419.462
25.584	531.146
25.774	338.101
26.029	612.568
26.661	457.411
26.898	491.498
27.060	699.712
27.204	671.332
27.674	692.188
28.086	728.181
28.246	506.742
28.585	737.682
28.616	762.291
28.670	707.405
28.866	574.928
29.033	862.638
29.216	557.920
29.387	499.257
29.572	626.085
29.647	847.542
30.126	599.629
30.585	870.326
30.638	800.299
30.833	658.357
30.981	675.403
31.206	953.654
31.612	902.580
33.061	1103.32];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'CruzEspi1993'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Wwi = 2 * weights.Wwi;
weights.Li = 2 * weights.Li;

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
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01479*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3J976'; % Cat of Life
metaData.links.id_ITIS = '630221'; % ITIS
metaData.links.id_EoL = '46578475'; % Ency of Life
metaData.links.id_Wiki = 'Haemulon'; % Wikipedia
metaData.links.id_ADW = 'Haemulon_flaviguttatum'; % ADW
metaData.links.id_Taxo = '175742'; % Taxonomicon
metaData.links.id_WoRMS = '275726'; % WoRMS
metaData.links.id_fishbase = 'Haemulon-flaviguttatum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Haemulon}}';
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
bibkey = 'CruzEspi1993'; type = 'techreport'; bib = [ ... 
'author = {Cruz-Romero, M. and E. Espino-Barr and A. Garc\''{i}a-Boa}, ' ... 
'year = {1993}, ' ...
'title = {Aspectos poblacionales de cinco especies de la familia {H}aemulidae ({P}isces) en la costa de {C}olima, {M}exico}, ' ...
'journal = {Ciencia Pesquera. Inst. Nal. Pesca Sria. de Pesca. Mexico}, ' ...
'volume = {9}, ' ...
'pages = {43-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Haemulon-flaviguttatum.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
