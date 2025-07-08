function [data, auxData, metaData, txtData, weights] = mydata_Somniosus_pacificus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Somniosidae';
metaData.species    = 'Somniosus_pacificus'; 
metaData.species_en = 'Pacific sleeper shark'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCvb', 'biCvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2.3); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 't-L'}; 

metaData.COMPLETE = 1.9; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 04 019];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 04 19]; 

%% set data
% zero-variate data

data.ab = 4.7*365;    units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'guess';
  temp.ab = C2K(2.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on S.microcephalus';
data.am = 262*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'MattTrib2024';   
  temp.am = C2K(2.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 40;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'MattTrib2024';
data.Lp  = 370;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'MattTrib2024';
data.Lpm = 317;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';    bibkey.Lpm  = 'guess';
data.Li  = 465;     units.Li  = 'cm';  label.Li  = 'ultimate total length';      bibkey.Li  = 'MattTrib2024';
  comment.Li = 'TL 720 cm estimates based on photos';
data.Lim = 375;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length';      bibkey.Lim  = 'guess';
  comment.Lim = 'based on Lim/Li ratio of S.microcephalus: 465*375/550';

data.Ri  = 10/365/5;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'MattTrib2024';   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value is speculative; litter interval of 5 yr based on ab';
  
% univariate data:
data.LW_f = [ ... % log TL (cm) log wet weight (kg)
4.10	0.60
4.15	0.99
4.19	0.89
4.21	1.17
4.24	1.06
4.25	0.94
4.26	1.28
4.29	1.40
4.30	1.20
4.32	1.17
4.32	1.63
4.34	1.25
4.35	1.46
4.35	2.00
4.36	1.58
4.37	1.26
4.38	0.80
4.38	1.83
4.40	1.55
4.40	2.29
4.40	1.35
4.41	1.75
4.42	1.92
4.44	1.69
4.44	2.08
4.44	2.04
4.45	1.60
4.48	2.04
4.50	1.83
4.50	1.40
4.52	1.95
4.53	2.32
4.53	2.21
4.56	2.38
4.56	2.17
4.57	2.04
4.58	2.44
4.58	1.92
4.59	2.26
4.59	1.83
4.60	2.05
4.62	2.29
4.62	2.04
4.62	2.11
4.63	1.91
4.64	2.21
4.64	2.39
4.65	3.04
4.65	2.71
4.65	2.63
4.65	2.24
4.65	2.10
4.68	2.40
4.68	2.37
4.68	2.16
4.69	2.67
4.69	2.51
4.71	2.89
4.71	2.50
4.72	2.72
4.74	2.77
4.74	2.61
4.75	2.85
4.76	2.27
4.76	2.71
4.77	2.60
4.77	2.48
4.78	2.85
4.80	3.03
4.80	2.68
4.80	2.57
4.81	2.25
4.81	3.20
4.81	2.78
4.82	3.16
4.83	2.90
4.83	2.72
4.84	3.24
4.84	2.62
4.84	3.04
4.86	2.84
4.86	2.62
4.87	3.22
4.88	3.36
4.88	2.98
4.89	2.88
4.89	3.08
4.90	2.42
4.90	3.16
4.92	2.89
4.92	3.09
4.93	3.22
4.94	3.48
4.95	3.30
4.97	3.36
4.98	3.47
4.98	3.22
4.98	2.77
5.00	3.10
5.01	3.22
5.01	3.03
5.01	3.01
5.02	3.51
5.03	3.40
5.05	3.55
5.05	4.01
5.06	3.29
5.07	3.20
5.07	3.18
5.09	3.64
5.09	3.49
5.09	3.06
5.09	3.78
5.10	4.58
5.12	3.68
5.12	3.35
5.12	3.86
5.13	4.32
5.13	3.30
5.15	3.77
5.16	3.61
5.16	4.04
5.18	4.01
5.18	3.91
5.18	4.60
5.18	3.89
5.18	3.75
5.20	4.11
5.21	4.31
5.21	4.21
5.21	4.01
5.25	4.02
5.26	4.42
5.27	4.17
5.29	4.29
5.30	4.45
5.30	4.15
5.36	4.56
5.37	6.05
5.38	4.87
5.38	4.62
5.39	4.43
5.39	4.55
5.41	4.80
5.42	4.56
5.43	4.72
5.47	4.83
5.48	5.03
5.48	4.90
5.48	4.60
5.49	4.67
5.51	4.56
5.52	4.96
5.52	5.27
5.52	5.21
5.53	5.34
5.53	5.12
5.54	5.05
5.55	4.95
5.56	5.36
5.58	5.02
5.58	6.37
5.59	4.76
5.59	5.07
5.62	5.26
5.65	5.44
5.68	5.31
5.71	5.88
5.72	5.68
5.73	5.80
5.75	6.14
5.75	5.89
5.77	5.79
5.78	6.03];
data.LW_f = exp(data.LW_f); % remove log-transform
units.LW_f  = {'cm','kg'}; label.LW_f  = {'total length', 'wet weight','females'}; 
bibkey.LW_f  = 'MattTrib2024';   
%
data.LW_m = [ ...
4.12	0.78
4.12	0.57
4.16	1.09
4.18	1.01
4.22	1.04
4.26	1.30
4.27	1.64
4.27	1.09
4.29	1.17
4.29	1.39
4.30	1.36
4.30	1.21
4.31	1.39
4.31	1.20
4.33	1.31
4.34	1.46
4.36	1.80
4.37	1.54
4.39	1.85
4.39	1.29
4.41	1.18
4.41	1.85
4.42	1.51
4.43	1.71
4.43	1.83
4.47	2.26
4.47	2.16
4.47	1.92
4.48	1.98
4.50	2.31
4.50	2.03
4.50	1.86
4.52	1.64
4.53	1.83
4.53	2.17
4.54	2.55
4.54	2.07
4.54	1.88
4.54	1.91
4.56	1.98
4.57	2.20
4.59	2.63
4.60	2.14
4.61	2.51
4.62	2.42
4.62	2.21
4.63	2.33
4.63	2.10
4.64	2.71
4.64	2.49
4.65	2.35
4.66	2.52
4.67	2.10
4.67	1.93
4.68	2.06
4.68	2.85
4.69	2.41
4.71	2.24
4.72	2.48
4.74	2.69
4.74	2.40
4.75	2.08
4.76	2.60
4.77	2.83
4.79	2.00
4.80	2.93
4.81	2.29
4.82	2.80
4.82	2.95
4.83	3.36
4.86	2.97
4.87	3.13
4.88	2.61
4.88	2.76
4.91	3.28
4.92	3.23
4.92	2.77
4.92	2.90
4.92	2.84
4.93	3.32
4.93	3.03
4.96	3.22
4.99	3.37
5.00	3.96
5.01	4.17
5.03	3.55
5.04	3.44
5.06	3.90
5.07	3.67
5.07	3.37
5.09	3.74
5.12	3.73
5.12	3.54
5.13	3.58
5.14	4.23
5.14	3.94
5.14	3.77
5.16	4.36
5.16	3.97
5.18	3.80
5.18	3.89
5.21	3.83
5.21	3.97
5.24	4.21
5.24	3.90
5.27	4.11
5.28	3.84
5.29	4.32
5.29	4.03
5.33	4.45
5.33	4.26
5.34	4.74
5.35	4.50
5.37	4.35
5.38	4.27
5.40	4.36
5.40	4.86
5.46	4.88
5.47	5.08
5.50	5.20
5.58	5.76
5.58	5.43
5.61	5.98
5.64	5.09
5.68	5.55
5.69	5.49
5.84	5.99];
data.LW_m = exp(data.LW_m); % remove log-transform
units.LW_m  = {'cm','kg'}; label.LW_m  = {'total length', 'wet weight','males'}; 
bibkey.LW_m  = 'MattTrib2024';   

data.tL = [ ... time (yr), length (cm)
 0   40
47.5 310];
data.tL(:,1) = data.tL(:,1) * 365;
units.tL = {'d','cm'}; label.tL  = {'time', 'total length'};         
temp.tL = C2K(2.3); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL  = 'MattTrib2024';  
comment.tL = 'birth estimated from eye lens core radiocarbon';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;
weights.Lb = weights.Lb * 3;
weights.Li = weights.Li * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Gestation time is unknown. The assumed litter-interval of 5 yr is the smallest for which the predicted gestation time is smaller than the litter interval (given this set of life-history data)';
D2 = 'Males are assumed to differ from females by {p_Am} and E_Hp only'; 
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Ovoviviparous';
metaData.bibkey.F2 = 'MattTrib2024'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4Y8YL'; % Cat of Life
metaData.links.id_ITIS = '160610'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Somniosus_pacificus'; % Wikipedia
metaData.links.id_ADW = 'Somniosus_pacificus'; % ADW
metaData.links.id_Taxo = '106289'; % Taxonomicon
metaData.links.id_WoRMS = '271654'; % WoRMS
metaData.links.id_fishbase = 'Somniosus-pacificus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Somniosus_pacificus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Somniosus-pacificus.html}}';
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
bibkey = 'MattTrib2024'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-024-03247-8}, ' ...
'author = {Mary Elizabeth Matta and Cindy A. Tribuzio and Lindsay N. K. Davidson and Keith R. Fuller and Garrett C. Dunne and Allen H. Andrews}, ' ... 
'year = {2024}, ' ...
'title = {A review of the Pacific sleeper shark Somniosus pacificus: biology and fishery interactions}, ' ...
'journal = {Polar Biology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
