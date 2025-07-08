function [data, auxData, metaData, txtData, weights] = mydata_Anaxyrus_baxteri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Anaxyrus_baxteri'; 
metaData.species_en = 'Wyoming toad';

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 31];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 31]; 


%% set data
% zero-variate data

data.tj = 40;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'guess';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'based on bufo bufo';
data.tp = 2.5*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'EoL';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on life spane of other Anaxyrus as given in AnAge';

data.Wwb = 0.07; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Bufo bufo';
data.Wwi = 40;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'LiVaug2009';

data.Ri  = 900/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'based on down-scaled bufo bufo and 1 brood/year';
 
% uni-variate data
% time-weight data
data.tW = [ ... % time (d), weight (g)
 0.209	10.781
14.185	12.342
27.744	15.520
41.930	17.138
55.906	19.703
69.883	24.554
84.068	26.115
98.044	29.015
112.021	31.190
125.997	33.476
139.974	35.651
153.950	36.654];
units.tW   = {'d', 'g'};  label.tW = {'time', 'weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LiVaug2009';
comment.tW = 'Temperature is guessed';

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

% Discussion points
D1 = 'This entry assumes that parameters don''t change (e.g. around metamorphosis)';
D2 = 'The guess for reproduction rate maximizes reproductive output (kap around 0.45)';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Females slighly lager than males';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'DK9V'; % Cat of Life
metaData.links.id_ITIS = '773512'; % ITIS
metaData.links.id_EoL = '311046'; % Ency of Life
metaData.links.id_Wiki = 'Anaxyrus_baxteri'; % Wikipedia
metaData.links.id_ADW = 'Anaxyrus_baxteri'; % ADW
metaData.links.id_Taxo = '988886'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Anaxyrus+baxteri'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anaxyrus_baxteri}}';
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
bibkey = 'LiVaug2009'; type = 'Article'; bib = [ ... 
'author = {H. Li and M. J. Vaughan and R. K. Browne}, ' ... 
'year = {2009}, ' ...
'title = {A Complex Enrichment Diet Improves Growth and Health in the Endangered Wyoming Toad (\emph{Bufo baxteri})}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {28}, ' ...
'pages = {197-213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/311046/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
