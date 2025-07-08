function [data, auxData, metaData, txtData, weights] = mydata_Eulamprus_quoyii
%% set metadata
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Eulamprus_quoyii';
metaData.species_en = 'Eastern Water Skink';

metaData.ecoCode.climate = {'Cfb', 'Cfc'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTa', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww','t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Michael Kearney'};    
metaData.date_subm = [2011 11 15];              
metaData.email    = {'m.kearney@unimelb.edu.au'};            
metaData.address  = {'University of Melbourne'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2013 08 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 10 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Michael Kearney'};    
metaData.date_mod_3 = [2017 05 25];              
metaData.email_mod_3    = {'mrke@unimelb.edu.au'};            
metaData.address_mod_3  = {'School of BioSciences, The University of Melbourne, 3010, Australia'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'};
metaData.date_acc    = [2017 05 28];

%% set data
% zero-variate data;
% age 0 is at onset of embryo development
data.ab = 71;     units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'CaleSchw2004';
temp.ab = C2K(25.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';

data.ap = data.ab+304.5; units.ap = 'd'; label.ap = 'age at puberty';              bibkey.ap = 'CaleSchw2004';
temp.ap = C2K(25.8); units.temp.ap = 'K'; label.temp.ap = 'temperature';

data.am = 12*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Schw2016';
temp.am = C2K(17.7); units.temp.am = 'K'; label.temp.am = 'temperature';
comment.am = 'Schwarzkopf unpublished observation';

data.Lb  = 3.845;     units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'CaleSchw2004';
data.Lp  = 9;      units.Lp  = 'cm';    label.Lp  = 'snout to vent length at puberty';  bibkey.Lp  = 'CaleSchw2004';
data.Li  = 13;     units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'Schw2016';
comment.Li = 'Schwarzkopf unpublished observation';

data.Wwb = 0.97;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'CaleSchw2004';
data.Wwp = 11;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'CaleSchw2004';
data.Wwi = 41.8;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'Schw2016';
comment.Wwi = 'Schwarzkopf unpublished observation';

data.Ri  = 5/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'CaleSchw2004';
temp.Ri = C2K(17.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ...
0,3.4
0,3.6
0,3.85
0,3.9
1,4
1,4
1,4
1,4
1,4.1
19,4.3
21,4.3
21,4.5
21,4.5
24,4.4
24,4.5
24,4.7
27,3.6
27,4.3
33,5
35,4.4
35,4.7
35,4.7
38,4.7
38,4.7
38,4.9
41,3.8
41,4.5
47,5.1
49,4.6
49,4.9
49,4.9
52,4.7
52,5
52,5.1
55,4.1
55,4.7
61,5.3
63,5
63,5.2
63,5.3
66,5.1
66,5.3
66,5.4
69,4.4
69,5
89,5.8
91,5.3
91,5.7
91,5.7
94,5.7
94,6
94,6.1
97,5
97,5.3
103,5.9
105,5.3
105,5.8
105,6
108,5.9
108,6.1
108,6.2
111,5.2
111,5.5
117,6.2
119,5.7
119,6
119,6.3
122,6
122,6.2
122,6.4
125,5.6
125,5.7
134,6.4
136,5.8
136,6.5
136,6.5
139,6.3
139,6.7
139,7.2
142,5.7
142,5.8
145,6.6
147,5.9
147,6.6
147,6.7
150,6.7
150,6.7
150,7.3
153,5.7
153,6
159,6.7
161,6.1
161,7
161,7.1
164,6.7
164,7.2
164,7.6
167,5.8
167,6.1
173,7
175,6.1
175,7
175,7.1
178,7
178,7.3
178,7.9
181,6
181,6.3
187,7.2
189,6.2
189,7.5
189,7.5
192,7.4
192,7.9
192,8.2
195,6.3
195,6.7
201,7.8
203,6.7
203,8
203,8.1
206,7.4
206,8
206,8.6
209,6.6
209,7
215,7.8
217,6.7
217,8.1
217,8.2
220,7.6
220,8.2
220,8.8
223,6.8
223,7.2
229,8
231,7.1
231,8.3
231,8.4
234,7.8
234,8.3
234,8.9
237,7
237,7.6
248,8.2
250,7.5
250,8.5
250,8.5
253,7.8
253,8.5
253,9
256,7.2
256,7.8
257,8.6
259,8
259,8.7
259,8.7
262,8
262,8.8
262,9
265,7.9
271,9
273,8
273,9
273,9.1
276,8.7
276,9
276,9.4
279,7.4
279,8.5
285,8.7
287,8
287,9
287,9
290,8.5
290,9
290,9.2
293,8.3
293,8.3
299,8.9
301,8.1
301,9.1
301,9.2
304,8.7
304,9.1
304,9.5
307,8.4
307,8.6
313,9.2
315,8.3
315,9.2
315,9.3
318,9
318,9.2
318,9.5
321,8.6
321,8.7
327,9.4
329,8.4
329,9.5
329,9.6
332,9.2
332,9.7
332,9.9
335,8.7
335,9.1
341,9.1
343,8.3
343,9.5
343,9.6
346,9
346,9.5
346,9.6
349,8.4
349,9
355,9.5
357,8.6
357,9.5
357,9.9
360,9.2
360,9.6
360,10.2
363,8.8
363,9.3
369,9.9
371,8.7
371,9.9
% 371,1
374,9.4
374,10.1
374,10.2
377,9.3
377,9.3
397,9.8
399,9.1
399,9.8
399,9.8
402,9.4
% 402,1
402,10.1
405,9.3
405,9.5
425,9.8
427,9.2
427,9.7
% 427,1
430,9.6
430,10.2
430,10.3
433,9.3
433,9.4
453,10.2
455,9.4
% 455,1
455,10.1
458,9.8
458,10.3
458,10.6
461,9.5
461,9.7
481,10.1
483,9.5
% 483,1
483,10.3
486,9.5
486,10.5
489,9.6
489,9.7
526,10.2
528,9.4
528,10.1
528,10.5
531,9.8
531,10.4
531,10.5
534,9.4
534,9.5
581,10.4
583,9.6
583,10.7
583,10.8
586,10.2
586,10.5
586,10.7
589,9.8
589,9.9
612,10.8
615,10.1
];    
units.tL = {'d', 'cm'};     label.tL = {'age', 'length'};  bibkey.tL = 'CaleSchw2004';temp.tL = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

data.LW = [ ...
3.4,0.6
3.6,0.83
3.6,0.91
3.8,1.17
3.85,0.94
3.9,1.02
4,0.95
4,1.18
4,1.14
4,1.13
4.1,1.48
4.1,1.12
4.3,1.36
4.3,1.44
4.3,1.78
4.4,1.77
4.4,1.39
4.4,1.82
4.5,1.73
4.5,1.51
4.5,1.64
4.5,1.69
4.6,2.06
4.7,2.05
4.7,1.95
4.7,2.16
4.7,2.11
4.7,1.75
4.7,2.21
4.7,2.24
4.9,2.25
4.9,2.46
4.9,2.8
5,2.41
5,2.19
5,2.54
5,2.4
5,2.29
5.1,2.54
5.1,2.76
5.1,2.47
5.2,2.53
5.2,2.72
5.3,2.46
5.3,3.04
5.3,2.75
5.3,2.86
5.3,3.17
5.3,2.81
5.4,3.07
5.5,2.61
5.6,2.6
5.7,2.86
5.7,3.18
5.7,2.78
5.7,2.9
5.7,2.96
5.7,3.14
5.7,3.1
5.8,3.27
5.8,2.72
5.8,3.03
5.8,3.65
5.8,3.05
5.9,3.35
5.9,3.31
5.9,3.71
6,3.55
6,3.47
6,3.4
6,3.41
6,3.8
6,4.21
6.1,3.77
6.1,4.17
6.1,3.62
6.1,3.62
6.1,4
6.2,4.51
6.2,4.7
6.2,4.4
6.2,3.68
6.3,4.16
6.3,4.42
6.3,3.8
6.3,4.55
6.4,4.3
6.4,3.95
6.5,4.43
6.5,5.23
6.6,4.53
6.6,5.12
6.6,4.67
6.7,5.6
6.7,4.45
6.7,5.15
6.7,4.78
6.7,5.66
6.7,4.9
6.7,5.53
6.7,5.64
6.7,5.02
6.8,5.31
7,6.35
7,6.25
7,5.87
7,6.43
7,7.44
7,6.28
7.1,6.64
7.1,5.76
7.1,7.16
7.2,8.06
7.2,7.33
7.2,6.53
7.2,6.2
7.2,7.13
7.3,7.32
7.3,7.1
7.4,8.75
7.4,7.21
7.4,7.94
7.5,8.06
7.5,8.12
7.5,7.94
7.6,8.29
7.6,9.26
7.6,8.73
7.8,10.29
7.8,10.19
7.8,11.35
7.8,8.1
7.8,8.82
7.9,10.55
7.9,8.74
7.9,9.92
8,11.29
8,9.43
8,8.11
8,8.43
8,9.25
8,8.86
8,10.33
8.1,10.01
8.1,9.95
8.1,10.94
8.2,9.94
8.2,11.04
8.2,9.89
8.2,11.62
8.3,9.52
8.3,12.14
8.3,11.6
8.3,10.82
8.3,12.37
8.3,12.09
8.4,10.91
8.4,15.82
8.4,11.48
8.4,11.15
8.5,11.56
8.5,12.12
8.5,12.71
8.5,12.57
8.5,13.46
8.6,11.6
8.6,13.24
8.6,11.71
8.6,12.45
8.6,11.85
8.7,12.88
8.7,14.42
8.7,11.92
8.7,12.49
8.7,12.9
8.7,13
8.7,14.07
8.7,13.19
8.8,14.92
8.8,12.83
8.8,12.58
8.9,13.83
8.9,14.3
9,14.13
9,13.59
9,15.68
9,13.88
9,14.61
9,14.6
9,14.89
9,13.47
9,14.79
9,14.89
9,12.79
9.1,15.13
9.1,15.01
9.1,15.46
9.1,15.28
9.1,15.01
9.1,17.801
9.2,14.16
9.2,15.61
9.2,16.91
9.2,16.07
9.2,15.49
9.2,15.85
9.2,16.24
9.2,15.52
9.3,15.44
9.3,17.04
9.3,17.26
9.3,17.96
9.3,17.7
9.3,16.6
9.4,17.64
9.4,18.71
9.4,16.67
9.4,18.2
9.4,15.35
9.4,15.97
9.4,15.93
9.4,16.31
9.5,16.17
9.5,18.67
9.5,17.88
9.5,18.32
9.5,18.66
9.5,16.96
9.5,17.35
9.5,16.37
9.5,17.24
9.5,18.18
9.5,19.25
9.5,18.11
9.6,18.9
9.6,17.96
9.6,19.76
9.6,19.76
9.6,18.83
9.6,17.61
9.6,18.55
9.7,17.8
9.7,18.96
9.7,17.3
9.7,22.31
9.8,20.45
9.8,18.77
9.8,18.16
9.8,19.97
9.8,22.02
9.8,20.98
9.8,21.63
9.9,17.92
9.9,18.93
9.9,18.7
9.9,19.55
9.9,18.84
10,23.97
10,19.4
10,21.09
10,22.48
10,22.64
10.1,20.77
10.1,20.85
10.1,24.2
10.1,21.73
10.1,21.88
10.1,22.09
10.2,21.11
10.2,25.23
10.2,20.66
10.2,21.92
10.2,22.55
10.2,21.66
10.3,24.32
10.3,24.55
10.3,22.15
10.4,26.9
10.4,25.55
10.5,23.82
10.5,23.23
10.5,25.01
10.5,21.96
10.6,26.23
10.7,29.33
10.7,28.67
10.8,29.82
10.8,25.18  
];
units.LW = {'cm', 'g'};     label.LW = {'snout vent length', 'wet weight'};  bibkey.LW = 'CaleSchw2004';

%% set weights for all real data
weights = setweights(data, []);

%% overwriting weights
% weights.ab = 100 * weights.ab; % 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'See Schwarzkopf,  Caley and Kearney 2016 for further details';
D2 = 'These parameters are for a Sydney (temperate) population - a population from Townsville (tropical) was also considered';
D3 = 'The effect of cold rearing conditions on growth was also explored and it was concluded that thermal acclimation in the embryo results in altered thermal response as a hatching';
D4 = 'mod_3: inclusion of t-L and t-Ww data and subsequent re-estimation';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3, 'D4', D4);

%% Links
metaData.links.id_CoL = '6H7Q3'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '794708'; % Ency of Life
metaData.links.id_Wiki = 'Eulamprus_quoyii'; % Wikipedia
metaData.links.id_ADW = 'Eulamprus_quoyii'; % ADW
metaData.links.id_Taxo = '91157'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Eulamprus&species=quoyii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Eulamprus_quoyii}}';  
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
bibkey = 'CaleSchw2004'; type = 'Article'; bib = [ ...  
'author = {Caley, J. M. and Schwarzkopf, L.}, ' ...
'title = {Complex growth rate evolution in a latitudinally widespread species}, ' ...
'journal = {Evolution}, ' ...
'volume = {58}, ' ...
'pages = {862--869}, ' ...
'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schw2016'; type = 'Article'; bib = [ ...  
'author = {Schwarzkopf, L. and Caley, J. M. and Kearney, M. R.}, ' ...
'title = {One lump or two? {E}xplaining a major latitudinal transition in reproductive allocation in a viviparous lizard}, ' ...
'journal = {Functional Ecology}, ' ...
'volume = {30}, ' ...
'pages = {1373-1383}, ' ...
'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


