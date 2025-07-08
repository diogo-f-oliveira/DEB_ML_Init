function [data, auxData, metaData, txtData, weights] = mydata_Tamias_townsendii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Tamias_townsendii'; 
metaData.species_en = 'Townsend''s chipmunk';

metaData.ecoCode.climate = {'BSk', 'Cs', 'Dsb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 01 02]; 

%% set data
% zero-variate data

data.tg = 28;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 50;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 353;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.2*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Data is uncertain';

data.Wwb = 3.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 35; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';      bibkey.Wwx = 'AnAge';
data.Wwi = 75; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'AnAge';

data.Ri  = 4.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4.5 pups per litter; 1 litter per yr';
  
% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
    1  3.8
    4  5.4
    6  6.7
   10  9.4
   12 11.2
   14 13.5
   16 15.2
   18 17.1
   20 19.2
   22 21.1
   24 23.5
   27 26.6
   29 28.5
   34 33.7
   48 44.2
   55 50.3];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(38.7);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ForbTurn1972';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature is from Tamias amoenus';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7WYZN'; % Cat of Life
metaData.links.id_ITIS = '180208'; % ITIS
metaData.links.id_EoL = '311527'; % Ency of Life
metaData.links.id_Wiki = 'Tamias_townsendii'; % Wikipedia
metaData.links.id_ADW = 'Tamias_townsendii'; % ADW
metaData.links.id_Taxo = '170038'; % Taxonomicon
metaData.links.id_MSW3 = '12401240'; % Mammal Spec World
metaData.links.id_AnAge = 'Tamias_townsendii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tamias_townsendii}}';
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
bibkey = 'ForbTurn1972'; type = 'Article'; bib = [ ...  
'doi = {10.2307/1379173}, ' ...
'author = {Forbes, R. B. and Turner, L. W.}, ' ...
'year = {1972}, ' ...
'title  = {Notes on Two Litters of {T}ownsend’s Chipmunks}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {53(2)}, ' ...
'pages = {355–359}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tamias_townsendii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
