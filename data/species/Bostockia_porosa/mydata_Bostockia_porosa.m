  function [data, auxData, metaData, txtData, weights] = mydata_Bostockia_porosa
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Percichthyidae';
metaData.species    = 'Bostockia_porosa'; 
metaData.species_en = 'Nightfish'; 

metaData.ecoCode.climate = {'Csb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 03];

%% set data
% zero-variate data
data.ab = 14; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'based on Wwp=0.00389*Lp^3.12, see F1';
data.Li = 15;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'PenPott1990';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 3.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on WN data';
data.Wwi = 18.2;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00389*Li^3.12, see F1';
 
% uni-variate data

% time-length-weight
data.tL_f = [ ... % time since hatch (yr), total length (cm)
0.132	1.399
0.198	2.447
0.305	3.019
0.359	3.178
0.439	3.845
0.559	4.163
0.586	4.385
0.666	4.545
0.773	4.799
0.907	5.371
0.974	5.848
1.054	6.038
1.121	6.134
1.242	6.325
1.254	7.214
1.389	6.548
1.443	6.739
1.524	6.421
1.604	6.581
1.698	7.121
1.792	6.931
1.885	7.598
1.979	7.820
2.033	7.630
2.140	8.361
2.206	8.901
2.300	9.092
2.369	7.695
2.529	8.712
2.744	8.427
2.811	8.745
2.851	9.094
3.199	10.207
3.348	9.128
3.442	9.732
3.645	8.241
3.763	11.003
3.871	10.146
4.020	9.480
4.097	11.893
4.637	10.277
4.893	9.707
5.053	10.374
5.253	12.280];
data.tL_f(:,1) = (0.2 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PenPott1990';
%
data.tL_m = [ ... % time since hatch (yr), total length (cm)
0.093	1.376
0.170	2.399
0.221	3.038
0.353	3.518
0.432	3.902
0.512	4.126
0.578	4.478
0.670	4.893
0.750	4.958
0.857	5.309
0.923	5.597
1.002	5.885
1.067	6.333
1.133	6.621
1.227	6.621
1.362	6.558
1.415	6.654
1.444	6.335
1.563	6.591
1.656	7.006
1.724	6.847
1.819	6.624
1.923	7.327
2.003	7.455
2.040	8.286
2.135	8.191
2.267	8.639
2.363	8.288
2.580	7.714
2.642	8.992
2.742	7.491
2.987	10.112
3.071	9.345
3.166	8.930
3.219	9.122
3.506	7.877
3.638	8.677
3.729	9.220
4.073	10.564
4.264	9.958
4.417	8.585
5.714	10.252
6.144	10.126];
data.tL_m(:,1) = (0.2 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PenPott1990';

% length-fecundity
data.WN = [ ... % weight (g), fecundity (#)
3.681	282.342
4.112	294.139
5.147	410.214
5.607	451.852
5.636	260.798
5.923	236.822
5.952	389.051
5.952	356.216
6.125	272.576
6.240	451.643
6.441	705.307
6.757	460.426
7.131	406.571
7.275	379.657
7.850	543.646
8.339	510.648
8.511	740.441
9.259	528.253
9.489	665.490
9.518	620.705
9.633	572.905
10.179	787.649
10.351	709.980
11.674	834.915
12.019	1013.905
12.077	981.050
12.335	885.442
12.968	1097.172
14.348	831.043
15.326	1141.166
16.217	1090.124];
units.WN = {'g', '#'};  label.WN = {'weight','fecundity'};  
  temp.WN = C2K(20);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'PenPott1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.ab = weights.ab * 0;

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '45MLG'; % Cat of Life
metaData.links.id_ITIS = '641886'; % ITIS
metaData.links.id_EoL = '211434'; % Ency of Life
metaData.links.id_Wiki = 'Bostockia_porosa'; % Wikipedia
metaData.links.id_ADW = 'Bostockia_porosa'; % ADW
metaData.links.id_Taxo = '478374'; % Taxonomicon
metaData.links.id_WoRMS = '1020471'; % WoRMS
metaData.links.id_fishbase = 'Bostockia-porosa'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Bostockia_porosa}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...1020471
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PenPott1990'; type = 'Article'; bib = [ ...
'author = {Pen, L.J. and I.C. Potter}, ' ...
'year = {1990}, ' ...
'title = {Biology of the nightfish, \emph{Bostockia porosa} {C}astelnau, in a south-western {A}ustralian river}, ' ... 
'journal = {Aust. J. Mar. Freshwat. Res.}, ' ...
'volume = {41(5)}, '...
'pages = {627-645}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bostockia-porosa.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

