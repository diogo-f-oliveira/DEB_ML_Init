function [data, auxData, metaData, txtData, weights] = mydata_Gobiomorphus_breviceps

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Eleotridae';
metaData.species    = 'Gobiomorphus_breviceps'; 
metaData.species_en = 'Upland bully'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi','biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 12];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 12];

%% set data
% zero-variate data

data.am = 4.5*365;   units.am = 'd';   label.am = 'life span';                          bibkey.am = 'fishbase';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 3.2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty';             bibkey.Lp  = 'fishbase'; 
data.Lim  = 8.2; units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 0.01; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'HamiPoul2001';
  comment.Wwb = 'based on egg diameter of 2.7 mm: pi/6*0.27^3';
data.Wwp = 0.34;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^3.02, see F1';
data.Wwi = 5.88;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.02, see F1';

data.Ri  = 400/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'HamiPoul2001';   
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), weight (g)
0	    0.028
61.062	0.074
95.996	0.083
122.165	0.111
148.418	0.081
186.251	0.099
209.522	0.118
244.484	0.107
270.681	0.116
290.998	0.164
317.000	0.306
380.822	0.476
427.433	0.466
453.602	0.494
485.666	0.474
511.863	0.483
526.425	0.482
570.054	0.519
599.094	0.576
636.885	0.623
651.364	0.680
680.404	0.736
723.797	0.936
746.553	1.308
751.946	1.604
781.056	1.612
783.801	1.727
815.962	1.640
836.251	1.707
880.048	1.629
897.619	1.562
923.774	1.599
958.556	1.713
981.660	1.846
1016.469	1.941
1051.319	2.007
1083.327	2.025
1120.562	2.454
1155.663	2.348
1166.978	2.577
1201.857	2.624
1222.424	2.499
1257.150	2.651
1283.542	2.526
1315.452	2.611
1341.274	2.878
1379.232	2.810
1402.670	2.714
1428.519	2.962];
units.tW_f  = {'d', 'g'};  label.tW_f = {'time', 'weight', 'females'};  
temp.tW_f   = C2K(14);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Stap1975'; comment.tW_f = 'Spectacle Lake: temperature varies seasonally between 5 and 22 C)';
%
data.tW_m = [ ... % time (d), weight (g)
0	    0.028
72.669	0.102
93.056	0.102
116.355	0.101
139.653	0.101
180.426	0.100
209.522	0.118
244.442	0.136
270.653	0.135
293.883	0.183
331.562	0.306
345.985	0.401
366.107	0.582
380.696	0.562
421.441	0.580
444.698	0.609
488.342	0.636
508.784	0.597
537.921	0.587
564.091	0.615
598.941	0.681
630.935	0.709
654.081	0.813
685.588	1.175
720.342	1.308
751.459	1.938
768.432	2.282
783.272	2.090
800.329	2.376
835.110	2.490
870.295	2.327
893.566	2.345
922.606	2.402
957.401	2.506
982.569	3.222
1017.405	3.297
1052.159	3.430
1075.917	3.114
1101.293	3.687
1147.445	3.991
1147.640	3.858
1199.868	3.990
1223.347	3.865
1255.300	3.922
1287.127	4.064
1318.592	4.455
1343.134	5.601
1378.068	5.610
1412.613	5.886
1441.625	5.961];
units.tW_m  = {'d', 'g'};  label.tW_m = {'time', 'weight', 'males'};  
temp.tW_m   = C2K(14);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Stap1975'; comment.tW_m = 'Spectacle Lake: temperature varies seasonally between 5 and 22 C)';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 10 * weights.tW_f;
weights.tW_m = 10 * weights.tW_m;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;
weights.Wwi = 5 * weights.Wwi;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 5 * weights.psd.v;
% weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperature in C for tL data is supposed vary as T(t) = 14+6*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.02'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6KN83'; % Cat of Life
metaData.links.id_ITIS = '637410'; % ITIS
metaData.links.id_EoL = '224523'; % Ency of Life
metaData.links.id_Wiki = 'Gobiomorphus_breviceps'; % Wikipedia
metaData.links.id_ADW = 'Gobiomorphus_breviceps'; % ADW
metaData.links.id_Taxo = ''; % Taxonomicon
metaData.links.id_WoRMS = '1014935'; % WoRMS
metaData.links.id_fishbase = 'Gobiomorphus-breviceps'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gobiomorphus_breviceps}}';
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
bibkey = 'Stap1975'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1975.tb04575.x}, ' ...
'author = {Staples, D. J.}, ' ... 
'year = {1975}, ' ...
'title = {Production biology of the upland bully \emph{Philypnodon breviceps} {S}tokell in a small {N}ew {Z}ealand lake. {III}. {P}roduction, food consumption and efficiency of food utilization}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {7(1)}, ' ...
'pages = {47–69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HamiPoul2001'; type = 'article'; bib = [ ... 
'author = {W. J. Hamilton and R. Poulin}, ' ... 
'year = {2001}, ' ...
'title = {Parasitism, water temperature and life history characteristics of the freshwater fish \emph{Gobiomorphus breviceps} {S}tokell ({E}leotridae)}, ' ...
'journal = {Ecology of Freshwater Fish}, ' ...
'volume = {10}, ' ...
'pages = {105-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gobiomorphus-breviceps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


