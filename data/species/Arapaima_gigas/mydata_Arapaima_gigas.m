  function [data, auxData, metaData, txtData, weights] = mydata_Arapaima_gigas

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Arapaimidae';
metaData.species    = 'Arapaima_gigas'; 
metaData.species_en = 'Pirarucu'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2014 04 28];                           
metaData.email    = {'Bas.Kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, the Boelelaan 1085, 1081 HV Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 16]; 


%% set data
% zero-variate data
data.ab = 9;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'WWF'; 
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 3*365; units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'AranCast2010';
  temp.ap = C2K(28); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for males: 6 yr';
data.am = 20*365;units.am = 'd';    label.am = 'life span';              bibkey.am = 'Nat_Geogr';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

%data.L0 = 0.3;   units.Lh = 'cm';   label.L0 = 'egg diameter';          bibkey.L0 = 'FAO';
data.Lb = 1.4;   units.Lb = 'cm';   label.Lb = 'total length at birth';  bibkey.Lb = 'FAO'; % estimated from L0
data.Lp = 160;   units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'AranCast2010';
data.Li = 240;   units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'Quei2000';

data.Wwi = 1e5;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Quei2000';
  
data.Ri = 2e4/365;units.Ri = '#/d';  label.Ri = 'maximum reprod rate';   bibkey.Ri = 'FAO';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data from AranCast2010
data.tL = [ ... % time (yr), total length (cm)
1.0	42.3
1.0	48.9
1.0	52.5
1.0	57.4
1.0	61.6
1.0	64.0
1.0	69.4
1.0	72.4
1.0	76.0
1.0	79.0
1.0	85.1
1.0	86.9
1.0	90.5
1.0	94.1
1.0	101.3
1.0	97.1
1.0	106.1
1.0	110.4
1.0	114.0
1.0	117.6
1.0	120.6
1.0	123.6
1.0	127.2
1.0	130.8
1.0	135.7
1.0	139.9
2.0	72.5
2.0	78.6
2.0	83.4
2.0	88.8
2.0	90.6
2.0	94.8
2.0	99.6
2.0	101.4
2.0	103.9
2.0	107.5
2.0	110.5
2.0	114.1
2.0	115.9
2.0	117.1
2.0	119.5
2.0	122.5
2.0	124.9
2.0	127.4
2.0	131.6
2.0	133.4
2.0	137.6
2.0	141.2
2.0	146.0
2.0	147.2
2.0	150.2
2.0	152.1
2.0	155.1
2.0	156.3
2.0	157.5
2.0	157.5
2.0	164.1
3.0	110.0
3.1	114.8
3.1	120.2
3.1	124.5
3.0	128.1
3.1	135.9
3.1	140.7
3.1	144.3
3.1	149.2
3.1	153.4
3.0	157.0
3.0	160.0
3.0	162.4
3.0	167.2
3.1	170.2
3.0	173.3
3.1	176.9
3.0	178.1
3.1	181.1
3.1	184.7
3.1	187.7
3.1	187.7
3.0	191.9
4.0	128.2
4.0	139.0
4.0	146.3
4.0	149.9
4.0	153.5
4.0	155.9
4.1	163.1
4.0	167.4
4.0	171.0
4.0	176.4
4.0	178.2
4.0	179.4
4.0	183.6
4.0	187.2
4.0	189.0
4.0	190.8
4.0	192.7
4.0	197.5
4.0	203.5
4.1	208.3
5.0	162.7
5.0	169.3
5.0	184.9
5.0	189.2
5.1	194.6
5.0	199.4
5.0	200.6
5.0	203.0
5.0	206.6]; % cm, physical length at f and T
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AranCast2010';
%
% LWw-data from Quei2000
data.LW = [ ... % total length (cm), wet weight (kg)
57.35	9.88
85.18	11.76
89.50	5.62
99.90	7.13
99.91	9.82
103.92	7.51
106.28	9.81
110.63	8.27
108.97	11.34
109.66	15.56
112.32	10.95
113.33	12.87
113.69	16.70
112.02	19.77
112.02	19.77
114.37	20.15
116.39	22.45
114.76	30.13
115.78	34.73
117.00	9.41
116.34	12.10
117.04	16.31
117.04	16.31
118.05	18.23
120.40	18.99
121.38	13.62
122.39	14.77
123.75	19.37
128.08	12.46
128.08	12.46
126.42	16.68
126.10	18.98
123.76	21.29
129.44	17.06
129.45	19.36
129.45	19.36
131.13	20.89
130.81	23.96
127.80	25.89
128.15	27.80
128.50	30.49
130.84	30.48
126.18	35.48
137.44	9.38
127.03	4.41
123.04	10.55
137.80	13.60
137.14	16.67
136.15	18.20
134.48	20.12
132.81	22.04
133.16	24.73
132.17	27.80
130.47	22.05
140.50	16.66
142.51	16.66
142.51	17.81
142.52	19.73
143.55	23.94
141.88	26.25
137.50	22.04
138.18	23.95
135.18	26.64
135.20	30.48
135.89	35.46
138.54	28.17
138.89	30.47
141.24	32.39
144.26	32.76
144.95	37.37
135.67	59.24
138.72	65.76
150.41	57.69
160.78	53.45
162.81	58.44
153.01	40.04
153.33	37.35
150.32	39.28
148.33	43.11
148.97	37.36
148.96	35.44
151.30	33.52
151.62	30.84
148.61	30.84
147.58	25.47
145.24	28.16
150.59	25.85
150.94	27.38
153.63	29.68
155.30	28.91
146.52	15.50
147.54	17.80
150.22	17.80
154.91	17.79
155.60	22.01
149.52	12.43
155.21	10.50
158.33	31.59
160.34	31.21
160.35	34.27
160.36	36.19
160.37	37.34
158.70	40.03
155.34	37.35
157.70	40.80
156.37	42.34
157.40	48.09
164.33	24.68
163.01	30.43
165.70	31.20
166.06	35.80
163.05	36.96
162.38	38.87
160.39	41.95
165.75	41.94
169.44	41.93
170.34	19.68
171.36	24.29
175.37	21.98
175.72	25.43
173.39	27.73
173.40	30.80
174.75	31.95
176.42	29.65
176.42	31.56
176.44	34.63
176.12	38.09
174.12	39.62
175.14	42.31
177.16	44.60
171.42	36.94
170.43	38.86
167.76	42.32
170.12	43.85
172.46	44.23
173.14	44.99
170.46	45.00
170.46	45.77
171.47	46.53
172.49	49.98
174.85	52.66
173.52	53.82
173.53	56.12
175.16	47.68
176.84	48.06
178.49	43.45
181.85	43.83
183.53	46.13
185.89	48.04
180.76	27.72
182.43	25.80
184.45	28.10
181.14	36.54
196.84	26.93
189.86	38.83
193.91	44.20
179.19	48.82
180.54	51.89
182.22	51.50
179.54	51.51
180.56	54.57
180.57	57.64
176.22	58.80
178.58	61.86
173.63	78.75
176.61	69.92
179.96	70.30
184.33	71.83
182.96	66.08
185.30	64.54
186.97	64.15
186.62	60.70
183.60	59.94
185.26	57.63
186.25	54.18
187.60	54.95
189.60	53.02
190.25	49.57
194.96	53.78
197.97	53.01
200.65	52.62
199.97	49.17
189.96	58.39
190.31	61.08
191.65	62.61
190.66	64.53
194.01	65.29
194.69	66.44
197.36	64.90
191.70	71.82
193.75	81.02
199.72	68.35
200.71	64.13
202.75	70.26
204.08	68.34
204.78	74.86
208.15	78.69
212.18	80.22
208.87	88.67
211.55	89.05
208.90	94.42
205.23	97.49
218.26	90.95
222.60	87.11
228.09	114.33
212.15	73.70
209.79	71.40
209.79	71.40
208.78	69.49
211.79	69.10];
data.LW(:,2) = data.LW(:,2) * 1e3; % convert kg to g
units.LW = {'d', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Quei2000';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts 
F1 = 'The arapaima has a fundamental dependence on surface air to breathe.';
metaData.bibkey.F1 = 'Wiki';
F2 = 'In addition to gills, it has a modified and enlarged swim bladder, composed of lung-like tissue, which enables it to extract oxygen from the air. ';
metaData.bibkey.F2 = 'Wiki';
F3 = 'The arapaima male is supposed to be a mouthbrooder, like his relative, the Osteoglossum, meaning the young are protected in his mouth until they are older.'; 
metaData.bibkey.F3 = 'Wiki';
F4 = 'Arapaima is NOT a mouthbrooder';
metaData.bibkey.F4 = 'FAO';
F5 = 'W = 3.788E-05* L ^2.7045';
metaData.bibkey.F5 = 'FAO';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5);
                                 
%% Links
metaData.links.id_CoL = 'G5TN'; % Cat of Life
metaData.links.id_ITIS = '161890'; % ITIS
metaData.links.id_EoL = '204868'; % Ency of Life
metaData.links.id_Wiki = 'Arapaima_gigas'; % Wikipedia
metaData.links.id_ADW = 'Arapaima_gigas'; % ADW
metaData.links.id_Taxo = '42701'; % Taxonomicon
metaData.links.id_WoRMS = '1042347'; % WoRMS
metaData.links.id_fishbase = 'Arapaima-gigas'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arapaima_gigas}}';  
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
bibkey = 'AranCast2010'; type = 'Article'; bib = [ ...    
'author = {Arantes, C. C. and Castello, L. and Stewart, D. J and Cetra, M and Queiroz, H. L.}, ' ...
'year  = {2010}, ' ...
'title = {Population density, growth and reproduction of arapaima in an {A}mazonian river-floodplain.}, ' ...  
'journal = {Ecology of Freshwater Fish}, ' ...
'doi = {10.1111/j.1600-0633.2010.00431.x}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Quei2000'; type = 'Phdthesis'; bib = [ ...    
'author = {Queiroz, H.L.}, ' ...
'year  = {2000}, ' ...
'title = {Natural history and conservation of pirarucu, \emph{Arapaima gigas}, at the {A}mazonian {V}arzea: red giants in muddy waters}, ' ...  
'school = {University of St. Andrews}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.mnhn.fr/summary/Arapaima-gigas.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FAO'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/culturedspecies/Arapaima_gigas/en}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WWF'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.wwf.org.br/?26210/Arapaima-the-freshwater-giant}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seriouslyfish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seriouslyfish.com/species/Arapaima_gigas/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Arapaima_gigas/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nat_Geogr'; type = 'Misc'; bib = ...
'howpublished = {\url{http://environment.nationalgeographic.com/environment/freshwater/arapaima/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
