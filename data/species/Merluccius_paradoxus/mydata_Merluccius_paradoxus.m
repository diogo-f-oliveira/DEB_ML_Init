function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_paradoxus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_paradoxus'; 
metaData.species_en = 'Deep-water Cape hake'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASE','MIW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.5); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 14];

%% set data
% zero-variate data
data.am = 12*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'Erzi1991';  
  temp.am = C2K(7.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 47.8;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase';
data.Li = 115;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 900 mum: pi/6*0.09^3';
data.Wwp = 825;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwp = 0.00513*Lp^3.10, see F1';
data.Wwi = 12540;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.00513*Li^3.10, see F1';
  
data.Ri  = 7e5/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(7.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Merluccius_bilinearis';
  
% uni-variate data
% time-length 
data.tL = [ ... % time since birth (yr), total length (cm) 
     2 27.6
     3 36.0
     4 43.8
     5 51.4
     6 59.0
     7 63.3
     8 69.9
     9 78.5
    10 84.7
    11 91.0
    12 93.3];
data.tL(:,1) = (0.7+data.tL(:,1))*365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(7.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erzi1991'; comment.tL = 'rec 180';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZV79'; % Cat of Life
metaData.links.id_ITIS = '164796'; % ITIS
metaData.links.id_EoL = '46564943'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_paradoxus'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_paradoxus'; % ADW
metaData.links.id_Taxo = '179869'; % Taxonomicon
metaData.links.id_WoRMS = '217745'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-paradoxus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'how217745published = {\url{https://en.wikipedia.org/wiki/Merluccius_paradoxus}}';
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
bibkey = 'Erzi1991'; type = 'techreport'; bib = [ ... 
'author = {Erzini, K.}, ' ... 
'year = {1991}, ' ...
'title = {A compilation of data on variability in length-age in marine fishes}, ' ...
'institution = {Fisheries Stock Assessment, Title XII, Collaborative Research Support Program, University of Rhode Island}, ' ...
'volume = {Working paper 77}, ' ...
'pages = {1-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-paradoxus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

