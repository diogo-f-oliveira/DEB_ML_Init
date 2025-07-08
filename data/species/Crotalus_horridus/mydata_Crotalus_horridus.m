function [data, auxData, metaData, txtData, weights] = mydata_Crotalus_horridus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Crotalus_horridus'; 
metaData.species_en = 'Timber rattlesnake'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'Ww-X'; 'L-Ww'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 21];

%% set data
% zero-variate data

data.ab = 135;     units.ab = 'd';    label.ab = 'age at puberty for females';     bibkey.ab = 'AnAge';
  temp.ab = C2K(18); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.tp = 2555;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'AnAge';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1825;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(18); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30.2*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 32.5;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching';     bibkey.Lb  = 'ADW';  
data.Lp  = 72.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'Wiki';  
data.Li  = 138;    units.Li  = 'cm';  label.Li  = 'ultimate total length of females';  bibkey.Li  = 'Wiki';
  comment.Li = 'based on common weight ratio of 1.3 for females vs 2 kg for males: (1.3/2)^(1/3)*Li';
data.Lim  = 159;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length of males';  bibkey.Lim  = 'Wiki';

data.Wwb = 22.5;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'ADW';
  comment.Wwb = '11.2 to 29.1 g';
data.Wwi = 1625;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of females';  bibkey.Wwi = 'ADW';
  comment.Wwi = 'based on common weight ratio of 1.3 for females vs 2 kg for males : (1.3/2)*2.5kg';
data.Wwim = 2500;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'ADW';
  
data.Ri  = 10/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% w-X data 
data.WX = [ ... % wet weight (g), cumulated amont of food eaten (g)
27.771	11.085
30.694	15.000
46.041	36.028
50.426	27.714
57.734	44.342
59.927	55.427
62.119	41.571
65.773	44.342
67.235	66.513
71.620	55.427
82.582	80.370
85.505	124.711
95.006	116.397
97.929	135.797
105.968	130.254
105.969	135.797
106.699	163.510
114.007	130.254
119.123	155.196
138.855	238.337
141.778	218.938
145.432	213.395
147.625	241.109
155.663	213.395
155.664	227.252
159.318	252.194
160.780	296.536
171.742	263.280
176.857	266.051
191.474	354.734
192.205	310.393
192.206	332.564
202.436	329.792
207.552	363.049
211.206	371.363
212.667	210.624
217.783	365.820
219.245	437.875
228.015	407.390
230.938	412.933
241.169	421.247
241.900	432.333
248.477	437.875
258.709	437.875
264.555	543.187
272.594	576.443
280.633	543.187
282.826	443.418
293.788	601.386
293.789	593.072
296.711	501.617
298.173	479.446
299.635	490.531
303.289	501.617
306.212	598.614
314.982	490.531
326.675	565.358
336.175	568.129
340.560	706.697
347.868	595.843
349.330	698.383
352.253	690.069
356.638	676.213
366.870	687.298
366.871	648.499
371.985	615.243
381.486	831.409
385.140	715.012
385.141	753.811
385.871	670.670
386.602	773.210
390.987	665.127
404.872	684.527
406.334	651.270
413.642	770.439
413.643	825.866
416.565	775.982
418.758	825.866
421.681	798.152
422.412	834.180
425.335	850.808
431.912	895.150
445.798	897.921
450.183	945.035
450.184	842.494
486.723	886.836
486.724	931.178
500.609	992.148
571.498	1028.176];
units.WX  = {'g', 'g'};  label.WX = {'wet weight', 'cum food ingested'};  
temp.WX   = C2K(18);  units.temp.WX = 'K'; label.temp.WX = 'temperature';
bibkey.WX = 'ConnRudo2003';
comment.WX = 'temp is guessed';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
31.639	34.650
33.411	31.003
34.541	32.827
35.513	38.298
38.572	31.003
41.493	52.888
42.142	58.359
44.724	60.182
44.729	65.653
46.016	62.006
46.025	72.948
47.635	69.301
47.801	74.772
47.968	82.067
50.556	91.185
50.566	103.951
50.732	109.422
51.530	98.480
51.694	102.128
51.862	111.246
52.497	98.480
52.508	111.246
55.097	122.188
57.269	215.198
58.833	155.015
58.984	142.249
60.442	149.544
60.610	158.663
60.624	175.076
62.091	195.137
62.236	175.076
64.347	191.489
65.129	162.310
67.930	235.258
68.395	211.550
69.369	218.845
69.833	195.137
70.160	200.608
70.523	249.848
74.405	264.438
74.414	275.380
75.067	284.498
75.196	244.377
75.370	260.790
75.869	279.027
76.051	304.559
77.822	300.912
79.766	311.854
79.775	322.796
80.266	331.915
80.555	289.970
80.564	300.912
81.886	341.033
83.356	362.918
83.508	351.976
83.530	379.331
83.545	397.568
84.142	337.386
84.499	381.155
84.510	393.921
84.846	410.334
85.133	366.565
85.353	439.514
85.497	417.629
85.627	379.331
85.681	446.809
87.271	417.629
87.623	454.103
87.733	390.274
89.348	393.921
89.376	428.571
90.667	428.571
93.431	455.927];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'ConnRudo2003';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Viviparous; C. atrox and C. horridus may hybridize in nature; facultative parthenogenesis occurs';
metaData.bibkey.F1 = 'retileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'ZPBS'; % Cat of Life
metaData.links.id_ITIS = '174306'; % ITIS
metaData.links.id_EoL = '963777'; % Ency of Life
metaData.links.id_Wiki = 'Crotalus_horridus'; % Wikipedia
metaData.links.id_ADW = 'Crotalus_horridus'; % ADW
metaData.links.id_Taxo = '50384'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crotalus&species=horridus'; % ReptileDB
metaData.links.id_AnAge = 'Crotalus_horridus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crotalus_horridus}}';
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
bibkey = 'ConnRudo2003'; type = 'Article'; bib = [ ... 
'author = {R. N. Conner and D. C. Rudolph and D. Saenx and R. Schaffer and S. J. Burgdorf}, ' ... 
'year = {2003}, ' ...
'title = {Growth rates and post-release survival of captive neonate timber rattlesnakes, \emph{Crotalus horridus}}, ' ...
'journal = {Herpetologiocal Review}, ' ...
'volume = {34}, ' ...
'pages = {314--317}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/timber-rattlesnake/crotalus-horridus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Crotalus_horridus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Crotalus_horridus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'retileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Crotalus&species=horridus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

