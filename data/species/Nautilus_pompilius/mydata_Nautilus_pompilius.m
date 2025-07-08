function [data, auxData, metaData, txtData, weights] = mydata_Nautilus_pompilius

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Nautilida'; 
metaData.family     = 'Nautilidae';
metaData.species    = 'Nautilus_pompilius'; 
metaData.species_en = 'Chambered nautilus'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMp', '0iMr'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCik', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.1); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'dLp'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 07]; 

%% set data
% zero-variate data

data.ab = 11*30.5;    units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'SaunLand2010';
  temp.ab = C2K(18.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2673;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'WestBeck2004';
  temp.tp = C2K(18.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'weight for tp is set to zero because this value is based on assumed constant growth in length';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'WestBeck2004';   
  temp.am = C2K(18.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'minimum estimate';

data.Lb  = 2.6;   units.Lb  = 'cm';  label.Lb  = 'shell diameter at birth'; bibkey.Lb  = 'WestBeck2004';
data.Lp  = 11.3;   units.Lp  = 'cm';  label.Lp  = 'shell diameter at puberty'; bibkey.Lp  = 'WestBeck2004';
data.Li  = 16.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell diameter'; bibkey.Li  = 'WestBeck2004';

data.Wwb = 4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Ward1987';
data.Wwi = 490;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Kooy2017';

data.dLp = 0.0055; units.dLp = 'cm/d'; label.dLp = 'change in shell diameter at puberty'; bibkey.dLp = 'WestBeck2004';
  temp.dLp = C2K(18.1);  units.temp.dLp = 'K'; label.temp.dLp = 'temperature'; 
  comment.dLp = 'this growth rate stayed constant around size at puberty';

data.Ri  = 11/365; units.Ri = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'Ward1987';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'This is the max number of eggs laid be a single female of unknown size, so data is speculative';


%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp; % see comment for tp

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'No sexual dimorphism';
metaData.bibkey.F1 = 'SaunLand2010';
F2 = 'The shell resembles a logarithmic spiral, with ratio ranging from about 1.24 to 1.43, (average about 1.33); the ratio of the golden spiral is 1.618';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '45VLF'; % Cat of Life
metaData.links.id_ITIS = '557222'; % ITIS
metaData.links.id_EoL = '590944'; % Ency of Life
metaData.links.id_Wiki = 'Nautilus_pompilius'; % Wikipedia
metaData.links.id_ADW = 'Nautilus_pompilius'; % ADW
metaData.links.id_Taxo = '40101'; % Taxonomicon
metaData.links.id_WoRMS = '216384'; % WoRMS
metaData.links.id_molluscabase = '216384'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nautilus_pompilius}}';
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
bibkey = 'WestBeck2004'; type = 'Article'; bib = [ ... 
'author = {B. Westermann and I. Beck-Schildw\"{a}chter and K. Beuerlein and E. F. Keleta and R. Schipp}, ' ... 
'year = {2004}, ' ...
'title = {Shell Growth and Chamber Formation of Aquarium-Reared \emph{Nautilus pompilius} ({M}ollusca, {C}ephalopoda) by {X}-Ray Analysis}, ' ...
'journal = {J. Exp. Zool.}, ' ...
'volume = {301A}, ' ...
'pages = {930-937}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaunLand2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Saunders, W. B. and Landman, N. H. (eds)}, ' ...
'year = {2010}, ' ...
'title  = {Nautilus; the biology and paleobiology of a living fossil}, ' ...
'series = {Topics in Geobiology}, ' ...
'volume = {6}, ' ...
'publisher = {Springer}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ward1987'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Ward, P. D.}, ' ...
'year = {1987}, ' ...
'title  = {The natural history of Nautilus}, ' ...
'publisher = {Allen \& Unwin, Winchester, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2017'; type = 'Misc'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S. A. L. M.}, ' ...
'year = {2017}, ' ...
'note  = {Measured volume of water in a thin plastic bag in the last champber of a shell of 16 cm diameter, where the water level in the bag peeps out of the shell like the soft tissue at life}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

