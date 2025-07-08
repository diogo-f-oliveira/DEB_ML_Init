function [data, auxData, metaData, txtData, weights] = mydata_Mauremys_reevesii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Mauremys_reevesii'; 
metaData.species_en = 'Chinese pond turtle';

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'piO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am';'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 03];

%% set data
% zero-variate data

data.ab = 63;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'DuShen2009';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '70-144 d';
data.am = 24.2*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 


data.Wwb = 4.3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'DuShen2009';
data.Wwp = 70; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'DuShen2009';
data.Wwi = 1753; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';
data.Wwim = 1553; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males';   bibkey.Wwim = 'guess';
 comment.Wwim = 'based on "males are somewhat smaller than females"';

data.Ri  = 5.1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(28);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.1 eggs er clutch, 1 clutche per yr assumed';
 
% uni-variate data

% time-weight
data.tWw = [ ... % time since birth (d), wet weight (g)
0.000	4.344
0.000	6.466
0.000	8.587
89.984	34.234
89.990	36.355
90.000	39.537
178.770	70.483
178.783	74.726
178.812	84.271
267.740	167.187
269.831	152.343
269.848	157.646
390.860	251.236
390.895	262.903
391.886	237.450
458.327	303.349
458.349	310.773
460.369	272.596];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(28);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'DuShen2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

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
F1 = 'Hybridizes with quite a few other species, which are not all closely related';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3YFWL'; % Cat of Life
metaData.links.id_ITIS = '949163'; % ITIS
metaData.links.id_EoL = '4520624'; % Ency of Life
metaData.links.id_Wiki = 'Mauremys_reevesii'; % Wikipedia
metaData.links.id_ADW = 'Mauremys_reevesii'; % ADW
metaData.links.id_Taxo = '1685683'; % Taxonomicon
metaData.links.id_WoRMS = '1451623'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Mauremys&species=reevesii'; % ReptileDB
metaData.links.id_AnAge = 'Mauremys_reevesii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mauremys_reevesii}}';
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
bibkey = 'DuShen2009'; type = 'Article'; bib = [ ... 
'doi = {10.1016/j.jtherbio.2009.03.002}, ' ...
'author = {Wei-Guo Du and  Jian-Wei Shen and Lei Wang}, ' ... 
'year = {2009}, ' ...
'title = {Embryonic development rate and hatchling phenotypes in the {C}hinese three-keeled pond turtle (\emph{Chinemys reevesii}): The influence of fluctuating temperature versus constant temperature}, ' ...
'journal = {Journal of Thermal Biology}, ' ...
'volume = {34)}, ' ...
'pages = {250-255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mauremys_reevesii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/4520624}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

