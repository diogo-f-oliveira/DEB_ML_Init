function [data, auxData, metaData, txtData, weights] = mydata_Vestia_elata
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Clausiliidae';
metaData.species    = 'Vestia_elata'; 
metaData.species_en = 'Door snail'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biH'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 18]; 

%% set data
% zero-variate data

data.tp  = 4*30.5;   units.tp  = 'd'; label.tp  = 'time since birth at puberty';     bibkey.tp  = 'Suli2008';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am  = 5*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Alinda_biplicata';

data.Lb  = 0.17; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'Suli2008';
  comment.Lb = '1.0-1.6 mm';
data.Li  = 1.7; units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Suli2008';

data.Wwi  = 0.148; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on Alinda_biplicata';

data.Ri  = 22/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Suli2008';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'produced in 5 batches per yr';
 
% uni-variate data
% time-length
data.tL = [ ... % age (d), shell height (cm)
0.081	0.170
0.100	0.209
0.107	0.224
7.326	0.239
7.565	0.282
8.017	0.313
13.715	0.347
13.926	0.331
14.135	0.312
14.340	0.285
14.606	0.382
20.461	0.288
21.359	0.338
21.591	0.365
21.598	0.381
21.604	0.392
32.511	0.353
33.211	0.445
33.665	0.480
33.857	0.426
35.585	0.383
54.058	0.625
54.071	0.652
54.301	0.675
55.718	0.443
56.196	0.528
62.763	0.550
70.086	0.782
70.316	0.805
70.324	0.821
70.687	0.670
70.770	0.840
82.178	0.932
82.600	0.901
82.807	0.877
82.964	0.750
83.881	0.838
84.109	0.858
94.906	1.042
95.771	1.023
96.163	0.930
96.452	1.077
97.208	0.833
105.498	1.254
106.988	1.173
107.075	0.902
107.097	1.397
107.176	1.111
107.764	0.971
108.467	1.068
109.546	1.041
129.477	1.584
129.671	1.534
129.937	1.631
130.342	1.116
130.508	1.007
130.645	1.290
136.624	1.452
143.908	1.602
144.796	1.180
144.856	1.304
144.973	1.095
146.334	1.648
146.563	1.219
153.704	1.524
153.811	1.295
173.015	1.692
173.435	1.657
173.954	1.374
188.377	1.377
201.326	1.491
201.831	1.631
201.846	1.662
202.002	1.534
202.026	1.584
202.043	1.619
202.077	1.689];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Suli2008';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite; known as ovoviviparous, but does lay eggs in lab with well-developed embryos';
metaData.bibkey.F1 = 'Suli2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7G2WW'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '52226332'; % Ency of Life
metaData.links.id_Wiki = 'Vestia_(gastropod)'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5731832'; % Taxonomicon
metaData.links.id_WoRMS = '1050663'; % WoRMS
metaData.links.id_molluscabase = '1050663'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vestia_(gastropod)}}';
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
bibkey = 'Suli2008'; type = 'Article'; bib = [ ... 
'author = {Anna Sulikowska-Drozd}, ' ... 
'title = {Reproduction and growth of \emph{Vestia elata} ({R}ossm\"{a}ssler, 1836) ({G}astropoda, {C}lausiliidae) kept under laboratory conditions}, ' ...
'journal = {Mollusca}, ' ...
'number = {1}, ' ...
'volume = {26}, ' ...
'year = {2008}, ' ...
'pages = {99-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

