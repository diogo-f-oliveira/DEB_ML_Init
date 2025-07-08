function [data, auxData, metaData, txtData, weights] = mydata_Propithecus_tattersalli
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Indriidae';
metaData.species    = 'Propithecus_tattersalli'; 
metaData.species_en = 'Golden-crowned sifaka';

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TW'};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 10]; 

%% set data
% zero-variate data

data.tg = 145;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'EoL';   
  temp.tg = C2K(36.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '130 till 165 d';
data.tx = 5.5 * 7;   units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'EoL';   
  temp.tx = C2K(36.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'EoL';
  temp.tp = C2K(36.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 98;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 3545;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 2.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'EoL';   
  temp.Ri = C2K(36.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data

% time-weight
data.tW = [ ... % time since birth (wk), weight (g)
  4    132.5
  5    166.2
  6    172
  7.5  194.5
  8.5  234
  9.5  254
 11    288.6
 12    305.8
 13.5  366
 14    378
 15    567
 17    563
 18    617
 20    840
 21    999
 22   1180
 23   1335
 24.5 1430
 25.5 1539
 27   1748
 28   1794];
data.tW(:,1) = 7 * data.tW(:,1); % convert wk to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Coff1990';
comment.tW = 'hand-reared';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'scaled functional response turned out to vary during handrearing; initial health problems';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Hindgut fermentation';
metaData.bibkey.F1 = 'Coff1990'; 
metaData.facts = struct('F1',F1);


%% Links
metaData.links.id_CoL = '6W9Q9'; % Cat of Life
metaData.links.id_ITIS = '572884'; % ITIS
metaData.links.id_EoL = '326523'; % Ency of Life
metaData.links.id_Wiki = 'Propithecus_tattersalli'; % Wikipedia
metaData.links.id_ADW = 'Propithecus_tattersalli'; % ADW
metaData.links.id_Taxo = '65524'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100094'; % MSW3
metaData.links.id_AnAge = 'Propithecus_tattersalli'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Propithecus_tattersalli}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Propithecus_tattersalli}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/326523/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Coff1990'; type = 'Article'; bib = [ ... 
'author = {B. S. Coffman}, ' ... 
'year = {1990}, ' ...
'title = {Hand-rearing and reintroduction of a Golden-crowned sifaki \emph{Propithecus tattersalli} at the {Duke University Primate Center}}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {29}, ' ...
'pages = {137-143}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

