function [data, auxData, metaData, txtData, weights] = mydata_Rossia_macrosoma

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiolida'; 
metaData.family     = 'Sepiolidae';
metaData.species    = 'Rossia_macrosoma'; 
metaData.species_en = 'Stout Bobtail'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 29]; 

%% set data
% zero-variate data

data.ab = 110;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'BoleBole1973';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BoleBole1973';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 270;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BoleBole1973';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.5; units.Lb  = 'cm';  label.Lb  = 'mantle length at birth';   bibkey.Lb  = 'BoleBole1973';
data.Li  = 8.5; units.Li  = 'cm';  label.Li  = 'mantle length at death';   bibkey.Li  = 'BoleBole1973';

data.Wwb = 0.1;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BoleBole1973';

data.Ni  = 30; units.Ni  = '#'; label.Ni  = 'cum reprod at death';    bibkey.Ni  = 'BoleBole1973';   
  temp.Ni = C2K(15);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '20 to 80 eggs';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
0.000	0.618
8.352	0.611
40.015	0.844
65.074	1.017
91.151	1.241
134.453	1.704
167.529	2.090];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BoleBole1973';
 
% length-weight
data.LW = [ ... % wet weight (g), mantle length (cm)
0.101	0.547
0.126	0.615
0.135	0.615
0.209	0.802
0.229	0.811
0.292	0.892
0.361	1.068
0.385	1.068
1.165	1.778
1.268	2.105
1.371	1.956
1.462	1.957
1.536	2.151
1.603	2.292
1.697	2.520
1.758	2.713
1.821	2.521
1.847	2.830
1.983	2.831
1.997	2.575
2.099	3.212
2.351	2.924
2.489	2.925
2.653	3.019
2.909	3.183
3.306	3.614
4.884	4.758
4.919	4.194
5.060	4.329
5.471	4.761
5.790	5.180
5.832	4.566
6.579	5.405
7.529	5.883
7.637	5.524
8.494	6.139
10.143	6.545];
data.LW = data.LW(:,[2 1]); % reverse sequence
units.LW   = {'cm', 'g'};  label.LW = {'mantle length', 'wet weight'};  
bibkey.LW = 'BoleBole1973';
comment.LW = 'hatching can take place at size smaller than birth';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Zoom factor z was fixed and ab ignored';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Death is programmed, not by ageing; reprod once just before death';
metaData.bibkey.F1 = 'BoleBole1973'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '78Y83'; % Cat of Life
metaData.links.id_ITIS = '573159'; % ITIS
metaData.links.id_EoL = '450463'; % Ency of Life
metaData.links.id_Wiki = 'Rossia'; % Wikipedia
metaData.links.id_ADW = 'Rossia_macrosoma'; % ADW
metaData.links.id_Taxo = '40216'; % Taxonomicon
metaData.links.id_WoRMS = '141449'; % WoRMS
metaData.links.id_molluscabase = '141449'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rossia}}';
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
bibkey = 'BoleBole1973'; type = 'Article'; bib = [ ... 
'author = {S. von Boletzky and M. V. von Boletzky}, ' ... 
'year = {1973}, ' ...
'title = {Observations on the embryonic and early post-embryonic development of \emph{Rossia macrosoma} ({M}ollusca, {C}ephalopoda)}, ' ...
'journal = {Helgol\"{a}nder wiss. Meeresunters}, ' ...
'volume = {25}, ' ...
'pages = {135-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

