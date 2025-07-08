  function [data, auxData, metaData, txtData, weights] = mydata_Piaractus_mesopotamicus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Serrasalmidae';
metaData.species    = 'Piaractus_mesopotamicus'; 
metaData.species_en = 'Pacu'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fnf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHs'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 01];

%% set data
% zero-variate data
data.ab = 7.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'AmbrBalb2014';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 25;  units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
data.Li = 40.5;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 5.2e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';

data.GSI = 0.20; units.GSI = 'g/g';  label.GSI = 'gonado somatic index for female';   bibkey.GSI = 'guess';
  temp.GSI = C2K(25);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
    1 27.50 24.64
    2 30.80 30.89
    3 34.90 33.79
    4 38.59 35.97
    5 41.67 37.85
    6 43.60 39.80
    7 45.10 42.00];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.9) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
  temp.tL_fm = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
  treat.tL_fm = {1, {'females','males',}};
bibkey.tL_fm = 'AmbrBalb2014';

% length-weight
data.LW_f = [ ... % log10 length (cm), log10 weight (g)
1.423	2.843
1.435	2.999
1.452	3.005
1.452	2.967
1.461	2.925
1.469	3.177
1.469	3.005
1.469	3.103
1.471	3.078
1.476	3.129
1.476	3.039
1.477	3.179
1.479	3.104
1.479	3.068
1.481	2.992
1.482	3.045
1.483	3.057
1.489	2.928
1.489	2.944
1.490	2.976
1.493	3.003
1.505	3.072
1.506	3.041
1.508	3.112
1.511	2.993
1.515	3.125
1.517	3.102
1.518	2.995
1.519	3.234
1.519	3.045
1.522	3.079
1.523	3.244
1.528	3.041
1.529	3.179
1.529	3.146
1.530	3.074
1.530	3.100
1.531	3.257
1.535	3.181
1.535	3.148
1.539	3.265
1.541	3.234
1.542	3.146
1.544	3.259
1.544	3.198
1.547	3.072
1.549	3.276
1.554	3.299
1.555	3.098
1.555	3.383
1.555	3.070
1.557	3.357
1.560	3.299
1.561	3.313
1.566	3.326
1.566	3.181
1.567	3.255
1.567	3.406
1.567	3.301
1.568	3.196
1.569	3.378
1.572	3.334
1.574	3.251
1.576	3.255
1.576	3.383
1.579	3.286
1.579	3.439
1.579	3.402
1.579	3.173
1.584	3.261
1.584	3.236
1.585	3.343
1.585	3.450
1.589	3.400
1.589	3.481
1.590	3.207
1.591	3.234
1.594	3.366
1.595	3.299
1.596	3.267
1.596	3.460
1.596	3.332
1.598	3.418
1.599	3.255
1.599	3.450
1.599	3.349
1.601	3.282
1.602	3.341
1.603	3.439
1.603	3.316
1.604	3.471
1.605	3.259
1.605	3.343
1.606	3.286
1.607	3.368
1.610	3.314
1.611	3.473
1.612	3.423
1.613	3.293
1.616	3.450
1.617	3.291
1.617	3.383
1.617	3.429
1.617	3.314
1.620	3.347
1.624	3.310
1.625	3.496
1.625	3.372
1.627	3.341
1.627	3.425
1.632	3.391
1.633	3.416
1.633	3.452
1.634	3.370
1.637	3.316
1.641	3.582
1.641	3.421
1.642	3.452
1.642	3.299
1.643	3.542
1.644	3.339
1.647	3.477
1.647	3.502
1.651	3.519
1.652	3.437
1.652	3.557
1.654	3.467
1.654	3.496
1.657	3.448
1.659	3.567
1.662	3.534
1.663	3.505
1.663	3.473
1.680	3.572
1.680	3.545
1.687	3.599
1.696	3.622
1.697	3.729
1.706	3.601
1.716	3.672
1.746	3.811
1.750	3.790
1.785	3.983
1.791	3.998];
data.LW_f = 10.^data.LW_f; % remove log transform
units.LW_f = {'cm', 'g'};  label.LW_f = {'std length','weight','females'};  
bibkey.LW_f = 'AmbrBalb2014';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ...  % std length (cm), weight (g)1.429	2.873
1.432	2.900
1.444	2.915
1.448	3.043
1.449	3.080
1.451	2.915
1.454	3.036
1.460	2.999
1.461	2.959
1.462	3.118
1.463	2.904
1.476	2.974
1.476	2.951
1.477	3.164
1.484	3.106
1.495	3.173
1.497	3.041
1.498	3.200
1.498	2.995
1.499	3.118
1.500	3.246
1.502	3.095
1.506	3.014
1.506	2.999
1.507	3.141
1.512	3.175
1.513	3.049
1.516	3.185
1.517	3.198
1.521	3.175
1.522	3.039
1.524	3.229
1.530	3.012
1.531	3.097
1.532	3.301
1.535	3.091
1.538	3.114
1.542	3.343
1.542	3.077
1.543	3.116
1.543	3.303
1.545	3.058
1.548	3.238
1.551	3.152
1.555	3.148
1.556	3.142
1.557	3.116
1.560	3.198
1.562	3.259
1.566	3.070
1.567	3.295
1.568	3.152
1.569	3.112
1.569	3.077
1.571	3.297
1.575	3.328
1.576	3.096
1.579	3.322
1.579	3.114
1.581	3.360
1.584	3.276
1.585	3.156
1.587	3.182
1.589	3.255
1.590	3.297
1.594	3.400
1.601	3.318
1.601	3.303
1.603	3.337
1.610	3.207
1.612	3.364
1.621	3.362
1.622	3.278
1.629	3.301
1.635	3.488
1.635	3.385
1.639	3.379
1.643	3.404
1.661	3.603
1.664	3.444
1.677	3.517
1.685	3.492
1.690	3.586
1.701	3.599];
data.LW_m = 10.^data.LW_m; % remove log transform
units.LW_m = {'cm', 'g'};  label.LW_m = {'std length','weight','males'};  
bibkey.LW_m = 'AmbrBalb2014';
comment.LW_m = 'Data for males';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 10;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 10;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02455*(TL in cm)^3.00, but at odds with Wwi = 20 kg, which seems large of a 40 cm fish'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4HPL3'; % Cat of Life
metaData.links.id_ITIS = '641578'; % ITIS
metaData.links.id_EoL = '210163'; % Ency of Life
metaData.links.id_Wiki = 'Piaractus_mesopotamicus'; % Wikipedia
metaData.links.id_ADW = 'Piaractus_mesopotamicus'; % ADW
metaData.links.id_Taxo = '183815'; % Taxonomicon
metaData.links.id_WoRMS = '1019322'; % WoRMS
metaData.links.id_fishbase = 'Piaractus-mesopotamicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Piaractus_mesopotamicus}}';  
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
bibkey = 'AmbrBalb2014'; type = 'Article'; bib = [ ...
'doi = {10.1590/1678-476620141044413417}, ' ...
'author = {Angela M. Ambrosio and  Thiago J. Balbi and Talitha M. Francisco and Luiz C. Gomes and Marina S. Zuliani and Edson K. Okada}, ' ...
'year = {2014}, ' ...
'title = {Aging and growth parameter from the \emph{Piaractus mesopotamicus} (pacu) from the {C}uiab\''{a} river, {M}ato {G}rosso, {B}razil}, ' ... 
'journal = {Iheringia, S\''{e}rie Zoologia, Porto Alegre}, ' ...
'volume = {104(4)}, '...
'pages = {413-417}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Piaractus-mesopotamicus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

