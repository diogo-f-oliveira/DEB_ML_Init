function [data, auxData, metaData, txtData, weights] = mydata_Hemimysis_speluncola

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Mysida'; 
metaData.family     = 'Mysidae';
metaData.species    = 'Hemimysis_speluncola'; 
metaData.species_en = 'Opossum shrimp'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMpe', '0iMi'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 09 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 28]; 

%% set data
% zero-variate data

data.ab_14 = 28.5;    units.ab_14 = 'd';    label.ab_14 = 'age at birth';             bibkey.ab_14 = 'GaudGuer1979';   
  temp.ab_14 = C2K(14);  units.temp.ab_14 = 'K'; label.temp.ab_14 = 'temperature';
data.ab_18 = 17;    units.ab_18 = 'd';    label.ab_18 = 'age at birth';             bibkey.ab_18 = 'GaudGuer1979';   
  temp.ab_18 = C2K(18);  units.temp.ab_18 = 'K'; label.temp.ab_18 = 'temperature';
data.ab_22 = 15;    units.ab_22 = 'd';    label.ab_22 = 'age at birth';             bibkey.ab_22 = 'GaudGuer1979';   
  temp.ab_22 = C2K(22);  units.temp.ab_22 = 'K'; label.temp.ab_22 = 'temperature';
data.tp = 34;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GaudGuer1979';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL-curve at 18 C for Lp';
data.am = 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'GaudGuer1979';  
data.Lp  = 0.44;   units.Lp  = 'cm';  label.Lp  = 'length at puberty'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'guess based on same relative length compared to Praunus: 1.8/2.6*0.64';
data.Li  = 0.64;   units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'GaudGuer1979';

data.Wdb = 1.69e-5;   units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'guess';
  comment.Wdb = 'based on (Lb/Li)^3*Wdi';
data.Wdp = 1.56e-4;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty';   bibkey.Wdp = 'guess';
  comment.Wdp = 'based on (Lp/Li)^3*Wdi';
data.Wdi = 5.56e-4;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = 'guess';
  comment.Wdi = 'based on length-weight of Mysis mixta: (0.6/1.470)^3*6.8e-3';
 
data.Ri  = 0.19;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';
  
% uni-variate data

% t-L data
data.tL_10 = [ ... % time since birth (d), standard length (cm)
-8.165	0.216
-1.921	0.224
2.161	0.238
11.047	0.241
14.409	0.258
16.331	0.260
18.972	0.274
20.413	0.274
21.134	0.282
24.976	0.293
27.378	0.319
29.299	0.334
35.303	0.337
37.705	0.371
40.106	0.370
44.189	0.407
47.071	0.441
51.874	0.442
53.555	0.445
56.437	0.481
62.441	0.495
65.803	0.497
68.205	0.529
81.654	0.562
86.217	0.567
93.181	0.566
95.102	0.573
97.984	0.603
100.866	0.605
111.913	0.608];  
data.tL_10(:,1) = data.tL_10(:,1) - data.tL_10(1,1); % convert time to time since birth
units.tL_10   = {'d', 'cm'};  label.tL_10 = {'time since birth', 'total length', '10 C'};  
temp.tL_10    = C2K(10);  units.temp.tL_10 = 'K'; label.temp.tL_10 = 'temperature';
bibkey.tL_10 = 'GaudGuer1979';
%
data.tL_14 = [ ... % time since Dec 1 (d), standard length (cm)
-2.633	0.200
-0.691	0.219
1.328	0.218
1.898	0.239
4.245	0.261
5.133	0.260
5.944	0.276
6.590	0.276
7.403	0.300
8.779	0.318
9.345	0.319
10.241	0.359
11.292	0.363
12.191	0.412
13.730	0.437
14.704	0.462
16.079	0.466
17.537	0.490
18.426	0.492
18.671	0.506
19.159	0.521
20.777	0.533
23.199	0.531];  
data.tL_14(:,1) = data.tL_14(:,1) - data.tL_14(1,1); % convert time to time since birth
units.tL_14   = {'d', 'cm'};  label.tL_14 = {'time since birth', 'total length', '14 C'};  
temp.tL_14    = C2K(14);  units.temp.tL_14 = 'K'; label.temp.tL_14 = 'temperature';
bibkey.tL_14 = 'GaudGuer1979';
%
data.tL_18 = [ ... % time since Dec 1 (d), standard length (cm)
-7.637	0.185
-6.981	0.185
-2.156	0.194
0.497	0.212
1.168	0.221
3.135	0.221
6.244	0.249
9.304	0.249
12.411	0.277
16.614	0.307
18.812	0.314
19.971	0.354
21.720	0.354
22.630	0.376
24.401	0.389
26.178	0.406
26.886	0.438
29.072	0.438
32.393	0.463
33.086	0.486
36.801	0.485
38.802	0.504
40.149	0.526
41.241	0.525
42.142	0.541
43.040	0.556
46.320	0.556
47.429	0.566
49.177	0.565
52.480	0.579
66.686	0.576];  
data.tL_18(:,1) = data.tL_18(:,1) - data.tL_18(1,1); % convert time to time since birth
units.tL_18   = {'d', 'cm'};  label.tL_18 = {'time since birth', 'total length', '18 C'};  
temp.tL_18    = C2K(18);  units.temp.tL_18 = 'K'; label.temp.tL_18 = 'temperature';
bibkey.tL_18 = 'GaudGuer1979';
%
data.tL_22 = [ ... % time since Dec 1 (d), standard length (cm)
-7.432	0.241
-1.945	0.260
5.270	0.260
9.009	0.281
14.277	0.300
16.930	0.326
20.479	0.373
23.103	0.373
25.740	0.386
28.161	0.400
31.703	0.440
34.131	0.461
35.464	0.480
40.068	0.492
40.527	0.512
43.166	0.526
43.379	0.521
46.222	0.522
46.449	0.529
48.656	0.548
53.684	0.547];  
data.tL_22(:,1) = data.tL_22(:,1) - data.tL_22(1,1); % convert time to time since birth
units.tL_22   = {'d', 'cm'};  label.tL_22 = {'time since birth', 'total length', '22 C'};  
temp.tL_22    = C2K(22);  units.temp.tL_22 = 'K'; label.temp.tL_22 = 'temperature';
bibkey.tL_22 = 'GaudGuer1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_14 = 0 * weights.tL_14;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_22','tL_18','tL_14','tL_10'}; subtitle1 = {'Data for 22, 18, 14, 10 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Females release eggs into a brood pouch or marsupium, where they are held until they hatch';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3KQ9V'; % Cat of Life
metaData.links.id_ITIS = '90565'; % ITIS
metaData.links.id_EoL = '128022'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Hemimysis_speluncola'; % ADW
metaData.links.id_Taxo = '408817'; % Taxonomicon
metaData.links.id_WoRMS = '120030'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Mysidae}}';
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
bibkey = 'GaudGuer1979'; type = 'Article'; bib = [ ... 
'author = {R. Gaudy and J. P. Guerin}, ' ... 
'year = {1979}, ' ...
'title = {Ecophysiologie comparee des mysidaces \emph{Hemimysis speluncola} {L}edoyer ({C}arvernicole) at \emph{Leptomysis lingvura} {G}. {O}. {S}ars (non cavernicole). {A}ction de la temperature sur la croissance en elevage}, ' ...
'journal = {J. exp. mar. Biol. Ecol.}, ' ...
'volume = {38}, ' ...
'pages = {101-119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
