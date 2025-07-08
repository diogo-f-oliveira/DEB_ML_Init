function [data, auxData, metaData, txtData, weights] = mydata_Bombyx_mori

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Lepidoptera'; 
metaData.family     = 'Bombycidae';
metaData.species    = 'Bombyx_mori'; 
metaData.species_en = 'Silkmoth'; 

metaData.ecoCode.climate = {'Cwa', 'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ae'; 'am'; 'Ww0'; 'Wwb'; 'Wwj'; 'Wwe'; 'Ww_t'; 'Ni'}; 
metaData.data_1     = {'t-Wwe'; 't-Ww'; 't-JO'; 't-JOe'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author   = {'James Maino';'Bas Kooijman'};    
metaData.date_subm = [2012 09 26];              
metaData.email    = {'jamesmaino@gmail.com'};            
metaData.address  = {'Melbourne University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 04 27]; 

%% set data
% zero-variate data

data.ab = 11;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'HsueTang1944';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.t1 = 9.33;  units.t1 = 'd';    label.t1 = 'period of instar 1';          bibkey.t1 = {'HsueTang1944','TanaTake1993'};   
  temp.t1 = C2K(25);  units.temp.t1 = 'K'; label.temp.t1 = 'temperature';
  comment.t1 = 'instar 1 is from birth till next moult';
data.t2 = 6.16;  units.t2 = 'd';    label.t2 = 'period of instar 2';          bibkey.t2 = {'HsueTang1944','TanaTake1993'};   
  temp.t2 = C2K(25);  units.temp.t2 = 'K'; label.temp.t2 = 'temperature';
data.t3 = 6.33;  units.t3 = 'd';    label.t3 = 'period of instar 3';          bibkey.t3 = {'HsueTang1944','TanaTake1993'};   
  temp.t3 = C2K(25);  units.temp.t3 = 'K'; label.temp.t3 = 'temperature';
data.t4 = 6.25;  units.t4 = 'd';    label.t4 = 'period of instar 4';          bibkey.t4 = {'HsueTang1944','TanaTake1993'};   
  temp.t4 = C2K(25);  units.temp.t4 = 'K'; label.temp.t4 = 'temperature';
data.t5 = 6.94;  units.t5 = 'd';    label.t5 = 'period of instar 5';          bibkey.t5 = {'HsueTang1944','TanaTake1993'};   
  temp.t5 = C2K(25);  units.temp.t5 = 'K'; label.temp.t5 = 'temperature';
data.tj = 35;    units.tj = 'd';    label.tj = 'time since birth at start spinning'; bibkey.tj = 'HsueTang1944';   
  temp.tj = C2K(25);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
%data.ts = 5;     units.ts = 'd';    label.ts = 'spinning period';             bibkey.ts = 'HsueTang1944';
%  temp.ts = C2K(25);  units.temp.ts = 'K'; label.temp.ts = 'temperature';
data.te = 20;    units.te = 'd';    label.te = 'time since start spinning at emergence'; bibkey.te = 'HsueTang1944';
  temp.te = C2K(25);  units.temp.te = 'K'; label.temp.te = 'temperature';
data.am = 7;     units.am = 'd';    label.am = 'life span as imago';          bibkey.am = 'HsueTang1944';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 0.49; units.Ww0 = 'mg';  label.Ww0 = 'egg wet weight';             bibkey.Ww0 = 'HsueTang1944';
data.Wwb = 0.345; units.Wwb = 'mg'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'HsueTang1944';
 comment.Wwb = 'instar 1 is from birth till ab+t1, so Ww1 = Wwb';
data.Ww2 = 2.710; units.Ww2 = 'mg'; label.Ww2 = 'initial wet weight of instar 2'; bibkey.Ww2 = {'HsueTang1944','TanaTake1993'};   
data.Ww3 = 12.69; units.Ww3 = 'mg'; label.Ww3 = 'initial wet weight of instar 3'; bibkey.Ww3 = {'HsueTang1944','TanaTake1993'};   
data.Ww4 = 73.79; units.Ww4 = 'mg'; label.Ww4 = 'initial wet weight of instar 4'; bibkey.Ww4 = {'HsueTang1944','TanaTake1993'};   
data.Ww5 = 366.4; units.Ww5 = 'mg'; label.Ww5 = 'initial wet weight of instar 5'; bibkey.Ww5 = {'HsueTang1944','TanaTake1993'};   
data.Wwj = 2504; units.Wwj = 'mg';  label.Wwj = 'pupal wet weight at start spinning'; bibkey.Wwj = 'HsueTang1944';
data.WdS = 180;  units.WdS = 'mg';  label.WdS = 'silk weight per pupa';       bibkey.WdS = 'HsueTang1944';
data.Wwjs = 930; units.Wwjs = 'mg'; label.Wwjs = 'pupal wet weight just after spinning'; bibkey.Wwjs = 'HsueTang1944';
data.Wwj5 = 900; units.Wwj5 = 'mg'; label.Wwj5 = 'pupal wet weight after 5 d'; bibkey.Wwj5 = 'HsueTang1944';
data.Wwe  = 600; units.Wwe = 'mg';  label.Wwe = 'imago wet weight at emergence'; bibkey.Wwe = 'HsueTang1944';
data.Wwe5 = 400; units.Wwe5 = 'mg'; label.Wwe5 = 'imago wet weight at death'; bibkey.Wwe5 = 'HsueTang1944';

data.Ni  = 400;  units.Ni  = '#';   label.Ni  = 'number of eggs laid';        bibkey.Ni  = 'HsueTang1944';   
  temp.Ni = C2K(25);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data

% embryo development
% egg weight includes shell
% O2 data can be off by a factor 10 (James)
tWO = [ ... % age (d), egg weight (10^-4 g), O2 consumption (mm^3/h)
 1 4.892625787 2.125347752
 2 4.973006192 2.11748333
 3 4.953840279 2.330118457
 4 4.937032657 2.721002871
 5 5.018142618 2.935844169
 6 4.901319347 3.428869843
 7 4.883183    4.084971209
 8 4.770237476 4.770237476
 9 4.754052791 6.660993349
10 4.642661285 7.328751566
11 4.625482051 8.388687189];
data.tWe = tWO(:,[1 2]); data.tWe(:,2) = data.tWe(:,2)/ 10;
units.tWe   = {'d', 'mg'};  label.tWe = {'age', 'embryo wet weight'};  
temp.tWe    = C2K(25); units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = {'HsueTang1944','TanaTake1993'};
%
data.tJOe = tWO(:,[1 3]); 
units.tJOe   = {'d', 'mul/h'};  label.tJOe = {'age', 'embryo O_2 consumption'};  
temp.tJOe    = C2K(25);  units.temp.tJOe = 'K'; label.temp.tJOe = 'temperature';
bibkey.tJOe = {'HsueTang1944','TanaTake1993'};

% larval growth from HsueTang44
tWJO =  [... time since birth (d), larval wet weight (mg), specific O2 cons mm^3/h/mg^(2/3)
0	0.345254223	1.607315008
1	0.319778308	1.460730172
2	0.484009627	1.494238768
3	0.857213693	1.653320307
4	1.176115572	1.59355112
5	1.74522329	1.506360781
6	1.967541947	1.570814856
7	2.050959101	1.514380469
8	2.357675334	1.642952471
9	2.710728363	1.493117549
10	2.716351703	1.52631088
11	3.183955579	1.827544666
12	6.864991439	2.102800153
13	9.234151595	2.372914007
14	13.17467771	1.702903351
15	12.69345945	1.641719664
16	13.49180327	1.491653667
18	21.65658628	2.700069854
19	35.46336974	2.453827335
20	55.83673302	4.528954942
21	72.2004659	2.371679502
22	73.78532593	2.33245353
23	59.5744443	2.247615405
24	125.9070359	6.397422007
25	153.5182461	9.698196962
26	206.5380156	12.07285543
27	351.6980821	2.607720253
28	366.4882034	4.194575347
29	413.2377612	3.886896711
30	513.8661379	14.56934408
31	762.6407375	10.24943676
32	1026.006235	26.43930288
33	1276.056782	9.342755855
34	1650.326981	10.54289788
35	2012.611732	5.632017557
36	2503.513859	7.011032818  % start of spinning
37	3114.2	    2.627513766  % guessed weight
38	3873.7	    3.53956588   % guessed weight
39	4818.6	    3.280696082];% guessed weight 
data.tW = tWJO(:,[1 2]);  
units.tW   = {'d', 'mg'};  label.tW = {'time since birth', 'larva wet weight'};  
temp.tW    = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HsueTang1944';
comment.tW = 'last 3 data points are guessed';
%
tWJO(:,3) = tWJO(:,3) .* tWJO(:,2).^(2/3); % covert spec O2 cons to absolute
data.tJO = tWJO(:,[1 3]); 
units.tJO   = {'d', 'mul/h'};  label.tJO = {'time since birth', 'larva O_2 consumption'};  
temp.tJO    = C2K(25);  units.temp.tJO = 'K'; label.temp.tJO = 'temperature';
bibkey.tJO = 'HsueTang1944';
comment.tJO = 'last 3 data points are based on guessed weights';

% pupal data
tJOW = [ ... % time since pupation (d), O2 consumption (mm^3/h), wet weight (mg)
 0	489.8690483 2876.20608
 1	551.0867890 2232.543862
 2	602.6983465 3066.973334
 3	222.7973393 1040.375221
 4	154.2765790  880.3188472
 5	 87.5386813  909.0337338
 6	 87.8516656  912.5780109
 7	 93.4049732  840.9496613
 8	117.7850037  973.7556711
 9	125.1526356  872.067296
10	222.4333998 1038.675769
11	145.4788971  904.0448989
12	106.6915440  882.0231825
13    0          812.7930848
14    0          792.7568439
15	338.0103510  751.9171665
16	191.7255534  776.21137
17	157.5614613  779.7403344
18	145.2446017  760.5013687
19	 71.4052263  932.0302327
20	420.6007086  810.9610579];
data.tWj = tJOW(:,[1 3]); 
units.tWj   = {'d', 'mg'};  label.tWj = {'time since pupation', 'pupa wet weight'};  
temp.tWj    = C2K(25);  units.temp.tWj = 'K'; label.temp.tWj = 'temperature';
bibkey.tWj = 'HsueTang1944';
%
data.tJOj = tJOW(:,[1 2]); 
units.tJOj   = {'d', 'mul/h'};  label.tJOj = {'time since pupation', 'pupa O_2 consumption'};  
temp.tJOj    = C2K(25);  units.temp.tJOj = 'K'; label.temp.tJOj = 'temperature';
bibkey.tJOj = 'HsueTang1944';


%% set weights for all real data
weights = setweights(data, []);
weights.tJOj(data.tJOj(:,2) == 0) = 0; % exclude missing data
weights.tJOj = 10 * weights.tJOj;
weights.WdS = 10 * weights.WdS;
weights.Ni = 10 * weights.Ni;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = weights.psd.k_J * 100;
weights.psd.kap_G = weights.psd.kap_G * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'chemical composition of silk: C12 H29 O11 N5';
D2 = 'Silk production is from decaying larval structure in pupa';
D3 = 'spinning period is included in pupal stage, which lasts 20 d';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'at end of larval stage, spinning starts, lasting 3 d, and feeding ceases';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'imagos cannot fly and do not eat';
metaData.bibkey.F2 = 'Wiki'; 
F3 = '610-915 m silk per cocoon, 10 mum diameter';
metaData.bibkey.F3 = 'Wiki'; 
F4 = '2000-3000 cocoons per pound (= 453.59237 g) of silk';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'MGPB'; % Cat of Life
metaData.links.id_ITIS = '117540'; % ITIS
metaData.links.id_EoL = '391618'; % Ency of Life
metaData.links.id_Wiki = 'Bombyx_mori'; % Wikipedia
metaData.links.id_ADW = 'Bombyx_mori'; % ADW
metaData.links.id_Taxo = '30426'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_lepidoptera = '68643'; % lepidoptera

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bombyx_mori}}';
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
bibkey = 'HsueTang1944'; type = 'Article'; bib = [ ... 
'author = {T. Y. HSUEH AND P. S. TANG}, ' ... 
'year = {1944}, ' ...
'title = {PHYSIOLOGY OF THE SILKWORM I. GROWTH AND RESPIRATION OF \emph{Bombix mori} DURING ITS ENTIRE LIFE-CYCLE}, ' ...
'journal = {Physiological Zoology}, ' ...
'volume = {17}, ' ...
'pages = {71--78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TanaTake1993'; type = 'Article'; bib = [ ... 
'author = {Tanaka, Y. and Takeda, S.}, ' ... 
'year = {1993}, ' ...
'title = {Ecdysone and 20-hydroxyecdysone supplements to the diet affect larval development in the silkworm, \emph{Bombix mori}, differently}, ' ...
'journal = {J. Insect Physiol.}, ' ...
'volume = {39}, ' ...
'pages = {805--809}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

