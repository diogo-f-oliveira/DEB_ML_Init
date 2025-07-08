function [data, auxData, metaData, txtData, weights] = mydata_Eurycercus_lamellatus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Eurycercidae';
metaData.species    = 'Eurycercus_lamellatus'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TH','TN','TA','TPi'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'T-ap'; 'T-am'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 02]; 

%% set data
% zero-variate data

data.ab = 5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 

data.Lb  = 0.074; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Smir1962';
data.Lp  = 0.18; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Smir1962';
data.Li  = 0.40;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'nina';
data.Lim  = 0.14;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'nina';

data.Ri = 10/9;    units.Ri = '#/d';    label.Ri = 'max reprod rate';  bibkey.Ri = 'Bott1975';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 10 egg per brood, 9 d per moult 11.75 d at 10 C, 5.97 d at 15 C)';

% uni-variate data
% time-length
data.tL = [ ... % time since july 10 (d), length (mm)
13.892	0.063
28.196	0.099
42.293	0.147
54.423	0.167
66.980	0.180
90.353	0.189];
data.tL(:,1) = data.tL(:,1) - 14; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(12);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KlemAase2020'; 
comment.tL = 'data from Takvatn, a 15 km 2 north Norwegian';
%
data.tL1 = [ ... time since birth (d), length (mm)
0.755	0.762
1.321	0.787
1.698	0.745
2.736	0.999
2.737	1.047
3.019	1.091
3.962	1.021
3.963	0.893
4.151	1.046
4.623	1.169
4.906	1.292
5.189	1.189
5.755	1.267
5.943	1.292
6.132	1.197
6.604	1.652
6.698	1.613
6.887	1.498
7.642	1.744
7.643	1.699
7.736	1.629
7.830	1.671
8.019	1.646
8.962	1.919
8.963	1.799
9.057	1.941
9.058	1.989
9.811	1.768
10.000	1.794
10.094	1.936
10.188	1.916
10.189	1.964
10.283	2.075
10.284	2.098
10.848	1.941
10.849	1.922
11.038	2.072
11.132	2.092
11.225	1.966
11.226	1.766
11.415	1.791
11.887	1.897
11.981	1.964
12.075	2.092
12.076	1.919
12.170	2.078
12.171	1.950
12.358	2.011
12.736	2.148
12.925	1.969
13.018	1.952
13.019	1.991
13.113	2.036
13.301	2.095
13.302	2.019
13.868	2.103
13.962	2.011
14.717	2.117
15.000	2.175
15.093	2.053
15.094	2.198
15.188	2.069
15.189	2.094
15.849	2.000
16.226	2.248
16.792	2.223
17.075	2.245
17.170	2.248
17.171	2.097
17.264	2.069
17.830	2.220
17.925	2.239
17.926	2.270
18.679	2.150
18.868	2.248
18.962	2.091
19.811	1.997
20.000	2.248
20.943	2.002
21.792	1.994
21.981	2.253
22.830	2.247
23.679	2.203
23.962	2.245
24.906	2.250
25.094	1.999
25.849	2.247
27.925	2.247
28.868	2.094
30.566	2.244
31.792	2.255
33.019	2.199
33.868	2.291
34.906	2.238
36.038	2.252
38.019	2.244];
data.tL1(:,2) = data.tL1(:,2)/10; % convert mm to cm
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'length'};  
temp.tL1    = C2K(20);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Smir1962'; comment.tL1 = 'fed on ditritus';
%
data.tL2 = [ ... time since birth (d), length (mm)
1.415	0.704
11.981	1.294
12.170	1.169
12.264	1.205
12.547	1.414
12.925	1.540
12.925	1.213
13.019	1.302
13.113	1.478
13.396	1.180
13.491	1.314
13.679	1.210
13.774	1.478
13.868	1.542
14.245	1.314
14.434	1.470
14.906	1.604
15.000	1.308
15.189	1.478
15.660	1.313
15.755	1.587
16.321	1.478
16.792	1.341
17.264	1.536
17.264	1.313
17.358	1.598
17.358	1.642
17.358	1.751
17.453	1.492
18.491	1.642
18.868	1.341
18.962	1.645
19.245	1.550
19.340	1.338
20.094	1.347
20.472	1.695
22.264	1.650
22.264	1.698
24.245	1.706];
data.tL2(:,2) = data.tL2(:,2)/10; % convert mm to cm
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since birth', 'length'};  
temp.tL2    = C2K(20);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'Smir1962';  comment.tL1 = 'fed minimally on ditritus';

