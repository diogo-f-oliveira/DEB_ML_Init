function [data, auxData, metaData, txtData, weights] = mydata_Milnesium_tardigradum

%% set metaData 
metaData.phylum     = 'Tardigrada'; 
metaData.class      = 'Eutardigrada'; 
metaData.order      = 'Parachela'; 
metaData.family     = 'Milnesiidae';
metaData.species    = 'Milnesium_tardigradum'; 
metaData.species_en = 'Water-bear'; 
metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biCi', 'biB'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};
metaData.T_typical  = C2K(20);% K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2012 12 24];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1  = {'Bas Kooijman'};          
metaData.date_mod_1    = [2015 03 12];                  
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};        
metaData.address_mod_1 = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 02]; 

%% set data
% zero-variate data
data.ab = 7; units.ab = 'd';  label.ab = 'time since t_0 at birth';     bibkey.ab = 'Grev1980';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'from Baum1970: 26-31 d';
data.tp = 24;   units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'Grev1980';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'from Baum1970'; 
data.am = 900;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'Earth';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'from all tardigrades';

data.Lb = 0.0200;    units.Lb = 'cm'; label.Lb = 'total length at birth';  bibkey.Lb = 'Grev1980';
  comment.Lb = 'from Baum1964';
data.Lp = 0.0435;    units.Lp = 'cm'; label.Lp = 'total length at puberty';bibkey.Lp = 'Grev1980';
  comment.Lp = 'from Baum1964';
data.Li = 0.100;     units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'MorgKing1976';

data.Wwb = 4.25e-7;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'estimate';
  comment.Wwb = 'based on volume: aspect ratio del = .26: V = 0.25 * pi * del^2 * Lb^2';
data.Wwp = 4.37e-6;  units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'estimate';
  comment.Wwp = 'based on volume: aspect ratio del = .26: V = 0.25 * pi * del^2 * Lp^2';
data.Wwi = 5.31e-5;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'estimate';
  comment.Wwi = 'based on volume: aspect ratio del = .26: V = 0.25 * pi * del^2 * Li^2';

data.Ri = 11/80;   units.Ri = '#/d';label.Ri = 'maximum reprod rate';      bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 10 * weights.Wwi; % much more confidence in the ultimate wet weight
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'The cuticle is moulted about four times during the life cycle.';
metaData.bibkey.F1 = 'bumblebee';
F2 = 'Some species lay their eggs inside the moulted cuticle, into which males shed sperm.';
metaData.bibkey.F2 = 'bumblebee';
F3 = 'It appears that egg laying and defecation can only happen during moulting.';
metaData.bibkey.F3 = 'bumblebee';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '43DJL'; % Cat of Life
metaData.links.id_ITIS = '155452'; % ITIS
metaData.links.id_EoL = '1053491'; % Ency of Life
metaData.links.id_Wiki = 'Milnesium_tardigradum'; % Wikipedia
metaData.links.id_ADW = 'Milnesium_tardigradum'; % ADW
metaData.links.id_Taxo = '104409'; % Taxonomicon
metaData.links.id_WoRMS = '343421'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tardigrada}}';  
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
bibkey = 'MorgKing1976'; type = 'Book'; bib = [ ...
'author = {Morgan, C. I. and King, P. E.}, ' ...
'year = {1976}, ' ...
'title = {British Tardigrades}, ' ...
'series = {Synopsis of the British Fauna}, ' ...
'volume = {9}, ' ...
'publisher = {Academic Press, London}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Grev1980'; type = 'Book'; bib = [ ...
'author = {Greven, H.}, ' ...
'year = {1980}, ' ...
'title = {Die Baertierchen}, ' ...
'series = {Die Neue Brehm-Bucherei.}, ' ...
'volume = {537}, ' ...
'publisher = {A. Ziemsen Verlag, Wittenberg Lutherstadt}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baum1964'; type = 'Article'; bib = [ ...
'author = {Baumann, H.}, ' ...
'year = {1964}, ' ...
'title = {\{U}ber den {L}ebenslauf und die {L}ebensweise von \emph{Milnesium tardigradum} {D}oyere ({T}ardigrada).}, ' ...
'journal = {Ver\"{o}ffentlichungen aus dem \"{U}berseemuseum Bremen}, ' ...
'volume = {3}, '...
'pages = {161--171}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bumblebee'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.bumblebee.org/invertebrates/TARDIGRADA.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Earth'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.eoearth.org/article/Tardigrada}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

