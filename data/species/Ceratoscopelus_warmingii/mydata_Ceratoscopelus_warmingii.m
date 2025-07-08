function [data, auxData, metaData, txtData, weights] = mydata_Ceratoscopelus_warmingii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Ceratoscopelus_warmingii'; 
metaData.species_en = 'Warming''s lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.5); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 26]; 

%% set data
% zero-variate data
data.am = 1.2*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(5.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 4;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 8.1;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3 for Benthosema_suborbitale';
data.Wwp = 0.384; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00537*Lp^3.08, see F3';
data.Wwi = 3.4; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.08, see F3';
  
data.Ri = 2e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(5.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';

% uni-variate data
% time-length data
% larva
data.tL_l = [ ... % time since birth (d), standard length (cm)
2.165	0.503
7.215	0.503
10.101	0.655
10.823	0.549
12.987	0.625
15.152	0.731
18.038	0.975
19.481	0.731
20.202	0.899
20.924	0.808
23.810	0.716
24.531	0.990
25.974	1.128
28.139	1.204
28.860	1.250
31.025	1.432
33.189	1.371
35.354	1.204];
units.tL_l = {'d', 'cm'}; label.tL_l = {'time since birth', 'standard length', 'larvae in surface waters'};  
temp.tL_l = C2K(10);  units.temp.tL_l = 'K'; label.temp.tL_l = 'temperature';
bibkey.tL_l = 'TakaYats2006';
comment.tL_l = 'larval growth in surface waters';
% post larva
data.tL = [ ... % time since birth (d), standard length (cm) 
68.543	2.316
75.758	3.703
77.201	2.057
82.973	2.225
82.973	2.316
85.137	2.514
86.580	2.072
87.302	2.712
87.302	2.819
94.517	2.819
99.567	3.383
103.896	3.337
103.896	3.215
106.782	3.383
112.554	3.307
113.997	3.611
113.997	3.688
118.326	4.221
121.212	3.825
123.377	4.084
126.984	3.749
129.870	4.145
141.414	4.693
142.136	4.251
158.730	5.044
162.338	4.968
167.388	5.669
168.831	4.952
176.046	5.516
176.046	5.958
178.932	5.653
188.312	5.669
196.248	5.562
199.134	5.912
204.906	6.232
233.045	6.598
233.766	6.888
256.854	6.080
265.512	7.528
266.955	6.187
270.563	7.573
271.284	6.415
271.284	6.629
274.170	6.507
277.056	6.141
290.043	6.537
292.929	7.878
309.524	7.619
314.574	7.406
321.068	7.756
324.675	6.842
326.118	7.238
330.447	7.086
333.333	7.573
341.270	7.025
344.877	7.482
345.599	7.025
351.371	8.091
360.750	7.482
360.750	7.025
369.408	7.147
375.180	7.848
375.180	7.070
417.749	7.451];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length', 'post-larvae in deep water'};  
temp.tL = C2K(5.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TakaYats2006';
comment.tL = 'post-larval growth in deep water';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;
weights.Ri = 0*weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_l','tL'}; subtitle1 = {'Data for larva, post-larva'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Preferred temperature 4.3 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight Ww in g = 0.00537*(SL in cm)^3.08';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'SPQ2'; % Cat of Life
metaData.links.id_ITIS = '623722'; % ITIS
metaData.links.id_EoL = '46564048'; % Ency of Life
metaData.links.id_Wiki = 'Ceratoscopelus_warmingii'; % Wikipedia
metaData.links.id_ADW = 'Ceratoscopelus_warmingii'; % ADW
metaData.links.id_Taxo = '166830'; % Taxonomicon
metaData.links.id_WoRMS = '126586'; % WoRMS
metaData.links.id_fishbase = 'Ceratoscopelus-warmingii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ceratoscopelus_warmingii}}';
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
bibkey = 'TakaYats2006'; type = 'article'; bib = [ ...
'doi = {10.1007/s10228-006-0346-2}, ' ...
'author = {Kaori Takagi and Akihiko Yatsu and Masatoshi Moku and Chiyuki Sassa}, ' ... 
'year   = {2006}, ' ...
'title  = {Age and growth of lanternfishes, \emph{Symbolophorus californiensis} and \emph{Ceratoscopelus warmingii} ({M}yctophidae), in the {K}uroshio-{O}yashio Transition Zone}}, ' ...
'journal = {Ichthyol Res}, ' ...
'page = {281-289}, ' ...
'volume = {53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Ceratoscopelus-warmingii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

