function [data, auxData, metaData, txtData, weights] = mydata_Amphiura_filiformis

%% set metaData
metaData.phylum     = 'Echinodermata';
metaData.class      = 'Ophiuroidea'; 
metaData.order      = 'Ophiurida'; 
metaData.family     = 'Amphiuridae';
metaData.species    = 'Amphiura_filiformis'; 
metaData.species_en = 'Long-armed burrowing brittlestar'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjB', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'ah', 'ab', 'aj', 'ap', 'am', 'Lh', 'Lb', 'Lj', 'Lp', 'Li', 'Wwb', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Christina Wood'};    
metaData.date_subm = [2017 05 17];              
metaData.email    = {'c.l.wood@soton.ac.uk'};            
metaData.address  = {'University of Southampton, National Oceanography Centre, Southampton, UK'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.vl'}; 
metaData.date_acc    = [2017 06 24]; 

%% set data
% zero-variate data

data.ah = 1.5;    units.ah = 'd';    label.ah = 'age at hatching';             bibkey.ah = 'DupoThor2009';   
  temp.ah = C2K(14);  units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'DupoThor2009';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'by d2 embryos have become ophiopleuteus larvae';
data.aj = 17;    units.aj = 'd';    label.aj = 'age at metamorphosis';     bibkey.aj = 'DupoThor2009';   
  temp.aj = C2K(14);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 3*365;    units.ap = 'd';    label.ap = 'age at puberty';           bibkey.ap = {'Muus1981','OckeMuus1978'};
  temp.ap = C2K(6.8);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'average taken from long term study of same population (Ocklemannn & Muus, 1978)';
data.am = 365*25;    units.am = 'd';    label.am = 'life span';                bibkey.am = {'Muus1981','OckeMuus1978'};   
  temp.am = C2K(6.8);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'average taken from long term study of same population (Ocklemannn & Muus, 1978';

data.Lh  = 0.0075;   units.Lh  = 'cm';  label.Lh  = 'total length at hatching';       bibkey.Lh  = 'DupoThor2009'; 
comment.Lh = 'Measurement taken from representative image of hatched ophiopluteus';
data.Lb  = 0.0075;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';          bibkey.Lb  = 'DupoThor2009';  
data.Lj  = 0.0325;   units.Lj  = 'cm';  label.Lj  = 'total length at metamorphosis';  bibkey.Lj  = 'Muus1981';
comment.Lj = 'Settlement length taken as proxy for metamorphosis'; 

data.Lp  = 0.138;   units.Lp  = 'cm';  label.Lp  = 'oral width at puberty';        bibkey.Lp  = {'Muus1981', 'JoseJens1992'}; 
comment.Lp = 'Value calculated using original disc diameter (4mm) from JoseJens1992,and converting using the equation given in Table 1 of JoseJens 1992)'; 
data.Li  = 0.29;   units.Li  = 'cm';  label.Li  = 'ultimate oral width';          bibkey.Li  = 'OConBown1983';
comment.Li = 'Taken from different population study as others use disc diameter instead, which is not so stable, however max disc size also reported and this corresponds to that reported by the Swedish population studies';

data.Wwb = 5.236e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight atb birth';         bibkey.Wwb = 'guess';
comment.Wwb = 'Calculated from guessed egg diameter of 0.1 mm: 4/3*pi*(0.01/2)^3';
data.Wwp = 4.7756;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'Muus1981', 'JoseJens1992'};
comment.Wwp = 'Value calculated from converting disc diameter to wet weight using equation given in JoseJens1992, Table1';
data.Wwi = 5.8465;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';            bibkey.Wwi = {'Muus1981', 'JoseJens1992'};
comment.Wwi = 'Value calculated from converting disc diameter to wet weight using equation given in JoseJens1992, Table1';

data.Ri  = 806.45;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'OConBown1983';   
temp.Ri = C2K(15);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'Average temperature during spawning season';
 
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

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Lives in sediment and sticks 2 arms out in the water, which tips can be snapped off';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'D6Q7'; % Cat of Life
metaData.links.id_ITIS = '157728'; % ITIS
metaData.links.id_EoL = '607601'; % Ency of Life
metaData.links.id_Wiki = 'Amphiura_filiformis'; % Wikipedia
metaData.links.id_ADW = 'Amphiura_filiformis'; % ADW
metaData.links.id_Taxo = '40989'; % Taxonomicon
metaData.links.id_WoRMS = '125080'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphiura_filiformis}}';
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
bibkey = 'DupoThor2009a'; type = 'Article'; bib = [ ... 
'author = {Dupont, S. and Thorndyke, W. and Thorndyke, M. C. and Burke, R. D.}, ' ... 
'year = {2009}, ' ...
'title = {Neural development of the brittlestar \emph{Amphiura filiformis}}, ' ...
'journal = {Development Genes and Evolution}, ' ...
'volume = {291}, ' ...
'number = {3}, '...
'pages = {159--66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Muus1981'; type = 'Article'; bib = [ ... 
'author = {Muus, K.}, ' ... 
'year = {1981}, ' ...
'title = {Density and growth of juvenile \emph{Amphiura filifmormis} ({O}phiuroidea) in the {O}resund}, ' ...
'journal = {Ophelia}, ' ...
'volume = {20}, ' ...
'number = {2}, '...
'pages = {153--68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DupoThor2009'; type = 'Article'; bib = [ ... 
'author = {Dupont, S. and Thorndyke, W. and Thorndyke, M. C. and Burke, R. D.}, ' ... 
'year = {2009}, ' ...
'title = {Neural development of the brittlestar \emph{Amphiura filiformis}}, ' ...
'journal = {Development Genes and Evolution}, ' ...
'volume = {291}, ' ...
'number = {3}, '...
'pages = {159--66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OckeMuus1978'; type = 'Article'; bib = [ ... 
'author = {Ockelmann, K. W. and Muus, K.}, ' ... 
'year = {1978}, ' ...
'title = {The biology, ecology and behaviour of the bivalve \emph{Mysella bidentata} ({M}ontagu)}, ' ...
'journal = {Ophelia}, ' ...
'volume = {17}, ' ...
'pages = {1--93}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoseJens1992'; type = 'Article'; bib = [ ... 
'author = {Josefson, A. B. and Jensen, J. N.}, ' ... 
'year = {1992}, ' ...
'title = {Growth patterns of \emph{Amphiura filiformis} support the hypothesis of organis enrichment in the {S}kagerrak-{K}attegat area}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {112}, ' ...
'pages = {615--624}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CareDupo2014'; type = 'Article'; bib = [ ... 
'author = {Carey, N. and Dupont, S. and Lundve, B. and Sigwart, J. D.}, ' ... 
'year = {2014}, ' ...
'title = {One size fits all: stability of metabolic scaling under warming and ocean acidification in echinoderms}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {161}, ' ...
'number = {9}, '...
'pages = {2131--2142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OConBown1983'; type = 'Article'; bib = [ ... 
'author = {OConnor, B. and Bowner, T. and Grehan, A.}, ' ... 
'year = {1983}, ' ...
'title = {Long-term assessment of the population dynamics of \emph{Amphiura filiformis} ({E}chinodermata: {O}phiuroidea) in {G}alway {B}ay (west coast of {I}reland)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {75}, ' ...
'pages = {279--86}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];