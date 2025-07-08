function [data, auxData, metaData, txtData, weights] = mydata_Synapturichthys_kleinii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Synapturichthys_kleinii'; 
metaData.species_en = 'Klein''s sole'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.9); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 16];

%% set data
% zero-variate data
data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(15.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';  
  temp.tp = C2K(15.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';  
  temp.am = C2K(15.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 20.5;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'BouaBoud2018';
data.Li = 42;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';
  comment.Li = 'based on tL data; fishbase gives TL 32 cm';

data.Wwb = 9e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'BouaBoud2018';
  comment.Wwb = 'based on egg diameter of 1.2  mm: pi/6*0.12^3';
data.Wwp = 85;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = {'fishbase','BouaBoud2018'};  
  comment.Wwp = 'based on 0.01047*Lp^2.98, see F1';
data.Wwi = 622.4; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.01047*Li^2.98, see F1';

% uni-variate data
% length-fecundity        
data.LN = [ ... % Length (cm) - fecundity (#)
22.463	3895.040
22.475	7152.191
23.987	12711.279
24.006	5581.158
24.018	7781.975
24.032	9630.683
24.528	7962.520
24.997	5149.747
25.006	14480.811
25.007	12984.339
25.210	4887.534
25.988	6390.864
26.013	12112.915
26.309	15724.670
26.312	9914.841
27.494	23305.529
27.531	8957.258];
units.LN = {'cm', '#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(15.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'BouaBoud2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01047*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7B7NL'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46570340'; % Ency of Life
metaData.links.id_Wiki = 'Synapturichthys_kleinii'; % Wikipedia
metaData.links.id_ADW = 'Synapturichthys_kleinii'; % ADW
metaData.links.id_Taxo = '691973'; % Taxonomicon
metaData.links.id_WoRMS = '236492'; % WoRMS
metaData.links.id_fishbase = 'Synapturichthys-kleinii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Synapturichthys_kleinii}}';
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
bibkey = 'BouaBoud2018'; type = 'article'; bib = [ ...
'doi = {10.3750/AIEP/02314}, ' ...
'author = {Zouhour Bouain and Lobna Boudaya and Abderrahmen Bouain and Lassad Neifar}, ' ...
'year = {2018}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF {K}LEIN''S SOLE, \emph{Synapturichthys kleinii} ({A}CTINOPTERYGII: {P}LEURONECTIFORMES: {S}OLEIDAE), OFF {T}UNISIAN COAST (CENTRAL {M}EDITERRANEAN)}, ' ... 
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {48(1)}, ' ...
'pages = {61–69}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Synapturichthys-kleinii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
