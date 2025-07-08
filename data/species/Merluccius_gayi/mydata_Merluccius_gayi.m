function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_gayi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_gayi'; 
metaData.species_en = 'South Pacific hake'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 13];

%% set data
% zero-variate data
data.am = 20*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';  
  temp.am = C2K(10.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 32;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase';
data.Li = 87;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 900 mum: pi/6*0.09^3';
data.Wwp = 570;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwp = 0.01413*Lp^3.06, see F1';
data.Wwi = 12164;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.01413*Li^3.06, see F1';
  
data.Ri  = 7e5/365;   units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';  
  temp.Ri = C2K(10.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Merluccius_bilinearis';
  
% uni-variate data
% time-length 
data.tL = [ ... % time since birth (yr), total length (cm) 
    1 17.0 
    2 31.2
    3 37.8
    4 42.9
    5 48.1];
data.tL(:,1) = (0.7+data.tL(:,1))*365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erzi1991'; comment.tL = 'rec 173';

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
F1 = 'length-weight: Ww in g = 0.01413*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3ZV72'; % Cat of Life
metaData.links.id_ITIS = '164799'; % ITIS
metaData.links.id_EoL = '357052'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_gayi'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_gayi'; % ADW
metaData.links.id_Taxo = '44369'; % Taxonomicon
metaData.links.id_WoRMS = '293628'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-gayi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Merluccius_gayi}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-gayi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

