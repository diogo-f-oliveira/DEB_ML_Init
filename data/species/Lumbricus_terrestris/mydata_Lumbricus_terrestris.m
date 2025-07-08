function [data, auxData, metaData, txtData, weights] = mydata_Lumbricus_terrestris

%% set metaData
metaData.phylum     = 'Annelida'; 
metaData.class      = 'Clitellata'; 
metaData.order      = 'Haplotaxida'; 
metaData.family     = 'Lumbricidae';
metaData.species    = 'Lumbricus_terrestris'; 
metaData.species_en = 'Common earthworm'; 

metaData.ecoCode.climate = {'B', 'C'};
metaData.ecoCode.ecozone = {'TP', 'TA', 'TN', 'TH'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Li'; 'Ww0'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-Ww_T'; 't-N'; 'T-JX'}; 

metaData.COMPLETE = 3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2013 05 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Vanessa Roeben'; 'Yvan Capowiez'; 'Andre Gergs'};    
metaData.date_mod_1 = [2019 11 14];              
metaData.email_mod_1    = {'roeben@gaiac-eco.de'};            
metaData.address_mod_1  = {'Research Institute gaiac, INRA, Bayer AG'};

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2019 12 09]; 


%% set data
% zero-variate data

data.ab_15 = 90;  units.ab_15 = 'd'; label.ab_15 = 'age at birth';         bibkey.ab_15 = 'Butt1993';   
  temp.ab_15 = C2K(15); units.temp.ab_15 = 'K'; label.temp.ab_15 = 'temperature';
data.ab_20 = 70;  units.ab_20 = 'd'; label.ab_20 = 'age at birth';         bibkey.ab_20 = 'Butt1993';   
  temp.ab_20 = C2K(20); units.temp.ab_20 = 'K'; label.temp.ab_20 = 'temperature';
data.tp = 73; units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BerrJord2001';
  temp.tp = C2K(20);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 2601;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'LakhSatc1970';   
  temp.am = C2K(20);    units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 22.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki'; 
data.Ww0 = 0.061; units.Ww0 = 'g';   label.Ww0 = 'egg wet weight';         bibkey.Ww0 = 'Butt1993';
data.Wwb = 0.7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BerrJord2001';
data.Wwp = 5.0;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Butt1993';
data.Wwi = 12.87; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'BerrJord2001';
  
% uni-variate data

