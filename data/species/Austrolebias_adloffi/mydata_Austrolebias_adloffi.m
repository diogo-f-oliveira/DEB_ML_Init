  function [data, auxData, metaData, txtData, weights] = mydata_Austrolebias_adloffi
  %% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Rivulidae';
metaData.species    = 'Austrolebias_adloffi'; 
metaData.species_en = 'Killifish'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'Lb'; 'Li'; 'Ni'};  
metaData.data_1     = {'t-L_Tf'; 't-Ww_Tf'; 't-S'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 02];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc    = [2020 10 02]; 

%% set data
% zero-variate data
data.tp = 2*30.5;        units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'WalfLiu1965';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  
data.Lb  = 0.51;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'guess';  
  comment.Lb = 'based on Kryptolebias_marmoratus';
data.Li = 5.64;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'LiuWalf1966';
   
data.Ni = 102;  units.Ni = '#'; label.Ni = 'cum # eggs till 335 d';   bibkey.Ni = 'WalfLiu1965';
  temp.Ni = C2K(16); units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 

% uni-variate data
  
% time-length
data.tL_22f = [ ... % time since birth (d), CL length (cm)
153.870	2.760
184.554	2.986
214.639	3.320
243.939	3.454
291.100	3.474
321.705	3.568
367.435	3.418
397.255	3.312
427.854	3.398];
data.tL_22f(:,1) = data.tL_22f(:,1) - data.tL_22f(1,1); % set origin at start experiment
data.tL_22f(:,2) = data.tL_22f(:,2)/ 0.78; % convert CL to TL, see F2
units.tL_22f = {'d', 'cm'}; label.tL_22f = {'time', 'total length', 'female'};  
temp.tL_22f = C2K(22);  units.temp.tL_22f = 'K'; label.temp.tL_22f = 'temperature';
bibkey.tL_22f = 'LiuWalf1966';
comment.tL_22f = 'Data for females at 22 C; CL was converted to TL, see F2, according to WalfLiu1965';
%
data.tL_22m = [ ... % time since birth (d), CL length (cm)
154.789	3.200
184.142	3.404
214.085	3.503
246.041	3.637
289.276	3.752
320.482	3.742
367.087	3.941
397.628	3.931
428.157	3.899];
data.tL_22m(:,1) = data.tL_22m(:,1) - data.tL_22m(1,1); % set origin at start experiment
data.tL_22m(:,2) = data.tL_22m(:,2)/ 0.78; % convert CL to TL, see F2
units.tL_22m = {'d', 'cm'}; label.tL_22m = {'time', 'total length', 'male'};  
temp.tL_22m = C2K(22);  units.temp.tL_22m = 'K'; label.temp.tL_22m = 'temperature';
bibkey.tL_22m = 'LiuWalf1966';
comment.tL_22m = 'Data for males at 22 C; CL was converted to TL, see F2, according to WalfLiu1965';
%
data.tL_16f = [ ... % time since birth (d), total length (cm)
151.878	2.760
183.410	3.291
213.563	3.738
244.845	3.854
290.744	3.983
321.343	4.069
367.224	4.167
396.484	4.236
427.076	4.309
458.342	4.399
489.560	4.411
535.986	4.313
565.914	4.386];
data.tL_16f(:,1) = data.tL_16f(:,1) - data.tL_16f(1,1); % set origin at start experiment
data.tL_16f(:,2) = data.tL_16f(:,2)/ 0.78; % convert CL to TL, see F2
units.tL_16f = {'d', 'cm'}; label.tL_16f = {'time', 'total length', 'female'};  
temp.tL_16f = C2K(16);  units.temp.tL_16f = 'K'; label.temp.tL_16f = 'temperature';
bibkey.tL_16f = 'LiuWalf1966';
comment.tL_16f = 'Data for females at 16 C; CL was converted to TL, see F2, according to WalfLiu1965';
%
data.tL_16m = [ ... % time since birth (d), std length (cm)
154.800	3.200
183.122	3.914
213.845	4.204
244.489	4.364
291.044	4.480
318.963	4.527
366.830	4.616
396.091	4.685
427.320	4.714
459.801	4.617
489.157	4.842
535.596	4.766
566.161	4.795];
data.tL_16m(:,1) = data.tL_16m(:,1) - data.tL_16m(1,1); % set origin at start experiment
data.tL_16m(:,2) = data.tL_16m(:,2)/ 0.78; % convert CL to TL, see F2
units.tL_16m = {'d', 'cm'}; label.tL_16m = {'time', 'total length', 'male'};  
temp.tL_16m = C2K(16);  units.temp.tL_16m = 'K'; label.temp.tL_16m = 'temperature';
bibkey.tL_16m = 'LiuWalf1966';
comment.tL_16m = 'Data for males at 16 C; CL was converted to TL, see F2, according to WalfLiu1965';

