function [data, auxData, metaData, txtData, weights] = mydata_Sebastes_umbrosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Sebastidae';
metaData.species    = 'Sebastes_umbrosus'; 
metaData.species_en = 'Honeycomb rockfish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 08 27];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 27];

%% set data
% zero-variate data

data.am = 31*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'KoloOwen2021';   
  temp.am = C2K(11.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Chen1971';
data.Li  = 29.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'ultimate wet weight';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm (but viviparous): pi/6*0.08^3';
data.Wwp = 14.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','Chen1971'};
  comment.Wwp = 'based on based on 0.01000*Lp^3.09';
data.Wwi = 359;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^3.09, see F1; max published weight 570 g';

data.Ri  = 7.8e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(11.3);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Sebastes_ensifer: 35e3*(30/23)^3';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
    1  4.25
    2  7.59
    3  9.72
    4 11.44
    5 12.89
    6 14.08
    7 15.13
    8 15.88
    9 16.75
   10 17.62
   11 18.46
   12 19.26
   13 20.07
   14 20.96
   15 19.78];
data.tL(:,1) = 365*(0.8+data.tL(:,1)); % convert yr 
data.tL(:,2) = 1.2*data.tL(:,2); % convert SL to TL, see F2
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(11.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Chen1971';  

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

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: weight(in g) = 0.01000*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 1.2 * SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4W7KY'; % Cat of Life
metaData.links.id_ITIS = '166709'; % ITIS
metaData.links.id_EoL = '46568120'; % Ency of Life
metaData.links.id_Wiki = 'Sebastes_umbrosus'; % Wikipedia
metaData.links.id_ADW = 'Sebastes_umbrosus'; % ADW
metaData.links.id_Taxo = '187252'; % Taxonomicon
metaData.links.id_WoRMS = '274774'; % WoRMS
metaData.links.id_fishbase = 'Sebastes-umbrosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sebastes_umbrosus}}';
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
bibkey = 'Chen1971'; type = 'techreport'; bib = [ ... 
'author = {Chen, Lo-Chai},' ...
'year = {1971}, ' ...
'title = {Systematics, Variation, Distribution, And Biology Of Rockfishes Of The Subgenus \emph{Sebastomus} ({P}isces, {S}corpaenidae, \emph{Sebastes})}, ' ...
'institution = {BULLETIN OF THE SCRIPPS INSTITUTION OF OCEANOGRAPHY, UNIVERSITY OF CALIFORNIA, LA JOLLA, CALIFORNIA}, ' ...
'volume = {18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoloOwen2021'; type = 'article'; bib = [ ... 
'doi = {10.1126/science.abg5332}, ' ...
'author = {Sree Rohit Raj Kolora and Gregory L. Owens and Juan Manuel Vazquez and Alexander Stubbs and Kamalakar Chatla and Conner Jainese and Katelin Seeto and Merit McCrea and Michael W. Sandel and Juliana A. Vianna and Katherine Maslenikov and Doris Bachtrog and James W. Orr and Milton Love and Peter H. Sudmant},' ...
'year = {2021}, ' ...
'title = {Origins and evolution of extreme life span in Pacific Ocean rockfishes}, ' ...
'journal = {Science}, ' ...
'volume = {374(6569)}, '...
'pages = {842-847}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Sebastes-umbrosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
