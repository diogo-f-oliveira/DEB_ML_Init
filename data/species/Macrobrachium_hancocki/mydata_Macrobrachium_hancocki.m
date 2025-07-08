function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_hancocki
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_hancocki'; 
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
 
data.Lp  = 2.375; units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Palaemon elegans 3.65*3.8/5.84 cm';
data.Li  = 3.8;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'IbarWehr2020';
  comment.Li = 'based on LW data';

data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.5 mm for Palaemon elegans: pi/6*.05^2*.065';
data.Wwp = 3.1;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3';
data.Wwi = 12.7;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'IbarWehr2020';
  comment.Wwi = 'based on LW data'; 

data.Ri  = 1.51e4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative max reprod rate, compared to Palaemon elegans: 12.73/1.43*1704 per yr';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (yr), carapace length (cm), weight (g)
0.734	0.879  0.108
1.012	1.123  0.327
1.319	1.447  0.600
2.097	2.107  2.245
2.847	2.535  4.769
3.596	2.848  6.470
5.756	3.360 11.571];
data.tLW(:,1) = data.tLW(:,1)*365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'carapace length', 'weight'};  
temp.tLW    = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'IbarWehr2020'; treat.tLW = {1, {'length','weight'}};
    
% length-weight
data.LW = [ ... % carapace length (cm), weight (g)
0.573	0.040
0.622	0.039
0.622	0.039
0.640	0.262
0.676	0.075
0.685	0.061
0.707	0.092
0.733	0.188
0.742	0.021
0.764	0.245
0.800	0.078
0.809	0.022
0.818	0.079
0.831	0.033
0.858	0.136
0.893	0.193
0.911	0.081
0.924	0.249
0.951	0.530
0.964	0.251
0.987	0.083
1.000	0.307
1.022	0.196
1.040	0.309
1.075	0.310
1.116	0.087
1.142	0.423
1.191	0.257
1.204	0.145
1.240	0.650
1.289	0.483
1.329	0.596
1.355	0.653
1.378	0.821
1.391	0.542
1.426	0.711
1.453	0.824
1.480	0.377
1.484	0.992
1.498	0.713
1.515	0.881
1.533	0.490
1.569	1.106
1.595	1.331
1.648	1.948
1.653	1.277
1.653	0.661
1.693	1.334
1.711	1.054
1.719	1.950
1.746	1.503
1.768	1.951
1.777	1.336
1.804	0.721
1.813	1.728
1.839	2.009
1.839	1.561
1.848	2.121
1.888	2.122
1.915	1.619
1.928	2.067
1.933	1.284
1.937	2.683
1.960	1.285
1.973	2.348
1.986	1.621
1.990	2.628
2.022	2.070
2.022	1.566
2.035	2.629
2.066	2.183
2.092	2.855
2.097	2.184
2.105	3.414
2.115	2.800
2.128	1.625
2.132	3.303
2.141	2.129
2.168	3.192
2.177	2.633
2.181	2.298
2.194	3.808
2.195	2.578
2.221	3.250
2.221	2.691
2.261	2.692
2.270	3.419
2.283	3.979
2.288	2.916
2.310	3.644
2.328	2.917
2.350	3.589
2.354	4.652
2.385	5.212
2.386	3.255
2.390	2.975
2.394	3.814
2.403	4.262
2.430	3.591
2.434	3.032
2.452	4.655
2.457	2.921
2.460	5.941
2.483	3.761
2.514	4.712
2.532	3.538
2.536	4.265
2.549	5.888
2.554	5.384
2.554	3.986
2.585	5.777
2.590	3.764
2.594	5.386
2.598	4.379
2.624	6.225
2.625	4.603
2.633	6.673
2.665	4.325
2.677	7.234
2.678	4.941
2.682	5.836
2.692	4.661
2.718	7.011
2.718	4.998
2.722	7.459
2.727	5.389
2.758	6.397
2.772	4.943
2.780	5.838
2.789	5.223
2.820	5.728
2.864	7.407
2.869	6.120
2.878	5.394
2.894	9.645
2.900	6.681
2.908	7.632
2.909	5.562
2.931	6.122
2.934	9.422
2.953	6.626
2.974	9.647
2.984	6.235
2.985	5.788
3.011	7.355
3.028	10.096
3.033	7.020
3.037	9.145
3.055	7.747
3.064	7.300
3.086	9.314
3.095	7.413
3.108	8.420
3.125	11.105
3.131	7.023
3.153	8.030
3.170	8.813
3.184	7.471
3.187	11.387
3.200	13.400
3.201	8.982
3.228	9.486
3.228	7.920
3.245	10.605
3.257	13.793
3.267	11.389
3.285	10.327
3.298	11.110
3.310	14.690
3.322	7.867
3.325	9.992
3.382	14.412
3.405	11.001
3.410	9.715
3.411	18.328
3.426	13.463
3.454	9.492
3.480	13.632
3.678	17.944
3.713	19.399
3.722	18.337
3.773	12.745];
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
metaData.links.id_CoL = '9GQ7G'; % Cat of Life
metaData.links.id_ITIS = '612665'; % ITIS
metaData.links.id_EoL = '311331'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium'; % Wikipedia
metaData.links.id_ADW = 'Macrobrachium_digueti'; % ADW
metaData.links.id_Taxo = '858740'; % Taxonomicon
metaData.links.id_WoRMS = '587192'; % WoRMS

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

