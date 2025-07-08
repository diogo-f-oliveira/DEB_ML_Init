function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_ongus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_ongus'; 
metaData.species_en = 'White-streaked grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 05];

%% set data
% zero-variate data

data.am = 21 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Crai2007';   
  temp.am = C2K(27.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 40;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'OhtaEbis2015';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 2.25e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Crai2007';
  comment.Wwi = 'based on (40/30)^3*950;  0.01148*Li^3.02, see F1, gives 791 g';

data.GSI  = 0.018;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'OhtaEbis2015';   
  temp.GSI = C2K(16);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
1.012	15.187
1.895	16.414
1.896	15.598
1.920	18.292
1.921	18.292
1.922	17.557
1.923	17.231
1.979	14.864
2.003	18.945
2.918	14.295
2.943	18.214
2.944	16.744
2.945	16.500
2.946	14.867
2.970	18.785
2.971	18.459
2.972	17.316
2.973	15.357
2.974	15.030
2.995	23.112
2.998	19.602
3.027	17.561
3.028	16.010
3.936	20.911
3.937	19.523
3.959	27.115
3.962	22.625
3.964	20.095
3.965	19.115
3.966	18.217
3.967	17.401
3.968	14.707
3.989	23.360
3.990	22.054
3.993	18.625
3.994	16.748
3.995	16.013
4.014	28.258
4.846	23.526
4.873	24.261
4.929	23.118
4.931	20.343
4.934	14.955
4.955	25.404
4.956	22.057
4.957	21.731
4.958	20.914
4.959	19.037
4.961	16.098
4.985	21.404
4.987	19.282
4.988	15.771
4.989	15.527
5.014	19.608
5.015	18.302
5.016	17.812
5.017	17.567
5.037	26.302
5.044	16.670
5.925	21.162
5.978	23.611
5.979	22.632
5.980	20.509
5.981	20.101
5.982	19.530
5.983	18.632
5.984	17.897
6.005	24.754
6.006	23.040
6.007	21.734
6.065	17.244
6.892	19.288
6.893	18.798
6.894	17.819
7.000	22.390
7.001	22.145
7.002	21.166
7.965	26.230
7.996	23.292
8.025	19.618
8.962	23.540
10.010	25.257
11.998	27.305
13.019	27.961
18.984	31.736
20.035	30.025];
data.tL(:,1) = (0.9+data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 1.17; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Crai2007';
  
% length-weight
data.LW = [ ... % std length (cm), weight (g)
14.289	93.521
14.705	115.041
14.747	102.841
15.038	118.210
15.330	109.152
15.496	136.691
15.580	115.346
15.829	127.647
15.869	176.516
15.912	155.156
15.993	210.147
16.246	130.845
16.286	161.394
16.412	137.010
16.578	158.442
16.787	146.301
16.913	109.704
16.994	176.908
17.037	155.549
17.162	146.432
17.285	201.437
17.493	213.723
17.536	174.044
17.578	161.845
17.702	198.529
17.911	189.442
17.952	207.777
18.036	162.005
18.077	192.553
18.116	284.170
18.285	204.839
18.286	180.412
18.451	229.325
18.494	192.699
18.825	226.402
18.826	214.189
18.827	180.601
19.118	202.077
19.367	247.965
19.368	223.538
19.491	269.382
19.535	202.222
19.658	248.067
19.739	324.431
19.868	220.659
19.908	263.421
19.947	339.771
20.159	245.188
20.199	269.630
20.324	291.047
20.491	278.892
20.615	306.416
20.824	269.848
20.907	297.357
21.030	349.309
21.239	324.954
21.365	297.517
21.614	337.299
21.948	316.041
22.114	325.260
22.280	346.692
22.489	316.230
22.529	386.473
22.613	355.968
22.862	383.536
22.902	429.352
23.020	649.240
23.068	450.783
23.113	365.303
23.195	386.706
23.236	414.201
23.527	420.409
23.734	463.230
23.860	444.953
24.112	387.026
24.439	558.132
24.525	481.826
25.315	549.277
25.359	485.171
26.145	628.956
26.191	519.049
27.279	363.703
27.313	586.616
27.851	696.727
28.268	687.713
30.052	917.343
31.549	994.201];
data.LW(:,2) = data.LW(:,2) * 1.17; % convert SL to TL
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Crai2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Discussion points
% D1 = '';
% metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.01148*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 1.17 * SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6FTPS'; % Cat of Life
metaData.links.id_ITIS = '551082'; % ITIS
metaData.links.id_EoL = '46579634'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_ongus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_ongus'; % ADW
metaData.links.id_Taxo = '105878'; % Taxonomicon
metaData.links.id_WoRMS = '218217'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-ongus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_ongus}}';
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
bibkey = 'Crai2007'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-006-0377-8}, ' ...
'author = {Matthew T. Craig}, ' ... 
'year = {2007}, ' ...
'title = {Preliminary observations on the life history of the white-streaked grouper, \emph{Epinephelus ongus}, from {O}kinawa, {J}apan}, ' ...
'journal = {Ichthyol. Res.}, ' ...
'volume = {54}, ' ...
'pages = {81–84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OhtaEbis2015'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-015-0382-8}, ' ...
'author = {Itaru Ohta and Akihiko Ebisawa}, ' ... 
'year = {2015}, ' ...
'title = {Reproductive biology and spawning aggregation fishing of the white-streaked grouper, \emph{Epinephelus ongus}, associated with seasonal and lunar cycles}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {98(6)}, ' ...
'pages = {1555-1570}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus-ongus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

