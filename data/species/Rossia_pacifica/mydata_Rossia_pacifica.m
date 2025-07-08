function [data, auxData, metaData, txtData, weights] = mydata_Rossia_pacifica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiolida'; 
metaData.family     = 'Sepiolidae';
metaData.species    = 'Rossia_pacifica'; 
metaData.species_en = 'Stubby Bobtail'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 29]; 

%% set data
% zero-variate data

data.ab = 150;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Summ1985';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Summ1985';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19*30.5;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Summ1985';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.5; units.Lb  = 'cm';  label.Lb  = 'mantle length at birth';   bibkey.Lb  = 'Summ1985';
data.Li  = 3.5; units.Li  = 'cm';  label.Li  = 'mantle length at death';   bibkey.Li  = 'Summ1985';

data.Wwb = 0.1;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Summ1985';

data.Ni  = 50; units.Ni  = '#'; label.Ni  = 'cum reprod at death';    bibkey.Ni  = 'Summ1985';   
  temp.Ni = C2K(10);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
5.951	0.545
16.861	0.545
22.813	0.642
29.260	0.613
38.186	0.633
43.641	0.681
52.568	0.681
59.511	0.613
67.446	0.672
73.893	0.633
80.340	0.633
88.274	0.652
97.201	0.740
100.673	0.759
107.615	0.818
117.534	0.837
121.501	0.866
128.940	0.895
136.379	0.856
143.322	0.964
148.281	0.964
155.720	1.051
164.151	1.012
183.988	1.100
192.418	1.207
202.337	1.246
210.272	1.246
215.231	0.983
222.670	1.314
222.671	1.071
228.621	1.158
231.596	1.363
236.060	1.071
242.011	1.217
248.954	1.363
256.393	1.343
263.832	1.392
270.774	1.411
277.717	1.616
283.173	1.616
291.107	1.616
299.538	1.742
306.977	1.849
312.928	1.946
318.383	2.005
323.838	2.112
331.773	2.258
340.700	2.375
348.139	2.491
354.090	2.657
363.016	2.735
369.959	2.764
376.406	2.764
382.853	2.900
388.804	2.978
395.747	3.056
403.186	3.085
411.121	3.182
417.072	3.338
425.999	3.309
430.462	3.046
436.909	3.144
444.348	3.144
451.291	3.241
456.746	3.202
465.177	3.163];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Summ1985';
 
% length-weight
data.LW = [ ... % wet weight (g), mantle length (cm)
0.053	0.475
0.103	0.573
0.143	0.619
0.162	0.639
0.300	0.810
0.341	0.796
0.527	0.933
0.694	1.094
0.728	1.094
3.901	1.723
4.584	2.056
5.050	1.957
5.563	2.052
0.053	0.475
0.103	0.573
0.143	0.619
0.162	0.639
0.300	0.810
0.341	0.796
0.527	0.933
0.694	1.094
0.728	1.094
3.901	1.723
4.584	2.056
5.050	1.957
5.563	2.052
6.031	2.188
6.433	2.371
6.752	2.529
7.087	2.786
7.683	2.567
7.808	2.923
8.742	2.606
9.028	2.872
9.630	3.215
11.317	2.912
12.468	2.910
13.516	3.102
15.379	3.360
18.366	3.522
33.914	4.052
34.465	4.843
35.026	4.465
40.502	4.681
42.511	4.992
43.906	4.602
50.770	5.232
60.633	5.852
65.729	5.753
76.005	6.231
98.399	6.215];
data.LW = data.LW(:,[2 1]); % reverse sequence
units.LW   = {'cm', 'g'};  label.LW = {'mantle length', 'wet weight'};  
bibkey.LW = 'Summ1985';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.ab = 0 * weights.ab; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Age at birth is ignorned since length of embryonic period is unclear';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Death is programmed, not by ageing; reprod once just before death';
metaData.bibkey.F1 = 'Summ1985'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4TFF5'; % Cat of Life
metaData.links.id_ITIS = '82338'; % ITIS
metaData.links.id_EoL = '450459'; % Ency of Life
metaData.links.id_Wiki = 'Rossia_pacifica'; % Wikipedia
metaData.links.id_ADW = 'Rossia_pacifica'; % ADW
metaData.links.id_Taxo = '157843'; % Taxonomicon
metaData.links.id_WoRMS = '346432'; % WoRMS
metaData.links.id_molluscabase = '346432'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rossia_pacifica}}';
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
bibkey = 'Summ1985'; type = 'Article'; bib = [ ... 
'author = {William C. Summers}, ' ... 
'year = {1985}, ' ...
'title = {Ecological implications of life stage timing determined from the cultivation of \emph{Rossi pacifica} ({M}ollusca: {C}ephalopoda)}, ' ...
'journal = {Vie et Milieu}, ' ...
'volume = {35(3/4)}, ' ...
'pages = {249-254}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

