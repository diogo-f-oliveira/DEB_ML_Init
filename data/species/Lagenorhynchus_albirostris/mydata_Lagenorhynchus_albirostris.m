function [data, auxData, metaData, txtData, weights] = mydata_Lagenorhynchus_albirostris
%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Lagenorhynchus_albirostris'; 
metaData.species_en = 'White-beaked dolphin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.9); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2018 07 16];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data
data.tg = 12.9*30.5;    units.tg = 'd';  label.tg = 'gestation time';              bibkey.tg = 'Wiki';    
  temp.tg = C2K(36.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Value for L. obscurus';
data.tx = 365; units.tx = 'd';  label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';    
  temp.tx = C2K(36.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'guess based on Delphinus';
data.tp = 7 * 365; units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'GalaJans2013';
  temp.tp = C2K(36.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 8 * 365; units.tpm = 'd'; label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'GalaJans2013';
  temp.tpm = C2K(36.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 40 * 365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'GalaJans2013';   
  temp.am = C2K(36.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 120;        units.Lb = 'cm'; label.Lb = 'total length at birth';                bibkey.Lb = 'GalaJans2013';
data.Lp = 234;       units.Lp = 'cm'; label.Lp = 'total length at puberty for female';    bibkey.Lp = 'GalaJans2013';
data.Lpm = 244;       units.Lpm = 'cm'; label.Lpm = 'total length at puberty for male';   bibkey.Lpm = 'GalaJans2013';
data.Li = 250;       units.Li = 'cm'; label.Li = 'ultimate total length for female';      bibkey.Li = 'GalaJans2013';
data.Lim = 267;       units.Lim = 'cm'; label.Lim = 'ultimate total length for male';     bibkey.Lim = 'GalaJans2013';

data.Wwb = 40e3;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Wiki';
data.Wwi = 306e3;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight for females';        bibkey.Wwi = 'EoL';
data.Wwim = 354e3;   units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';        bibkey.Wwim = 'EoL';

data.Ri = 1/365;    units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(36.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
1.241	182.111
1.314	169.571
1.387	190.259
2.263	214.070
2.263	217.205
2.263	229.744
2.336	209.680
2.409	178.958
3.285	244.148
3.358	210.291
3.358	218.442
4.307	229.712
4.380	215.291
5.255	215.904
5.255	225.935
5.255	230.324
5.328	234.712
6.277	230.308
6.423	239.710
6.423	254.130
7.299	240.323
7.299	237.189
7.372	210.228
7.445	250.352
8.321	230.276
8.321	232.157
8.321	237.799
10.292	252.816
11.460	254.678
12.336	257.172
12.482	244.631
14.307	250.245
15.328	193.176
15.401	237.689
16.204	253.977
17.299	250.198
17.299	243.928
17.372	279.037
18.029	243.917
20.292	245.135
20.365	250.777
21.241	241.359
22.263	263.913
22.263	268.302
22.336	255.135
23.285	241.327
24.234	247.581
24.307	253.223
27.372	245.024
28.394	252.532
29.270	246.249
30.438	243.722
30.438	249.365
31.387	249.350
32.409	249.961
33.285	241.797
39.489	259.881];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(36.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GalaJans2013';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
1.447	175.193
2.459	204.644
3.472	212.152
3.617	222.181
4.412	210.256
4.557	222.166
4.557	225.301
4.557	232.825
5.425	219.645
5.425	226.541
5.425	229.049
5.570	234.690
6.510	209.597
6.510	215.866
6.510	222.136
7.378	223.376
7.523	234.659
7.523	245.944
8.608	274.140
8.680	244.672
9.403	269.739
9.548	257.198
10.416	227.717
10.416	253.422
10.416	265.962
11.573	249.016
11.646	267.196
12.441	278.469
14.250	267.155
14.322	272.797
14.467	248.970
14.467	279.064
15.407	269.018
16.420	270.256
18.445	270.225
21.410	248.861
21.627	251.366
26.329	274.490
26.329	282.013
27.414	288.266
28.354	290.132
30.380	268.784
32.405	269.379];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(36.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GalaJans2013';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M; 

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
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Data from North Sea population';
metaData.bibkey.F1 = 'GalaJans2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RWS7'; % Cat of Life
metaData.links.id_ITIS = '180442'; % ITIS
metaData.links.id_EoL = '46559265'; % Ency of Life
metaData.links.id_Wiki = 'Lagenorhynchus_albirostris'; % Wikipedia
metaData.links.id_ADW = 'Lagenorhynchus_albirostris'; % ADW
metaData.links.id_Taxo = '68724'; % Taxonomicon
metaData.links.id_WoRMS = '137101'; % WoRMS
metaData.links.id_MSW3 = '14300061'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagenorhynchus_albirostris}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GalaJans2013'; type = 'Article'; bib = [ ... 
'author = {A. Galatius and O. E. Jansen and C. C. Kinze}, ' ... 
'year = {2013}, ' ...
'title = {Parameters of growth and reproduction of white-beaked dolphins (\emph{Lagenorhynchus albirostris}) from the {N}orth {S}ea}, ' ...
'journal = {MARINE MAMMAL SCIENCE}, ' ...
'doi = {10.1111/j.1748-7692.2012.00568.x}, ' ...
'volume = {29}, ' ...
'pages = {348-355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/342089/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

