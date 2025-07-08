function [data, auxData, metaData, txtData, weights] = mydata_Ascidiella_aspersa

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Phlebobranchia'; 
metaData.family     = 'Ascidiidae';
metaData.species    = 'Ascidiella_aspersa'; 
metaData.species_en = 'European sea squirt';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 05 28];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 05 28]; 


%% set data
% zero-variate data;
data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'NierHofm1989';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*30.5; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Mill1952';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 2.3;  units.Lp  = 'cm';  label.Lp  = 'body length at puberty'; bibkey.Lp  = 'KanaBaba2017';
data.Li  = 10;  units.Li  = 'cm';  label.Li  = 'ultimate body length'; bibkey.Li  = 'Buiz1983';

data.Wwb  = 1.6e-5;   units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on height 0.8 mm: Wwi*(0.08/10)^3';
data.Wwi  = 31;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on height 10 cm, diameter 3 cm, depth 2 cm: pi/6*3*2*10';

data.Ri  = 1.4e6/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(19.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';

% uni-variate data at f

% time - temp from Orto1920
tT = [ ... % time since 1 jan (mnth), temperature (C)
  0	9.6
  1	7.9
  2	7.7
  3	8.2
  4	10.2
  5	13.2
  6	14.3
  7	15.5
  8	15.6
  9	14.6
 10	12.8
 11	10.7
 12	9.1];
tT = [tT; tT]; tT(1:12+12,1) = 1:12 + 12;
tT(:,1) = tT(:,1) * 30.5;  % convert mnth to d
tT(:,2) = C2K(tT(:,2));  % convert C to K
%
% time-body length
data.tL_spr = [ ... % time since 1 jan (d), body length (cm) 
 94 1.320	
143 2.270	
176 3.034	
199 3.675	
227 4.101	
251 4.279	
297 4.642];
units.tL_spr = {'d', 'cm'}; label.tL_spr = {'time since 1 jan', 'body length', 'spring cohort'};  
temp.tL_spr = tT; units.temp.tL_spr = 'K'; label.temp.tL_spr = 'temperature';
settle.tL_spr = 183; units.settle.tL_spr = 'd'; label.settle.tL_spr = 'time at settlement';
bibkey.tL_spr = {'Orto1920','Mill1952'}; 
comment.tL_spr = 'Mar - Sept 1950';
%
data.tL_sum = [ ... % time since 1 jan (d), body length (cm)
243 0.321
267 1.640
284 2.193
307 3.256];
units.tL_sum = {'d', 'cm'}; label.tL_sum = {'time since 1 jan', 'body length', 'summer cohort'};  
temp.tL_sum = tT; units.temp.tL_sum = 'K'; label.temp.tL_sum = 'temperature';
settle.tL_sum = 336; units.settle.tL_sum = 'd'; label.settle.tL_sum = 'time at settlement';
bibkey.tL_sum = {'Orto1920','Mill1952'}; 
comment.tL_sum = 'Jul - Nov 1951';

% time - temp from KanaBaba2017
tT = [ ... % time since 1 june 2010, temperature (C)
38.747	16.027
63.971	19.758
100.624	20.510
130.406	17.347
161.765	10.644
191.538	7.668
215.684	4.318
248.191	3.206
273.625	2.465
307.368	5.079
332.715	6.201
366.396	10.120
395.652	18.138
423.716	21.496
456.232	20.198
484.620	16.662
515.865	12.382
544.244	9.032
575.498	4.566
603.851	1.775
634.868	2.340
663.081	2.531
692.503	7.008
721.881	12.417
751.347	15.962
782.215	19.694
807.404	24.170
840.175	17.468
875.635	13.561
899.895	7.789
932.490	4.813
966.461	2.583
993.306	1.842
1015.778	4.082
1048.102	6.882
1077.655	8.564
1107.034	13.973
1137.797	19.941
1171.645	20.319
1198.648	16.224
1228.552	10.453
1258.299	8.036
1288.080	4.873
1316.415	2.456
1348.896	1.902
1374.208	3.770
1402.307	6.383
1434.525	11.420];
tT(:,2) = C2K(tT(:,2));
%
% time-length
data.tL_2010 = [ ... % time since 1 June (d), body length (cm)
42.773	0.211
75.566	0.553
104.082	0.463
136.875	0.719
166.816	1.451
196.758	2.788
228.125	3.562
258.066	4.164
286.582	4.117
316.523	5.108
350.742	5.494
382.109	5.793];
units.tL_2010 = {'d', 'cm'}; label.tL_2010 = {'time since 1 june', 'body length', '2010 cohort'};  
temp.tL_2010 = tT; units.temp.tL_2010 = 'K'; label.temp.tL_2010 = 'temperature';
settle.tL_2010 = 42.8; units.settle.tL_2010 = 'd'; label.settle.tL_2010 = 'time at start';
bibkey.tL_2010 = 'KanaBaba2017'; 
%
data.tL_2011 = [ ... % time since 1 June (d), body length (cm)
44.373	0.409
75.863	0.318
110.216	2.087
135.980	2.301
167.471	3.508
196.098	4.283
226.157	5.144
259.078	5.572
289.137	5.482
322.059	5.349
350.686	5.994
380.745	6.639];
units.tL_2011 = {'d', 'cm'}; label.tL_2011 = {'time since 1 june', 'body length', '2011 cohort'};  
temp.tL_2011 = tT; units.temp.tL_2011 = 'K'; label.temp.tL_2011 = 'temperature';
settle.tL_2011 = 44.4; units.settle.tL_2011 = 'd'; label.settle.tL_2011 = 'time at start';
bibkey.tL_2011 = 'KanaBaba2017'; 
%
data.tL_2012 = [ ... % time since 1 June (d), body length (cm)
14.311	0.258
45.656	0.129
75.628	0.301
104.419	1.849
138.814	2.839
167.407	3.269
196.129	4.430
230.417	4.817
260.519	5.720
290.445	5.634
318.923	5.419
350.489	6.538
384.654	6.237];
units.tL_2012 = {'d', 'cm'}; label.tL_2012 = {'time since 1 june', 'body length', '2012 cohort'};  
temp.tL_2012 = tT; units.temp.tL_2012 = 'K'; label.temp.tL_2012 = 'temperature';
settle.tL_2012 = 14.3; units.settle.tL_2012 = 'd'; label.settle.tL_2012 = 'time at start';
bibkey.tL_2012 = 'KanaBaba2017'; 
%
data.tL_2013 = [ ... % time since 1 June (d), body length (cm)
42.819	0.192
77.075	0.403
108.579	1.174
138.696	2.159
167.449	3.489
201.820	4.345
230.512	5.331
259.195	6.274
289.006	5.539
320.472	6.095
349.056	6.479
380.354	6.088];
units.tL_2013 = {'d', 'cm'}; label.tL_2013 = {'time since 1 june', 'body length', '2013 cohort'};  
temp.tL_2013 = tT; units.temp.tL_2010 = 'K'; label.temp.tL_2013 = 'temperature';
settle.tL_2013 = 42.8; units.settle.tL_2013 = 'd'; label.settle.tL_2013 = 'time at start';
bibkey.tL_2013 = 'KanaBaba2017'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_spr = 3 * weights.tL_spr;
weights.tL_sum = 3 * weights.tL_sum;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp   = temp;
auxData.settle = settle;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_sum','tL_spr'}; subtitle1 = {'Data for summer, spring populations'};
set2 = {'tL_2013','tL_2012','tL_2011','tL_2010'}; subtitle2 = {'Data for 2013,2012,2011,2010 populations'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'temperature fluctuates seasonally';     
metaData.discussion = struct('D1',D1); 

%% Facts
F1 = 'Solitary tunicate; total length tadpole 1.3 mm; after tail resorption upon settlement 0.3 mm; functional ascian in 4 d after settlement';
metaData.bibkey.F1 = 'Yama1975';
F2 = 'Protandric hermaphroditic; external fertilisation';
metaData.bibkey.F2 = 'Mill1952';
F3 = 'A. aspersa is host for the mussel Modiolarca subpicta';
metaData.bibkey.F3 = 'MortDine2011';
F4 = 'Metamorphosis of larva starts 7 h after hatching at 20 C; feeding starts after metamorphosis';
metaData.bibkey.F4 = 'NierHofm1989';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = 'H63Z'; % Cat of Life
metaData.links.id_ITIS = '159213'; % ITIS
metaData.links.id_EoL = '46584106'; % Ency of Life
metaData.links.id_Wiki = 'Ascidiella_aspersa'; % Wikipedia
metaData.links.id_ADW = 'Ascidiella_aspersa'; % ADW
metaData.links.id_Taxo = '114872'; % Taxonomicon
metaData.links.id_WoRMS = '114872'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ascidiella_aspersa}}'; 
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
bibkey = 'Mill1952'; type = 'article'; bib = [ ...
'author = {Millar, R. H.}, ' ...
'doi = {10.1017/s0025315400003672}, ' ...
'year = {1952}, ' ...
'title  =  {The annual growth and reproductive cycle in four ascidians},  ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {31(01)}, '...
'pages = {41-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mill1970'; type = 'Book'; bib = [ ...  
'author = {Millar, R. H.}, ' ...
'year = {1970}, ' ...
'title  = {British Ascidians}, ' ...
'publisher = {Academic Press}, ' ...
'series = {Synopses of the British Fauna}, ' ...
'volume = {1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Orto1920'; type = 'article'; bib = [ ...
'author = {Orton, J. H.}, ' ...
'year = {1920}, ' ...
'title  =  {Sea-temperature, breeding and distribution in marine animals},  ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {12}, '...
'pages = {339-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KanaBaba2017'; type = 'article'; bib = [ ...
'author = {Kanamori, M. and Baba, K. and Natsuike, M. and Goshima, S.}, ' ...
'doi = {10.1017/s0025315416000497}, ' ...
'year = {2017}, ' ...
'title  =  {Life history traits and population dynamics of the invasive ascidian, \emph{Ascidiella aspersa}, on cultured scallops in {F}unka {B}ay, {H}okkaido, northern {J}apan},  ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {97(2)}, '...
'pages = {387 –399}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MortDine2011'; type = 'article'; bib = [ ...
'author = {Brian Morton and Grete E. Dinesen}, ' ...
'doi = {10.1017/S0025315410001980}, ' ...
'year = {2011}, ' ...
'title  =  {The biology and functional morphology of \emph{Modiolarca subpicta} ({B}ivalvia: {M}ytilidae: {M}usculinae), epizoically symbiotic with \emph{Ascidiella aspersa} ({U}rochordata: {A}scidiacea), from the {K}attegat, northern {J}utland, {D}enmark},  ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {91(8)}, '...
'pages = {1637 – 1649}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NierHofm1989'; type = 'article'; bib = [ ...
'author = {Eva Niermann-Kerkenberg and Dietrich Kurt Hofmann}, ' ...
'doi = {10.1007/BF02367902}, ' ...
'year = {1989}, ' ...
'title  =  {Fertilization and normal development in \emph{Ascidiella aspersa} ({T}unicata) studied with {N}omarski-optics},  ' ...
'journal = {Helgol\"{a}nder Meeresunters}, ' ...
'volume = {43}, '...
'pages = {245-258}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Buiz1983'; type = 'Book'; bib = [ ...  
'author = {Buizer, D. A. G.}, ' ...
'year = {1983}, ' ...
'title  = {De Nederlandse zakpijpen (manteldieren) en mantelvisjes}, ' ...
'publisher = {Kon. Ned. Natuurhist. Ver.}, ' ...
'series = {Wetenschappelijke Mededelingen}, ' ...
'volume = {158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

