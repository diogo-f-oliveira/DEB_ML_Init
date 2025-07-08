function [data, auxData, metaData, txtData, weights] = mydata_Panthera_onca
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Panthera_onca'; 
metaData.species_en = 'Jaguar'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 99;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(37.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 126;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on Oreamnos';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 730;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.0);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 28*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(37.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
data.Wwb = 820;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 5034; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 65e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'John2016';
data.Wwim = 75e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'John2016';
  
data.Ri  = 0.5*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.0);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 0.5 litters per yr';

% uni-variate data

% time-weight
data.tW_f = [ % time since birth (d), wet weight (kg)
9.243	1.273
16.637	1.636
23.107	2.182
27.728	2.364
30.501	2.727
37.895	3.273
41.592	3.636
47.137	5.091
48.062	3.636
50.834	3.818
55.456	5.455
61.001	3.818
61.926	6.000
61.926	5.091
69.320	6.545
76.714	6.545
78.562	6.727
82.259	7.636
85.956	8.182
92.426	8.909
93.350	8.727
97.972	9.636
97.972	9.091
101.669	10.182
108.139	10.909
115.533	12.364
122.927	13.818
130.321	16.000
134.942	16.000
140.488	15.636
143.261	16.364
158.973	19.091
172.837	22.182
195.944	27.091
207.035	31.091
216.277	32.182
216.277	37.636
226.444	33.636
242.157	37.273
260.642	41.273
296.688	46.727
317.022	54.909
317.022	60.727
327.189	53.091
328.113	62.182
340.128	53.818
346.598	59.091
346.598	65.636
371.553	64.545
371.553	57.273
374.326	53.818
392.811	59.636
393.736	64.727
412.221	53.818
422.388	58.182
428.858	66.000
437.176	52.727
457.510	56.909
458.434	68.000
473.222	54.545
492.632	64.000
494.480	57.455
500.026	57.818
500.950	64.182
513.890	55.455
521.284	58.909
540.693	61.818
548.087	59.455
558.254	61.091
559.178	58.364
590.603	53.455
622.028	59.818
660.847	54.545
695.969	55.273]; 
data.tW_f(:,2) = data.tW_f(:,2)*1e3; % convert kg to g
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'total weight', 'female'};  
temp.tW_f  = C2K(37.0);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'John2016';
comment.tW_f = 'Data for females';
% 
data.tW_m = [ ... % time since birth (d), wet weight (kg)
0.001	0.879
8.990	0.886
17.982	1.243
24.276	1.422
29.670	1.601
35.964	1.781
44.060	2.488
44.064	3.013
48.558	3.016
51.261	3.719
56.651	3.373
58.463	5.126
61.154	4.427
67.450	4.957
69.241	4.082
72.851	5.837
73.744	5.137
78.240	5.315
80.043	6.017
83.636	5.669
83.648	7.071
89.940	7.075
92.631	6.377
92.648	8.479
96.232	7.080
101.622	6.734
101.628	7.434
105.235	8.838
112.406	6.391
114.232	9.896
116.014	7.970
123.216	9.201
123.228	10.778
126.800	7.803
132.227	12.011
133.113	10.435
135.801	9.386
143.906	11.143
146.608	11.846
146.616	12.897
146.628	14.298
152.926	15.003
156.536	16.758
161.017	15.184
161.053	19.563
163.721	16.062
166.432	17.816
168.238	18.868
168.257	21.145
168.261	21.671
169.117	16.417
173.662	22.550
179.011	17.124
179.932	19.928
179.965	23.956
185.314	18.530
188.065	25.188
189.867	25.715
191.634	21.863
197.936	23.094
197.963	26.422
198.822	21.518
200.607	19.943
205.135	24.150
205.173	28.704
208.727	23.627
208.741	25.379
209.678	30.109
214.131	25.032
215.040	26.259
215.090	32.390
216.950	39.923
223.123	25.389
224.038	27.316
225.886	33.448
227.625	26.268
232.130	27.673
232.141	28.899
237.531	28.552
238.497	36.786
241.142	30.482
244.801	38.191
252.902	39.599
260.106	41.180
267.313	43.112
275.423	45.571
279.922	46.099
283.517	46.102
288.917	46.982
296.116	47.863
297.013	47.688
301.508	47.691
303.315	48.919
310.509	49.274
310.515	49.975
315.115	62.940
317.712	50.681
322.202	50.159
324.160	69.778
331.202	51.567
332.095	50.867
338.402	52.623
341.987	51.399
343.045	70.843
344.697	52.978
348.292	52.980
354.595	54.211
365.387	54.920
372.586	55.976
388.794	59.316
393.374	69.829
400.489	60.550
401.464	69.834
416.689	63.014
423.046	70.901
429.289	64.950
443.695	67.939
457.183	68.474
457.200	70.576
491.351	69.725
491.359	70.776
498.583	74.810
512.015	68.514
523.735	72.726
528.185	67.300
545.275	68.713
575.833	68.210
600.115	69.804
630.679	70.002
658.545	70.197
695.400	70.224
724.159	69.720]; 
data.tW_m(:,2) = data.tW_m(:,2)*1e3; % convert kg to g
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'total weight', 'male'};  
temp.tW_m  = C2K(37.0);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'John2016';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 2 * weights.Wwi;
weights.Wwim = 2 * weights.Wwim;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4CGXQ'; % Cat of Life
metaData.links.id_ITIS = '180593'; % ITIS
metaData.links.id_EoL = '328606'; % Ency of Life
metaData.links.id_Wiki = 'Panthera_onca'; % Wikipedia
metaData.links.id_ADW = 'Panthera_onca'; % ADW
metaData.links.id_Taxo = '67276'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000240'; % MSW3
metaData.links.id_AnAge = 'Panthera_onca'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Panthera_onca}}';
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
bibkey = 'John2016'; type = 'techreport'; bib = [ ... 
'author = {S. Johnson}, ' ... 
'year = {2016}, ' ...
'title = {AZA Jaguar Species  Survival  Plan (2016).   Jaguar Care  Manual}, ' ...
'institution = {Silver  Spring,  MD: Association  of  Zoos  and Aquariums}, ' ...
'howpublished = {\url{https://www.speakcdn.com/assets/2332/jaguar_care_manual_2016.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Panthera_onca}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Panthera_onca/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

