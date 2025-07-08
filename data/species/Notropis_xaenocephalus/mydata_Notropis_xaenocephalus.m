function [data, auxData, metaData, txtData, weights] = mydata_Notropis_xaenocephalus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_xaenocephalus'; 
metaData.species_en = 'Coosa shiner'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 16]; 

%% set data
% zero-variate data

data.am = 4*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'JollPowe2008';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'JollPowe2008'; 
data.Li = 6.39;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'JollPowe2008'; 

data.Wwb = 1.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'JollPowe2008';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwi = 4.4;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'JollPowe2008';

data.Ri = 540/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'JollPowe2008';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time (d), std length (cm)
87.953	3.210
95.551	2.766
122.177	3.640
122.303	3.384
149.128	3.855
151.793	3.438
181.388	3.277
181.434	3.183
240.281	3.559
304.002	4.030
308.868	4.137
335.653	4.688
338.159	4.594
367.649	4.648
399.585	4.728
399.618	4.661
429.161	4.608
431.667	4.513
456.184	4.675
483.135	4.890
483.208	4.742
515.210	4.688
522.536	4.796
549.738	4.500
581.628	4.675
584.048	4.755
608.783	4.473
613.577	4.728
638.002	5.078
638.035	5.011
669.931	5.172
670.031	4.970
697.061	5.024
704.380	5.145
731.371	5.280
736.382	5.091
760.867	5.320
790.277	5.535
790.323	5.441
822.359	5.320
854.103	5.790
883.619	5.790
913.248	5.562
1006.365	6.274
1068.049	5.884
1126.995	6.059
1158.905	6.194
1161.404	6.113];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'JollPowe2008'; 
comment.tL = 'from Moore Creek between August 2004 and July 2005';

% time - weight
data.tWw = [ ... % time since birth (d), eviscerated wet weight (g)
63.952	0.385
63.952	0.253
93.468	0.604
98.387	0.440
125.444	0.527
125.444	0.659
157.419	0.396
218.911	0.571
280.403	0.989
280.403	0.934
312.379	1.374
339.435	1.418
344.355	1.352
376.331	1.429
376.331	1.418
403.387	1.286
405.847	1.176
435.363	1.297
464.879	1.429
469.798	1.341
494.395	1.297
494.395	1.352
526.371	1.242
528.831	1.198
555.887	1.264
555.887	1.297
585.403	1.473
585.403	1.209
619.839	1.681
619.839	1.615
649.355	1.780
649.355	1.780
651.815	1.846
676.411	1.791
678.871	1.769
710.847	1.846
737.903	2.143
737.903	2.088
769.879	2.110
769.879	2.165
796.935	1.890
833.831	2.418
860.887	2.308
892.863	2.099
986.331	3.330
1042.903	2.824
1104.395	3.220
1136.371	2.560
1138.831	3.637];
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'wet weight'};  
temp.tWw = C2K(15);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'JollPowe2008'; 
comment.tWw = 'from Moore Creek between August 2004 and July 2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed nor to differ from females';
D2 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.83 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6SD5W'; % Cat of Life
metaData.links.id_ITIS = '163474'; % ITIS
metaData.links.id_EoL = '49291090'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_xaenocephalus'; % Wikipedia
metaData.links.id_ADW = 'Notropis_xaenocephalus'; % ADW
metaData.links.id_Taxo = '181560'; % Taxonomicon
metaData.links.id_WoRMS = '1020250'; % WoRMS
metaData.links.id_fishbase = 'Notropis-xaenocephalus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_xaenocephalus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-xaenocephalus.html}}';  
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
bibkey = 'JollPowe2008'; type = 'article'; bib = [ ... 
'author = {Danielle M. Jolly and Steven L. Powers}, ' ... 
'year = {2008}, ' ...
'title = {Life-history Aspects of \emph{Notropis xaenocephalus} ({C}oosa Shiner) ({A}ctinopterygii: {C}yprinidae) in {N}orthern {G}eorgia}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {7(3)}, ' ...
'pages = {449-458}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

