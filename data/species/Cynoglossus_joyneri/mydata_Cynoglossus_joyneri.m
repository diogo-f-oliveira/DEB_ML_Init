function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_joyneri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_joyneri'; 
metaData.species_en = 'Red tongue sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 03 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 23];

%% set data
% zero-variate data
data.ab = 2.0;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(27.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'YamaKata2009';  
  temp.am = C2K(27.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 21.2;   units.Lp = 'cm';  label.Lp = 'total length at puberty';      bibkey.Lp = 'guess';
  comment.Lp = 'based on Cynoglossus_arel';
data.Li = 39.4;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 9.2e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.56 mm of Cynoglossus arel: pi/6*0.056^3';
data.Wwp = 49.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00407*Lp^3.08, see F1';
data.Wwi = 334; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00407*Li^3.08, see F1';

data.Ri  = 443283/365; units.Ri = '#/d'; label.Ri  = 'reprod rate at FL 23.75 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Cynoglossus robustus';

% uni-variate data
% time-length        
data.tL_f = [ ... % age (yrs), total length (cm) 
1.020	17.341
1.038	15.668
1.045	16.086
1.045	16.564
1.045	18.895
1.045	19.194
1.051	15.847
1.179	18.837
1.191	16.327
1.210	17.821
1.274	18.419
1.280	15.849
1.305	16.447
1.305	16.866
1.325	19.675
1.363	21.169
1.375	18.659
1.381	17.344
1.382	19.914
1.388	18.480
1.394	16.269
1.394	18.002
1.395	19.257
1.433	20.572
1.439	19.198
1.446	22.305
1.458	19.795
1.464	18.720
1.465	21.230
1.496	20.154
1.515	19.378
1.522	19.796
1.534	18.123
1.540	18.661
1.541	18.900
1.547	21.470
1.560	20.633
1.566	20.215
1.610	16.630
1.611	22.128
1.623	18.124
1.623	18.542
1.623	20.514
1.629	16.152
1.629	17.466
1.629	17.825
1.629	18.961
1.636	20.873
1.636	21.112
1.642	19.678
1.642	19.857
1.706	20.037
1.756	18.006
1.801	18.484
1.839	19.082
1.852	19.501
1.865	20.696
1.865	21.353
1.865	21.652
1.922	22.967
1.948	23.027
2.055	21.355
2.093	21.654
2.226	19.863
2.297	21.597
2.360	21.956
2.430	22.315
2.436	20.761
2.443	21.957
2.443	24.945
2.455	19.626
2.455	21.479
2.461	20.164
2.608	24.050
2.614	21.421
2.620	20.345
2.621	22.496
2.621	22.735
2.621	23.094
2.627	21.958
3.389	20.890
3.618	23.462
3.618	25.016
3.618	25.913
3.631	24.120
4.634	26.341
5.618	25.813];
data.tL_f(:,1) = 365 * (0.2+data.tL_f(:,1)); % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f = C2K(27.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YamaKata2009'; 
%
data.tL_m = [ ... % age (yrs), total length (cm) 
0.860	15.845
0.867	17.638
0.874	18.176
1.025	15.429
1.032	16.086
1.032	16.445
1.033	18.656
1.033	19.791
1.039	18.238
1.045	17.102
1.116	22.003
1.190	15.072
1.191	15.729
1.210	16.148
1.216	17.522
1.217	19.016
1.223	17.343
1.224	21.646
1.306	20.153
1.356	17.643
1.356	18.779
1.356	19.316
1.357	20.033
1.363	21.169
1.369	18.181
1.439	20.393
1.439	20.572
1.445	16.987
1.445	17.405
1.445	19.138
1.452	19.437
1.452	21.050
1.458	18.361
1.458	20.154
1.459	22.007
1.465	21.588
1.472	22.963
1.534	17.705
1.540	17.466
1.547	18.302
1.547	18.780
1.547	21.589
1.560	20.334
1.566	20.693
1.572	19.617
1.572	19.856
1.611	22.845
1.616	17.646
1.617	21.351
1.623	16.988
1.623	19.917
1.629	18.542
1.630	19.558
1.630	20.335
1.636	19.319
1.648	18.124
1.655	20.754
1.725	19.798
1.731	19.619
1.776	22.428
1.845	19.680
1.846	20.755
1.852	22.489
1.865	23.744
1.871	20.517
1.878	21.294
2.010	18.367
2.036	21.953
2.037	22.730
2.106	21.356
2.106	21.834
2.131	20.818
2.189	22.492
2.202	22.134
2.259	21.955
2.354	21.119
2.360	21.777
2.360	22.135
2.373	20.342
2.436	18.730
2.443	23.212
2.443	24.706
2.450	24.586
2.455	21.837
2.456	22.256
2.468	22.495
2.474	21.240
2.487	20.463
2.513	21.718
2.526	24.587
2.532	23.332
2.538	22.794
2.570	21.062
2.608	22.974
2.614	20.703
2.614	22.496
2.620	19.867
2.620	20.942
2.621	22.138
2.627	21.540
2.634	24.050
2.679	27.218
2.773	24.052
2.792	23.633
2.862	22.738
2.881	25.009
2.882	25.427
3.027	20.707
3.046	22.142
3.459	24.656
3.541	23.402
3.726	24.479
3.967	24.840
4.806	28.136];
data.tL_m(:,1) = 365 * (0.2+data.tL_m(:,1)); % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m = C2K(27.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YamaKata2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: Ww in g = 0.00407*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BTZL'; % Cat of Life
metaData.links.id_ITIS = '616327'; % ITIS
metaData.links.id_EoL = '46570053'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_joyneri'; % ADW
metaData.links.id_Taxo = '172555'; % Taxonomicon
metaData.links.id_WoRMS = '274205'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-arel'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus}}';
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
bibkey = 'YamaKata2009'; type = 'article'; bib = [ ...
'author = {Masayuki Yamamoto and Satoshi Katayama and Hiroyasu Makino and Hiroyuki Takemori}, ' ...
'year = {2009}, ' ...
'title = {Age and Growth of Red Tongue Sole (\emph{Cynoglossus joyneri}) in the Central {S}eto {I}nland {S}ea, {J}apan}, ' ... 
'journal = {Aquaculture Sci.}, ' ...
'volume = {57(2)}, ' ...
'pages = {341-342}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus-joyneri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
