function [data, auxData, metaData, txtData, weights] = mydata_Tremarctos_ornatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Ursidae';
metaData.species    = 'Tremarctos_ornatus'; 
metaData.species_en = 'Spectacled bear'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 01]; 

%% set data
% zero-variate data

data.tg = 228;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 4*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 39*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 320;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'AnAge','Wiki'};
  comment.Wwb = 'animalcorner: 283 - 510 g';
data.Wwx = 1.3e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'guess';
  comment.Wwx = 'based on Ursus americanus, corrected for time since birth at weaning: 14e3*(90/198)^3';
data.Wwi = 65e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '35-82 kg; 65 kg on average';
data.Wwim = 115e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'Wiki';
  comment.Wwim = '100-200 kg, 115 kg on average';

data.Ri  = 2/365/3;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = {'Wiki','GarcRang2012'};   
  temp.Ri = C2K(37.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 2 pups each 3 yr';
 
  
%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 3 * weights.Wwx;
weights.tx = 3 * weights.tx;
%weights.tp = 3 * weights.tp;

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

%% Links
metaData.links.id_CoL = '5832V'; % Cat of Life
metaData.links.id_ITIS = '621849'; % ITIS
metaData.links.id_EoL = '328076'; % Ency of Life
metaData.links.id_Wiki = 'Tremarctos_ornatus'; % Wikipedia
metaData.links.id_ADW = 'Tremarctos_ornatus'; % ADW
metaData.links.id_Taxo = '66531'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000951'; % MSW3
metaData.links.id_AnAge = 'Tremarctos_ornatus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tremarctos_ornatus}}';
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
bibkey = 'GarcRang2012'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1365-2907.2011.00207.x}, ' ...
'author = {Garc\''{i}a-Rangel, S.}, ' ... 
'year = {2012}, ' ...
'title = {Andean bear \emph{Tremarctos ornatus} natural history and conservation}, ' ...
'journal = {Mammal Review}, ' ...
'valume = {42(2}, ' ...
'pages = {85–119}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tremarctos_ornatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'animalcorner'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animalcorner.org/animals/spectacled-bear/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

