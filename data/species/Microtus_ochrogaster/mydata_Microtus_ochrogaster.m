function [data, auxData, metaData, txtData, weights] = mydata_Microtus_ochrogaster
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_ochrogaster'; 
metaData.species_en = 'Prairie vole'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2017 12 31];              

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 47;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 3.02;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 16.7;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 40;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 4*3.8/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.8 pups per litter; 4 litters per yr';
  
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
    0  3.39
    2  4.66
    4  5.40
    6  6.63
    8  8.12
   10  9.76
   12 10.42];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(38.1);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'RaboWebs2002';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7VV8C'; % Cat of Life
metaData.links.id_ITIS = '180312'; % ITIS
metaData.links.id_EoL = '310271'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_ochrogaster'; % Wikipedia
metaData.links.id_ADW = 'Microtus_ochrogaster'; % ADW
metaData.links.id_Taxo = '62776'; % Taxonomicon
metaData.links.id_MSW3 = '13000286'; % Mammal Spec World
metaData.links.id_AnAge = 'Microtus_ochrogaster'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_ochrogaster}}';
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
bibkey = 'RaboWebs2002'; type = 'Article'; bib = [ ... 
'author = {David R. Rabon and W. M. David Webster and D. Kim Sawrey}, ' ... 
'year = {2002}, ' ...
'title = {EARLY POSTNATAL MASS IN MONTANE AND PRAIRIE VOLES (\emph{Microtus})}, ' ...
'journal = {Journal of the North Carolina Academy of Science}, ' ...
'volume = {118(1)}, ' ...
'pages = {57-60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Microtus_ochrogaster}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

