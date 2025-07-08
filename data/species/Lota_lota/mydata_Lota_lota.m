function [data, auxData, metaData, txtData, weights] = mydata_Lota_lota
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Lotidae';
metaData.species    = 'Lota_lota'; 
metaData.species_en = 'Burbot'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % in K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2017 03 18]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 03 18]; 

%% set data
% zero-variate data
data.ah = 30;       units.ah = 'd';    label.ah = 'age at hatch';                bibkey.ah = 'Wiki';    
  temp.ah = C2K(3); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.tb = 8;  units.tb = 'd';    label.tb = 'time since hatch at birth';      bibkey.tb = 'KuprTrab2014'; 
  temp.tb = C2K(10); units.temp.tb = 'K'; label.temp.tb = 'temperature';
data.tp = 4*365;  units.tp = 'd';    label.tp = 'time since hatch at puberty';bibkey.tp = 'Wiki'; 
  temp.tp = C2K(13); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lh = 0.42;      units.Lh = 'cm';   label.Lh = 'total length at hatch';   bibkey.Lh = 'KuprTrab2014';
data.Lb = 0.46;      units.Lb = 'cm';   label.Lb = 'total length at birth';   bibkey.Lb = 'KuprTrab2014';
data.Lp = 40;     units.Lp = 'cm';   label.Lp = 'total length at puberty';    bibkey.Lp = 'fishbase';
data.Li = 152;      units.Li = 'cm';   label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 1 mm: 4/3*pi*0.05^3';
data.Wwp = 320;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on LW data for Lp';
data.Wwi = 34000;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';   

