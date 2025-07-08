function [data, auxData, metaData, txtData, weights] = mydata_Sorex_araneus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Sorex_araneus'; 
metaData.species_en = 'Common shrew'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 23;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Chur1990';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 198;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.2*365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 6;    units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'IJssSche1977';

data.Wwb = 0.44; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 7.6;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'Chur1990';
  comment.Wwx = 'obtained from tW data at tx';
data.Wwp = 8.2;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'BajkChet2009';
data.Wwi = 8.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3*6/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'IJssSche1977';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.132	0.670
3.966	2.007
6.929	4.016
9.026	4.941
10.858	6.051
11.854	6.350
13.731	7.119
15.696	7.317
17.625	7.443
21.731	6.641
33.513	8.129];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(38.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Chur1990';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'T_a is taken high to allow for daily torpor';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'T can drop till 0 C during hibernation';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7WW78'; % Cat of Life
metaData.links.id_ITIS = '633779'; % ITIS
metaData.links.id_EoL = '124497'; % Ency of Life
metaData.links.id_Wiki = 'Sorex_araneus'; % Wikipedia
metaData.links.id_ADW = 'Sorex_araneus'; % ADW
metaData.links.id_Taxo = '169834'; % Taxonomicon
metaData.links.id_WoRMS = '1506665'; % WoRMS
metaData.links.id_MSW3 = '13700459'; % Mammal Spec World
metaData.links.id_AnAge = 'Sorex_araneus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sorex_araneus}}';
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
bibkey = 'Chur1990'; type = 'Book'; bib = [ ... 
'author = {Churfield, S.}, ' ... 
'year = {1990}, ' ...
'title = {The natural history of shrews}, ' ...
'publisher = {C Helm}, ' ...
'address = {London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BajkChet2009'; type = 'Article'; bib = [ ... 
'author = {Bajkowska, U. and Chetnicki, W. and Fedyk, S.}, ' ... 
'year = {2009}, ' ...
'title = {Breeding of the common shrew, \emph{Sorex araneus}, under laboratory conditions}, ' ...
'journal = {Folia ziol}, ' ...
'volume = {68}, ' ...
'pages = {1--8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IJssSche1977'; type = 'Book'; bib = [ ... 
'author = {IJsseling M.A. and Scheygrond, A.}, ' ... 
'year = {1977}, ' ...
'title = {Wat is dat voor een dier?}, ' ...
'publisher = {Thieme}, ' ...
'address = {Zutphen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sorex_araneus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

