function [data, auxData, metaData, txtData, weights] = mydata_Aspidoscelis_sexlineatus

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Teiidae';
metaData.species    = 'Aspidoscelis_sexlineatus';
metaData.species_en = 'Six-lined racerunner';

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 08];

%% set data
% zero-variate data;
data.ab = 55;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'guess';
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on values for other Aspidoscelis species';

data.Lb  = 3.2;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Fitc1958';
data.Lp  = 5.3;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'Fitc1958';
data.Li  = 8.1;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Fitc1958';
 
data.Wwb  = 0.84;   units.Wwb  = 'g';  label.Wwb  = 'weight at birth';   bibkey.Wwb  = 'Fitc1958';
data.Wwi  = 9.1;   units.Wwi  = 'g';  label.Wwi  = 'ultimate weight for females';   bibkey.Wwi  = 'Fitc1958';

% univariate data
% time - length
data.tL = [ ... % time since birth (d),  SVL (cm)
4.203	3.287
56.747	3.992
121.900	4.749
199.664	5.142
243.800	5.439
325.768	6.153
397.226	6.867
519.127	7.253
872.217	7.525
1195.883	7.873
1445.988	8.133];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fitc1958';

% time - weight
data.tW = [ ... % time since birth (d),  weight (g)
1.882	0.969
29.147	1.214
48.036	1.329
123.480	2.260
203.205	2.865
322.535	4.871
408.192	7.069
506.695	8.261
859.587	9.110
1187.262	9.942
1443.639	10.087];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Fitc1958';

% length - fecundity
data.LN = [ ... SVL (cm), feundity (#)
5.377	1.988
5.852	1.969
5.973	0.994
6.031	1.978
6.119	1.929
6.130	2.077
6.152	0.994
6.320	1.004
6.355	2.972
6.427	1.969
6.435	2.992
6.553	2.972
6.730	4.016
6.736	0.984
6.878	3.927
6.879	4.035
6.939	2.972
6.997	3.976
7.041	1.978
7.116	3.976
7.167	2.982
7.670	3.996
8.559	4.921
8.560	5.010];
units.LN  = {'cm', '#'};  label.LN = {'SVL', 'fecundity'};  
temp.LN   = C2K(20);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Fitc1958';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'HHJK'; % Cat of Life
metaData.links.id_ITIS = '914096'; % ITIS
metaData.links.id_EoL = '52233880'; % Ency of Life
metaData.links.id_Wiki = 'Aspidoscelis_sexlineatus'; % Wikipedia
metaData.links.id_ADW = 'Cnemidophorus_sexlineatus'; % ADW
metaData.links.id_Taxo = '49331'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Aspidoscelis&species=sexlineatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aspidoscelis_sexlineatus}}';   
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
bibkey = 'Fitc1958'; type = 'Article'; bib = [ ...
'author = {Fitch, H. S.}, ' ...
'title = {Natural history of the six-lined race-runner (\emph{Cnemidophorus sexlineatus})}, ' ...
'journal = {Univ. Kan. Publ. Mus. Nat. Hist.}, ' ...
'volume = {11}, ' ...
'pages = {11-62}, ' ...
'year = {1958}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
