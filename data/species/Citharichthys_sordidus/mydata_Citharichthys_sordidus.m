function [data, auxData, metaData, txtData, weights] = mydata_Citharichthys_sordidus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Paralichthyidae';
metaData.species    = 'Citharichthys_sordidus'; 
metaData.species_en = 'Pacific sanddab'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L_f'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 15];

%% set data
% zero-variate data

data.am = 9*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.9;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';     bibkey.Lp  = 'LefePayn1999'; 
data.Li  = 41;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 to 0.8 mm: pi/6*0.075^3';
data.Wwp = 19.6;  units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';      bibkey.Wwp = {'fishbase','LefePayn1999'};
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F1';
data.Wwi = 873;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.07, see F1';
 
% uni-variate data
% time-length
data.tL_fm = [... % time since birth (yr), total length (cm)
 0	11.970 11.667
 1	15.342 14.259
 2	17.674 16.204
 3	20.005 18.278
 4	22.205 19.574
 5	23.756 21.259
 6	25.177 22.426
 7	26.467 23.981
 8	27.106 25.796
 9	28.136 26.315
10	28.646 27.093
11	29.286 28.000]; 
data.tL_fm(:,1) = (data.tL_fm(:,1) + 4.3) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'age', 'total length'};  
temp.tL_fm = C2K(10.3); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MacNDome2001'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'data for Southern California';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
13.237	712.169
13.677	839.411
14.381	1409.315
15.218	1284.762
15.262	1979.589
15.527	1159.096
15.569	2801.288
15.748	591.140
15.966	2423.176
15.968	970.549
16.444	6592.604
16.539	1666.489
16.670	2550.977
16.803	2172.308
16.848	1288.193
16.977	3877.936
16.982	25.317
17.020	4320.133
17.461	4005.273
17.465	1352.649
17.555	405.468
17.950	785.250
17.989	4322.174
18.037	1669.642
18.169	2112.025
18.298	3880.718
18.610	1418.218
18.782	4765.948
18.872	3250.349
18.917	2745.179
18.996	8555.873
19.091	3882.387
19.180	3377.313
19.314	2114.437
19.483	6977.951
19.623	1736.139
19.661	5652.010
19.705	5778.417
19.875	10515.617
19.884	3757.742
19.931	1799.945
20.016	4200.125
20.017	3758.020
20.058	5526.529
20.061	3189.693
20.370	2874.555
20.408	6916.741
20.456	4769.472
20.504	2053.783
20.587	5653.957
20.590	3064.491
20.676	4454.146
20.760	7612.218
20.854	3317.679
20.890	9254.595
20.938	5970.487
20.981	7233.734
21.030	3444.365
21.069	6918.132
21.073	4581.296
21.074	3444.458
21.076	2181.304
21.241	9634.284
21.472	2813.716
21.473	2182.138
21.556	5403.368
21.602	3887.674
21.633	12793.003
21.772	8498.558
21.947	9193.664
21.994	7362.182
21.998	4393.771
22.134	2120.372
22.210	10204.742
22.305	5089.155
22.309	2815.478
22.388	9131.434
22.434	7489.427
22.474	10015.826
22.480	5910.575
22.484	3131.636
22.562	10079.169
22.652	9258.305
22.877	5658.780
22.917	8627.284
23.102	2564.517
23.224	9322.668
23.265	11849.070
23.357	9133.474
23.358	8249.267
23.440	12670.491
23.494	5344.291
23.573	11533.929
23.581	6670.786
23.788	15450.170
23.843	7934.497
23.933	6608.371
24.108	7682.423
24.195	8377.344
24.328	7367.097
24.359	16335.584
24.713	15704.749
24.848	13873.455
24.930	17410.471
24.943	8631.550
25.074	9831.826
25.193	18358.393
25.412	19243.064
25.517	7685.391
25.565	5601.280
25.649	8064.615
25.956	8886.316
26.031	17728.578
26.048	6612.822
26.129	11539.308
26.292	20381.758
26.333	22023.951
26.341	17097.650
26.353	8508.203
26.692	17856.284
26.777	19814.359
26.966	11541.071
26.969	9393.709
27.454	8573.679
28.183	22217.319];
units.LN = {'cm', 'fecundity'}; label.LN = {'total length','fecundity'};  
bibkey.LN = 'MacNDome2001';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Wwp = 0 * weights.Wwp;
weights.Lp = 3 * weights.Lp;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for females, males in Southern California'};
% set2 = {'tL_fC','tL_mC'}; subtitle2 = {'Data for females, males in Central California'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'I had to add 4 yrs for age estimates to arrive at a plausible fit';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00977*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4CYVD'; % Cat of Life
metaData.links.id_ITIS = '172743'; % ITIS
metaData.links.id_EoL = '46570506'; % Ency of Life
metaData.links.id_Wiki = 'Citharichthys_sordidus'; % Wikipedia
metaData.links.id_ADW = 'Citharichthys_sordidus'; % ADW
metaData.links.id_Taxo = '46919'; % Taxonomicon
metaData.links.id_WoRMS = '275809'; % WoRMS
metaData.links.id_fishbase = 'Citharichthys-sordidus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Citharichthys_sordidus}}';
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
bibkey = 'HePear2013'; type = 'techreport'; bib = [ ... 
'author = {He, X. and Pearson, D.E. and Field, J.C. and Lefebvre, L. and Key, M.}, ' ... 
'year = {2013}, ' ...
'title = {Status of the U.S. {P}acific Sanddab Resource in 2013}, ' ...
'institution = {Pacific Fishery Management Council, Portland, OR}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LefePayn1999'; type = 'article'; bib = [ ...
'doi = {10.1016/j.seares.2015.07.003}, ' ...
'author = {Lyndsey S. Lefebvre and Amber M. Payne and John C. Field}, ' ...
'year = {1999}, ' ...
'title = {Reproductive dynamics of Pacific sanddab, \emph{Citharichthys sordidus}, off the central coast of {C}alifornia}, ' ... 
'journal = {Journal of Sea Research}, ' ...
'volume = {107(1)}, ' ...
'pages = {100-111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Citharichthys-sordidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

