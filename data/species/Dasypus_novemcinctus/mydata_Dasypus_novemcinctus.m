function [data, auxData, metaData, txtData, weights] = mydata_Dasypus_novemcinctus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cingulata'; 
metaData.family     = 'Dasypodidae';
metaData.species    = 'Dasypus_novemcinctus'; 
metaData.species_en = 'Common long-nosed armadillo'; 
metaData.ecoCode.climate = {'A', 'BSh', 'Cwa', 'Cwb', 'Cfa'};
metaData.ecoCode.ecozone = {'TN', 'THn'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(34.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-Wwe'; 't-Le'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2014 07 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 133;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 137;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(34.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 90;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  comment.Li = 'Wiki: 64-107 cm';

data.Wwb = 66;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 5500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: max 10 kg';

data.Ri  = 4/ 365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(34.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	 89.49
4.186	145.41
8.398	167.79
12.606	212.53
15.764	234.90
22.082	268.46
23.131	290.83
30.502	335.57
33.657	369.13
38.921	402.68
45.235	458.61
46.298	413.87
53.668	458.61
54.706	536.91
57.848	637.58
57.890	436.24
59.982	514.54
61.008	648.77
69.432	693.51
74.680	805.37
76.800	749.44
76.812	693.51
82.045	872.48
82.057	816.55
82.076	727.07
86.241	973.15
89.396	1006.71
91.526	906.04
99.955	928.41
103.087	1073.83
103.099	1017.90
108.334	1185.68
109.412	1073.83
114.643	1263.98
116.761	1219.24
120.964	1286.35
127.275	1353.47
136.732	1498.88
137.805	1409.40
144.109	1510.07
149.350	1655.48
150.454	1420.58
152.496	1733.78
158.880	1454.14
159.854	1834.45
166.234	1577.18
168.276	1890.38
173.594	1666.67
180.854	2237.14
182.028	1666.67
187.287	1722.60
189.271	2315.44
193.594	1812.08
195.561	2483.22
203.072	1856.82
210.433	1946.31
215.659	2158.84
219.770	2662.19
225.117	2304.25
228.187	2740.49
230.307	2684.56
230.399	2248.32
235.649	2348.99
237.746	2404.92
241.913	2639.82
241.913	2639.82
244.043	2539.15
247.170	2706.94
252.463	2606.26
258.757	2751.68
266.104	2908.28
267.181	2796.42
270.325	2885.91
280.867	2885.91
287.207	2818.79
288.216	3031.32
294.549	2997.76
296.617	3187.92
297.690	3098.43
300.841	3154.36
308.204	3232.66
310.341	3098.43
312.414	3266.22
315.588	3210.29
318.737	3277.40
321.925	3154.36
325.079	3199.11
331.387	3277.40
337.724	3221.48
342.955	3411.63
342.972	3333.33
350.309	3534.68
356.637	3523.49
362.934	3657.72
372.448	3534.68
376.643	3635.35
382.952	3713.65
391.386	3713.65
397.678	3870.25
405.050	3903.80
411.352	4015.66
418.725	4049.22
426.121	3970.92
433.498	3982.10
439.797	4105.15
444.026	4049.22
452.464	4026.85
460.910	3970.92
468.275	4038.03
474.598	4049.22
481.987	4004.47
488.305	4038.03
495.682	4049.22
503.062	4049.22
509.390	4038.03
516.776	4004.47
525.208	4015.66
529.429	3993.29
536.799	4038.03
549.450	4038.03
556.836	4004.47
570.539	4015.66
570.539	4015.66
592.666	4071.59
608.479	4071.59
636.919	4183.45
659.067	4138.70
681.173	4295.30
698.026	4362.42
709.575	4586.13
712.757	4496.64
721.186	4519.02];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'McDoMsPh1968';
%
data.tW1 = [ ... 
0.003	1274.788
0.990	3626.062
1.984	3824.363
2.991	4164.306
2.991	4164.306
3.997	3824.363
4.992	4263.456
5.984	3541.076];
data.tW1(:,1) = 120 + 365 * data.tW1(:,1); % convert yr to d
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(34.5);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'McDoMsPh1968';

% t-Ww foetal development from faunaparaguay
tWL = [ ... age (d), weight (g), hindfoot (c)
 50  2 0.7
 70 16 1.3
 90 36 2.0
120 64 2.7];
data.tWe = tWL(:,[1 2 ]); 
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'embryo wet weight'};  
temp.tWe    = C2K(34.5);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'faunaparaguay';
%
data.tLe = tWL(:,[1 3]); 
units.tLe   = {'d', 'cm'};  label.tLe = {'age', 'embry foot length'};  
temp.tLe    = C2K(34.5);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'faunaparaguay';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'the 4 cups originate from a single eggs cell';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '349W8'; % Cat of Life
metaData.links.id_ITIS = '180103'; % ITIS
metaData.links.id_EoL = '328482'; % Ency of Life
metaData.links.id_Wiki = 'Dasypus_novemcinctus'; % Wikipedia
metaData.links.id_ADW = 'Dasypus_novemcinctus'; % ADW
metaData.links.id_Taxo = '60596'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11700009'; % MSW3
metaData.links.id_AnAge = 'Dasypus_novemcinctus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dasypus_novemcinctus}}';
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
bibkey = 'McDoMcPh1998'; type = 'Article'; bib = [ ... 
'author = {McDonough, C. M. and McPhee, S. A. and Loughry, W. J.}, ' ... 
'year = {1998}, ' ...
'title = {Growth rates of juvenile nine-banded armadillos}, ' ...
'journal = {The Southern Naturalist}, ' ...
'volume = {43}, ' ...
'pages = {462--468}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dasypus_novemcinctus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'faunaparaguay'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.faunaparaguay.com/mamm8Dasypusnovemcinctus.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