% time-weight
data.tWw_22f = [ ... % time since birth (d), wet weight (g)
152.522	0.569
183.268	0.707
213.101	0.946
243.347	0.999
290.635	1.167
320.397	1.182
365.747	1.195
396.880	1.063
427.597	1.108];
data.tWw_22f(:,1) = data.tWw_22f(:,1) - data.tWw_22f(1,1); % set origin at start experiment
units.tWw_22f = {'d', 'g'}; label.tWw_22f = {'time', 'wet weight', 'female'};  
temp.tWw_22f = C2K(22);  units.temp.tWw_22f = 'K'; label.temp.tWw_22f = 'temperature';
bibkey.tWw_22f = 'LiuWalf1966';
comment.tWw_22f = 'Data for females';
%
data.tWw_22m = [ ... % time since birth (d), std length (cm)
153.089	0.870
183.842	1.032
213.634	1.139
244.353	1.192
290.248	1.438
321.464	1.568
366.360	1.644
397.055	1.619
427.297	1.657];
data.tWw_22m(:,1) = data.tWw_22m(:,1) - data.tWw_22m(1,1); % set origin at start experiment
units.tWw_22m = {'d', 'g'}; label.tWw_22m = {'time', 'wet weight', 'male'};  
temp.tWw_22m = C2K(22);  units.temp.tWw_22m = 'K'; label.temp.tWw_22m = 'temperature';
bibkey.tWw_22m = 'LiuWalf1966';
comment.tWw_22m = 'Data for males';
%
data.tWw_16f = [ ... % time since birth (d), wet weight (g)
153.467	0.569
181.946	1.009
214.686	1.479
244.541	1.787
290.445	2.064
321.242	2.364
366.553	2.255
395.828	2.223
427.063	2.415
457.792	2.499
488.046	2.575
533.824	2.450
565.977	2.557];
data.tWw_16f(:,1) = data.tWw_16f(:,1) - data.tWw_16f(1,1); % set origin at start experiment
units.tWw_16f = {'d', 'g'}; label.tWw_16f = {'time', 'wet weight', 'female'};  
temp.tWw_16f = C2K(16);  units.temp.tWw_16f = 'K'; label.temp.tWw_16f = 'temperature';
bibkey.tWw_16f = 'LiuWalf1966';
comment.tWw_16f = 'Data for females';
%
data.tWw_16m = [ ... % time since birth (d), std length (cm)
153.087	0.870
183.058	1.542
213.904	1.997
244.718	2.352
290.146	2.613
320.906	2.797
366.285	2.904
396.963	2.826
427.209	2.879
457.885	2.793
488.246	3.209
535.407	2.975
565.646	3.005];
data.tWw_16m(:,1) = data.tWw_16m(:,1) - data.tWw_16m(1,1); % set origin at start experiment
units.tWw_16m = {'d', 'g'}; label.tWw_16m = {'time', 'wet weight', 'male'};  
temp.tWw_16m = C2K(16);  units.temp.tWw_16m = 'K'; label.temp.tWw_16m = 'temperature';
bibkey.tWw_16m = 'LiuWalf1966';
comment.tWw_16m = 'Data for males';

% time - survival
data.tS_f = [ ... % time since birth, surviving fraction
93.790	1
276.919	1
338.923	0.694
395.778	0.045
423.059	0.004];
units.tS_f = {'d', '-'}; label.tS_f = {'time since birth', 'surviving fraction', 'female'};  
temp.tS_f = C2K(22);  units.temp.tS_f = 'K'; label.temp.tS_f = 'temperature';
bibkey.tS_f = 'LiuWalf1966';
comment.tS_f = 'Data for females';
%
data.tS_m = [ ... % time since birth, surviving fraction
92.514	1
183.751	1
213.592	0.957
272.504	0.679
301.650	0.625
333.097	0.506
393.693	0.004];
units.tS_m = {'d', '-'}; label.tS_m = {'time since birth', 'surviving fraction', 'male'};  
temp.tS_m = C2K(22);  units.temp.tS_m = 'K'; label.temp.tS_m = 'temperature';
bibkey.tS_m = 'LiuWalf1966';
comment.tS_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_22f = 3 * weights.tL_22f;
weights.tL_22m = 3 * weights.tL_22m;
weights.tL_16f = 3 * weights.tL_16f;
weights.tL_16m = 10 * weights.tL_16m;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_22f', 'tL_22m', 'tL_16f', 'tL_16m'}; subtitle1 = {'Data for females, males at 22,16 C'};
set2 = {'tWw_22f', 'tWw_22m', 'tWw_16f', 'tWw_16m'}; subtitle2 = {'Data for females, males at 22,16 C'};
set3 = {'tS_f', 'tS_m'}; subtitle3 = {'Data for females, males at 22 C'};
metaData.grp.sets = {set2,set1,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'weight length relationship: Ww in g = 0.00479 * (TL in cm)^3.14'; 
  metaData.bibkey.D1 = 'fishbase';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Anual killifish'; 
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length length relationship from photo: snout-base of caudel fin = 0.78 * TL'; 
metaData.bibkey.F2 = 'fishbase';
F3 = 'length length relationship from photo: SL = 0.81 * TL'; 
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'JWVJ'; % Cat of Life
metaData.links.id_ITIS = '647155'; % ITIS
metaData.links.id_EoL = '356167'; % Ency of Life
metaData.links.id_Wiki = 'Austrolebias_adloffi'; % Wikipedia
metaData.links.id_ADW = 'Austrolebias_adloffi'; % ADW
metaData.links.id_Taxo = '162718'; % Taxonomicon
metaData.links.id_WoRMS = '1026442'; % WoRMS
metaData.links.id_fishbase = 'Austrolebias-adloffi'; % fishbase


%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Austrolebias-adloffi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Austrolebias_adloffi}}';
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
bibkey = 'WalfLiu1965'; type = 'Article'; bib = [ ...
'author = {Roy L. Walford and Robert K. Liu}, ' ...
'year = {1965}, ' ...
'title = {Husbandrty, life span, and growth rate of the annual fish, \emph{Cynolebias adloffi} {E}. {A}hl}, ' ...
'journal = {Exp. Geront.}, ' ...
'volume = {1}, ' ...
'pages = {161-171}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiuWalf1966'; type = 'Article'; bib = [ ...
'author = {Robert K. Liu and Roy L. Walford}, ' ...
'year = {1966}, ' ...
'title = {Increased growth and life-span with lowered ambient temperature in the annual fish, \emph{Cynolebias adloffi}}, ' ...
'journal = {Nature}, ' ...
'volume = {212}, ' ...
'pages = {1277-1278}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

