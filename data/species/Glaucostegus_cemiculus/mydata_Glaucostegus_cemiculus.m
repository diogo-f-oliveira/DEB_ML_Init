function [data, auxData, metaData, txtData, weights] = mydata_Glaucostegus_cemiculus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Glaucostegidae';
metaData.species    = 'Glaucostegus_cemiculus'; 
metaData.species_en = 'Blackchin guitarfish';

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0iMcd','0iMm'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 05];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 5*30.5;  units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(25.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'EnajBrad2012';   
  temp.am = C2K(25.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 34;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';
data.Lp  = 158;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase'; 
  comment.Lp = '153-164 cm';
data.Lpm  = 146;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'fishbase'; 
  comment.Lpm = '138-154 cm';
data.Li  = 265;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwi = 112.8e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00347 *Li^3.10, see F1';

data.Ri  = 10/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'till 20 pups per litter; 1 litter per 1 yr or 4-5 pups each 0.5 yr';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.047	36.041
0.952	64.040
1.953	89.876
3.003	114.271
4.005	130.759
4.937	143.655
5.917	152.953
6.921	159.014
7.901	166.155
8.953	174.370
9.957	178.633
10.914	182.180
11.894	186.803
12.923	188.189
13.928	190.295];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
  temp.tL_f = C2K(25.4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EnajBrad2012';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.023	34.604
0.928	63.681
1.977	91.672
2.955	114.993
3.957	131.840
4.961	144.014
5.941	151.154
6.993	156.493
7.950	161.838
8.954	165.022
9.935	168.927];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
  temp.tL_m = C2K(25.4); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EnajBrad2012';
comment.tL_m = 'data for males';

% length - weight
data.LWw_f = [ ... % total length (cm), wet weight (g)
44.061	319.790
46.448	321.276
49.102	447.408
51.223	324.248
59.976	329.696
70.860	1270.080
76.696	1273.712
81.209	1712.204
87.322	3085.304
89.436	2215.252
93.150	2217.563
93.950	2715.986
97.399	2842.613
98.456	2407.588
99.791	3342.026
101.381	3156.294
103.767	3095.540
105.100	3781.016
108.014	3347.144
110.936	3909.129
113.579	2790.444
115.451	4472.105
115.709	3725.378
119.962	4723.876
120.234	5470.934
124.480	5660.298
125.271	5100.624
125.806	5661.124
128.989	5663.105
129.794	6721.697
132.707	6163.344
133.777	7159.861
135.897	6912.217
138.026	7784.913
139.884	7848.308
143.330	7663.732
143.339	8597.347
147.856	9533.769
149.432	7792.012
149.704	8539.070
149.729	11339.913
150.257	11091.281
152.621	8416.402
153.424	9226.031
153.435	10470.851
153.976	11716.000
156.875	9539.382
157.159	11655.742
157.433	12714.004
158.992	9042.775
159.825	13151.177
163.273	13215.563
164.342	14087.599
165.114	11349.488
166.193	13404.102
166.468	14524.606
168.057	14276.634
168.830	11663.006
169.654	14837.793
169.930	16082.777
170.734	17016.887
170.955	12037.773
171.506	14278.780
171.814	19133.742
173.903	15462.843
174.164	14965.081
176.577	17829.653
178.430	17457.363
178.956	16897.524
180.293	18143.169
180.531	15093.525
180.781	13288.701
181.304	12479.897
182.928	16153.108
186.942	20139.009
186.947	20699.178
187.164	15284.375
188.010	20948.802
197.861	25062.817
199.196	26121.739];
units.LWw_f = {'d', 'cm'};  label.LWw_f = {'total length','wet weight','female'};  
bibkey.LWw_f = 'EnajBrad2012';
comment.LWw_f = 'data for females';
%
data.LWw_m = [ ... % total length (cm), wet weight (g)
37.695	315.828
41.938	193.986
47.510	384.176
60.244	578.823
64.224	768.023
69.266	957.883
76.697	1460.435
82.274	2148.552
87.579	2214.096
92.092	2590.349
94.477	2405.111
97.136	3091.413
97.929	2718.462
100.591	3840.451
102.971	3032.803
104.042	4153.802
105.897	3905.993
106.423	3408.395
110.679	4842.579
110.931	3286.721
111.463	3411.532
111.483	5714.450
113.060	4034.934
114.393	4844.891
114.670	6152.117
117.306	4348.779
118.378	5594.259
119.973	5906.456
122.083	4600.716
122.628	6281.554
124.213	5535.652
127.130	5412.984
130.850	6099.948
131.123	6971.487
133.782	7782.272
136.423	6476.861
137.757	7349.060
140.681	8035.527
141.485	8907.398
143.848	6232.519
143.864	8037.508
143.868	8473.196
147.322	9159.992
147.330	9969.126
147.842	7977.745
149.717	9970.612
153.706	11155.666
154.490	9849.103
157.684	11033.661
159.263	9665.351
159.266	10038.797
159.558	12964.289
161.408	12280.792
165.368	10104.834
167.510	12409.073];
units.LWw_m = {'d', 'cm'};  label.LWw_m = {'total length','wet weight','male'};  
bibkey.LWw_m = 'EnajBrad2012';
comment.LWw_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
mmetaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00347 * (TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Ovoviviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3G6MS'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '51263397'; % Ency of Life
metaData.links.id_Wiki = 'Glaucostegus_cemiculus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4784678'; % Taxonomicon
metaData.links.id_WoRMS = '1016062'; % WoRMS
metaData.links.id_fishbase = 'Glaucostegus-cemiculus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glaucostegus_cemiculus}}'; 
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
bibkey = 'EnajBrad2012'; type = 'Article'; bib = [ ... 
'author = {Samira Enajjar and Mohamed Nejmeddine Bradai and Abderrahman Bouain}, ' ... 
'year = {2012}, ' ...
'title = {Age, growth and sexual maturity of the blackchin guitarfish \emph{Rhinobatos cemiculus} in the {G}ulf of {G}ab\`{e}s (southern {T}unisia, central {M}editerranean)}, ' ...
'journal = {Cah. Biol. Mar.}, ' ...
'volume = {53}, ' ...
'pages = {17-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Glaucostegus-cemiculus.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
 