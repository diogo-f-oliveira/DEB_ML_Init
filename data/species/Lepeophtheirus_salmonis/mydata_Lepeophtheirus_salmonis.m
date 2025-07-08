function [data, auxData, metaData, txtData, weights] = mydata_Lepeophtheirus_salmonis 

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Hexanauplia'; 
metaData.order      = 'Siphonostomatoida'; 
metaData.family     = 'Caligidae';
metaData.species    = 'Lepeophtheirus_salmonis'; 
metaData.species_en = 'Salmon louse'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN', 'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biTvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine', 'Bas Kooijman'};    
metaData.date_subm = [2017 09 26];              
metaData.email    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 09 26]; 

%% set data
% zero-variate data

data.ab_5 = 17.5;    units.ab_5 = 'd';    label.ab_5 = 'age at birth';             bibkey.ab_5 = 'MarInst';   
  temp.ab_5 = C2K(5);  units.temp.ab_5 = 'K'; label.temp.ab_5 = 'temperature';
  comment.ab_5 = 'age when they attach and start feeding - 2 to 14 days depending on temperature, Wiki';
data.ab_15 = 5.5;    units.ab_15 = 'd';    label.ab_15 = 'age at birth';             bibkey.ab_15 = 'MarInst';   
  temp.ab_15 = C2K(15);  units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.tp = 57;    units.tp = 'd';    label.tp = 'time since birth at puberty females'; bibkey.tp = 'Wiki';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '10 days for copepodid, ~10 days chalimus I, ~15 for chalimus 2, ~10 days for pre-adult 1 female and ~12 days for pre-adult 2 female';
data.tp_m = 52;   units.tp_m = 'd';    label.tp_m = 'time since birth at puberty males'; bibkey.tp_m = 'Wiki';
  temp.tp_m = C2K(10);  units.temp.tp_m = 'K'; label.temp.tp_m = 'temperature';
  comment.tp = '~8 days as pre-adult 1 and ~9 days as pre-adult 2';
data.am = 210;    units.am = 'd';    label.am = 'mean life span';                bibkey.am = 'MarInst';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'life span of adult phase under lab conditions, temp is guessed';
  
data.Lb  = 0.07;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'Wiki';  
data.Lp  = 1.8;   units.Lp  = 'cm';  label.Lp  = 'length at puberty females'; bibkey.Lp  = 'MarInst'; 
  comment.Lp = '0.8-1.8 cm';
data.Lp_m  = 0.6;   units.Lp_m  = 'cm';  label.Lp_m  = 'length at puberty males'; bibkey.Lp_m  = 'MarInst'; 
  comment.Lp_m = '0.5-0.6 cm';
data.Li  = 1.8;    units.Li  = 'cm';  label.Li  = 'ultimate total length females';   bibkey.Li  = 'MarInst';
data.Li_m  = 0.6;  units.Li_m  = 'cm';  label.Li_m  = 'ultimate total length males';   bibkey.Li_m  = 'MarInst';

data.Wwp = 0.18;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MarInst';
data.Wwi = 0.18;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on photo: at 1.8 cm length, max width is 0.66 cm, mean width is 0.5 cm, guessed height 0.2 cm: 1.8*0.5*0.2';

