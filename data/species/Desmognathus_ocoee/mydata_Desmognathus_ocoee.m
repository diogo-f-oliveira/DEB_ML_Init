function [data, auxData, metaData, txtData, weights] = mydata_Desmognathus_ocoee
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Desmognathus_ocoee'; 
metaData.species_en = 'Ocoee salamander'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L';'t-Ww_f'; 'L-N_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 10]; 


%% set data
% zero-variate data

data.ab = 60;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '53 to 66 d';
data.tp = 1.4*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Bruc2016';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'amphibiaweb';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 5   ;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Bruc2016';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 2.5 mm (2 to 3 mm): pi/6*0.25^3';
data.Wwi = 2;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Bruc2016';

data.Ri  = 20/365/2; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '13 eggs per clutch (5 to 23), 1 clutch each other yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
0.680	1.380
1.633	2.121
1.667	1.953
1.667	1.869
1.667	1.785
1.667	1.700
1.667	1.633
1.667	1.566
1.769	2.407
1.769	2.323
2.585	2.795
2.585	2.710
2.585	2.643
2.653	2.862
2.653	2.492
2.687	3.384
2.721	2.357
2.721	2.172
2.857	3.636
3.571	3.199
3.605	2.643
3.605	2.744
3.605	3.350
3.605	4.630
3.639	2.896
3.639	3.300
3.639	3.956
3.673	3.771
3.673	4.040
3.673	4.478
3.707	3.468
3.810	3.249
3.810	3.889
4.592	4.242
4.592	3.721
4.592	3.586
4.626	4.680
4.626	4.562
4.626	4.209
4.626	3.552
4.626	3.451
4.898	4.394
4.898	4.276
5.578	4.175
5.578	4.428
5.646	3.502
5.646	4.815
5.680	4.074
6.633	4.141
6.633	3.670
6.667	4.579
6.667	4.697
6.803	4.512
6.803	4.630
9.694	4.747];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'total length', 'Wolf Creek, Cowee Mountains'};  
temp.tL   = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bruc2016';
comment.tL = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
0.507	0.059
1.564	0.198
1.586	0.160
1.586	0.122
1.586	0.109
1.586	0.097
1.586	0.084
1.755	0.270
2.558	0.206
2.558	0.244
2.558	0.291
2.558	0.447
2.579	0.350
2.579	0.379
2.579	0.409
2.579	0.697
2.791	0.853
3.552	1.072
3.573	1.686
3.573	1.153
3.573	0.459
3.573	0.413
3.594	0.569
3.594	0.358
3.615	0.755
3.615	0.692
3.615	0.616
3.636	1.538
3.636	0.903
3.636	0.768
3.721	0.616
3.784	1.030
4.567	0.717
4.567	0.759
4.567	0.801
4.567	0.886
4.567	1.224
4.567	1.241
4.567	1.305
4.567	1.668
4.567	1.698
4.588	1.558
4.651	0.772
4.778	1.427
4.799	1.355
5.560	0.776
5.581	1.845
5.581	1.875
5.603	1.241
5.624	1.465
5.666	1.482
5.666	1.139
6.512	1.219
6.533	1.608
6.575	0.868
6.596	1.710
6.660	1.659
6.765	1.532
6.765	1.612
9.577	1.772];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW  = {'d', 'g'}; label.tW = {'time since birth', 'wet weight', 'Wolf Creek, Cowee Mountains'};  
temp.tW   = C2K(15); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Bruc2016';
comment.tW = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';
%
data.tW1 = [ ... % time since birth (yr), wet weight (g)
0.725	0.023
0.802	0.069
1.255	0.118
1.294	0.138
1.306	0.184
1.333	0.112
1.333	0.079
1.371	0.177
1.410	0.207
1.449	0.151
1.527	0.099
1.695	0.194
1.733	0.223
1.746	0.197
1.772	0.276
1.772	0.230
1.772	0.165
1.773	0.138
1.786	0.099
1.863	0.184
2.287	0.697
2.301	0.537
2.302	0.400
2.341	0.322
2.443	0.566
2.482	0.540
2.483	0.439
2.665	0.221
2.677	0.374
2.703	0.446
2.756	0.224
2.766	0.606
2.767	0.518
2.807	0.273
2.819	0.433
3.311	0.381
3.323	0.531
3.466	0.574
3.685	0.656
3.694	1.295
3.698	0.718
3.712	0.466
3.726	0.287
3.735	0.966
3.747	1.165
3.748	0.949
3.759	1.174
3.760	1.138
3.763	0.678
3.763	0.636
3.772	1.230
3.800	0.858
3.812	1.024
3.836	1.289
3.863	1.168
4.252	1.132
4.261	1.733
4.261	1.654
4.267	0.672
4.289	1.361
4.303	1.263
4.303	1.224
4.368	1.139
4.369	1.025
4.459	1.113
4.720	0.823
4.768	1.306
4.768	1.276
4.804	1.730
4.833	1.250
5.323	1.606
5.710	1.868
5.736	1.757
5.738	1.404
5.739	1.368
5.739	1.342
5.750	1.639
5.750	1.620
5.751	1.499
5.768	0.873
5.851	2.008
6.736	1.304
7.288	1.980];
data.tW1(:,1) = data.tW1(:,1) * 365; % convert yr to d
units.tW1  = {'d', 'g'}; label.tW1 = {'time since birth', 'wet weight', 'Coweeta, Cowee Mountains'};  
temp.tW1   = C2K(15); units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Bruc2016';
comment.tW1 = 'Data for Coweeta, Cowee Mountains, SW North Carolina';

