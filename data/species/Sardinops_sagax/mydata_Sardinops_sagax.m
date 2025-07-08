function [data, auxData, metaData, txtData, weights] = mydata_Sardinops_sagax

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Sardinops_sagax'; 
metaData.species_en = 'Blue pilchard'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI', 'MP'};
metaData.ecoCode.habitat = {'0iMpe', '0iMr'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 12 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 15]; 


%% set data
% zero-variate data;

data.ab = 2;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'fishbase';    
  temp.ab = C2K(19);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 365;   units.tp = 'd';    label.tp = 'time since birth at puberty';            bibkey.tp = 'Wiki';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 9;   units.Lp  = 'cm';   label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 39.5; units.Li  = 'cm';  label.Li  = 'ultimate standard length';   bibkey.Li  = 'fishbase';

data.Wwb = 8e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.9-1.4 mm : pi/6*0.115^3';
data.Wwi = 486;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.R13  = 10e3/365;   units.R13  = '#/d';  label.R13  = 'reprod rate at SL 13 cm';    bibkey.R13  = 'fishbase';  
  temp.R13 = C2K(20);  units.temp.R13 = 'K'; label.temp.R13 = 'temperature';
data.R18  = 46e3/365;   units.R18  = '#/d';  label.R18  = 'reprod rate at SL 18 cm';    bibkey.R18  = 'fishbase';  
  temp.R18 = C2K(20);  units.temp.R18 = 'K'; label.temp.R18 = 'temperature';
  
% uni-variate data

% time-length data
data.tL = [ % time since birth (d), standard length (cm)
43.033	3.105
43.033	3.428
45.687	3.825
46.066	3.378
46.256	2.607
47.393	4.421
47.583	3.874
49.100	4.520
49.289	3.625
50.616	4.892
50.995	3.998
51.185	4.768
51.564	5.091
51.564	3.799
51.943	4.470
53.270	4.146
54.408	3.599
54.787	3.798
54.787	4.742
54.976	4.171
54.976	4.419
54.976	4.966
55.924	5.164
56.493	4.096
56.872	4.319
57.630	3.822
57.630	4.220
58.009	5.114
58.199	3.226
58.578	4.468
59.147	4.021
59.336	3.524
59.526	5.114
60.284	4.567
60.664	4.244
60.853	4.940
61.043	5.288
61.043	4.492
61.422	3.871
62.370	5.262
62.749	5.461
63.128	4.020
64.076	5.014
64.076	4.591
64.265	4.094
64.834	4.690
65.024	5.386
66.161	4.889
66.919	5.187
67.109	4.640
67.867	4.218
68.626	6.056
68.815	4.590
69.763	6.478
70.142	6.751
71.090	5.211
71.469	5.981
71.659	5.534
71.659	6.701
72.038	4.689
72.417	5.086
72.796	6.428
73.555	5.061
73.934	5.881
73.934	5.583
75.071	6.328
75.450	6.527
75.640	4.688
75.640	6.701
75.640	6.949
76.019	5.508
76.019	5.781
76.967	6.899
76.967	6.999
77.156	6.079
78.104	4.787
78.104	7.172
78.294	6.526
78.483	5.085
78.483	5.880
78.673	6.700
79.810	6.054
79.810	5.681
80.000	6.476
80.190	6.849
80.758	7.196
80.758	5.482
81.896	5.184
82.085	6.923
83.033	6.351
83.602	7.097
83.602	5.879
83.602	7.270
83.791	6.575
85.308	6.972
85.687	7.320
85.877	6.376
86.256	5.257
86.825	6.773
86.825	7.245
88.152	6.350
88.341	7.096
88.910	7.319
88.910	7.443
89.100	6.797
90.616	7.965
90.806	7.045
91.943	7.443
92.133	6.325
92.512	6.896
93.839	6.821
93.839	7.020
94.028	7.989
97.251	7.988
98.009	7.267
105.213	8.309
107.867	8.160
108.057	8.806
109.194	9.004
111.659	8.308
114.313	8.631
114.502	10.022
117.915	8.456
119.431	8.654
120.190	9.598
120.948	8.952
123.223	7.908
124.360	8.554
124.550	8.976
124.739	8.256
127.204	9.224
127.962	9.224
130.616	8.428
134.218	9.546
135.355	8.452
135.545	9.272
140.284	10.538
145.024	9.469
145.213	10.140
146.730	9.543
158.673	10.162];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'QuinNeva2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwb = 5 * weights.Wwb;
weights.ab = 0 * weights.ab;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00871*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XMKV'; % Cat of Life
metaData.links.id_ITIS = '161729'; % ITIS
metaData.links.id_EoL = '46562463'; % Ency of Life
metaData.links.id_Wiki = 'Sardinops_sagax'; % Wikipedia
metaData.links.id_ADW = 'Sardinops_sagax'; % ADW
metaData.links.id_Taxo = '42672'; % Taxonomicon
metaData.links.id_WoRMS = '217452'; % WoRMS
metaData.links.id_fishbase = 'Sardinops-sagax'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sardinops_sagax}}';
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
bibkey = 'QuinNeva2000'; type = 'Article'; bib = [ ... 
'author = {C. Qui\~{n}onez-Vel\''{a}zquez and M. O. Nevarez-Mart\''{i}nez and M. G. Gluyas-Mill\''{a}n}, ' ... 
'year = {2000}, ' ...
'title = {Growth and hatching dates of juvenile {P}acific sardine \emph{Sardinops caeruleus} in the {G}ulf of {C}alifornia}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {48}, ' ...
'pages = {99-106}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sardinops-sagax.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
  
