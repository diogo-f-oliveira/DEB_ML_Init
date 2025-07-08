function [data, auxData, metaData, txtData, weights] = mydata_Cynoglossus_senegalensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Cynoglossidae';
metaData.species    = 'Cynoglossus_senegalensis'; 
metaData.species_en = 'Senegalese tongue sole'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.7); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'R_L'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 07];

%% set data
% zero-variate data
data.ab = 8;      units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'guess';    
  temp.ab = C2K(25.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';  
  temp.am = C2K(25.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 31;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'guess';
data.Li = 66.5;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 8.17e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.16  mm: pi/6*0.116^3';
data.Wwp = 163;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'guess';  
  comment.Wwp = 'based on 0.00363*Lp^3.12, see F4';
data.Wwi = 1.77e3; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'guess';     
  comment.Wwi = 'based on 0.00363*Li^3.12, see F4';

data.Ri = 4.9e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(25.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Solea_senegalensis';

% uni-variate data
% time-length        
data.tL = [ ... % age (years) ~ Length (cm) 
    1 17
    2 22
    3 27
    4 34
    5 37
    6 42
    7 45];
data.tL(:,1) = 365 * (0.8+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Nawa1985';
comment.tL = 'Data from Cross River estuary';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 25.7 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'demersal';
metaData.bibkey.F3 = 'fishbase'; 
F4 = 'Length-Weight relationship: W in g = 0.00363*(TL in cm)^3.12';
metaData.bibkey.F4 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '6C5ZS'; % Cat of Life
metaData.links.id_ITIS = '616347'; % ITIS
metaData.links.id_EoL = '46570074'; % Ency of Life
metaData.links.id_Wiki = 'Cynoglossus'; % Wikipedia
metaData.links.id_ADW = 'Cynoglossus_senegalensis'; % ADW
metaData.links.id_Taxo = '172583'; % Taxonomicon
metaData.links.id_WoRMS = '274226'; % WoRMS
metaData.links.id_fishbase = 'Cynoglossus-senegalensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoglossus}}';
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
bibkey = 'Nawa1985'; type = 'article'; bib = [ ...
'author = {Nawa, I.G}, ' ...
'year = {1985}, ' ...
'title = {A study on the growth of \emph{Pseudotolithus elongatus}, \emph{Chrysichthys nigrodigitatus} and \emph{Cynoglossus goreensis} occurring in the {C}ross {R}iver {E}stuary}, ' ... 
'journal = {Aquadocs}, ' ...
'howpublished = {\url{http://hdl.handle.net/1834/21143}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Cynoglossus_senegalensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