data.Ri  = 2*183/11;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MarInst';
comment.Ri = '11 d between pairs of egg string egg strings. Mean egg numbers per string 152 (+16) range from 123 to 183';
temp.Ri = C2K(7.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ...   % cm, total length at f and T
4.974	0.113
5.013	0.068
5.013	0.084
5.013	0.087
5.013	0.090
5.013	0.093
5.013	0.096
5.013	0.100
5.013	0.103
5.013	0.106
6.000	0.097
6.000	0.102
6.000	0.106
6.039	0.109
6.039	0.113
6.039	0.118
6.039	0.120
6.039	0.123
6.039	0.126
6.039	0.136
6.947	0.101
6.947	0.108
6.987	0.112
6.987	0.116
6.987	0.125
6.987	0.128
6.987	0.132
7.026	0.120
7.934	0.118
7.974	0.128
7.974	0.141
8.013	0.125
8.013	0.132
8.013	0.135
8.053	0.103
8.053	0.110
8.053	0.114
9.000	0.119
9.000	0.122
9.000	0.125
9.000	0.129
9.000	0.133
9.000	0.135
9.000	0.138
9.000	0.147
9.039	0.108
9.039	0.113
9.039	0.116
9.039	0.142
9.118	0.162
9.829	0.158
9.868	0.172
9.868	0.179
9.868	0.182
9.868	0.186
9.908	0.197
9.908	0.201
9.908	0.204
9.908	0.207
9.908	0.212
9.947	0.116
9.987	0.122
9.987	0.125
9.987	0.128
9.987	0.132
9.987	0.137
9.987	0.140
9.987	0.144
9.987	0.147
9.987	0.151
9.987	0.155
10.855	0.218
10.895	0.181
10.895	0.184
10.895	0.191
10.895	0.194
10.895	0.198
10.895	0.204
10.895	0.207
10.895	0.209
10.895	0.212
10.934	0.125
10.934	0.149
10.934	0.154
10.974	0.129
10.974	0.140
10.974	0.143
10.974	0.146
11.013	0.121
11.013	0.133
11.013	0.136
11.842	0.220
11.842	0.223
11.882	0.197
11.882	0.199
11.882	0.202
11.882	0.207
11.882	0.210
11.882	0.217
11.882	0.226
11.882	0.231
11.882	0.233
11.882	0.236
11.882	0.239
11.921	0.174
11.921	0.185
11.921	0.188
11.921	0.192
11.921	0.213
12.000	0.124
12.000	0.136
12.000	0.144
12.789	0.195
12.829	0.223
12.829	0.226
12.829	0.229
12.829	0.233
12.829	0.242
12.868	0.202
12.868	0.207
12.868	0.210
12.868	0.215
12.868	0.218
12.947	0.124
12.947	0.133
12.947	0.140
12.947	0.143
12.947	0.148
13.145	0.222
13.184	0.218
13.224	0.214
13.224	0.228
13.816	0.196
13.855	0.185
13.855	0.189
13.855	0.192
13.855	0.234
13.855	0.239
13.855	0.242
13.855	0.248
13.855	0.250
13.895	0.201
13.895	0.205
13.895	0.209
13.895	0.214
13.895	0.217
13.895	0.221
13.895	0.224
13.895	0.228
13.895	0.231
13.895	0.255
13.934	0.124
14.013	0.131
14.092	0.152
14.092	0.212
14.092	0.216
14.092	0.219
14.092	0.223
14.132	0.226
14.132	0.231
14.132	0.249
14.171	0.234
14.171	0.236
14.171	0.239
14.171	0.241
14.171	0.298
14.882	0.230
14.921	0.215
14.921	0.226
14.921	0.258
14.921	0.262
14.961	0.223
15.000	0.201
15.000	0.237
15.000	0.241
15.000	0.244
15.000	0.247
15.000	0.250
15.000	0.254
15.039	0.270
15.158	0.272
15.789	0.275
15.789	0.282
15.789	0.287
15.829	0.232
15.829	0.236
15.829	0.241
15.829	0.244
15.829	0.247
15.829	0.250
15.829	0.254
15.829	0.259
15.829	0.266
15.829	0.270
15.868	0.214
15.947	0.195
15.947	0.197
15.947	0.199
15.947	0.220
15.947	0.223
15.947	0.228
16.026	0.333
16.066	0.234
16.066	0.257
16.066	0.291
16.066	0.294
16.066	0.299
16.066	0.302
16.066	0.305
16.066	0.325
16.066	0.338
16.105	0.239
16.105	0.242
16.105	0.245
16.105	0.249
16.105	0.261
16.105	0.265
16.105	0.267
16.105	0.277
16.105	0.285
16.105	0.308
16.105	0.310
16.105	0.313
16.105	0.316
16.105	0.321
16.105	0.329
16.105	0.343
16.105	0.347
16.145	0.229
16.145	0.252
16.145	0.270
16.816	0.290
16.816	0.296
16.855	0.232
16.855	0.236
16.855	0.240
16.895	0.226
16.895	0.247
16.895	0.250
16.895	0.253
16.895	0.258
16.895	0.261
16.895	0.263
16.895	0.269
16.895	0.275
17.053	0.289
17.053	0.323
17.053	0.326
17.053	0.364
17.053	0.368
17.053	0.370
17.053	0.372
17.053	0.375
17.053	0.378
17.053	0.387
17.092	0.227
17.092	0.274
17.092	0.277
17.092	0.280
17.092	0.283
17.092	0.286
17.092	0.295
17.092	0.309
17.092	0.313
17.092	0.329
17.092	0.333
17.092	0.336
17.092	0.338
17.092	0.341
17.092	0.343
17.092	0.344
17.092	0.348
17.092	0.355
17.132	0.260
17.132	0.263
17.132	0.266
17.132	0.270
17.132	0.352
17.171	0.231
17.171	0.252
17.171	0.255
17.211	0.240
18.079	0.324
18.079	0.329
18.079	0.333
18.079	0.348
18.079	0.351
18.079	0.368
18.079	0.371
18.079	0.375
18.079	0.377
18.079	0.380
18.118	0.365
18.118	0.387
18.158	0.342
18.158	0.345
18.158	0.355
18.158	0.359
18.158	0.362
18.158	0.382
19.066	0.354
19.105	0.309
19.105	0.334
19.105	0.336
19.105	0.341
19.105	0.348
19.105	0.357
19.105	0.359
19.105	0.360
19.105	0.363
19.105	0.365
19.145	0.379
19.145	0.387];
units.tL   = {'d', 'cm'};  label.tL = {'time since infection', 'total length'};  
temp.tL    = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HamrEich2013';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'six post-nauplius instars (= copepodid stages), of which 2 are chalimus stages, with frontal filament that do not allow them to roam over the host';
metaData.bibkey.F1 = 'HamrEich2013'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '7ZH75'; % Cat of Life
metaData.links.id_ITIS = '89113'; % ITIS
metaData.links.id_EoL = '1021240'; % Ency of Life
metaData.links.id_Wiki = 'Lepeophtheirus_salmonis'; % Wikipedia
metaData.links.id_ADW = 'Lepeophtheirus_salmonis'; % ADW
metaData.links.id_Taxo = '435802'; % Taxonomicon
metaData.links.id_WoRMS = '762378'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lepeophtheirus_salmonis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarInst'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marine.ie/Home/site-area/areas-activity/aquaculture/sea-lice/life-cycle-salmon-louse}}';
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
bibkey = 'HamrEich2013'; type = 'Article'; bib = [ ... 
'author = {L. A. Hamre and C. Eichner and C. M. A. Caipang and S. T. Dalvin and J. E. Bron and F. Nilsen and G. Boxshall and R. Skern-Mauritzen}, ' ... 
'year = {2013}, ' ...
'title = {The Salmon Louse \emph{Lepeophtheirus salmonis} ({C}opepoda: {C}aligidae) Life Cycle Has Only Two Chalimus Stages}, ' ...
'journal = {PLoS ONE}, ' ...
'doi = {10.1371/journal.pone.0073539}, ' ...
'volume = {8}, ' ...
'number = {9}, '...
'pages = {e73539}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeucNord2000'; type = 'Article'; bib = [ ... 
'author = {Heuch, P. A. and Nordhagen, J. R. and Schram, T. A.}, ' ... 
'year = {2000}, ' ...
'title = {Egg production  in the salmon louse \emph{Lepeophtheirus salmonis} ({K}royer) in relation to origin and water temperature}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {31}, ' ...
'pages = {805--814}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

