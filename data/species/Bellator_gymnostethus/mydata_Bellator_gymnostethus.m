function [data, auxData, metaData, txtData, weights] = mydata_Bellator_gymnostethus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Triglidae';
metaData.species    = 'Bellator_gymnostethus'; 
metaData.species_en = 'Naked-belly searobin'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.1); % in K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 30];

%% set data
% zero-variate data
data.ab = 10;      units.ab = 'd';    label.ab = 'age at birth';                   bibkey.ab = 'guess';    
  temp.ab = C2K(20.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SchmCast1994';  
  temp.am = C2K(20.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7;     units.Lp = 'cm';   label.Lp = 'total length at puberty';          bibkey.Lp = 'guess';
data.Li = 15;    units.Li = 'cm';   label.Li = 'ultimate total length';         bibkey.Li = 'fishbase';

data.Wwb = 8.0e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'Yusc1985';
  comment.Wwb = 'based on egg diameter of 1.05-1.25 mm of Prionotus evolans: pi/6*0.115^3';
data.Wwp = 5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';         bibkey.Wwp = 'guess';  
  comment.Wwp = 'based on 0.01479*Lp^3.00, see F1';
data.Wwi = 49.9; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';     bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.01479*Li^3.00, see F1';

data.Ri = 30e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(20.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on P. evolans for TL 15 cm';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (years), std length (cm) 
    1  5.9
    2  8.0
    3 10.8
    4 10.5
    5 10.5
    6 10.8];
data.tL(:,1) = 365 * (0.4+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(20.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SchmCast1994';

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.01479*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5WGNK'; % Cat of Life
metaData.links.id_ITIS = '643796'; % ITIS
metaData.links.id_EoL = '46568724'; % Ency of Life
metaData.links.id_Wiki = 'Bellator'; % Wikipedia
metaData.links.id_ADW = 'Bellator_gymnostethus'; % ADW
metaData.links.id_Taxo = '163998'; % Taxonomicon
metaData.links.id_WoRMS = '276274'; % WoRMS
metaData.links.id_fishbase = 'Bellator-gymnostethus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bellator}}';
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
bibkey = 'SchmCast1994'; type = 'article'; bib = [ ...
'author = {Juan Jacobo Schmitter-Sotol and Jos\''{e} Luis Castro-Aguifre}, ' ... 
'year   = {1994}, ' ...
'title  = {Age and growth of three searobins ({P}isces: {T}riglidae) off the western coast of {B}aja {C}alifornia {S}ur, {M}\''{e}xico}, ' ...
'journal = {Rev. Biol. Trop.}, ' ...
'page = {271-279}, ' ...
'volume = {42(1/2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bellator-gymnostethus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

