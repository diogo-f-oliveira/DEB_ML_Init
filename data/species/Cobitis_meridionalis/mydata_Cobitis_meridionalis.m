  function [data, auxData, metaData, txtData, weights] = mydata_Cobitis_meridionalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Cobitis_meridionalis'; 
metaData.species_en = 'Prespa spined loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 09];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 09];

%% set data
% zero-variate data
data.am = 3*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'smallest females with mature eggs was TL 7.8';
data.Li = 12.1;    units.Li = 'cm'; label.Li = 'ultimate total length for females'; bibkey.Li = 'CrivLee2000';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'CrivLee2000';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 0.76;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00562*Lp^3.05, see F1';
data.Wwi = 11.3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = {'CrivLee2000','fishbase'};
  comment.Wwi = 'Based on 0.00562*Li^3.05, see F1';

data.Ri = 676/365;   units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'CrivLee2000';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
0.846	0.162
5.444	0.651
10.263	1.626
14.522	2.438
20.022	2.745
24.640	3.092
29.851	3.378
34.199	3.583
39.419	3.809
44.335	4.115
48.975	4.320
54.758	4.688
59.689	4.893
64.322	5.139
68.360	5.465
74.176	5.610
78.526	5.794
84.916	6.000
88.987	6.104
94.513	6.228
99.156	6.413
104.697	6.436
109.348	6.560
115.458	6.685
119.829	6.728
124.770	6.872
129.718	6.956
134.084	7.040
138.437	7.204
143.678	7.288
148.037	7.412];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CrivLee2000'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.Ri = 3 * weights.Ri;
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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww (in g) = 0.00562*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
F2 = 'known from Lake Prespa (Greece, Albania, and Macedonia)';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'WJZZ'; % Cat of Life
metaData.links.id_ITIS = '687860'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Cobitis_meridionalis'; % Wikipedia
metaData.links.id_ADW = 'Cobitis_meridionalis'; % ADW
metaData.links.id_Taxo = '171515'; % Taxonomicon
metaData.links.id_WoRMS = '1016499'; % WoRMS
metaData.links.id_fishbase = 'Cobitis-meridionalis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cobitis_meridionalis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%73167
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CrivLee2000'; type = 'Article'; bib = [ ...  
'author = {Crivelli, A. J. and Lee, T. A.}, ' ...
'year = {2000}, ' ...
'title = {Observations on the age, growth and fecundity of \emph{Cobitis meridionalis}, an endemic loach of {L}ake {P}respa}, ' ... 
'journal = {Folia Zool. : }, ' ...
'volume = {49(Suppl. 1)}, '...
'pages = {121-128}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cobitis-meridionalis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