% tW-data from Butt1993 at 20 C
data.tW = [ ... % time since birth (d), wet weight (g)
  0.464	0.067
 31.520	1.231
 60.722	3.429
 91.778	4.930
121.444	6.094
152.500	6.337];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Butt1993';
%
data.tN = [ ... % time after maturation (d), cumulative offspring (#)
29.483	4.440
62.260	8.096
91.715	12.201
122.243	15.748
152.827	19.963
181.106	23.400
213.789	25.943
243.160	29.044
274.676	31.031
303.982	33.353
336.608	35.227
365.970	38.217];
units.tN   = {'d', '#'};  label.tN = {'time since birth', 'cumulative offspring'};  
temp.tN    = C2K(20);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'Butt1993';
comment.tN = 'initial mass 3.1 g; decreasing mass during reprod to 5.3 g';

data.TP = [ ...      %  Temperature (C), cast production (g/d) 
2	1.1714
2	1.4857
2	1.3714
2	1.2143
2	0.9857
2	1.4714
2	0.5714
2	0.5286
7	2.0571
7	1.2429
7	0.8429
7	1.1571
7	1.2286
7	1.5714
7	0.9571
7	0.9429
12	2.3286
12	2.2143
12	1.7714
12	0.8000
12	1.3000
12	1.2000
12	1.0429
12	1.0857
17	3.3714
17	2.7429
17	2.8857
17	1.9429
17	2.3429
17	1.8143
17	2.6857
17	1.6429
22	4.2714
22	3.7286
22	3.2714
22	2.2714
22	0.6714
22	1.7286
22	2.9857
22	2.9714
27	1.7000
27	1.1143
27	1.5286
27	0.9714
27	0.2571
27	1.5000
27	1.5286
27	0.6143
32	0.9143
32	0.2429
32	0.3286
32	0.4143
   ];
units.TP   = {'C', 'g/d'};  label.TP = {'temperature', 'cast production'};  
bibkey.TP = 'Capo2018';

% tW-data from BerrJord2001 at 20 C
data.tW_20 = [ ... % time since birth (d), wet weight (g)
14	 0.11   
28	 0.88   
42	 1.70   
56	 3.00   
70	 4.37   
84	 5.43   
98	 6.25   
112	 7.26   
126	 7.72   
140	 8.55   
154	 8.90   
168	 9.60   
182	 10.19   
196	 10.59   
210	 11.00   
224	 11.65   
238	 12.35   
252	 12.58   
266	 12.87  
];
units.tW_20   = {'d', 'g'};  label.tW_20 = {'time since birth', 'wet weight', '20 C'};  
temp.tW_20    = C2K(20);  units.temp.tW_20 = 'K'; label.temp.tW_20 = 'temperature';
bibkey.tW_20 = 'BerrJord2001';

% tW-data from BerrJord2001 at 15 C
data.tW_15 = [ ... % time since birth (d), wet weight (g)
14	 0.11   
28	 0.58   
42	 1.17   
56	 1.93   
70	 3.00   
84	 3.88   
98	 4.82   
112	 5.65   
126	 6.41   
140	 7.00   
154	 7.58   
168	 7.87   
182	 8.52   
196	 9.28   
210	 9.75   
224	 10.52   
238	 10.92   
252	 11.63   
266	 12.21   
];
units.tW_15   = {'d', 'g'};  label.tW_15 = {'time since birth', 'wet weight', '15 C'};  
temp.tW_15    = C2K(15);  units.temp.tW_15 = 'K'; label.temp.tW_15 = 'temperature';
bibkey.tW_15 = 'BerrJord2001';

% tW-data from BerrJord2001 at 10 C
data.tW_10 = [ ... % time since birth (d), wet weight (g)
 14	 0.11   
28	 0.22   
42	 0.39   
56	 0.50   
70	 0.85   
84	 1.08   
98	 1.43   
112	 1.83   
126	 2.24   
140	 2.77   
154	 3.35   
168	 4.06   
182	 4.35   
196	 5.23   
210	 5.70   
224	 6.52   
238	 7.29   
252	 7.87   
266	 8.52   
];
units.tW_10   = {'d', 'g'};  label.tW_10 = {'time since birth', 'wet weight', '10 C'};  
temp.tW_10    = C2K(10);  units.temp.tW_10 = 'K'; label.temp.tW_10 = 'temperature';
bibkey.tW_10 = 'BerrJord2001';

% tW-data from BerrJord2001 at 25 C
data.tW_25 = [ ... % time since birth (d), wet weight (g)
14	 0.11   
28	 0.22   
42	 0.39   
56	 0.37   
70	 0.42   
84	 0.47   
98	 0.52   
112	 0.63   
126	 0.68   
140	 0.61   
154	 0.48   
168	 0.47 
];
units.tW_25   = {'d', 'g'};  label.tW_25 = {'time since birth', 'wet weight', '25 C'};  
temp.tW_25    = C2K(25);  units.temp.tW_25 = 'K'; label.temp.tW_25 = 'temperature';
bibkey.tW_25 = 'BerrJord2001';

  
%% Group plots
set1 = {'tW_25', 'tW_20','tW_15','tW_10'}; subtitle1 = {'BerrJord2001 for 25, 20, 15, 10 C'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

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

%% Discussion points
D1 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
D2 = 'mod_1: data on time-cast production and time-weight is added for different temperatures';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6R26F'; % Cat of Life
metaData.links.id_ITIS = '977384'; % ITIS
metaData.links.id_EoL = '3126801'; % Ency of Life
metaData.links.id_Wiki = 'Lumbricus_terrestris'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '15563'; % Taxonomicon
metaData.links.id_WoRMS = '1069627'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lumbricus_terrestris}}';
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
bibkey = 'Butt1993'; type = 'Article'; bib = [ ... 
'author = {Butt, K. R.}, ' ... 
'year = {1993}, ' ...
'title = {Reproduction and growth of three deep-burrowing earthworms ({L}umbricidae) in laboratory culture in order to assess production for soil restoration}, ' ...
'journal = {Biol Fertil Soils}, ' ...
'volume = {16}, ' ...
'pages = {135--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
% bibkey = 'HolmOste1991'; type = 'Article'; bib = [ ... 
% 'author = {Holmstrup, M. and {\O}stergaard, I. K. and Nielsen, A. and Hansen, B. T.}, ' ... 
% 'year = {1991}, ' ...
% 'title = {The relationship between temperature and cocoon incubation time for some Lumbricid earthworm species}, ' ...
% 'journal = {edobiologia}, ' ...
% 'volume = {35}, ' ...
% 'pages = {179--184}'];
% metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BerrJord2001'; type = 'Article'; bib = [ ... 
'author = {Berry, E.C. and Jordan, D.}, ' ... 
'year = {2001}, ' ...
'title = {Temperature and soil moisture content effects on the growth of \emph{Lumbricus terrestris} ({O}ligochaeta: {L}umbricidae) under laboratory conditions}, ' ...
'journal = {Soil Biology \& Biochemistry}, ' ...
'volume = {33}, ' ...
'pages = {133--136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Capo2018'; type = 'Misc'; bib = [ ... 
'author = {Capowiez, Y.}, ' ... 
'year = {2018}, ' ...
'note = {Unpublished}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LakhSatc1970'; type = 'Article'; bib = [ ... 
'author = {Lakhani, K.H. and Satchell, J. E.}, ' ... 
'year = {1970}, ' ...
'title = {Production by \emph{{L}umbricus terrestris} ({L}.)}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {39}, ' ...
'pages = {473--492}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

