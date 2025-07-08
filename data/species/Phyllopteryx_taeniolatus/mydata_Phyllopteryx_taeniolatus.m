function [data, auxData, metaData, txtData, weights] = mydata_Phyllopteryx_taeniolatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Phyllopteryx_taeniolatus'; 
metaData.species_en = 'Common seadragon'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'sta@akvaplan.niva.no'}; 
metaData.date_acc  = [2019 03 15]; 

%% set data
% zero-variate data

data.ab = 34;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'fishbase';   
  temp.ab = C2K(17.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '30 till 38 d';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ForsLowe2006';   
  temp.am = C2K(17.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'survived 3.5 yr in lab';

data.Lp  = 31;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 46;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 5e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'ForsLowe2006';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwp = 342;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01000*Li^3.04, see F2';
data.Wwi = 1134;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.04, see F2';

data.Ri  = 250*2/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'SancBoot2005';   
  temp.Ri = C2K(17.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '250 eggs per brood, 2 broods per yr';
  
% uni-variate data
% time-length data
data.tL = [ ... % time since 1 Aug 2001 (d), standard length (cm)
189.569	15.078
191.941	16.580
193.459	15.937
196.603	17.439
211.217	16.372
212.030	17.444
212.055	18.088
218.238	18.412
218.993	17.983
219.798	18.841
222.920	19.807
227.487	18.200
261.539	21.106
273.192	23.255
275.440	21.540
283.178	22.186
297.909	24.121
340.322	23.813
409.608	27.716
410.942	25.893
411.131	28.466
414.097	28.894
424.212	26.746
427.217	27.710
518.409	30.575
628.189	26.784
634.483	32.573
681.519	33.629
712.036	29.544
724.200	35.330
759.079	30.707
761.856	28.562
773.973	33.705
787.101	32.628
788.427	30.697
842.721	30.679
842.768	31.322
847.344	33.680
870.649	31.313
870.743	32.600
906.111	34.625
906.158	35.269
906.205	35.912
924.974	31.723
929.503	33.438
1011.874	36.091
1013.270	35.125];
data.tL(:,1) = data.tL(:,1) - data.tL(1,1); % set origin at first observation
units.tL   = {'d', 'cm'};  label.tL = {'time', 'standard length', 'wild'};  
temp.tL    = C2K(17.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SancBoot2005';

data.tL1 = [ ...
0.013	2.839
0.013	3.161
0.021	3.484
0.021	4.323
0.038	3.161
0.055	3.806
0.060	4.903
0.064	3.161
0.068	3.742
0.068	4.452
0.068	5.355
0.068	5.806
0.072	3.032
0.072	4.129
0.072	7.032
0.077	5.484
0.089	4.645
0.089	7.613
0.098	5.871
0.102	4.581
0.106	5.290
0.119	6.581
0.128	6.903
0.132	5.355
0.132	6.194
0.132	7.355
0.140	6.323
0.140	7.677
0.149	5.871
0.157	7.806
0.157	9.032
0.157	9.613
0.157	10.000
0.166	8.516
0.170	9.226
0.174	8.774
0.174	11.355
0.183	10.000
0.183	10.258
0.183	10.516
0.196	7.935
0.200	5.613
0.204	12.194
0.221	11.613
0.226	12.452
0.226	13.161
0.226	13.613
0.226	13.871
0.230	11.032
0.234	10.387
0.243	9.742
0.243	9.032
0.243	11.548
0.285	11.548
0.289	13.742
0.289	14.516
0.294	16.710
0.298	13.226
0.298	14.774
0.298	14.968
0.298	16.000
0.302	12.129
0.302	14.258
0.319	14.129
0.323	13.871
0.328	15.355
0.332	11.548
0.336	16.581
0.340	13.290
0.362	16.000
0.366	13.806
0.374	13.226
0.379	17.613
0.391	12.258
0.396	15.355
0.400	16.258
0.404	16.968
0.404	18.258
0.404	19.290
0.409	20.258
0.413	15.935
0.413	14.581
0.413	17.355
0.413	17.613
0.413	19.613
0.421	15.161
0.434	17.548
0.443	19.677
0.460	14.452
0.460	15.742
0.460	16.968
0.460	18.581
0.464	16.387
0.498	16.194
0.506	19.871
0.511	19.548
0.511	20.516
0.511	17.226
0.515	14.452
0.515	15.871
0.515	20.129
0.515	20.323
0.515	23.032
0.515	18.129
0.523	19.032
0.557	15.677
0.566	17.484
0.570	16.194
0.574	22.387
0.583	21.355
0.583	22.903
0.600	19.871
0.621	17.742
0.655	23.548
0.660	22.065
0.660	24.581
0.664	17.806
0.664	18.387
0.668	21.226
0.685	17.613
0.706	19.677
0.715	18.581
0.736	19.548
0.736	21.871
0.740	24.968
0.745	18.839
0.745	23.935
0.762	20.387
0.774	25.871
0.821	24.194
0.821	21.355
0.830	19.548
0.834	22.645
0.838	25.419
0.838	26.452
0.838	22.903
0.843	19.613
0.898	23.677
0.906	22.645
0.923	27.097
0.928	20.710
0.996	24.194
1.000	22.839
1.009	28.065
1.043	22.194
1.072	26.516
1.166	27.548
1.174	24.645
1.217	25.032
1.217	29.161
1.230	28.065
1.230	29.871
1.247	25.548
1.268	22.903
1.391	27.806
1.451	24.194
1.455	24.839
1.549	28.323
1.596	28.000
1.609	25.355
1.630	30.065
1.702	26.645
1.762	29.032
1.791	27.226
1.830	26.387
1.868	26.903
1.868	31.097
1.996	27.484
2.004	28.839
2.021	26.774
2.123	28.839
2.336	29.097
2.557	29.613
2.698	29.677
2.838	30.129
2.923	30.581
2.983	31.806
3.098	30.323];
data.tL1(:,1) = 365 * data.tL1(:,1);
units.tL1   = {'d', 'cm'};  label.tL1 = {'time', 'standard length', 'captive'};  
temp.tL1    = C2K(17.2);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'ForsLowe2006';
comment.tL1 = 'Data for captive individuals, observed since hatch';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from wild, captive'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Optimal temperature for reproduction is 17.2 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.01000*(TL in cm)^3.04';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Shortest time between 2 pregnancies of the same males is 57 d, 1 or 2 cycles per yr';
metaData.bibkey.F3 = 'SancBoot2005'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '6VFLV'; % Cat of Life
metaData.links.id_ITIS = '644912'; % ITIS
metaData.links.id_EoL = '46567739'; % Ency of Life
metaData.links.id_Wiki = 'Phyllopteryx_taeniolatus'; % Wikipedia
metaData.links.id_ADW = 'Phyllopteryx_taeniolatus'; % ADW
metaData.links.id_Taxo = '183763'; % Taxonomicon
metaData.links.id_WoRMS = '282254'; % WoRMS
metaData.links.id_fishbase = 'Phyllopteryx-taeniolatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phyllopteryx_taeniolatus}}';
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
bibkey = 'SancBoot2005'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2005.00720.x}, ' ...
'author = {J. Sanchez-Camara and D. J. Booth and X. Turon}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive cycle and growth of \emph{Phyllopteryx taeniolatus}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {67}, ' ...
'pages = {133-148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ForsLowe2006'; type = 'Article'; bib = [ ... 
'author = {Kristy L. Forsgren and Christopher G. Lowe}, ' ... 
'year = {2006}, ' ...
'title = {The life history of weedy seadragons, \emph{Phyllopteryx taeniolatus} ({T}eleostei: {S}yngnathidae)}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {67}, ' ...
'pages = {313-322}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Phyllopteryx-taeniolatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

