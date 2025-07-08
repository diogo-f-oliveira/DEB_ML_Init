  function [data, auxData, metaData, txtData, weights] = mydata_Opsanus_beta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Batrachoidiformes'; 
metaData.family     = 'Batrachoididae';
metaData.species    = 'Opsanus_beta'; 
metaData.species_en = 'Gulf toadfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMr', '0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L_T'; 'L-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author  = {'Bas Kooijman'};                  
metaData.date_subm    = [2014 05 15];                      
metaData.email   = {'bas.kooijman@vu.nl'};      
metaData.address = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 25];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data
data.am = 9*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'MalcBari2009';   
  temp.am = C2K(24.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'fishbase'; 
data.Li = 22;   units.Li = 'cm';  label.Li = 'ultimate total length for females';  bibkey.Li = 'MalcBari2009';
data.Lim = 35;   units.Lim = 'cm';  label.Lim = 'ultimate total length for males';  bibkey.Lim = 'MalcBari2009';

data.Wwb = 3.35e-2;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';    bibkey.Wwb = 'MalcBari2009';
  comment.Wwb = ' based on egg diameter of 0.4 cm: pi/6*0.4^3'; 
  
data.Ri = 2200/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(24.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri  = 'based on kap = 0.6';
  
% uni-variate data
% time-length
data.tL_f = [... % time since birth (d), length (cm)
0.898	6.536
1.307	9.023
1.556	13.854
1.796	14.067
2.065	12.504
2.145	14.423
2.314	10.728
2.315	16.625
2.474	15.062
2.494	10.728
2.554	16.199
2.555	20.107
2.643	17.904
2.653	16.980
3.072	22.877
3.411	19.751
3.481	20.533
3.551	17.691
4.489	20.036
4.748	15.275];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'length', 'female'};
temp.tL_f = C2K(24.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'MalcBari2009'};
comment.tL_f = 'Data for females';
%
data.tL_m = [... % time since birth (d), length (cm)
1.147	10.728
1.237	11.012
1.406	11.083
1.576	7.886
1.995	15.346
2.145	19.396
2.155	14.991
2.244	9.520
2.833	26.146
3.082	20.107
3.162	18.686
3.163	23.659
3.751	24.583
3.830	30.266
4.160	29.698
4.329	29.556
4.479	28.561
4.499	26.217
4.579	24.938
4.908	30.622
5.087	27.496
5.247	32.043
5.586	29.556
6.723	32.895];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'length', 'male'};
temp.tL_m = C2K(24.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'MalcBari2009'};
comment.tL_m = 'Data for males';

% length-weight
data.LW = [ ... % total length (mm), wet weight (g)
11.616	8.548
15.657	6.034
23.737	4.755
54.545	8.395
58.586	8.380
62.121	8.368
65.152	8.357
68.687	8.344
72.727	8.330
76.263	8.317
78.788	9.558
82.828	12.044
87.879	12.026
90.404	12.017
94.444	14.502
97.475	16.991
99.495	16.984
104.040	19.468
106.566	20.709
110.101	25.696
114.141	16.932
116.162	30.675
116.667	19.423
120.707	30.658
122.727	24.401
124.747	34.394
126.263	26.889
128.283	26.881
128.283	39.381
133.333	33.113
134.343	43.110
135.859	30.604
138.889	36.843
141.414	48.084
145.455	33.070
146.970	53.065
151.010	45.550
152.525	59.295
154.040	65.539
155.051	50.536
157.576	55.527
158.586	69.273
162.626	79.259
163.131	53.007
164.646	68.001
167.677	61.741
169.192	81.735
173.232	89.221
173.232	69.221
173.232	66.721
175.253	59.214
177.273	89.206
177.778	76.705
183.333	101.685
183.838	74.183
184.848	84.179
184.848	94.179
188.384	105.417
191.414	95.406
191.414	194.156
195.455	109.141
196.465	120.388
196.970	90.386
197.475	130.384
199.495	101.627
199.495	112.877
199.495	136.627
201.515	122.870
204.545	129.109
210.606	129.087
213.131	119.078
214.646	137.823
215.152	150.321
217.172	156.564
218.687	149.058
220.707	177.801
221.717	169.048
224.747	196.537
225.253	179.035
226.768	169.030
230.808	175.265
230.808	184.015
231.313	197.763
233.838	191.504
234.343	229.003
235.354	208.999
236.364	170.245
237.374	193.992
238.384	188.988
243.939	227.718
247.475	238.956
248.485	188.952
250.000	228.947
253.030	235.186
257.576	241.420
260.101	281.411
260.606	302.659
265.657	295.141
269.192	288.878
270.707	298.873
274.242	336.360
274.747	320.108
275.253	328.856
275.253	363.856
278.283	323.846
280.303	342.588
280.808	328.837
282.828	342.579
284.343	312.574
284.848	243.822
285.354	357.570
287.879	368.811
287.879	378.811
290.404	331.302
294.444	331.288
294.444	355.038
296.465	400.031
298.485	363.773
299.495	383.770
301.010	417.514
302.525	390.009
304.040	372.504
305.051	441.250
308.081	429.989
314.646	474.966
320.707	489.944
328.283	513.667];
data.LW(:,1) = data.LW(:,1)/ 10; % convert mm to cm
units.LW = {'cm', 'g'}; label.LW = {'length', 'wet weight'}; 
bibkey.LW = {'MalcBari2009'};
 
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
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  
                               
%% Links
metaData.links.id_CoL = '6T47D'; % Cat of Life
metaData.links.id_ITIS = '164424'; % ITIS
metaData.links.id_EoL = '46565873'; % Ency of Life
metaData.links.id_Wiki = 'Opsanus_beta'; % Wikipedia
metaData.links.id_ADW = 'Opsanus_beta'; % ADW
metaData.links.id_Taxo = '182070'; % Taxonomicon
metaData.links.id_WoRMS = '275645'; % WoRMS
metaData.links.id_fishbase = 'Opsanus-beta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Opsanus_beta}}';  
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
bibkey = 'MalcBari2009'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2009.02426.x}, ' ...
'author = {E. Malca and J. F. Barimo and J. E. Serafy and P. J. Walsh}, ' ...
'year = {2009}, ' ...
'title = {Age and growth of the gulf toadfish \emph{Opsanus beta} based on otolith increment analysis}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {75}, '...
'pages = {1750-1761}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Opsanus-beta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

