function [data, auxData, metaData, txtData, weights] = mydata_Acanthopagrus_arabicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Acanthopagrus_arabicus'; 
metaData.species_en = 'Arabian yellowfin seabream'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.8; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 203];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 03];

%% set data
% zero-variate data

data.ab = 2.5+3;  units.ab = 'd';   label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'hatch after 2.5 d, assumed 3 d more till first feeding';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Acanthopagrus_australis';

data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty'; bibkey.Lp  = 'guess';
data.Li  = 42;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'AlHaMoha2022';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 750 mum: pi/6*0.075^3';
data.Wwp = 173; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02512*Lp^2.95, see F1';
data.Wwi = 1.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02512*Li^2.95, see F1';

data.Ri = 1e6/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(27.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Acanthopagrus_australis: 3e6*1.5e3/4.3e3';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 20.7
    2 23.6
    3 28.2
    4 34.2
    5 38.2
    6 41.3];
data.tL(:,1) = 365 * (0.4+data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};   label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(27.2); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'AlHaMoha2022'};

%% set weights for all real data
weights = setweights(data, []);
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g =  0.02512*(TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Protandrous hermaphrodite; Sex change (from male to female) at 19.1 cm total length, 1.95 yr';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '64GH8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580076'; % Ency of Life
metaData.links.id_Wiki = 'Acanthopagrus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5223571'; % Taxonomicon
metaData.links.id_WoRMS = '835123'; % WoRMS
metaData.links.id_fishbase = 'Acanthopagrus-arabicus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthopagrus_arabicus}}';
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
bibkey = 'AlHaMoha2022'; type = 'article'; bib = [ ... 
'author = {Al-Hassani, A.H. and A.R.M. Mohamedn}, ' ... 
'year = {2022}, ' ...
'title = {Some biological aspects of four marine fish species in {I}raqi marine waters, northwest {A}rabian {G}ulf}, ' ...
'journal = {Journal of Applied and Natural Science}, ' ...
'volume = {14(3)}, ' ...
'pages = {1051-1061}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Acanthopagrus_-arabicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

