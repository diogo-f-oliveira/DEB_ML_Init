function [data, auxData, metaData, txtData, weights] = mydata_Rhinolophus_marshalli

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Rhinolophidae';
metaData.species    = 'Rhinolophus_marshalli'; 
metaData.species_en = 'Marshall''s horseshoe bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 27]; 

%% set data
% zero-variate data

data.tg = 80;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'guess';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';  
data.tx = 31;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'JinBo2012';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '37-43 d';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'guess';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 2.5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';  bibkey.Wwb = 'JinBo2012';
data.Wwi = 7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'JinBo2012';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'guess';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
0.971	2.906
1.060	2.995
1.061	2.825
1.062	2.777
1.063	2.532
1.064	2.470
1.104	2.613
1.148	2.641
1.192	2.695
4.062	3.500
4.063	3.405
4.064	2.907
4.065	2.832
4.106	3.296
4.107	3.207
4.108	3.112
4.109	2.996
4.150	3.050
4.238	3.166
6.976	3.338
7.020	4.005
7.021	3.903
7.022	3.787
7.023	3.610
7.064	3.699
7.065	3.651
7.066	3.583
7.067	3.542
7.068	3.501
7.069	3.433
7.070	3.290
10.022	4.524
10.066	4.340
10.067	4.251
10.068	4.197
10.069	4.142
10.070	4.115
10.071	3.945
10.072	3.829
10.155	4.054
10.198	4.619
10.199	4.442
12.980	5.002
12.981	4.586
13.024	4.900
13.025	4.777
13.026	4.729
13.027	4.688
13.028	4.661
13.029	4.634
13.030	4.525
13.068	4.375
13.069	4.443
15.938	5.302
16.071	5.180
16.072	5.112
16.073	5.064
16.074	4.792
16.075	4.737
16.115	5.016
16.116	4.935
16.117	4.873
19.073	5.596
19.074	5.487
19.075	5.460
19.076	5.385
19.077	5.317
19.078	5.242
19.079	5.188
19.080	5.106
19.081	5.045
21.987	5.209
21.988	5.795
22.031	5.352
22.032	5.434
22.033	5.488
22.075	5.298
22.076	5.536
22.077	5.584
22.078	5.618
22.079	5.645
22.080	5.720
24.945	5.728
24.989	5.810
25.033	6.028
25.034	5.912
25.077	5.660
25.078	5.612
25.079	5.524
25.080	5.449
25.081	5.374
25.082	5.285
27.947	5.702
27.948	6.158
27.949	6.226
27.991	5.490
27.992	5.777
27.993	5.817
27.994	5.892
27.995	5.947
28.032	5.565
28.033	5.620
28.034	6.029
28.035	6.090
31.036	6.425
31.037	6.329
31.038	6.261
31.039	6.207
31.040	6.139
31.041	5.955
31.042	5.832
31.043	5.696
31.044	5.539
31.082	6.071
33.951	6.439
33.995	5.881
33.996	6.024
33.997	6.181
33.998	6.249
33.999	6.330
34.000	6.507
34.084	5.670
36.998	6.502
36.999	6.256
37.042	6.086
37.086	6.379
37.087	6.161
37.174	5.950
39.868	6.455
40.000	6.033
40.001	6.564
40.044	6.332
40.088	6.230
40.089	6.653];
units.tWw   = {'d', 'cm'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(34.8);  units.temp.tWw = 'C'; label.temp.tWw = 'temperature';
bibkey.tWw = 'JinBo2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4S98J'; % Cat of Life
metaData.links.id_ITIS = '631444'; % ITIS
metaData.links.id_EoL = '308545'; % Ency of Life
metaData.links.id_Wiki = 'Rhinolophus_marshalli'; % Wikipedia
metaData.links.id_ADW = 'Rhinolophus_marshalli'; % ADW
metaData.links.id_Taxo = '64145'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800597'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinolophus_marshalli}}';
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
bibkey = 'JinBo2012'; type = 'Article'; bib = [ ...
'doi = {10.3161/150811012x654312}, ' ...
'author = {Jin, L. and Bo, L. snd Sun, K. and Liu, Y. and Ho, J. P. and Feng, J.}, ' ... 
'year = {2012}, ' ...
'title =  {Postnatal Growth and Age Estimation in {M}arshall''s Horseshoe Bat, \emph{Rhinolophus marshalli}}, ' ...
'journal = {Acta Chiropterologica}, ' ...
'volume = {14(1)}, ' ...
'pages = {105–110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

