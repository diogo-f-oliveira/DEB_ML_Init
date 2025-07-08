function [data, auxData, metaData, txtData, weights] = mydata_Hypsibius_convergens 
%% set metadata

%% set metaData

metaData.species    = 'Hypsibius_convergens'; 
metaData.species_en = 'Water-bear'; 
metaData.phylum     = 'Tardigrada'; 
metaData.class      = 'Eutardigrada'; 
metaData.order      = 'Parachela'; 
metaData.family     = 'Hypsibiidae';

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0iT'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biCi', 'biB'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(20);     % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {}; % tags for different types of uni-variate data

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                      
metaData.date_subm = [2012 12 23];                          
metaData.email    = {'bas.kooijman@vu.nl'};               
metaData.address  = {'Vrije Universiteit, 1081 HV Amsterdam, the Netherlands'};     

metaData.author_mod_1  = {'Bas Kooijman'};          
metaData.date_mod_1    = [2013 08 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};    
metaData.address_mod_1 = {'Vrije Universiteit, 1081 HV Amsterdam, the Netherlands'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 18];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 01]; 

%% set data
% zero-variate data
data.ab = 7.5;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Grev1980';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Grev1980 from Baum1961: 5-10 d';
data.tp = 12;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Grev1980'; 
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Grev1980 from Baum1961';
data.am = 900;      units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Earth';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.tp = 'for all tradigrada';

data.Lb = 0.01;     units.Lb = 'cm';   label.Lb = 'physical length at birth';    bibkey.Lb = 'Grev1980'; 
 comment.Lb = 'Grev1980 from Baum1961';
data.Lp = 0.01875;  units.Lp = 'cm';   label.Lp = 'physical length at puberty';  bibkey.Lp = 'Grev1980'; 
 comment.Lp = 'Grev1980 from Baum1961: 175-200 mum';
data.Li = 0.0265;   units.Li = 'cm';   label.Li = 'ultimate physical length';    bibkey.Li = 'MorgKing1976';

data.Wwb = 5.31e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Grev1980';                                                                                 
 comment.Wwb = 'based on volume: aspect ratio del = .26: V = 0.25 * pi * del^2 * Lb^2';
data.Wwp = 3.50e-7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'Grev1980';                                                                                
 comment.Wwp = 'based on volume: aspect ratio del = .26: V = 0.25 * pi * del^2 * Lp^2';
data.Wwi = 9.88e-7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'MorgKing1976'; 
 comment.Wwi = 'based on volume: aspect ratio del = .26: V = 0.25 * pi * del^2 * Li^2';

data.Ri = 8/80;     units.Ri = '#/d';  label.Ri = 'maximum reprod rate';         bibkey.Ri = 'Grev1980';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'the reproductive time interval is guessed for an individual of ultimate length Li ';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'The cuticle is moulted about four times during the life cycle. Some species lay their eggs inside the moulted cuticle, into which males shed sperm. It appears that egg laying and defecation can only happen during moulting.'; 
metaData.bibkey.F1 = 'bumblebee';
metaData.facts = struct('F1',F1);

%% Discussion  
D1 = 'treated as identical to H. conjungens (but this is uncertain)';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3P3HX'; % Cat of Life
metaData.links.id_ITIS = '155410'; % ITIS
metaData.links.id_EoL = '1053825'; % Ency of Life
metaData.links.id_Wiki = 'Hypsibius'; % Wikipedia
metaData.links.id_ADW = 'Hypsibius_convergens'; % ADW
metaData.links.id_Taxo = '421894'; % Taxonomicon
metaData.links.id_WoRMS = '343068'; % WoRMS


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
'series = {Die Neue Brehm-Bucherei}, ' ...
'volume = {537}, ' ...
'publisher = {A. Ziemsen Verlag, Wittenberg Lutherstadt}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Baum1961'; type = 'Article'; bib = [ ...
'author = {Baumann, H.}, ' ...
'year = {1961}, ' ...
'title = {Der {L}ebensablauf von \emph{Hypsibius (H.) convergens} {U}rbanowicz ({T}ardigrada)}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {167}, '...
'pages = {363-381}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bumblebee'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.bumblebee.org/invertebrates/TARDIGRADA.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Earth'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.eoearth.org/article/Tardigrada}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

