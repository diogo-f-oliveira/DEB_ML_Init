function [data, auxData, metaData, txtData, weights] = mydata_Branchinella_kugenumaensis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Thamnocephalidae';
metaData.species    = 'Branchinella_kugenumaensis'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L_f'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 25]; 

%% set data
% zero-variate data

data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'HuanChou2010';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL_L1 data and Lp';
data.am = 50;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'HuanChou2010';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.04; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
  comment.Lb = 'based on Phallocryptus_spinosus';
data.Lp  = 1.00;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'HuanChou2010';
data.Li  = 3.00; units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'HuanChou2010';
  
data.Wdi  = 0.0459;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(3/1)^3';

data.sM  = 5;   units.sM  = '-'; label.sM  = 'acceleration factor';      bibkey.sM  = 'guess';   
  comment.sM = 'pseudo-data based on mean value for fairy shrimps';

% uni-variate data
% time-length
data.tL_L1 = [ ... % time since birth (d), length (cm)
3.117	0.358
3.871	0.499
5.005	0.608
6.041	0.824
6.887	1.024
7.826	1.324
9.050	1.590
9.996	1.624
10.754	1.657
11.795	1.698
13.027	1.698
13.880	1.706
14.828	1.715
15.965	1.706
17.008	1.714
17.861	1.698
18.994	1.847
20.030	2.047
21.068	2.214
22.104	2.430
23.051	2.430
24.094	2.438
25.039	2.538
25.989	2.471
26.842	2.463
28.169	2.454
29.016	2.654
29.776	2.613
31.007	2.646
32.142	2.704
32.996	2.679
33.660	2.662
35.082	2.678
35.932	2.762
36.976	2.712
37.923	2.736
38.966	2.720
39.915	2.703
40.958	2.686
41.716	2.694
42.854	2.686
43.800	2.744
44.938	2.727
45.980	2.744
47.117	2.768
49.961	2.751];
units.tL_L1 = {'d', 'cm'}; label.tL_L1 = {'time since birth', 'length'};  
temp.tL_L1 = C2K(25); units.temp.tL_L1 = 'K'; label.temp.tL_L1 = 'temperature'; 
bibkey.tL_L1 = 'HuanChou2010'; comment.tL_L2 = 'long inundation';
%
data.tL_L2 = [ ... % time since inundation (d), length (cm)
2.832	0.366
3.869	0.566
4.807	0.858
5.937	1.108
7.066	1.357
7.817	1.616
8.857	1.682
9.992	1.774
10.938	1.807
12.266	1.798
13.118	1.832
14.162	1.790
15.109	1.815
15.962	1.814
17.006	1.764
17.856	1.856
18.994	1.864
19.751	1.889
20.888	1.914
21.833	1.989
23.064	2.022
24.105	2.080
25.148	2.080
25.906	2.096
26.949	2.080
28.085	2.104
28.844	2.096];
units.tL_L2 = {'d', 'cm'}; label.tL_L2 = {'time since birth', 'length'};  
temp.tL_L2 = C2K(25); units.temp.tL_L2 = 'K'; label.temp.tL_L2 = 'temperature'; 
bibkey.tL_L2 = 'HuanChou2010'; comment.tL_L2 = 'long inundation';
%
data.tL_S = [ ... % time since birth (d), length (cm)
 2	0.283 0.249 0.216 0.216 0.191
 3	0.424 0.349 0.332 0.341 0.266
 4	0.681 0.540 0.449 0.490 0.416
 5	0.939 0.756 0.557 0.690 0.590
 6	1.238 1.055 0.781 0.906 0.690
 7	1.521 1.288 1.047 1.055 0.789
 8	1.695 1.554 1.230 1.022 0.889
 9	1.911 1.612 1.238 1.114 1.022
10	2.136 1.712 1.238 1.205 1.205
11	2.310 1.828 1.255 1.247 1.205
12	2.368 1.911 1.512 1.330 1.247
13	2.368 1.986 1.521 1.305 1.247
14	2.393 1.953 1.512 1.280 1.213
15	2.410 1.870 1.504 1.213 NaN
16  NaN   NaN   1.471 NaN   NaN];
units.tL_S = {'d', 'cm'}; label.tL_S = {'time since birth', 'length'};  
temp.tL_S = C2K(25); units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature'; 
treat.tL_S = {1, {'1','2','3','4','5'}}; label.treat.tL_S = 'Short inundation events';  
bibkey.tL_S = 'HuanChou2010'; 

% length-fecundity
data.LN = [ ... length (cm), fecundity (#)
1.051	12.526
1.110	14.737
1.154	12.526
1.154	8.105
1.159	15.474
1.198	19.158
1.198	16.211
1.208	11.789
1.262	16.947
1.297	25.053
1.311	16.947
1.316	22.105
1.361	25.789
1.400	28.737
1.405	22.842
1.410	47.895
1.410	17.684
1.454	24.316
1.454	30.211
1.454	36.105
1.498	26.526
1.503	30.211
1.552	32.421
1.557	42.737
1.557	39.053
1.597	48.632
1.602	33.895
1.602	37.579
1.602	44.947
1.607	29.474
1.646	50.105
1.646	36.105
1.661	30.947
1.700	59.684
1.725	54.526
1.754	55.263
1.798	53.789
1.808	66.316
1.813	58.947
1.813	70.000
1.946	67.789
2.015	61.158
2.054	72.211
2.207	131.158
2.251	111.263
2.300	118.632
2.305	162.842
2.315	109.789
2.339	123.053
2.344	114.211
2.354	101.684
2.398	151.789
2.403	142.211
2.403	127.474
2.408	134.842
2.457	153.263
2.467	155.474
2.467	126.000
2.497	132.632
2.502	151.053
2.502	135.579
2.507	164.316
2.507	156.947
2.551	144.421
2.595	190.105
2.600	156.211
2.605	176.105
2.654	191.579
2.659	180.526
2.698	199.684
2.703	195.263
2.708	211.474
2.718	180.526
2.846	242.421
2.851	294.737
2.851	290.316
2.856	253.474
2.861	235.053
2.900	252.000
2.905	231.368
2.910	294.000
2.998	311.684];
units.LN = {'cm', '#'}; label.LN = {'length','fecundity'};  
temp.LN = C2K(25); units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = 'HuanChou2010'; 

%% set weights for all real data
weights = setweights(data, []);
weights.sM = 0.2 * weights.sM; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_L1','tL_L2'}; subtitle1 = {'Data for 2 long inundation events'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'temperatures are guessed';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7RPBV'; % Cat of Life
metaData.links.id_ITIS = '624088'; % ITIS
metaData.links.id_EoL = '327147'; % Ency of Life
metaData.links.id_Wiki = 'Branchinella'; % Wikipedia
metaData.links.id_ADW = 'Branchinella_kugenumaensis'; % ADW
metaData.links.id_Taxo = '5287582'; % Taxonomicon
metaData.links.id_WoRMS = '755165'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HuanChou2010'; type = 'Article'; bib = [ ... 
'doi = {10.1651/09-3235.1}, ' ...
'author = {Shiang-Lin Huang and Chun-Chieh Wang and Wan-Ping Huang and Lien-Siang Chou}, ' ... 
'year = {2010}, ' ...
'title = {Indeterminate Growth of the Fairy Shrimp, \emph{Branchinella (Branchinellites) kugenumaensis} ({B}ranchiopoda: {A}nostraca) in an Unpredictable Ephemeral Pool}, ' ...
'journal = {Journal of crustacean biology}, ' ...
'volume = {30(3)}, ' ...
'pages = {366–372}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
