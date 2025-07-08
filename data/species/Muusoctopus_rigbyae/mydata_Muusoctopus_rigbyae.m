function [data, auxData, metaData, txtData, weights] = mydata_Muusoctopus_rigbyae
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Enteroctopodidae';
metaData.species    = 'Muusoctopus_rigbyae'; 
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

data.Wwb  = 0.1;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'SchwHovi2019';
  comment.Wwb = 'based on oocyte length 5-15 mm, assumed wigth 4 mm: pi/6*1.2*0.4^2';
data.Wwp  = 65;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'SchwHovi2019';
data.Wwi  = 250;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'SchwHovi2019';

data.Ni  = 70; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'SchwHovi2019';   
  temp.Ni = C2K(4);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% length-weight
data.LWw_f = [ ... % mantle length (cm), wet weight (g)
3.118	21.403
4.400	25.494
4.497	27.452
4.965	54.712
5.140	63.478
5.361	169.339
5.513	128.587
5.725	93.670
6.019	135.465
6.097	148.099
6.133	107.328
6.155	141.312
6.345	85.032
6.561	110.310
6.970	134.648
7.337	102.669
7.380	163.841
7.877	44.504
8.020	163.944
8.181	238.727
8.648	256.279
8.692	339.781
8.902	282.533];
units.LWw_f   = {'d', 'g'};  label.LWw_f = {'mantle length', 'wet weight', 'female'};  
bibkey.LWw_f = 'SchwHovi2019';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % mantle length (cm), wet weight (g)
4.614	40.092
5.045	97.443
5.139	43.090
5.180	72.222
5.298	107.193
5.352	38.270
5.377	125.652
5.722	51.922
5.743	76.197
5.995	66.529
5.995	74.296
6.151	84.030
6.539	80.209
6.676	97.707
6.910	108.425
6.990	145.331
7.087	144.376
7.185	152.159
7.203	128.860
7.364	228.887
7.385	252.191
7.478	185.216
7.610	123.101
7.611	132.810
7.612	155.140
7.651	162.914
7.689	140.590
7.785	129.926
7.927	216.356
7.961	138.692
8.024	224.139
8.335	229.044
8.350	149.434
8.371	178.564
8.710	322.308
8.839	211.650];
units.LWw_m   = {'d', 'g'};  label.LWw_m = {'mantle length', 'wet weight', 'male'};  
bibkey.LWw_m = 'SchwHovi2019';
comment.LWw_m = 'Data for males';

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
209.112	43.473
254.240	34.211
263.786	55.474
267.650	44.816
273.438	32.631
273.452	26.548
283.889	76.706
285.826	69.095
290.672	49.309
296.343	85.794
301.112	97.946
304.933	105.539
308.859	69.025
312.749	47.721
319.438	59.868
325.130	87.227
327.977	100.906
331.863	81.123
340.354	141.933
340.431	109.994
350.805	186.008
355.709	141.887
361.409	166.204
366.244	150.980
366.361	102.311
368.196	137.286
371.207	82.524
373.885	166.166
376.819	143.343
382.563	149.410
390.357	100.717
394.977	175.227
398.969	111.337
410.452	124.990
412.401	112.817
426.738	137.108
427.413	255.737];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(4);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'SchwHovi2019';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.am = 5 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 2 * weights.psd.v;

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
metaData.links.id_CoL = '6RQRX'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '12007246'; % Ency of Life
metaData.links.id_Wiki = 'Muusoctopus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3969648'; % Taxonomicon
metaData.links.id_WoRMS = '527162'; % WoRMS
metaData.links.id_molluscabase = '527162'; % molluscabase

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

