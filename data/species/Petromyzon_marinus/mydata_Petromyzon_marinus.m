function [data, auxData, metaData, txtData, weights] = mydata_Petromyzon_marinus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Petromyzon_marinus'; 
metaData.species_en = 'Sea lamprey'; 

metaData.ecoCode.climate = {'Dfb', 'Dfc', 'ME', 'MC'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0pFc', 'piMc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bpD', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(5); % K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am';'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t_L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2018 10 29];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 29]; 

%% set data
% zero-variate data;
data.ab = 35;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'ADW';    
  temp.ab = C2K(8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3 to 8 weeks';
data.ap = 5*365;    units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = {'Hard1969','ADW'};
  temp.ap = C2K(11); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 11*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 13.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'Hard1969';
data.Li  = 120;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4; units.Wwb = 'g';   label.Wwb = 'dry weight at birth';   bibkey.Wwb = 'SmitMars2009';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwi = 2300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';

data.NR  = 1e5;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'ADW';   
  temp.NR = C2K(11); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... time since hatch (yr), total length (cm)
     1  3.4 
     2  5.8
     3  8.2
     4 10.6
     5 12.0];
data.tL(:,1) = data.tL(:,1) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Hard1969';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 5 * weights.Li;
weights.Lp = 0 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'assumption: W_i excludes eggs; Lp is ignored due to inconsistency of (tp,Lp) with tL';
D2 = 'temperatures are guess';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'spawns once at end of life; anadromous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '6V6DZ'; % Cat of Life
metaData.links.id_ITIS = '159722'; % ITIS
metaData.links.id_EoL = '46582331'; % Ency of Life
metaData.links.id_Wiki = 'Petromyzon_marinus'; % Wikipedia
metaData.links.id_ADW = 'Petromyzon_marinus'; % ADW
metaData.links.id_Taxo = '41690'; % Taxonomicon
metaData.links.id_WoRMS = '101174'; % WoRMS
metaData.links.id_fishbase = 'Petromyzon-marinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Petromyzon_marinus}}';  
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
bibkey = 'KellKing2011'; type = 'article'; bib = [ ...  
'author = {Kelly, F. L. and King, J. J.}, ' ...
'year = {2011}, ' ...
'title  = {A Review of the ecology and distribution of the three lamprey species, \emph{Lampetra fluviatilis} ({L}.), \emph{Lampetra planeri} ({B}loch) and \emph{Petromyzon marinus} ({L}.): a context for conservation and biodiversity considerations in {I}reland}, ' ...
'journal = {Biology and Environment: proceedings of the royal irish academy.}, ' ...
'volume = {101B (3)}, ' ...
'page = {165-185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hard1969'; type = 'article'; bib = [ ...  
'author = {M. W. Hardisty}, ' ...
'year = {1969}, ' ...
'title  = {Information on the growth of the ammocoete larva of the anadromous Sea lamprey, \emph{Petromyzon marinus} in {B}ritish rivers}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {159}, ' ...
'page = {139-144}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hard1961'; type = 'article'; bib = [ ...  
'author = {Hardisty, M. W.}, ' ...
'year = {1961}, ' ...
'title  = {The growth of larval lampreys.}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {30(2)}, ' ...
'page = {357--371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SmitMars2009'; type = 'article'; bib = [ ...  
'author = {S. J. Smith and J. E. Marsden}, ' ...
'year = {2009}, ' ...
'title  = {Factors Affecting Sea Lamprey Egg Survival}, ' ...
'journal = {North American Journal of Fisheries Management}, ' ...
'volume = {29}, ' ...
'page = {859-868}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/2530}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Petromyzon_marinus/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  