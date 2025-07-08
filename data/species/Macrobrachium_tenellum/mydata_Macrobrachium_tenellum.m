function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_tenellum
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_tenellum'; 
metaData.species_en = 'Longarm river prawn'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp % mean ambient reservoir water temperature in  EtimSank1998
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 02];

%% set data
% zero-variate data
data.am = 4.6*365;  units.am = 'd';     label.am = 'life span';     bibkey.am = 'IbarWehr2020';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp  = 5; units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Palaemon elegans 3.65*8/5.84 cm';
data.Li  = 11.5;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'IbarWehr2020';
  comment.Li = 'based on LW data';

data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.5 mm for Palaemon elegans: pi/6*.05^2*.065';
data.Wwp = 15.4;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 63*(5/8)^3 g';
data.Wwi = 63;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'IbarWehr2020';
  comment.Wwi = 'based on LW data'; 

data.Ri  = 7.5e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative max reprod rate, compared to Palaemon elegans: 63/1.43*1704 per yr';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (yr), carapace length (cm), weight (g)
0.641	1.193  0.319
0.760	1.671  0.324
1.070	2.049  0.783
1.189	2.426  1.390
1.857	3.183  3.065
2.262	3.780  4.731
3.454	5.094 13.635
5.171	6.389 27.824];
data.tLW(:,1) = data.tLW(:,1)*365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'carapace length', 'weight'};  
temp.tLW    = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'IbarWehr2020'; treat.tLW = {1, {'length','weight'}};
    
% length-weight
data.LW = [ ... % carapace length (cm), weight (g)
0.986	0.582
1.111	0.060
1.286	0.069
1.448	0.431
1.560	1.318
1.560	0.965
1.585	0.790
1.610	0.968
1.748	0.623
1.760	1.329
1.885	1.512
1.935	2.043
2.072	1.169
2.084	3.285
2.159	2.231
2.210	1.000
2.272	2.943
2.334	2.064
2.434	2.951
2.484	1.896
2.571	2.782
2.709	2.789
2.858	2.974
2.921	2.801
2.921	2.095
3.008	2.982
3.083	4.572
3.146	1.578
3.195	5.989
3.195	3.697
3.220	5.461
3.269	8.285
3.308	4.232
3.320	5.996
3.383	3.354
3.470	3.711
3.482	5.828
3.507	6.358
3.570	3.717
3.595	5.305
3.694	5.839
3.695	4.076
3.782	6.020
3.857	4.613
3.882	6.731
3.919	4.617
3.969	4.619
4.044	6.739
4.094	5.860
4.219	6.043
4.231	9.394
4.269	6.751
4.343	8.518
4.431	6.407
4.443	9.581
4.505	8.174
4.530	10.291
4.542	13.466
4.668	9.417
4.680	8.183
4.780	10.128
4.805	8.190
4.817	12.070
4.904	16.306
4.941	15.250
4.942	11.195
4.966	14.546
5.053	15.961
5.079	12.613
5.129	13.497
5.166	17.202
5.179	12.970
5.179	11.031
5.241	13.855
5.278	17.560
5.316	14.741
5.329	12.978
5.377	20.034
5.415	15.804
5.501	23.743
5.540	17.398
5.553	12.285
5.590	15.461
5.740	16.350
5.827	19.000
6.051	20.598
6.077	19.189
6.175	24.484
6.263	25.723
6.287	26.782
6.325	28.724
6.675	23.100
6.685	35.267
7.121	42.166
7.309	36.887
7.454	64.753
7.941	62.840];
units.LW   = {'cm', 'g'};  label.LW = {'carapace length', 'weight'};  
bibkey.LW = 'IbarWehr2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 3 * weights.tLW;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Disccussion points
% D1 = '';
% metaData.discussion = struct('D1',D1);  

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9GQG4'; % Cat of Life
metaData.links.id_ITIS = '96364'; % ITIS
metaData.links.id_EoL = '1010626'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium'; % Wikipedia
metaData.links.id_ADW = 'Macrobrachium_tenellum'; % ADW
metaData.links.id_Taxo = '453442'; % Taxonomicon
metaData.links.id_WoRMS = '587578'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macrobrachium}}';
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
bibkey = 'IbarWehr2020'; type = 'Article'; bib = [ ...
'doi = {10.1093/jcbiol/ruz089}, ' ...
'author = {Mauricio A. Ibarra and Ingo S. Wehrtmann}, ' ...
'year = {2020}, ' ...
'title = {Estimates of growth and longevity of six species of freshwater shrimps (\emph{Macrobrachium} spp.) ({D}ecapoda: {C}aridea: {P}alaemonidae) from {C}osta {R}ica}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {40(1)}, ' ...
'pages = {45–57}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

