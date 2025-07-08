function [data, auxData, metaData, txtData, weights] = mydata_Syngnathus_fuscus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Syngnathus_fuscus'; 
metaData.species_en = 'Northern pipefish'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 09 24];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 24];

%% set data
% zero-variate data

data.ab = 30;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(4.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '30 till 38 d';
data.am = 2.5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(4.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.1;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'CampAble1998';  
data.Lp  = 11.9;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'CampAble1998';  
data.Li  = 33;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'CampAble1998';
  comment.Wwb = 'based on egg diameter of 0.75-1 mm: pi/6*0.09^3';
data.Wwp = 0.79;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = {'CampAble1998','fishbase'};
  comment.Wwp = 'based on 0.00028*Lp^3.21, see F1';
data.Wwi = 21;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00028*Li^3.21, see F1';

data.Ri  = 1380/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'CampAble1998';   
  temp.Ri = C2K(4.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on # eggs per female';
  
% uni-variate data
% time-length
data.tL = [ ... % time since 1 May (mnth), total length (cm)
    0  1.1
    1  3.4
    3 11.7
    4 16.2];
data.tL(:,1) = 30.5*(data.tL(:,1)+0); % set origin at start observation
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length', 'wild'};  
temp.tL    = C2K(4.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CampAble1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL','tL1'}; subtitle1 = {'Data from wild, captive'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g =0.00028*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53WMJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46567517'; % Ency of Life
metaData.links.id_Wiki = 'Syngnathus_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Syngnathus_fuscus'; % ADW
metaData.links.id_Taxo = '188594'; % Taxonomicon
metaData.links.id_WoRMS = '159451'; % WoRMS
metaData.links.id_fishbase = 'Syngnathus-fuscus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Syngnathus_fuscus}}';
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
bibkey = 'CampAble1998'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1352845}, ' ...
'author = {Campbell, B. C. and Able, K. W.}, ' ... 
'year = {1998}, ' ...
'title = {Life History Characteristics of the Northern Pipefish, \emph{Syngnathus fuscus}, in Southern {N}ew {J}ersey}, ' ...
'journal = {Estuaries}, ' ...
'volume = {21(3)}, ' ...
'pages = {470-475}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Syngnathus-fuscus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