data.Ri = 1.3e6/365; units.Ri = '#/d';  label.Ri = 'reprod rate ';            bibkey.Ri = 'fishbase';
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% tL data 
data.tL = [ ... % age (years), Length (cm)
1	27.137
2	32.496
3	38.498
6	52.722];
data.tL(:,1) = 365 * (.75 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SemdSkor2015';

% tL data since hatch
data.tL_b = [ ... % time since hatch (years), Length (cm)
0.000	0.407
0.887	0.422
1.996	0.445
2.993	0.445
3.991	0.430
5.100	0.430
5.987	0.452
6.984	0.445
7.982	0.460
8.869	0.482
9.978	0.497
10.976	0.497
11.973	0.520
13.027	0.520
13.969	0.580
15.909	0.663
17.960	0.761
20.067	0.889
21.896	1.018
24.002	1.198
25.942	1.266
27.938	1.410
30.044	1.485
31.929	1.590
33.925	1.651
36.031	1.832
37.916	1.952
39.911	2.209
41.851	2.405
44.013	2.585
45.898	2.729
47.949	2.804
50.000	2.917];
units.tL_b = {'d', 'cm'}; label.tL_b = {'time since hatch', 'total length'};  
temp.tL_b = C2K(10);  units.temp.tL_b = 'K'; label.temp.tL_b = 'temperature';
bibkey.tL_b = 'KuprTrab2014';
comment.tL_b = 'Yolk sac larva till 8 d post hatch; flexion larva from 26 till 34 d post hatch';

% LW data 
data.LW = [ ... % log10 total length (cm), log10 wet weight (g)
1.351	1.968
1.360	2.004
1.361	1.961
1.368	1.973
1.378	2.014
1.387	2.024
1.387	2.042
1.397	1.945
1.397	2.146
1.398	1.978
1.398	2.037
1.405	2.027
1.405	2.055
1.405	2.075
1.405	2.103
1.419	2.136
1.421	2.106
1.422	2.149
1.430	2.106
1.436	2.200
1.446	2.134
1.446	2.208
1.446	2.228
1.453	2.254
1.454	2.218
1.461	2.187
1.461	2.218
1.468	2.172
1.468	2.205
1.468	2.261
1.477	2.350
1.477	2.269
1.482	2.361
1.483	2.307
1.483	2.279
1.483	2.246
1.490	2.271
1.490	2.304
1.491	2.330
1.497	2.266
1.497	2.284
1.497	2.373
1.497	2.299
1.503	2.271
1.503	2.310
1.503	2.332
1.503	2.361
1.511	2.228
1.511	2.248
1.511	2.302
1.511	2.320
1.511	2.391
1.511	2.414
1.511	2.445
1.511	2.353
1.512	2.371
1.517	2.371
1.518	2.338
1.518	2.422
1.518	2.452
1.518	2.470
1.518	2.297
1.522	2.320
1.522	2.391
1.522	2.404
1.522	2.455
1.522	2.437
1.530	2.401
1.530	2.414
1.536	2.478
1.542	2.439
1.542	2.513
1.543	2.386
1.543	2.496
1.549	2.503
1.552	2.475
1.555	2.501
1.555	2.531
1.558	2.457
1.561	2.496
1.567	2.465
1.567	2.541
1.567	2.590
1.568	2.511
1.572	2.541
1.579	2.554
1.579	2.569
1.585	2.529
1.588	2.521
1.589	2.615
1.589	2.636
1.590	2.567
1.593	2.610
1.594	2.638
1.594	2.595
1.595	2.557
1.599	2.661
1.610	2.697
1.616	2.648
1.617	2.717
1.633	2.676
1.707	3.015
1.730	3.033
1.797	3.239];
data.LW = 10.^data.LW; % remove log10 transformation
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'SemdSkor2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_b = 10 * weights.tL_b;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
  
%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Requires temperatures of 1 to 4 C to breed for 2 or 3 weeks; optimal incubation between 1 and 7 C';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Females are slightly larger than males and mature later, but differences are small';
metaData.bibkey.F2 = 'CottJohn2013'; 
F3 = 'Only gadiform that lives in freshwater';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3W7KT'; % Cat of Life
metaData.links.id_ITIS = '721687'; % ITIS
metaData.links.id_EoL = '46564471'; % Ency of Life
metaData.links.id_Wiki = 'Lota_lota'; % Wikipedia
metaData.links.id_ADW = 'Lota_lota'; % ADW
metaData.links.id_Taxo = '44325'; % Taxonomicon
metaData.links.id_WoRMS = '154388'; % WoRMS
metaData.links.id_fishbase = 'Lota-lota'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lota_lota}}';
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
bibkey = 'KuprTrab2014'; type = 'article'; bib = [ ...
'author = {K. Kupren and I. Trabska and D. Zarski and S. Krejszeff and K. Palinska-Zarska and D. Kucharczyk}, ' ...
'year   = {2014}, ' ...
'title  = {Early development and allometric growth patterns in burbot Lota lota L.}, ' ...
'journal = {Aquacult Int}, ' ...
'page = {29-39}, ' ...
'volume = {22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WolnKami2002'; type = 'article'; bib = [ ...
'author = {J. Wolnicki and R. Kaminski and L. Myszkowski}, ' ...
'year   = {2002}, ' ...
'title  = {TEMPERATURE-INFLUENCED GROWTH AND SURVIVAL OF BURBOT LOTA LOTA (L.) LARVAE FED LIVE FOOD UNDER CONTROLLED CONDITIONS}, ' ...
'journal = {Archives of Polish Fisheries}, ' ...
'page = {109-113}, ' ...
'volume = {10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SemdSkor2015'; type = 'article'; bib = [ ...
'author = {M. M. Smederevac-Lali\''{c} and S. B. Skori\''{c} and Z. V. Vi\v{s}nji\''{c}-Jefti\''{c} and V. D. Djikanovi\''{c} and B. M. Mi\''{c}kovi\''{c}}, ' ...
'year   = {2015}, ' ...
'title  = {Growth and Weight-Length Relationship of \emph{Burbot Lota lota} ({L}.) ({L}otidae) in the {D}anube {R}iver at {B}a\v{c}ka {P}alanka ({S}erbia)}, ' ...
'journal = {Acta zool. bulg.}, ' ...
'page = {97--103}, ' ...
'volume = {67}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CottJohn2013'; type = 'article'; bib = [ ...
'author = {P. A. Cott and T. A. Johnston and J. M. Gunn}, ' ...
'year   = {2013}, ' ...
'title  = {Sexual dimorphism in an under-ice spawning fish: the burbot (\emph{Lota lota})}, ' ...
'journal = {Can. J. Zool.}, ' ...
'page = {732-740}, ' ...
'volume = {91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lota-lota.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ICES'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.ices.dk/explore-us/projects/EU-RFP/EU Repository/ICES FIshMap/ICES FishMap species factsheet-haddock.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

