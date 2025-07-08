function [data, auxData, metaData, txtData, weights] = mydata_Tetragnatha_versicolor

global tcJX_C tcJX_HL tcJX_LH

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Arachnida'; 
metaData.order      = 'Araneae'; 
metaData.family     = 'Tetragnathidae';
metaData.species    = 'Tetragnatha_versicolor'; 
metaData.species_en = 'Longjawed Orbweaver'; 

metaData.ecoCode.climate = {'Am', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn', 'TN'};
metaData.ecoCode.habitat = {'0jTf', '0jTg', '0iTi'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 20]; 


%% set data
% zero-variate data

data.tp = 45;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MarcRich2008';
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ADW';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'probably less than 1 yr';

data.Li  = 1.33;  units.Li  = 'cm';  label.Li  = 'ultimate cephalothorax length for female';  bibkey.Li  = 'ADW';
data.Lim  = 0.92;  units.Lim  = 'cm'; label.Lim  = 'ultimate cephalothorax length for male';   bibkey.Lim = 'ADW';

data.Wwb = 1.7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Yosh2005';
  comment.Wwb = 'value applies to Tetragnatha praedonia';
data.Wwp = 0.010;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'MarcRich2008';
data.Wwi = 0.082;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';

data.Ri  = 103/ 14; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '103 eggs per clutch, one clutch each 14 d, if well fed';
  
% uni-variate data
% t-L data
data.tW_C = [ ... % time since start experiment (d), wet weight (9)
0.000001	0.00248
7.640760	0.00377
15.36084	0.00495
23.18032	0.00588
30.90903	0.00807
38.83463	0.00956
46.75573	0.01051
54.37006	0.01118
62.28910	0.01189
69.99906	0.01187];
units.tW_C   = {'d', 'g'};  label.tW_C = {'time', 'wet weight', 'constant'};  
temp.tW_C    = C2K(21);  units.temp.tW_C = 'K'; label.temp.tW_C = 'temperature';
bibkey.tW_C = 'MarcRich2008';
comment.tW_C = 'Constant food supply';
%
data.tW_HL = [ ... % time since start experiment (d), wet weight (g)
0.000001	0.00275
7.554130	0.00552
15.17539	0.00701
23.38940	0.00661
31.00653	0.00761
39.02365	0.00792
46.63535	0.00827
54.34643	0.00838
62.16627	0.00936
69.87211	0.00885];
units.tW_HL   = {'d', 'g'};  label.tW_HL = {'time', 'wet weight', 'high-low'};  
temp.tW_HL    = C2K(21);  units.temp.tW_HL = 'K'; label.temp.tW_HL = 'temperature';
bibkey.tW_HL = 'MarcRich2008';
comment.tW_HL = 'Step down in food supply';
%
data.tW_LH = [ ... % time since start experiment (d), wet weight (9)
0.000001	0.00279
7.637200	0.00335
15.25133	0.00399
23.26864	0.00433
30.88577	0.00532
39.00734	0.00599
46.61904	0.00634
54.33987	0.00761
69.89536	0.01160];
units.tW_LH   = {'d', 'g'};  label.tW_LH = {'time', 'wet weight', 'low-high'};  
temp.tW_LH    = C2K(21);  units.temp.tW_LH = 'K'; label.temp.tW_LH = 'temperature';
bibkey.tW_LH = 'MarcRich2008';
comment.tW_LH = 'Step up in food supply';
% food: adult D. melanogaster (average individual mass: 1.07 - 0.02 mg).
tcJX_C = [ ...  % time since start experiment (d), cumulative number of prey (#)
 0.000	 0.000
64.302	56.707
99.000  87.308];
%
tcJX_HL = [ ... % time since start experiment (d), cumulative number of prey (#)
 0.000	 0.366
 8.279	32.195
64.600	56.463
99.000  71.286];
%
tcJX_LH = [ ... % time since start experiment (d), cumulative number of prey (#)
 0.000	 0.000
47.931	20.488
56.415	53.537
64.798	56.341
99.000  86.504];

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

%% Group plots
set1 = {'tW_C', 'tW_LH', 'tW_HL',}; subtitle1 = {'Data for constant, low-high, high-low food supply'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Digestgion efficiency turns out to depend on food supply rate, and seems proportional to length';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '55ML4'; % Cat of Life
metaData.links.id_ITIS = '868558'; % ITIS
metaData.links.id_EoL = '1193770'; % Ency of Life
metaData.links.id_Wiki = 'Tetragnatha_versicolor'; % Wikipedia
metaData.links.id_ADW = 'Tetragnatha_versicolor'; % ADW
metaData.links.id_Taxo = '958783'; % Taxonomicon
metaData.links.id_WoRMS = '1491366'; % WoRMS
metaData.links.id_spider = '37011'; % spider

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tetragnatha}}';
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
bibkey = 'MarcRich2008'; type = 'Article'; bib = [ ... 
'author = {L. B. Marczak and J. S. Richardson}, ' ... 
'year = {2008}, ' ...
'title = {Growth and development rates in a riparian spider are altered by asynchrony between the timing and amount of a resource subsidy}, ' ...
'journal = {Oecologia}, ' ...
'volume = {156}, ' ...
'pages = {249-258}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Tetragnatha_versicolor/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Yosh2005'; type = 'Article'; bib = [ ... 
'author = {M. Yoshida}, ' ... 
'year = {2005}, ' ...
'title = {The number of eggs and cocoons produced by \emph{Tetragnatha praedonia} ({A}raneae: {T}etragnathidae) under rearing conditions}, ' ...
'journal = {Acta Arachnologica}, ' ...
'volume = {54}, ' ...
'number = {2}, ' ...
'pages = {77-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

