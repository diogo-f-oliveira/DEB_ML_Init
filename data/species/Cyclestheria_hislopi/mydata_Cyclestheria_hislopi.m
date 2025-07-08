function [data, auxData, metaData, txtData, weights] = mydata_Cyclestheria_hislopi
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Cyclestherida'; 
metaData.family     = 'Cyclestheriidae';
metaData.species    = 'Cyclestheria_hislopi'; 
metaData.species_en = 'Brazilian clam shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'Hha'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 07]; 

%% set data
% zero-variate data

data.tp = 15;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'YashBald2011';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '21-26 (mean 22) d for first brood';
data.am = 66;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'YashBald2011';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = '52-77 d';

data.Lb  = 0.1;  units.Lb = 'cm';  label.Lb  = 'carapace length at birth'; bibkey.Lb  = 'YashBald2011';
data.Lp  = 0.207;  units.Lp = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'YashBald2011';
  comment.Lp = '0.27 cm at first brood';
data.Li  = 0.3;  units.Li = 'cm';  label.Li  = 'ultimate carapace length';   bibkey.Li  = 'YashBald2011';

data.Wwi  = 0.0092;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on foto length 0.3 cm, height 0.26 cm, thickness 0.15 cm: pi/4*0.3*0.26*0.15; uncertain because of water in carapace';

data.Ri  = 3.9/28;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'PerePiri2014';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'mostly 3 broods per female: 3.6 eggs at 22 d, 3.9 eggs at 30 d, 3.9 eggs at 58 d';
 
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), carapace length (cm)
0.871	0.099
0.875	0.106
0.879	0.113
1.585	0.102
1.798	0.119
1.896	0.112
1.901	0.122
1.905	0.128
2.319	0.140
2.499	0.101
2.615	0.126
2.709	0.111
2.917	0.120
3.516	0.101
3.521	0.109
3.632	0.126
3.637	0.134
3.642	0.142
4.658	0.141
4.671	0.162
4.757	0.135
4.950	0.119
5.662	0.118
5.775	0.138
5.778	0.143
5.790	0.163
6.373	0.116
6.794	0.141
6.893	0.137
7.413	0.156
7.706	0.136
7.721	0.162
7.935	0.180
8.737	0.160
8.835	0.154
8.853	0.185
9.136	0.146
9.764	0.177
9.769	0.186
10.052	0.148
10.379	0.186
10.883	0.177
10.969	0.150
11.485	0.164
11.698	0.181
11.814	0.205
12.529	0.210
12.614	0.182
12.726	0.199
12.910	0.165
13.723	0.165
13.835	0.182
13.947	0.200
14.558	0.201
14.740	0.165
14.748	0.180
15.808	0.254
15.880	0.202
16.164	0.166
16.825	0.253
16.893	0.196
16.896	0.201
16.899	0.205
17.945	0.255
18.027	0.222
18.034	0.234
18.118	0.202
18.859	0.253
18.951	0.237
19.145	0.220
19.756	0.222
19.876	0.253
19.964	0.229
20.172	0.238
20.894	0.255
20.983	0.234
21.088	0.239
21.090	0.242
21.901	0.238
21.906	0.246
21.911	0.254
21.914	0.261
22.832	0.265
22.924	0.249
23.021	0.240
23.131	0.254
23.748	0.267
23.842	0.254
23.845	0.258
24.868	0.268
24.961	0.254
25.065	0.258
25.777	0.258
25.782	0.266
25.979	0.255
26.798	0.265
27.198	0.254
27.200	0.257
27.706	0.253
27.709	0.258
27.917	0.266
28.930	0.258
29.029	0.254
29.036	0.267
29.743	0.257
29.943	0.251
29.951	0.265
30.866	0.265
30.965	0.261
31.065	0.257
31.882	0.263
31.986	0.268
31.989	0.272
32.184	0.257
32.696	0.265
32.794	0.259
32.904	0.272
33.098	0.256
34.015	0.259
34.121	0.267
34.124	0.271
34.938	0.273
35.031	0.258
35.135	0.262
35.349	0.280
35.955	0.272
36.049	0.259
36.153	0.263
36.164	0.282
36.972	0.273
37.065	0.258
37.069	0.265
37.078	0.281
38.096	0.281
38.189	0.267
38.194	0.276
38.901	0.267
39.014	0.287
39.109	0.275
40.019	0.265
40.031	0.287
40.126	0.275
40.832	0.265
41.041	0.274
41.149	0.286
41.963	0.287
42.053	0.266
42.058	0.274
42.878	0.286
42.972	0.273
43.171	0.265
43.997	0.287
44.190	0.268
44.193	0.274
44.800	0.268
44.906	0.275
45.217	0.286
45.816	0.267
46.126	0.275
46.131	0.284
46.934	0.265
47.047	0.285
47.142	0.273
47.861	0.286
47.951	0.265
48.058	0.275
49.069	0.265
49.177	0.275
49.184	0.287
49.793	0.286
49.990	0.275
50.087	0.266
51.104	0.267
51.210	0.274
51.217	0.286
52.030	0.285
52.222	0.265
52.328	0.273
52.845	0.287
52.934	0.265
53.244	0.275
53.951	0.266
53.963	0.286
54.058	0.274
55.070	0.266
55.075	0.275
55.082	0.286
55.985	0.267
56.193	0.275
56.302	0.286
57.109	0.275
57.115	0.285
58.132	0.286
58.329	0.274
59.047	0.286
59.142	0.274
60.261	0.274
60.267	0.285
60.879	0.287
61.176	0.274
61.996	0.286
62.294	0.272
63.210	0.275
63.318	0.285
64.133	0.287
64.329	0.275
65.353	0.286
65.447	0.274
66.166	0.286
66.261	0.273
67.278	0.275
67.285	0.286
68.092	0.275
68.200	0.286
69.414	0.275
69.420	0.286
70.033	0.290
70.227	0.273
71.457	0.291
72.069	0.294
73.390	0.292
74.305	0.292
75.322	0.292
76.238	0.293
76.853	0.302
78.074	0.302
79.192	0.302
80.210	0.302
81.328	0.302];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'carapace length'};  
temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YashBald2011';
comment.tL = ['lab culture from flooded area beside the Miranda River at Passo do Lontra in the Mato Grosso swamplands; ' ...
   'fed on the chlorophycean Pseudokirchneriella subcapitata at a density of 5e6 cells/mL.'];

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 2 * weights.Li;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 2 * weights.Li;
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'No info on egg size could be found';   
metaData.discussion = struct('D1',D1);

%% Facts
F1 = '';
metaData.bibkey.F1 = ''; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BJMQC'; % Cat of Life
metaData.links.id_ITIS = '83808'; % ITIS
metaData.links.id_EoL = '338855'; % Ency of Life
metaData.links.id_Wiki = 'Cyclestheria'; % Wikipedia
metaData.links.id_ADW = 'Cyclestheria_hislopi'; % ADW
metaData.links.id_Taxo = '96593'; % Taxonomicon
metaData.links.id_WoRMS = '889262'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyclestheria}}';
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
bibkey = 'YashBald2011'; type = 'Article'; bib = [ ... 
'doi = {10.23818/limn.33.18}, ' ...
'author = {Yashima, M. N. and Baldochi, A. and Rocha, O.}, ' ... 
'year = {2011}, ' ...
'title = {Life cycle of \emph{Cyclestheria hislopi} ({B}aird, 1859) ({C}rustacea, {B}ranchiopoda)}, ' ...
'journal = {Braz. J. Biol.}, ' ...
'volume = {71(2)}, ' ...
'pages = {481-486}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

