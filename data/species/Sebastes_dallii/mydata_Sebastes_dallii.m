function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_dallii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_dallii'; 
metaData.species_en = 'Calico rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE','MPN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 29];

%% set data
% zero-variate data

data.am = 12 *365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LoveMorr1990'; 
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 16.5;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','LoveMorr1990'};
  comment.Wwp = 'based on 0.01000*Lp^3.09, see F1';
data.Wwi = 209;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm) 
    1  5.02
    2  7.21
    3  8.33
    4  9.24
    5 10.13
    6 10.81
    7 11.40
    8 11.88
    9 12.35
   10 12.97
   11 13.75];
data.tL(:,1) = 365*(0.3+data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(10.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Chen1971';  

% length-weight
data.LW = [ ... % total length (cm), weight (g) 
6.561	3.670
6.619	3.872
6.707	6.518
6.880	4.475
6.995	4.675
7.024	4.674
7.371	7.313
7.401	7.923
7.603	8.121
7.834	7.910
9.337	10.106
10.034	26.387
10.206	16.397
10.264	20.471
10.524	15.979
10.525	24.538
10.553	18.628
10.641	24.127
10.699	23.922
10.930	22.896
10.987	20.448
11.016	21.263
11.017	24.319
11.074	23.706
11.132	22.074
11.132	22.278
11.190	22.276
11.190	22.480
11.247	20.440
11.277	24.719
11.277	26.553
11.277	26.553
11.306	26.348
11.681	20.631
11.681	23.280
11.710	21.649
11.885	29.387
11.914	29.590
11.971	26.939
12.115	24.286
12.116	31.826
12.116	31.826
12.144	24.693
12.145	28.972
12.173	27.545
12.202	23.876
12.289	27.337
12.317	25.502
12.381	53.826
12.550	34.258
12.551	34.666
12.578	28.959
12.608	35.071
12.637	31.402
12.782	35.066
12.899	41.380
12.926	34.858
12.926	34.858
12.955	32.004
12.956	40.970
13.041	30.167
13.100	35.056
13.100	37.706
13.130	43.411
13.158	36.277
13.188	43.001
13.273	35.051
13.274	39.127
13.274	40.757
13.275	42.795
13.276	48.704
13.276	48.704
13.332	39.940
13.360	37.698
13.360	37.901
13.391	45.848
13.419	40.956
13.447	38.306
13.448	40.955
13.448	43.808
13.448	43.808
13.449	47.069
13.476	35.656
13.478	47.068
13.533	34.839
13.563	41.359
13.621	37.690
13.679	40.948
13.709	44.616
13.709	46.450
13.912	47.259
13.912	51.742
13.940	47.258
13.941	49.703
13.969	47.664
14.027	44.402
14.056	47.050
14.059	60.296
14.113	43.381
14.142	44.195
14.143	48.882
14.171	41.748
14.171	44.194
14.201	49.491
14.201	49.899
14.204	65.998
14.285	38.484
14.287	47.247
14.316	46.635
14.403	47.040
14.432	47.243
14.519	48.667
14.519	49.482
14.550	60.893
14.551	62.523
14.578	54.982
14.579	60.892
14.605	46.015
14.607	57.630
14.635	51.720
14.636	57.629
14.637	60.279
14.662	43.568
14.666	62.723
14.692	49.476
14.723	57.219
14.724	64.759
14.750	46.622
14.809	54.567
14.842	73.315
14.867	53.547
14.869	65.570
14.893	41.115
14.897	60.882
14.925	58.640
14.982	54.562
15.014	67.196
15.129	62.709
15.273	63.520
15.330	59.850
15.360	63.110
15.360	65.759
15.445	54.752
15.446	57.808
15.476	63.310
15.504	62.698
15.533	63.308
15.708	67.990
15.708	67.990
15.738	74.102
15.796	74.101
15.823	66.152
15.824	70.228
15.881	69.003
15.882	74.098
15.940	74.300
16.054	65.737
16.143	74.294
16.203	88.557
16.287	73.474
16.287	74.901
16.345	73.472
19.046	140.843];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'LoveMorr1990';  

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#) 
11.385	3785.365
11.790	4575.609
12.164	6214.634
12.164	6214.634
12.190	7707.316
12.193	6302.438
12.251	5804.877
12.334	8643.902
12.514	4956.097
12.888	6565.853
13.000	9024.390
13.000	9024.390
13.033	6185.365
13.320	8204.877
13.366	15697.560
13.377	9024.390
13.431	11365.853
13.696	8526.829
13.724	9082.926
13.730	5687.804
14.182	12858.536
14.185	10956.097
14.595	8175.609
15.478	18156.097];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(10.8);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LoveMorr1990';  

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
%weights.Wwp = 0 * weights.Wwp;
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

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4W7LP'; % Cat of Life
metaData.links.id_ITIS = '644576'; % ITIS
metaData.links.id_EoL = '46568132'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_dallii'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_dallii'; % ADW
metaData.links.id_Taxo = '187265'; % Taxonomicon
metaData.links.id_WoRMS = '274786'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-dallii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_dallii}} ';
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
bibkey = 'LoveMorr1990'; type = 'techreport'; bib = [ ... 
'author = {Miton S. Love and Pamela Morris  and Merritt McCrae and Robson Collins}, ' ...
'year = {1990}, ' ...
'title = {Life History Aspects of 19 Rockfish Species ({S}corpaenidae: {S}ebastes) from the {S}outhern {C}alifornia {B}ight}, ' ...
'institution = {NOAA Technical Report NMFS}, ' ...
'volume = {87}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Chen1971'; type = 'techreport'; bib = [ ... 
'author = {Chen, Lo-Chai}, ' ...
'year = {1971}, ' ...
'title = {Systematics, Variation, Distribution, And Biology Of Rockfishes Of The Subgenus \emph{Sebastomus} ({P}isces, {S}corpaenidae, \emph{Sebastes})}, ' ...
'institution = {BULLETIN OF THE SCRIPPS INSTITUTION OF OCEANOGRAPHY, UNIVERSITY OF CALIFORNIA, LA JOLLA, CALIFORNIA}, ' ...
'volume = {18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-dallii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
