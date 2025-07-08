function [data, auxData, metaData, txtData, weights] = mydata_Spermophilus_citellus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Spermophilus_citellus'; 
metaData.species_en = 'European ground squirrel'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 34;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'completed weaning 6-7 wk';
data.tp = 314;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.7*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 5.25;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ADW';
data.Ww30 = 61.4;   units.Ww30 = 'g';   label.Ww30 = 'wet weight at 30 d since birth';     bibkey.Ww30 = 'ADW';
data.Wwi = 353;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'ADW';
data.Wwim = 380;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'ADW';

data.Ri  = 1.3*6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.3 litter per yr, 6 pups per litter';

% uni-variate data

% time-weight
data.tWw_f = [ ... % time in 1 Feb (d), weight (g)
112.239	67.301
124.290	90.014
132.799	116.118
144.874	142.232
154.475	154.734
162.951	176.302
176.118	188.815
179.888	217.171
194.155	217.215
198.959	224.033
208.519	230.866
222.674	215.036
407.673	148.718
413.658	154.405
426.923	180.524
439.216	237.251
447.474	228.206
459.348	225.976
467.654	223.734
476.025	230.563
487.899	228.332
498.543	220.429
508.119	229.529
517.792	252.234
527.409	267.003
537.042	284.040
546.699	304.478
556.033	279.564
569.128	281.872
778.901	188.420
788.550	207.724
798.280	238.366
811.488	256.548
822.115	246.377
831.619	245.273
841.147	247.570
850.707	254.402
862.467	236.298
873.168	236.331
881.628	255.632
892.514	281.743
903.271	289.713
912.824	295.412
922.408	305.645];
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f  = C2K(37.5);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'MillStri1999';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since in Feb (d), weight (g)
109.853	66.160
121.799	74.134
131.480	97.973
142.375	125.218
153.205	143.392
162.911	170.633
172.584	193.339
183.325	199.041
194.244	229.687
200.253	238.776
213.356	242.218
224.113	250.188
233.479	229.809
240.856	263.846
392.556	196.290
403.200	188.386
415.195	203.163
424.763	211.129
436.790	230.441
445.250	249.741
456.056	264.514
469.102	260.020
479.835	264.588
487.122	286.153
496.820	312.260
512.309	316.843
516.167	357.672
528.129	367.913
537.697	375.879
547.338	394.050
560.392	390.689
568.845	408.856
580.710	405.491
586.687	410.045
760.791	316.481
770.238	307.440
779.734	305.202
790.297	285.961
800.933	276.923
812.952	295.101
822.496	299.666
832.056	306.499
843.897	299.733
855.819	304.305
861.860	317.929
871.315	310.022
881.062	342.932
891.835	353.170
903.878	374.749
915.897	392.927
923.112	404.287
936.101	391.856
944.513	404.354];
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m  = C2K(37.5);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'MillStri1999';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwi = 5 * weights.Wwi;
weights.Wwim = 5 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Food is assumed to vary as: min(1,f_m+f_a*cos(2*pi*(t-200)/365))';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6YX8Y'; % Cat of Life
metaData.links.id_ITIS = '632446 '; % ITIS
metaData.links.id_EoL = '1041051'; % Ency of Life
metaData.links.id_Wiki = 'Spermophilus_citellus'; % Wikipedia
metaData.links.id_ADW = 'Spermophilus_citellus'; % ADW
metaData.links.id_Taxo = '61917'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401010'; % MSW3
metaData.links.id_AnAge = 'Spermophilus_citellus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spermophilus_citellus}}';
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
bibkey = 'MillStri1999'; type = 'Article'; bib = [ ... 
'author = {Eva Millesi and Arjen M. Strijkstra and Ilse E. Hoffmann and John P. Dittami and Serge Daan}, ' ... 
'year = {1999}, ' ...
'title = {Sex and Age Differences in Mass, Morphology, and Annual Cycle in European Ground Squirrels, \emph{Spermophilus citellus}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {80(1)}, ' ...
'pages = {218-231}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Spermophilus_citellus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Spermophilus_citellus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
