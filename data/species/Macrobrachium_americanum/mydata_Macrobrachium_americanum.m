function [data, auxData, metaData, txtData, weights] = mydata_Macrobrachium_americanum

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Palaemonidae';
metaData.species    = 'Macrobrachium_americanum'; 
metaData.species_en = 'Cauque river prawn'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp % mean ambient reservoir water temperature in  EtimSank1998
metaData.data_0     = {'am'; 'Li'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
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

data.am = 10.6*365;  units.am = 'd';     label.am = 'life span';     bibkey.am = 'IbarWehr2020';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp  = 6; units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Palaemon elegans 3.65*9.6/5.84 cm';
data.Li  = 9.6;   units.Li  = 'cm';   label.Li  = 'ultimate total length';  bibkey.Li  = 'IbarWehr2020';
  comment.Li = 'based on LW data';

data.Wwb = 8.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 0.65 mm and egg width 0.5 mm for Palaemon elegans: pi/6*.05^2*.065';
data.Wwp = 83;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(Lp/Li)^3: 340*(6/9.6)^3 g)';
data.Wwi = 340;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'IbarWehr2020';
  comment.Wwi = 'based on LW data'; 

data.Ri  = 4e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same relative max reprod rate, compared to Palaemon elegans: 340/1.43*1704 per yr';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % time (yr), carapace length (cm), weight (g)
0.504	1.766   3.894
0.717	2.044   3.923
0.846	2.509   4.900
1.230	2.973   8.762
1.401	3.624  10.723
2.000	4.553  22.283
2.641	5.388  38.642
4.010	6.641  80.015
6.318	8.216 165.611];
data.tLW(:,1) = data.tLW(:,1)*365; % convert yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time', 'carapace length', 'weight'};  
temp.tLW    = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature'; 
bibkey.tLW = 'IbarWehr2020'; treat.tLW = {1, {'length','weight'}};
    
% length-weight
data.LW = [ ... % carapace length (cm), weight (g)
1.390	0.798
1.613	0.781
1.692	0.573
1.810	0.766
1.836	1.032
1.915	1.657
2.007	2.549
2.072	2.544
2.112	4.339
2.217	1.635
2.256	3.429
2.321	3.425
2.387	2.521
2.453	1.617
2.518	2.511
2.584	4.304
2.663	6.096
2.702	4.295
2.820	7.882
2.846	2.486
2.938	5.176
3.043	9.663
3.095	6.962
3.213	9.650
3.279	6.948
3.384	11.435
3.449	6.936
3.554	6.029
3.555	13.220
3.646	10.516
3.712	13.208
3.764	8.710
3.804	13.201
3.882	14.094
3.895	8.700
3.988	18.581
4.000	9.591
4.053	18.576
4.092	10.483
4.145	18.569
4.223	12.271
4.263	19.459
4.289	14.963
4.381	22.147
4.433	16.750
4.447	23.940
4.525	19.439
4.564	10.448
4.617	16.736
4.683	28.416
4.709	23.021
4.840	32.000
4.866	23.009
4.945	27.498
4.972	31.990
5.090	30.184
5.168	24.784
5.221	33.769
5.247	23.880
5.339	39.154
5.404	29.261
5.405	48.137
5.430	23.866
5.483	37.345
5.575	42.731
5.614	28.346
5.693	45.419
5.732	31.933
5.732	39.124
5.850	33.722
5.864	51.699
5.903	41.808
5.969	38.208
5.969	60.679
6.021	48.990
6.061	57.976
6.126	46.286
6.271	52.567
6.310	65.148
6.350	82.224
6.375	46.267
6.389	57.053
6.442	67.835
6.520	66.930
6.625	63.327
6.639	74.112
6.704	83.995
6.717	57.028
6.783	67.810
6.783	87.585
6.914	75.890
7.006	88.467
7.072	82.170
7.138	100.142
7.229	89.349
7.294	78.558
7.361	93.834
7.414	110.908
7.492	101.015
7.504	77.643
7.610	100.107
7.662	94.710
7.664	136.058
7.833	104.585
7.938	115.363
8.003	87.493
8.004	129.740
8.543	167.453
8.611	219.583
8.675	185.421
8.965	244.725
9.503	230.302
9.516	242.886
9.585	339.959];
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
metaData.links.id_CoL = '9GQ5Q'; % Cat of Life
metaData.links.id_ITIS = '96246'; % ITIS
metaData.links.id_EoL = '342615'; % Ency of Life
metaData.links.id_Wiki = 'Macrobrachium'; % Wikipedia
metaData.links.id_ADW = 'Macrobrachium_americanum'; % ADW
metaData.links.id_Taxo = '587094'; % Taxonomicon
metaData.links.id_WoRMS = '587094'; % WoRMS

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

