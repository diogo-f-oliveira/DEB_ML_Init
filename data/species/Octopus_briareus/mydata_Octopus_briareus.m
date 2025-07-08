function [data, auxData, metaData, txtData, weights] = mydata_Octopus_briareus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_briareus'; 
metaData.species_en = 'Caribbean reef octopus '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW','MAg'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 05]; 

%% set data
% zero-variate data

data.ab = 50;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'HanlWolt1989';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 518;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'HanlWolt1989';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8;      units.Lp  = 'cm';  label.Lp  = 'mantle length at puberty';  bibkey.Lp  = 'HanlWolt1989';
  comment.Lp = '4.5-12 cm';

data.Wwb = 0.127;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HanlWolt1989';
  comment.Wwb = 'based on egg length 10-14 mm, width 4-5 mm: pi/6*1.2*0.45^2';
data.Wwi = 1500;  units.Wwi = 'g';   label.Wwi = 'wet weight at death';     bibkey.Wwi = 'Wiki';

data.Ni  = 955;  units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'HanlWolt1989';   
  temp.Ni = C2K(25);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
2.043	0.805
4.148	1.024
6.114	1.358
8.148	1.526
9.976	1.999
11.947	2.690
14.126	3.202
16.021	3.510
18.135	4.354
20.087	2.208
22.061	2.852
24.098	3.174
26.216	4.362
28.183	4.769
30.222	5.545
31.986	7.164
34.098	8.705
36.065	9.602
38.024	9.282
40.126	9.214
42.372	10.075
44.046	8.840
46.377	12.697
47.977	10.202];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HanlWolt1989';

% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
    14   0.20
    28   0.50
    42   0.98
    68   1.75
    70   3.49
    84   8.07
    98  14.03
   112  25.02
   126  45.33
   140  68.49
   154 121.78
   168 183.71
   182 281.77
   196 362.50
   211 450.48
   224 546.32
   238 645.46
   252 707.42 
   266 746.70
   281 826.54
   295 877.28
   309 811.86
   324 869.50
   336 847.24];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'HanlWolt1989';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'z is not well-fixed by data, size ultimate size is much larger than size at death';
D2 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'semelparous: death at first spawning';
metaData.bibkey.F1 = 'HanlWolt1989'; 
F2 = 'No planktontic larval stage; strongly cannibalistic';
metaData.bibkey.F2 = 'HanlWolt1989'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '48KKC'; % Cat of Life
metaData.links.id_ITIS = '82610'; % ITIS
metaData.links.id_EoL = '492284'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_briareus'; % Wikipedia
metaData.links.id_ADW = 'Octopus_briareus'; % ADW
metaData.links.id_Taxo = '158209'; % Taxonomicon
metaData.links.id_WoRMS = '341954'; % WoRMS
metaData.links.id_molluscabase = '341954'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus_briareus}}';
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
bibkey = 'HanlWolt1989'; type = 'Article'; bib = [ ... 
'author = {Hanlon, R.T. and M.R. Wolterding}, ' ... 
'year = {1989}, ' ...
'title = {Behavior, body patterning, growth and life history of \emph{Octopus briareus} cultured in the laboratory}, ' ...
'journal = {Am. Malacol. Bull.}, ' ...
'volume = {7}, ' ...
'pages = {21-45}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

