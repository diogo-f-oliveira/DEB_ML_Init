function [data, auxData, metaData, txtData, weights] = mydata_Morelia_spilota
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Pythonidae';
metaData.species    = 'Morelia_spilota'; 
metaData.species_en = 'Carpet python'; 

metaData.ecoCode.climate = {'Aw','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bTg', 'biTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 12 25];

%% set data
% zero-variate data

data.ab = 63;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'AnAge';
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 730;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 19.6*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'Wiki';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 58;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'Fear1996';
  comment.Lb = 'SVL 48 cm';
data.Li  = 400;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';

data.Wwb = 30.4;     units.Wwb = 'g';  label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Fear1996';
data.Wwi = 15.9e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';
data.Wwim = 10e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'guess';
  
data.Ri  = 30/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(28);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-50 eggs per clutch, 1 clutch per yr assumed';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), SVL (cm)
  0.000	 48.567
 31.443	 59.461
 61.711	 73.532
 92.879	 84.879
124.002	 88.511
155.240	112.113
186.400	122.099
214.808	130.723
245.970	141.163
275.318	154.326
305.564	164.312
335.824	177.021
364.208	181.560];
data.tL(:,2) = data.tL(:,2) * 1.177; % convert SVL to TL
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Fear1996'; 

% time-weight
data.tW = [ ... % time since birth (d), weight (g)
 0.000	31.773
32.049	54.468
63.180	104.397
92.484	158.865
124.572	281.418
155.789	481.135
186.060	626.383
215.502	921.418
246.843	1339.007
277.195	1624.965
304.851	1997.163
335.156	2201.418
364.028	3100.142];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(28);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Fear1996'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 5 * weights.tW;
weights.Wwb = 5 * weights.Wwb;
weights.ab = 5 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Mother generates heat to warm the eggs';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6RPMC'; % Cat of Life
metaData.links.id_ITIS = '634780'; % ITIS
metaData.links.id_EoL = '791411'; % Ency of Life
metaData.links.id_Wiki = 'Morelia_spilota'; % Wikipedia
metaData.links.id_ADW = 'Morelia_spilota'; % ADW
metaData.links.id_Taxo = '93833'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Morelia&species=spilota'; % ReptileDB
metaData.links.id_AnAge = 'Morelia_spilota'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Morelia_spilota}}';
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
bibkey = 'Fear1996'; type = 'Article'; bib = [ ... 
'author = {Simon Fearn}, ' ... 
'year = {1996}, ' ...
'title = {CAPTIVE GROWTH OF A CARPET PYTHON \emph{Morelia spilota}}, ' ...
'journal = {Litteratura Serpentium  • 1111111ber 4}, ' ...
'volume = {16(4)}, ' ...
'pages = {94-102}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Morelia_spilota}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Morelia_spilota/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];