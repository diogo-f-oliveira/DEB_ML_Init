function [data, auxData, metaData, txtData, weights] = mydata_Acipenser_oxyrinchus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acipenseriformes'; 
metaData.family     = 'Acipenseridae';
metaData.species    = 'Acipenser_oxyrinchus'; 
metaData.species_en = 'Atlantic sturgeon'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iMcd', '0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp - this is not sure as the species  migrates from sea to fresh water
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 05 19];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 05 23]; 

%% set data
% zero-variate data;
data.ab = 7; units.ab = 'd';      label.ab = 'age at hatch';   bibkey.ab = 'FishBase';    
  temp.ab = C2K(17.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'reported in Fishbase as hatch time'; 
data.tp = 8*365;  units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Wiki';
  temp.tp = C2K(17); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'temp is guessed- wiki says between 8 and 17 years';
data.tp_m = 7*365;  units.tp_m = 'd'; label.tp_m = 'time since birth at puberty for male'; bibkey.tp_m = 'Wiki';
  temp.tp_m = C2K(17); units.temp.tp_m = 'K'; label.temp.tp_m = 'temperature'; 
  comment.tp_m = 'temp is guessed- wiki says between 7 and 12 years';
data.am = 60*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'FishBase';   
  temp.am = C2K(17);units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temperature is guessed';

data.Li  = 430;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female'; bibkey.Li  = 'FishBase';
data.Li_m  = 403;   units.Li_m  = 'cm'; label.Li_m  = 'ultimate total length for male'; bibkey.Li_m  = 'FishBase';

data.Wwb = 8.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MimsLazu2002';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3'; 
data.Wwi = 202.4e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'AnAge';

data.Ri  = 8e6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'FishBase';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temperature is guessed, Fishbase says 0.4-8 million eggs may be spawned per female';

% uni-variate data
% time-length
tLW = [ ... % time (d), total length (cm), wet weight (g)
 34  3.2    1.2
 42  5.2    5.0
 51  7.9    7.2
 55  7.6   12
 76 15.0   20
 85 17.2   27
 99 21.5   36
111 24.1   43
138 27.9   67
152 31.9  117
167 34.3  157
194 39.7  250
229 47.2  459
258 53.5  672
289 62.0 1016
320 66.5 1287
348 69.7 1581
365 71.9 1866
383 75.5 2093
440 80.5 2605
502 84.9 3064];
tLW(:,1) = tLW(:,1) - 34; % set first observation of culture at origin
data.tL = tLW(:,1:2);
units.tL  = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL   = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MasoClug1992';
comment.tL = 'temperature varied seasonally between 17 and 27 C';

% time-weight
data.tW = tLW(:,[1 3]);
units.tW  = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW   = C2K(23);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MasoClug1992';
comment.tW = 'temperature varied seasonally between 17 and 27 C';

% length-weight
data.LW = tLW(:,[2 3]);
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'MasoClug1992';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 0 * weights.Wwi;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Ultimate weight is ignored because of inconsistency with LW data';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = '';
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9C6W'; % Cat of Life
metaData.links.id_ITIS = '553269'; % ITIS
metaData.links.id_EoL = '46561171'; % Ency of Life
metaData.links.id_Wiki = 'Acipenser_oxyrinchus'; % Wikipedia
metaData.links.id_ADW = 'Acipenser_oxyrinchus'; % ADW
metaData.links.id_Taxo = '107322'; % Taxonomicon
metaData.links.id_WoRMS = '151802'; % WoRMS
metaData.links.id_fishbase = 'Acipenser-oxyrinchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Acipenser_oxyrinchus}}';  
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
bibkey = 'FishBase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Acipenser-oxyrinchus+desotoi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'nasps'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.nasps-sturgeon.org/sturgeons/biology/systematics/acipenser-oxyrinchus-desotoi.aspx}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MasoClug1992'; type = 'Article'; bib = [ ...    
'author = {Mason, W. T. and Clugston, J. P. and Foster, A. M.}, ' ...
'year  = {1992}, ' ...
'title = {Growth of Laboratory-Held Gulf of {M}exico Sturgeon (\emph{Acipenser oxyrhynchus desotoi})}, ' ...  
'journal = {The Progressive Fish-Culturist}, ' ...
'volume = {54}, ' ...
'doi = {10.1577/1548-8640(1992)054<0059:GOLHGO>2.3.CO;2}, ' ...
'pages = {59--61}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MimsLazu2002'; type = 'techreport'; bib = [ ...    
'author = {Steven D. Mims and Andrew Lazur and William L. Shelton and Boris Gomelsky and Frank Chapman}, ' ...
'year  = {2002}, ' ...
'title = {Species Profile Production of Sturgeon}, ' ...  
'institution = {Southern Regional Aquaculture Center}, ' ...
'series = {SRAC Publication}, ' ...
'volume = {7200}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Acipenser_oxyrinchus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