data.LN = [ ... % log SVL (mm), log follicle number (#)
3.421	2.302
3.440	2.196
3.455	2.635
3.470	2.635
3.481	2.643
3.489	2.638
3.491	2.397
3.529	2.771
3.540	2.301
3.542	2.831
3.545	2.638
3.560	2.298
3.597	2.945
3.610	2.784
3.618	2.567
3.620	2.776
3.634	2.637
3.638	2.781
3.665	3.001
3.683	3.001
3.687	2.951
3.702	3.098
3.709	2.992
3.713	2.567];
data.LN = exp(data.LN); % remove ln transformation
data.LN(:,1) = data.LN(:,1)/ 10; % convert mm to cm
units.LN  = {'cm', '#'}; label.LN = {'time since birth', 'follicle number', 'Wolf Creek, Cowee Mountains'};  
temp.LN   = C2K(15); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Bruc2013';
comment.LN = 'Data for Wolf Creek, Cowee Mountains, SW North Carolina';
%
data.LN1 = [ ... % log SVL (mm), log follicle number (#)
3.521	2.708
3.543	2.561
3.602	2.480
3.653	2.639
3.658	2.773
3.676	2.944
3.707	2.706
3.712	2.769
3.716	2.632
3.732	2.639
3.733	3.000
3.744	2.942
3.760	3.045
3.760	3.004
3.787	2.707
3.837	3.332];
data.LN1 = exp(data.LN1); % remove ln transformation
data.LN1(:,1) = data.LN1(:,1)/ 10; % convert mm to cm
units.LN1  = {'cm', '#'}; label.LN1 = {'time since birth', 'follicle number', 'Coweeta, Cowee Mountains'};  
temp.LN1   = C2K(15); units.temp.LN1 = 'K'; label.temp.LN1 = 'temperature';
bibkey.LN1 = 'Bruc2013';
comment.LN1 = 'Data for Coweeta, Cowee Mountains, SW North Carolina';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data for Wolf Creek, Coweeta'};
set2 = {'LN','LN1'}; subtitle2 = {'Data for Wolf Creek, Coweeta'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures were guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '353MT'; % Cat of Life
metaData.links.id_ITIS = '550243'; % ITIS
metaData.links.id_EoL = '1018737'; % Ency of Life
metaData.links.id_Wiki = 'Desmognathus_ocoee'; % Wikipedia
metaData.links.id_ADW = 'Desmognathus_ocoee'; % ADW
metaData.links.id_Taxo = '142920'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Desmognathus+ocoee'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Desmognathus_ocoee}}';
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
bibkey = 'Bruc2016'; type = 'Article'; bib = [ ... 
'doi = {10.1643/CE-14-204}, ' ...
'author = {Richard C. Bruce}, ' ... 
'year = {2016}, ' ...
'title = {Application of the {G}ompertz Function in Studies of Growth in Dusky Salamanders (\emph{Plethodontidae}: {D}esmognathus)}, ' ...
'journal = {Copeia}, ' ...
'volume = {104}, ' ...
'pages = {94-100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bruc2013'; type = 'Article'; bib = [ ... 
'author = {Richard C. Bruce}, ' ... 
'year = {2013}, ' ...
'title = {Size-Mediated Tradeoffs in Life-History Traits in Dusky Salamanders}, ' ...
'journal = {Copeia}, ' ...
'volume = {2013}, ' ...
'pages = {262-267}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/species/5811}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