% temperature-time since birth at puberty
data.Ttp = [ ... % temperature (C), time since birth at puberty (d)
    5 0.62*162
   10 0.50*105
   15 0.44*63
   20 0.45*42];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'Bott1975';     

% temperature-time since birth at puberty
data.Tam = [ ... % temperature (C), life span (d)
    5 162
   10 105
   15  63
   20  42];
units.Tam   = {'C', 'd'};  label.Tam = {'temperature', 'mean life span'};  
bibkey.Tam = 'Bott1975';  

% length-weight
data.LWw = [ ... % length (mm), weight (mg)
0.746	0.042
1.159	0.077
1.595	0.236
2.007	0.599
2.201	0.941];
data.LWw(:,1) = data.LWw(:,1)/ 10; % convert mm to cm
data.LWw(:,2) = data.LWw(:,2)/ 1e3; % convert mg to g
units.LWw   = {'cm', 'g'};  label.LWw = {'length', 'weight'};  
bibkey.LWw = 'Smir1962';     

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL; 
weights.tL1 = 3 * weights.tL1; 
weights.Li = 5 * weights.Li; 
weights.ab = 0 * weights.ab; 
weights.Lp = 0 * weights.Lp; 
weights.Ttp = 3 * weights.Ttp; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL2'}; subtitle1 = {'Data forhigh, low food'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6HF72'; % Cat of Life
metaData.links.id_ITIS = '84023'; % ITIS
metaData.links.id_EoL = '84017'; % Ency of Life
metaData.links.id_Wiki = 'Eurycercus'; % Wikipedia
metaData.links.id_ADW = 'Eurycercus_lamellatus'; % ADW
metaData.links.id_Taxo = '156237'; % Taxonomicon
metaData.links.id_WoRMS = '412813'; % WoRMS

%% References
bibkey = 'nina'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.nina.no/archive/nina/pppbasepdf/NINA-Infomateriell/2007/krepsdyrfaktaark/walseng_Acroperus%%20harpae.pdf}}';
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
bibkey = 'KlemAase2020'; type = 'Article'; bib = [ ... 
'doi = {10.1093/jcbiol/ruaa048}, ' ...
'author = {Anders Klemetsen and Berit M. Aase and Per-Arne Amundsen}, ' ... 
'year = {2020}, ' ...
'title = {Diversity, abundance, and life histories of littoral chydorids ({C}ladocera: {C}hydoridae) in a subarctic {E}uropean lake}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {40(5)}, ' ...
'pages = {534–543}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bott1975'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00369097}, ' ...
'author = {Howard H. Bottrell}, ' ... 
'year = {1975}, ' ...
'title = {Generation time, length of life, instar duration and frequency of moulting, and their relationship to temperature in eight species of cladocera from the {R}iver {T}hames, {R}eading}, ' ...
'journal = {Oecologia (Berl.)}, ' ...
'volume = {19(2)}, ' ...
'pages = {129–140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Smir1962'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf00046194}, ' ...
'author = {N. N. Smirnov}, ' ... 
'year = {1962}, ' ...
'title = {\emph{Eurycercus lamellatus} ({O}. {F}. {M}\"{u}ller) ({C}hydoridae, {C}ladocera): {F}ield observations and nutrition}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {20(3)}, ' ...
'pages = {280–280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
