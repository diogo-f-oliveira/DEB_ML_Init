function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_reidi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_reidi'; 
metaData.species_en = 'Longsnout seahorse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 17];

%% set data
% zero-variate data

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(26.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 3.5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Matl1992';   
  temp.am = C2K(26.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.8;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'HoraJoye2009'; 
  comment.Lb = 'based on tL data';
data.Lp  = 8;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 17.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 0.0023; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = {'fishbase','HoraJoye2009'};
  comment.Wwb = 'based on 0.00447*Lb^3.00, see F1; egg diameter 1.2 mm';
data.Wwp = 2.27;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00444*Lp^3.00, see F1';
data.Wwi = 23.8;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.00, see F1';

data.Ri  = 1572/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'HoraJoye2009';   
  temp.Ri = C2K(26.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ...
0.024	0.933
0.115	0.754
2.396	1.052
4.005	1.310
6.292	1.370
6.564	1.271
7.768	1.569
9.781	1.827
10.062	1.391
10.338	1.113
11.662	1.947
11.943	1.510
13.680	2.026
13.957	1.729
13.962	1.550
15.698	2.086
15.839	1.848
15.843	1.689
15.960	2.344
19.862	2.424
20.006	2.107
20.145	1.928
24.158	2.901
24.186	1.869
24.310	2.246
24.443	2.306
27.552	1.870
27.659	2.902
27.796	2.803
27.920	3.180
28.483	2.287
31.283	3.319
31.811	3.676
32.085	3.518
32.369	2.962
38.267	3.935
38.676	3.757
38.691	3.201
38.841	2.626
39.092	3.301
39.353	3.618
45.667	4.115
45.685	3.461
45.794	4.413
46.057	4.651
52.616	6.081
52.788	4.692
52.907	5.268
53.045	5.148
53.064	4.454
59.371	5.229
59.475	6.340
59.481	6.122
59.631	5.546
59.871	6.658
73.837	7.990
73.852	7.434
73.892	5.966
73.979	7.732
80.303	7.891
80.583	7.475
80.689	8.526
80.742	6.582
80.970	8.090
87.031	8.012
87.425	8.409
87.575	7.833
87.583	7.536
87.587	7.377
94.690	8.608
94.693	8.469
94.857	7.398
94.985	7.656
94.994	7.299
95.266	7.200
101.398	9.502
101.729	7.201
101.826	8.590
101.933	9.602
101.977	7.995
108.440	7.956
108.563	8.412
108.687	8.809
108.972	8.214];
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(26.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HoraJoye2009';

% length-weight
data.LW = [ ... % length (cm), weight (g)
0.720	0.036
0.830	0.042
0.977	0.036
1.111	0.030
1.209	0.030
1.331	0.048
1.441	0.071
1.502	0.060
1.612	0.048
1.685	0.054
1.734	0.071
1.905	0.071
2.002	0.006
2.161	0.065
2.332	0.077
2.515	0.048
2.540	0.173
2.894	0.095
2.955	0.089
3.053	0.125
3.223	0.143
3.358	0.161
3.468	0.137
3.565	0.155
3.712	0.196
3.895	0.220
3.980	0.208
4.176	0.256
4.298	0.292
4.493	0.304
4.579	0.339
4.823	0.339
5.128	0.351
5.214	0.315
5.263	0.500
5.275	0.470
5.531	0.488
5.873	0.667
6.020	0.643
6.068	0.726
6.337	0.792
6.374	0.750
6.532	0.869
6.618	0.786
6.642	0.994
7.131	1.048
7.167	1.202
7.253	1.000
7.326	1.054
7.387	1.256
7.509	1.327
7.595	1.179
7.705	1.411
7.753	1.363
7.753	1.554
7.814	1.149
7.827	1.280
7.949	1.595
7.973	1.345
7.998	1.464
8.059	1.440
8.168	1.530
8.205	1.679
8.339	1.952
8.388	1.756
8.400	1.607
8.437	1.583
8.523	1.774
8.632	1.905
8.657	1.815
8.767	2.446
8.852	2.071
9.463	2.339
9.585	2.482];
units.LW   = {'cm', 'g'};  label.LW = {'length','weight'};  
bibkey.LW = 'HoraJoye2009';    

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00447*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LZP5'; % Cat of Life
metaData.links.id_ITIS = '166492'; % ITIS166493
metaData.links.id_EoL = '46567771'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_reidi'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_reidi'; % ADW
metaData.links.id_Taxo = '176707'; % Taxonomicon
metaData.links.id_WoRMS = '159446'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus-reidi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_reidi}}';
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
bibkey = 'HoraJoye2009'; type = 'Article'; bib = [ ... 
'author = {Maik dos Santos Cividanes da Hora and Jean-Christophe Joyeux}, ' ... 
'year = {2009}, ' ...
'title = {Closing the reproductive cycle: {G}rowth of the seahorse \emph{Hippocampus reidi} ({T}eleostei, {S}yngnathidae) from birth to adulthood under experimental conditions}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {292(1/2)}, ' ...
'pages = {37-41}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus-reidi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

