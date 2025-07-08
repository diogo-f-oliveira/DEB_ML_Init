function [data, auxData, metaData, txtData, weights] = mydata_Histioteuthis_miranda

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Histioteuthidae';
metaData.species    = 'Histioteuthis_miranda'; 
metaData.species_en = 'Cock-eyed squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MP','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';  'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 28];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 28];

%% set data
% zero-variate data

data.am = 470;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'HoviLipi2009';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty for female';  bibkey.Lp  = 'HoviLipi2009';
data.Lpm  = 15;  units.Lpm  = 'cm'; label.Lpm  = 'mantle length at puberty for male';  bibkey.Lpm  = 'HoviLipi2009';
data.Li  = 29; units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'HoviLipi2009';
data.Lim = 29; units.Lim = 'cm'; label.Lim  = 'mantle length at death for male'; bibkey.Lim  = 'HoviLipi2009';

data.Wwb  = 2.4e-5;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg length 0.5 mm and egg width of 0.3 mm for Histioteuthis_bonnellii: pi/6*0.05*0.03^2';

data.Ni  = 148e3; units.Ni  = '#';      label.Ni  = 'cum reprod at death';      bibkey.Ni  = 'HoviLipi2009';   
  temp.Ni = C2K(6); units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), mantle length (cm)
291.754	21.540
300.959	17.467
307.315	16.449
328.293	15.979
329.008	18.877
339.922	24.987
342.345	23.107
343.938	22.715
344.828	18.956
350.389	18.094
357.130	17.467
360.218	20.366
362.167	21.462
364.238	17.937
368.486	21.854
372.137	18.407
373.659	20.679
374.794	22.637
379.247	18.799
379.251	18.642
387.805	24.282
389.830	22.480
390.965	24.439
403.280	22.480
403.300	21.697
405.084	29.060
405.667	21.932
418.429	18.016
425.796	23.655
432.065	25.927
463.050	20.992];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'mantle length', 'female'};  
temp.tL_f    = C2K(6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HoviLipi2009';
comment.tL_f = 'Data for females)'; 
%
data.tL_m = [ ... % time since birth (d), mantle length (cm
274.918	14.961
301.653	21.149
321.022	21.697
323.558	15.509
335.266	21.540
342.506	16.997
346.355	21.070
350.372	18.721
355.716	26.084
357.989	14.883
358.280	18.877
363.805	19.347
411.216	21.540
418.148	28.668
429.408	21.697
465.608	28.982];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'mantle length', 'male'};  
temp.tL_m    = C2K(6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HoviLipi2009';
comment.tL_m = 'Data for males'; 

% time-weight
data.tWw_f = [ ... % time since birth (d), wet weight (g)
291.982	954.955
300.681	603.603
306.354	481.982
327.912	540.541
328.669	774.775
338.880	1378.378
342.663	1400.901
343.041	842.342
344.932	693.694
350.227	468.468
356.278	693.694
359.304	770.270
360.439	950.450
364.977	725.225
369.138	725.225
371.407	545.045
374.054	1328.829
374.433	990.991
378.593	819.820
388.048	1572.072
390.318	1157.658
391.452	1554.054
402.421	1027.027
404.312	801.802
405.446	1968.468
407.337	698.198
418.684	950.450
426.248	1099.099
432.300	1486.486
462.935	932.433];
units.tWw_f   = {'d', 'g'};  label.tWw_f = {'time', 'wet weight', 'female'};  
temp.tWw_f    = C2K(6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'HoviLipi2009';
comment.tWw_f = 'Data for females'; 
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
274.962	265.766
302.572	581.081
320.726	1099.099
322.617	454.955
336.233	1013.514
343.041	684.685
346.445	594.595
349.470	639.640
355.522	1324.324
357.791	522.522
358.926	1013.514
363.086	779.279
411.120	617.117
418.684	1545.045
429.274	1103.604
466.339	1563.063];
units.tWw_m   = {'d', 'g'};  label.tWw_m = {'time', 'wet weight', 'male'};  
temp.tWw_m    = C2K(6);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'HoviLipi2009';
comment.tWw_m = 'Data for males'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 5 * weights.Wwb;

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed for this deepsea species';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3M5G5'; % Cat of Life
metaData.links.id_ITIS = '556048'; % ITIS
metaData.links.id_EoL = '491809'; % Ency of Life
metaData.links.id_Wiki = 'Histioteuthis'; % Wikipedia
metaData.links.id_ADW = 'Histioteuthis_miranda'; % ADW
metaData.links.id_Taxo = '158053'; % Taxonomicon
metaData.links.id_WoRMS = '341871'; % WoRMS
metaData.links.id_molluscabase = '341871'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Histioteuthis}}';
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
bibkey = 'HoviLipi2009'; type = 'Article'; bib = [ ... 
'author = {Hendrik Jan T. Hoving and Marek R. Lipi\''{n}ski}, ' ... 
'year = {2009}, ' ...
'title = {Female reproductive biology, and age of deep-sea squid \emph{Histioteuthis miranda} from southern {A}frica}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {66}, ' ...
'pages = {1868-1872}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Histioteuthis-miranda.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

