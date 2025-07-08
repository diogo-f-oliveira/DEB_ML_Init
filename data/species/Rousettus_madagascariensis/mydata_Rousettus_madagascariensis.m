function [data, auxData, metaData, txtData, weights] = mydata_Rousettus_madagascariensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Pteropodidae';
metaData.species    = 'Rousettus_madagascariensis'; 
metaData.species_en = 'Madagascan fruit bat'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiHs','xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 06 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 27]; 

%% set data
% zero-variate data

data.tg = 127;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'EoL';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature'; 
data.tx = 4.5*31;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.9; units.Lb = 'cm';   label.Lb = 'forewarm length at birth';     bibkey.Lb = 'AndrAndr2021';
data.Li = 6.5;  units.Li = 'cm';   label.Li = 'ultimate forewarm length'; bibkey.Li = 'AndrAndr2021';

data.Wwb = 8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
  comment.Wwb = '15 percent of adult: 0.13*62.1';
data.Wwi = 62.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'EoL';

data.Ri  = 1.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1.2 pup per litter; 1 litter per yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), forearm length (cm)
2.681	3.156
6.226	2.983
11.001	2.995
11.763	3.828
12.241	3.231
12.872	3.405
13.583	3.977
15.308	3.654
23.237	4.524
24.504	4.897
24.990	4.338
25.542	4.114
26.752	4.201
29.307	5.046
30.617	2.636
31.401	3.581
31.458	3.866
31.862	2.897
32.545	3.332
32.760	4.413
33.120	3.220
35.030	3.829
44.813	5.022
47.155	4.799
55.081	5.657
55.604	5.284
56.597	4.278
56.755	5.073
71.663	5.036
73.745	3.509
74.457	7.086
75.955	5.621
76.803	6.888
77.197	5.869
78.103	7.422
79.765	3.782
81.307	5.534
123.769	6.058
127.371	6.170
206.859	6.884
276.684	7.000
280.680	6.093
309.970	6.381];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'forearm length', 'female'};  
temp.tL_f    = C2K(34.8);  units.temp.tL_f = 'C'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AndrAndr2021';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), forearm length (cm)
9.845	3.182
11.090	3.443
11.799	7.008
12.340	3.728
25.361	3.207
25.579	4.301
29.148	4.251
29.654	3.792
30.775	3.431
32.760	4.413
32.805	4.637
32.857	4.897
32.891	5.071
33.531	2.289
41.224	4.972
44.875	5.333
45.430	5.122
46.687	5.445
46.714	5.581
47.148	4.762
71.212	5.769
74.009	4.838
74.076	5.173
74.135	5.471
74.956	3.596
74.957	3.596
76.653	6.130
77.987	6.838
78.155	7.683
80.762	5.795
90.587	7.199
92.850	6.578
138.856	3.923
166.133	6.086
205.535	6.225
205.607	6.585
235.974	6.289
276.617	6.664
278.350	6.379
283.690	6.230
283.756	6.565
308.814	6.567
311.814	6.654
339.302	6.879];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'forearm length', 'male'};  
temp.tL_m    = C2K(34.8);  units.temp.tL_m = 'C'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AndrAndr2021';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lb = 10 * weights.Lb;
weights.Li = 10 * weights.Li;

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4THCX'; % Cat of Life
metaData.links.id_ITIS = '631672'; % ITIS
metaData.links.id_EoL = '323427'; % Ency of Life
metaData.links.id_Wiki = 'Rousettus_madagascariensis'; % Wikipedia
metaData.links.id_ADW = 'Rousettus_madagascariensis'; % ADW
metaData.links.id_Taxo = '169758'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800418'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rousettus_madagascariensis}}';
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
bibkey = 'AndrAndr2021'; type = 'Article'; bib = [ ...
'doi = {10.1101/2021.10.28.466299}, ' ...
'author = {Angelo Andrianiaina and Santino Andry and Anecia Gentles and Sarah Guth and Jean-Michel H\''{e}raud and Hafaliana Christian Ranaivoson and Ny Anjara Fifi Ravelomanantsoa and Timothy Treuer and Cara E. Brook}, ' ... 
'year = {2021}, ' ...
'title =  {Reproduction, seasonal morphology, and juvenile growth in three {M}alagasy fruit bats}, ' ...
'journal = {BioRxiv}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/323427}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

