function [data, auxData, metaData, txtData, weights] = mydata_Echinocardium_cordatum

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Spatangoida'; 
metaData.family     = 'Loveniidae';
metaData.species    = 'Echinocardium_cordatum'; 
metaData.species_en = 'Sea potato'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 04]; 

%% set data
% zero-variate data

data.tj = 39;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'BIOTIC';
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temp guessed';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Buch1966';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp guessed';
data.am = 20*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'BIOTIC';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp guessed';

data.Lp  = 5.6;    units.Lp  = 'cm';  label.Lp  = 'test length at puberty'; bibkey.Lp  = 'DuinJenn1984';
  comment.Lp = 'Read from tL data for tp, and converted to test length: 3.3 * 5.56/ 3.3, see F2';
data.Li  = 9;      units.Li  = 'cm';  label.Li  = 'ultimate test length';   bibkey.Li  = 'Wiki';

data.Wwb = 8.8e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Kash2007';
  comment.Wwb = 'based on egg diameter of 119 mum: pi/6*0.0119^3';
data.Wwp = 61.2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Buch1966';
  comment.Wwp = 'computed as (Lp/Li)^3*Wwi, see F2';  
data.Wwi = 254;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  comment.Wwi = 'computed as (9/5.56)^3*60, see F2';

data.Ri = 1e6/365;    units.Ri = 'd';    label.Ri = 'max reprod rate';      bibkey.Ri = 'BIOTIC';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp guessed';
 
% uni-variate data

% time-length
% southern site
data.tL = [ ... % time since settlement (yr), length of ventral plate (cm)
 1	1.176
 2	2.383
 3	3.263
 4	3.837
 5	4.009
 6	4.234
 7	4.195
 8	4.198
 9	4.317
10	4.658];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 5.56/ 3.3; % convert ventral plate length to test length
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'test length', 'southern site North Sea'};  
temp.tL    = C2K(8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DuinJenn1984';
comment.tL = 'Data for southern site North Sea; time derived from rings';
% intermediate site
data.tL1 = [ ... % time since settlement (yr), length of ventral plate (cm)
 1	1.091
 2	2.108
 3	2.703
 4	3.129
 5	3.333
 6	3.431
 7	3.561
 8	3.606
 9	3.557
10	3.602];
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d
data.tL1(:,2) = data.tL1(:,2) * 5.56/ 3.3; % convert ventral plate length to test length
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since settlement', 'test length', 'intermediate site North Sea'};  
temp.tL1    = C2K(9);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'DuinJenn1984';
comment.tL1 = 'Data for intermediate site North Sea; time derived from rings';
% northern site
data.tL2 = [ ... % time since settlement (yr), length of ventral plate (cm)
 1	0.922
 2	1.739
 3	2.386
 4	2.770
 5	2.974
 6	3.104
 7	3.233
 8	3.310
 9	3.335
10	3.359];
data.tL2(:,1) = data.tL2(:,1) * 365; % convert yr to d
data.tL2(:,2) = data.tL2(:,2) * 5.56/ 3.3; % convert ventral plate length to test length
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since settlement', 'test length', 'northern site North Sea'};  
temp.tL2    = C2K(10);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'DuinJenn1984';
comment.tL2 = 'Data for northern site North Sea; time derived from rings';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL', 'tL1', 'tL2'}; subtitle1 = {'Data from south, intermediate, north North Sea'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'The bivalve Tellimya ferruginosa is often found living inside the sea potatos burrow as a commensal';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'A (nude) test of length 5.56 cm and ventral plate length 3.3 cm, has a volume of 60 ml';
metaData.bibkey.F2 = 'Kooy2017'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '38GP4'; % Cat of Life
metaData.links.id_ITIS = '158129'; % ITIS
metaData.links.id_EoL = '46556636'; % Ency of Life
metaData.links.id_Wiki = 'Echinocardium_cordatum'; % Wikipedia
metaData.links.id_ADW = 'Echinocardium_cordatum'; % ADW
metaData.links.id_Taxo = '41169'; % Taxonomicon
metaData.links.id_WoRMS = '124392'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Echinocardium_cordatum}}';
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
bibkey = 'DuinJenn1984'; type = 'Article'; bib = [ ... 
'author = {G. C. A. Duineveld and M. I. Jenness}, ' ... 
'year = {1984}, ' ...
'title = {Differences in growth rates of the sea urchin \emph{Echinocardium cordatum} as estimated by the parameter o of the von {B}ertalanffy equation applied to skeletal rings}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {19}, ' ...
'pages = {65--72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kash2007'; type = 'Article'; bib = [ ... 
'author = {S. D. Kashenko}, ' ... 
'year = {2007}, ' ...
'title = {Adaptive Responses of Embryos and Larvae of the Heart-Shaped Sea Urchin \emph{Echinocardium cordatum} to Temperature and Salinity Changes}, ' ...
'journal = {Russian Journal of Marine Biology}, ' ...
'volume = {33}, ' ...
'number = {6}, ' ...
'pages = {381-390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Buch1966'; type = 'Article'; bib = [ ... 
'author = {J. B. Buchanan}, ' ... 
'year = {1966}, ' ...
'title = {The biology of \emph{Echinocardium cordatum} [{E}chinodermata: {S}patangoidea] from different habitats}, ' ...
'journal = {J. Mar. Biol. Assoc. UK}, ' ...
'volume = {46}, ' ...
'number = {1}, ' ...
'pages = {97--114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BIOTIC'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4248}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2017'; type = 'Misc'; bib = [ ...
'author = {S. A. L. Kooijman}, ' ... 
'year = {2017}, ' ...
'note = {personal measurement}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

