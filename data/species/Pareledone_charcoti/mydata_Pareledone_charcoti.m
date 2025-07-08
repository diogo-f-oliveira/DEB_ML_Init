function [data, auxData, metaData, txtData, weights] = mydata_Pareledone_charcoti
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Megaleledonidae';
metaData.species    = 'Pareledone_charcoti'; 
metaData.species_en = 'Antarctic octopus'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'L-Ww'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 25]; 

%% set data
% zero-variate data

data.am = 430;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'SchwHovi2019';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 0.22;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'SchwHovi2019';
  comment.Wwb = 'based on oocyte length 1-18 mm, assumed width 6 mm: : pi/6*1.2*0.6^2';
data.Wwp  = 40;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'SchwHovi2019';
  comment.Wwp = 'based on first mating';
data.Wwi  = 110;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'SchwHovi2019';

data.Ni  = 55; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'SchwHovi2019';   
  temp.Ni = C2K(4);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
1.801	2.942
2.497	5.908
2.914	8.492
3.132	10.333
3.272	10.342
3.331	23.503
3.490	25.340
3.808	23.532
3.868	27.191
3.868	29.384
3.868	19.881
3.967	32.679
4.066	34.147
4.086	30.859
4.126	33.420
4.205	25.018
4.225	38.543
4.225	28.309
4.245	30.503
4.285	35.257
4.305	25.024
4.364	35.627
4.384	39.284
4.424	33.438
4.483	34.173
4.483	39.290
4.503	26.864
4.523	30.886
4.583	84.252
4.603	43.683
4.623	45.512
4.642	32.355
4.781	31.267
4.801	34.923
4.821	55.027
4.841	46.621
4.960	42.243
5.020	31.647
5.119	43.349
5.199	36.409
5.219	57.975
5.219	32.756
5.278	34.221
5.318	45.189
5.377	44.096
5.397	52.869
5.397	55.427
5.517	63.475
5.695	79.568
5.715	64.584
5.795	61.665
5.894	86.890
5.914	50.342
5.993	70.449
6.053	60.950
6.113	70.456
6.152	83.982
6.331	81.800
6.331	53.291
6.371	79.244
6.391	59.143
6.430	89.116
6.490	107.760
6.490	64.631
6.510	82.542
6.570	56.595
6.987	97.922
7.245	108.537
7.523	125.001
7.742	112.588];
units.LWw_f   = {'d', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'SchwHovi2019';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
2.636	9.572
2.894	4.836
3.073	13.984
3.152	5.583
3.311	13.999
3.411	16.198
3.411	8.157
3.570	22.421
3.570	12.187
3.609	20.231
3.728	30.106
3.788	16.952
3.808	33.401
3.808	23.167
3.828	35.960
3.947	27.561
3.947	16.596
3.967	30.486
4.026	23.180
4.106	37.439
4.106	30.495
4.126	27.938
4.166	22.823
4.205	18.074
4.225	16.979
4.245	28.676
4.265	21.002
4.344	31.606
4.384	27.953
4.404	30.147
4.404	33.437
4.464	36.730
4.503	28.692
4.543	21.749
4.543	23.942
4.563	35.274
4.603	30.891
4.623	29.795
4.623	30.526
4.642	25.776
4.682	34.550
4.702	41.496
4.702	48.806
4.742	32.727
4.742	27.610
4.841	29.078
4.841	27.250
4.861	22.865
4.921	30.910
4.980	42.609
5.020	29.088
5.020	31.647
5.079	44.443
5.079	29.092
5.079	33.844
5.079	37.864
5.179	36.774
5.219	25.080
5.278	48.476
5.596	40.454
5.715	39.730];
units.LWw_m   = {'d', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'SchwHovi2019';
comment.LWw_m = 'Data for males';

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
183.556	5.496
191.205	9.160
199.809	4.275
217.973	7.328
222.753	28.702
225.621	12.214
230.402	17.099
233.270	12.824
235.182	26.870
254.302	28.702
258.126	20.153
267.686	31.756
267.687	15.267
270.554	31.145
275.335	29.924
279.159	10.382
281.071	23.817
281.072	43.969
282.983	38.473
287.763	26.870
288.719	34.198
293.499	26.870
301.147	38.473
303.059	23.206
306.883	42.748
309.751	70.229
310.707	31.756
314.532	25.038
319.312	29.313
322.180	35.420
326.960	45.802
336.520	39.695
337.476	123.969
338.432	51.298
340.344	32.977
347.036	108.092
347.037	31.756
351.816	112.977
364.245	32.977
366.157	52.519
367.113	97.099
374.761	36.031
378.585	40.916
430.210	90.382];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(4);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'SchwHovi2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'time-weight data assumes that growth increments of beaks are daily, which is speculative for cold-water species (SchwHovi2019)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '75RH6'; % Cat of Life
metaData.links.id_ITIS = '556246'; % ITIS
metaData.links.id_EoL = '591636'; % Ency of Life
metaData.links.id_Wiki = 'Pareledone'; % Wikipedia
metaData.links.id_ADW = 'Pareledone_charcoti'; % ADW
metaData.links.id_Taxo = '158350'; % Taxonomicon
metaData.links.id_WoRMS = '239392'; % WoRMS
metaData.links.id_molluscabase = '239392'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Muusoctopus}}';
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
bibkey = 'SchwHovi2019'; type = 'article'; bib = [ ... 
'doi = {10.1371/journal.pone.0219694}, ' ...
'author = {Richard Schwarz and Henk-Jan Hoving and Christoph Noever and Uwe Piatkowski}, ' ... 
'year = {2019}, ' ...
'title = {Life histories of Antarctic incirrate octopods (Cephalopoda: Octopoda)}, ' ...
'journal = {Plos One}, ' ...
'volume = {14(7)}, ' ...
'pages = {e0219694}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Muusoctopus-rigbyae.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

