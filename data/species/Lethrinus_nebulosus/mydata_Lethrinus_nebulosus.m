function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_nebulosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_nebulosus'; 
metaData.species_en = 'Spangled emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 28*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EbisOzaw2009';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 38.8; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 87;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 922;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01698*Lp^2.98, see F1';
data.Wwi = 10226;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01698*Li^2.98, see F1';

data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(28); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Lethrinus_miniatus, Ebis2006';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
0.433	10.417
1.083	23.397
1.250	21.178
1.359	22.886
1.359	21.862
1.466	26.814
1.522	25.619
1.575	28.009
1.633	23.571
1.634	22.717
1.739	29.205
1.745	21.693
1.800	21.864
1.852	25.108
1.853	24.084
2.012	32.451
2.071	26.988
2.125	27.842
2.125	27.671
2.179	30.061
2.183	24.427
2.234	29.208
2.345	28.014
2.397	32.112
2.450	34.502
2.508	31.258
2.509	29.893
2.616	33.649
2.667	38.601
2.668	37.747
2.729	30.065
2.774	42.870
2.782	33.138
2.783	30.919
2.835	35.187
2.839	30.577
2.885	41.846
2.889	36.041
2.892	32.797
2.993	44.749
3.057	33.481
3.113	31.945
3.163	38.091
3.166	33.994
3.215	42.360
3.220	36.043
3.272	39.458
3.440	36.215
3.491	40.996
3.494	37.240
3.494	36.727
3.544	43.557
3.603	38.265
3.710	42.192
3.710	42.021
3.764	44.583
3.764	44.241
3.770	35.875
3.880	36.730
3.933	39.632
3.991	35.023
4.043	38.609
4.151	42.024
4.208	39.463
4.258	45.781
4.312	46.635
4.314	44.415
4.316	41.513
4.372	41.172
4.373	39.806
4.374	38.781
4.423	46.123
4.475	50.050
4.646	42.027
4.704	38.954
4.748	52.271
4.755	43.564
4.919	45.101
4.969	51.590
4.971	49.199
5.028	46.468
5.082	47.663
5.190	50.396
5.191	48.859
5.300	51.079
5.356	50.055
5.413	47.495
5.413	46.812
5.683	53.130
5.746	42.887
5.795	51.765
5.858	41.692
5.904	52.619
5.908	47.668
5.961	49.888
6.076	43.230
6.125	51.084
6.182	48.694
6.183	47.670
6.185	44.938
6.289	53.304
6.510	51.769
6.569	46.989
6.731	51.087
6.787	49.210
6.895	52.625
7.058	55.358
7.062	49.723
7.390	53.140
7.393	48.530
7.828	55.533
7.833	49.899
7.835	46.655
8.053	49.388
8.105	54.168
8.264	61.340
8.271	52.974
8.823	50.758
9.265	49.053
10.246	61.181
10.255	49.229
10.909	58.282
10.911	55.038
11.075	56.405
11.126	62.210
11.679	58.969
11.684	52.994
11.900	57.434
12.011	56.922
12.069	52.825
12.070	51.289
12.178	54.021
12.285	57.778
12.397	56.071
12.890	58.635
12.950	52.489
14.209	61.032
15.149	55.404
16.354	63.093
17.623	59.857
18.178	54.396
19.108	61.743
19.825	59.869
20.151	65.164
24.117	61.772
26.924	61.617];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EbisOzaw2009';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
0.380	7.856
0.488	9.735
0.760	14.346
0.924	16.054
0.925	13.664
2.505	35.527
2.618	31.601
2.678	25.113
2.727	32.626
2.951	27.505
3.160	41.506
3.217	40.141
3.324	43.727
3.325	42.702
3.432	46.459
3.541	47.655
3.762	46.119
3.768	38.436
3.877	39.803
3.928	45.267
3.935	36.901
4.035	48.853
4.036	47.828
4.926	35.882
5.079	51.590
5.197	41.688
5.303	47.152
5.744	46.301
5.855	45.107
6.127	48.864
6.289	53.304
6.291	50.573
6.565	52.623
6.626	44.940
6.951	50.918
7.168	54.846
7.175	46.309
7.283	49.383
8.157	57.413
8.158	55.705
8.271	51.950
8.934	49.563
8.987	52.466
9.260	54.516
9.865	55.203
10.637	53.671
10.859	51.794
12.067	55.386
12.288	54.534
12.340	57.949
12.891	57.098
13.112	55.904
14.213	55.910
15.093	56.769
15.262	52.843
22.908	59.545];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EbisOzaw2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01698*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6PR26'; % Cat of Life
metaData.links.id_ITIS = '169143'; % ITIS
metaData.links.id_EoL = '46580953'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_nebulosus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_nebulosus'; % ADW
metaData.links.id_Taxo = '45299'; % Taxonomicon
metaData.links.id_WoRMS = '212081'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-miniatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_nebulosus}}';
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
bibkey = 'EbisOzaw2009'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-009-0061-9}, ' ...
'author = {Akihiko Ebisawa and Takakazu Ozawa}, ' ... 
'year = {2009}, ' ...
'title = {Life-history traits of eight \emph{Lethrinus} species from two local populations in waters off the {R}yukyu {I}slands}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {75}, ' ...
'pages = {553–566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GomaSiju2021'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.15461}, ' ...
'author = {Pitchaimuthu Gomathi and Ramachandran Siju and Mathavankonathu Kuttan Anil and Gopidas P. Ambarish and Sumathi Surya and Bhargavan Raju and Padikkala Kandiyil Raheem and Boby Ignatius and Achamveettil Gopalakrishnan}, ' ... 
'year = {2021}, ' ...
'title = {Embryonic and larval development of Pink ear emperor, \emph{Lethrinus lentjan} ({L}acepede, 1802) under captive conditions}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {52}, ' ...
'pages = {5857–5869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DegoAli2013'; type = 'Article'; bib = [ ... 
'author = {A. S. O. Abu Degoon and S. M. Ali}, ' ... 
'year = {2013}, ' ...
'title = {On some reproductive aspects of the Sky Emperor, \emph{Lethrinus mahsena} ({P}ieces) in the {S}udanese {R}ed {S}ea}, ' ...
'journal = {SJBS (B)}, ' ...
'volume = {17}, ' ...
'pages = {51-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ebis2006'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-006-0345-3}, ' ...
'author = {Akihiko Ebisawa}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive and sexual characteristics in five Lethrinus species in waters off the {R}yukyu {I}slands}, ' ...
'journal = {Ichthyol Res}, ' ...
'volume = {53}, ' ...
'pages = {269–280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-nebulosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
