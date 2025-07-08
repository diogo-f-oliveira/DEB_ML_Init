function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_occidentale
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_occidentale'; 
metaData.species_en = 'River prawn'; 

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

data.am = 7.9*365;  units.am = 'd';     label.am = 'life span';     bibkey.am = 'IbarWehr2020';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp  = 2.44; units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Palaemon elegans 3.65*3.9/5.84 cm';
data.Li  = 3.9;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'IbarWehr2020';
  comment.Li = 'based on LW data';

data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.5 mm for Palaemon elegans: pi/6*.05^2*.065';
data.Wwp = 3.57;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 14.6*(2.44/3.9)^3 g';
data.Wwi = 14.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'IbarWehr2020';
  comment.Wwi = 'based on LW data'; 

data.Ri  = 1.74e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative max reprod rate, compared to Palaemon elegans: 14.6/1.43*1704 per yr';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (yr), carapace length (cm), weight (g)
0.252	0.862  0.339
0.480	1.197  0.763
0.654	1.663  1.485
1.015	2.186  3.440
1.450	2.651  5.735
3.744	3.614 15.464];
data.tLW(:,1) = data.tLW(:,1)*365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'carapace length', 'weight'};  
temp.tLW    = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'IbarWehr2020'; treat.tLW = {1, {'length','weight'}};
    
% length-weight
data.LW = [ ... % carapace length (cm), weight (g)
0.188	0.826
0.722	0.271
0.788	0.336
0.840	0.400
0.905	0.592
0.976	0.530
1.027	0.721
1.060	0.406
1.098	0.597
1.145	1.103
1.159	0.535
1.196	1.357
1.201	0.915
1.224	0.284
1.243	1.169
1.281	0.412
1.290	0.917
1.290	0.981
1.323	0.223
1.323	1.108
1.342	0.666
1.384	0.667
1.393	1.173
1.407	0.099
1.440	0.858
1.454	1.238
1.496	1.491
1.515	0.544
1.520	2.124
1.548	0.924
1.548	1.556
1.581	1.873
1.609	1.178
1.642	1.685
1.646	0.800
1.703	1.370
1.712	2.066
1.740	1.055
1.740	1.561
1.773	2.067
1.773	2.699
1.778	1.246
1.811	2.510
1.825	1.816
1.834	1.121
1.862	0.679
1.862	2.385
1.881	2.955
1.890	0.237
1.900	1.502
1.900	2.576
1.923	1.881
1.942	2.640
1.965	1.440
1.984	2.199
1.994	3.589
2.008	2.768
2.027	1.947
2.031	3.274
2.041	3.843
2.055	2.201
2.059	2.770
2.073	1.759
2.088	3.213
2.116	3.593
2.120	1.950
2.144	3.214
2.163	2.330
2.186	3.657
2.196	2.899
2.219	2.268
2.219	3.279
2.224	4.606
2.261	2.711
2.261	3.723
2.261	4.228
2.289	3.155
2.289	3.723
2.318	4.230
2.318	5.051
2.322	2.776
2.341	4.799
2.350	3.156
2.355	3.788
2.383	3.536
2.402	4.232
2.411	3.410
2.421	4.738
2.472	4.170
2.491	5.182
2.505	4.803
2.514	3.034
2.515	5.815
2.520	6.320
2.543	3.982
2.557	4.615
2.566	6.069
2.571	5.184
2.571	7.396
2.599	4.300
2.609	6.702
2.613	5.501
2.627	4.680
2.637	6.197
2.651	8.346
2.660	4.870
2.670	6.640
2.693	5.629
2.712	4.998
2.735	5.757
2.754	5.505
2.754	8.096
2.782	6.200
2.801	7.149
2.806	5.632
2.806	7.907
2.806	8.603
2.839	6.455
2.848	7.845
2.853	9.362
2.867	7.277
2.871	6.519
2.890	8.099
2.932	6.710
2.933	7.468
2.980	7.912
2.980	8.607
2.984	6.585
2.984	7.090
3.026	7.597
3.027	8.671
3.032	13.032
3.083	7.978
3.139	9.685
3.163	13.604
3.167	8.612
3.181	7.601
3.182	11.582
3.186	10.255
3.219	9.687
3.228	10.572
3.247	8.614
3.247	11.900
3.304	11.017
3.304	12.533
3.308	8.931
3.317	9.563
3.355	11.523
3.374	12.598
3.379	10.892
3.397	10.134
3.430	10.451
3.430	12.157
3.445	13.738
3.449	10.136
3.482	13.486
3.562	14.752
3.581	12.477
3.595	16.017
3.637	13.300
3.675	18.104
3.675	19.178
3.679	12.037
3.690	22.844
3.736	14.251
3.808	28.156
3.850	25.313
3.867	17.667
3.909	14.571];
units.LW   = {'cm', 'g'};  label.LW = {'carapace length', 'weight'};  
bibkey.LW = 'IbarWehr2020'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 3 * weights.tLW;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 5 * weights.Ri;
weights.Wwp = 0 * weights.Wwp;

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
metaData.links.id_CoL = '9GQCQ'; % Cat of Life
metaData.links.id_ITIS = '612728'; % ITIS
metaData.links.id_EoL = '1039680'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium'; % Wikipedia
metaData.links.id_ADW = 'Macrobrachium_occidentale'; % ADW
metaData.links.id_Taxo = '858809'; % Taxonomicon
metaData.links.id_WoRMS = '587416'; % WoRMS

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

