function [data, auxData, metaData, txtData, weights] = mydata_Lampetra_lanceolata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Lampetra_lanceolata'; 
metaData.species_en = 'Turkish brook lamprey'; 

metaData.ecoCode.climate = {'Dfa','MC'};
metaData.ecoCode.ecozone = {'THp','MAbl'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temperature
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2023 12 31];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam'};      

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 31];

%% set data
% zero-variate data;
data.am = 4*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'GozlEngi2011';   
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'GozlEngi2011: temp 5.4-22.4 C, mean 10 C';

data.Lp  = 13;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'GozlEngi2011';
data.Li  = 17.3;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'GozlEngi2011';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GozlEngi2011';
  comment.Wwb = 'based on egg diameter of 0.821 mm: pi/6*0.0821^3';
data.Wwp = 2.7;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'fishbase','GozlEngi2011'};
  comment.Wwp = 'based on 0.00126*Lp^2.99, see F2)';
data.Wwi = 9.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'GozlEngi2011';

data.NR  = 1898.5;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'GozlEngi2011';   
  temp.NR = C2K(10); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (d), total length (cm)
    0  2.64
    1  9.47
    2 13.09
    3 15.64];
data.tL(:,1) = 365 * (0.3+data.tL(:,1));
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GozlEngi2011';

% length-weight
data.LW = [ ... % length (cm), weight (g)
1.950	0.061
2.176	0.121
2.350	0.061
4.076	0.162
4.551	0.283
4.977	0.323
5.977	0.384
5.982	1.414
6.703	0.687
6.954	0.808
7.028	0.646
7.254	0.848
7.504	0.869
7.530	1.051
7.629	0.747
7.655	1.071
7.755	0.970
7.880	0.970
8.031	1.253
8.055	0.949
8.105	1.091
8.256	1.172
8.506	1.172
8.532	1.354
8.657	1.333
8.831	1.192
8.907	1.333
9.107	1.475
9.156	1.192
9.183	1.596
9.234	1.798
9.433	1.697
9.683	1.596
9.735	2.000
9.759	1.798
9.960	2.061
10.085	1.939
10.108	1.717
10.312	2.364
10.436	2.222
10.512	2.424
10.513	2.566
10.561	2.263
10.762	2.485
10.888	2.525
10.962	2.424
10.988	2.606
11.036	2.242
11.064	2.828
11.112	2.364
11.288	2.525
11.414	2.768
11.466	3.131
11.515	3.010
11.565	3.111
11.738	2.667
11.943	3.576
12.041	3.293
12.117	3.455
12.118	3.556
12.268	3.657
12.394	3.778
12.492	3.515
12.795	3.980
12.815	3.051
12.899	4.808
12.973	4.626
12.997	4.424
12.997	4.505
13.046	4.303
13.100	5.111
13.181	6.182
13.250	5.091
13.296	4.202
13.303	5.596
13.345	3.980
13.397	4.404
13.400	5.051
13.497	4.505
13.546	4.162
13.699	4.747
13.700	4.949
13.802	5.434
13.822	4.485
13.976	5.152
13.978	5.556
14.026	5.273
14.027	5.374
14.149	4.848
14.229	5.919
14.280	6.061
14.405	6.000
14.461	7.212
14.529	5.778
14.552	5.414
14.555	5.980
14.679	5.737
14.831	6.242
14.908	6.525
14.956	6.242
14.957	6.404
15.010	7.091
15.062	7.333
15.147	9.434
15.209	6.828
15.360	7.091
15.386	7.253
15.449	4.828
15.482	6.364
15.490	8.020
15.513	7.596
15.843	8.566
15.944	8.869
15.966	8.303
16.011	7.192
16.014	7.758
16.022	9.434
16.492	8.343
16.993	8.667
17.321	9.131];
units.LW = {'cm', 'g'};     label.LW = {'total length','wiehgt'};  
bibkey.LW = 'GozlEngi2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'spawns once at end of life; no feeding as adult, no parasitic stage';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00126*(TL in cm)^2.99';
metaData.bibkey.F2 = 'fishbase';
F3 = 'Endemic of the Iyidere stream system,';
metaData.bibkey.F3 = 'GozlEngi2011';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '6NVL8'; % Cat of Life
metaData.links.id_ITIS = '622247'; % ITIS
metaData.links.id_EoL = '46582325'; % Ency of Life
metaData.links.id_Wiki = 'Lampetra_lanceolata'; % Wikipedia
metaData.links.id_ADW = 'Lampetra_lanceolata'; % ADW
metaData.links.id_Taxo = '178160'; % Taxonomicon
metaData.links.id_WoRMS = '271317'; % WoRMS
metaData.links.id_fishbase = 'Lampetra-lanceolata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampetra_lanceolata}}';  
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
bibkey = 'GozlEngi2011'; type = 'article'; bib = [ ...  
'author = {Ahmet Mutlu G\"{o}zler and Semih Engin and Davut Turan and Cemalettin \c{S}ahin}, ' ...
'year = {2011}, ' ...
'title  = {Age, growth and fecundity of the {T}urkish Brook Lamprey, \emph{Eudontomyzon lanceolata} ({K}ux \& {S}teiner, 1972), in north-eastern {T}urkey}, ' ...
'journal = {Zoology in the Middle East}, ' ...
'volume = {52}, ' ...
'page = {57-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lampetra-lanceolata.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
