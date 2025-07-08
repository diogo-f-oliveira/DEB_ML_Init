function [data, auxData, metaData, txtData, weights] = mydata_Syngnathus_taenionotus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Syngnathus_taenionotus'; 
metaData.species_en = 'Darkflank pipefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
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

data.ab = 60;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'FranMacc2003';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '30 till 38 d';
data.am = 2*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranMacc2003';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.03;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'FranMacc2003';  
data.Lp  = 12;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'guess';  
data.Li  = 19;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'FranMacc2003';
  comment.Wwb = 'based on egg diameter of 1.4 mm: pi/6*0.14^3';
data.Wwp = 0.82;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00028*Lp^3.21, see F1';
data.Wwi = 3.6;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00028*Li^3.21, see F1';

data.Ri  = 46/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'FranMacc2003';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on # eggs per female, males possibly hold eggs of 2 females';
  
% uni-variate data
% time-length
data.tL = [ ... % time since 1 May (mnth), total length (cm)
    0  2.0
    1  4.76
    2  6.8
    3  8.4
    4 10.8
   11 16.7];
data.tL(:,1) = 30.5*(data.tL(:,1)+0); % set origin at start observation
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length', 'wild'};  
temp.tL    = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FranMacc2003';

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
F1 = 'length-weight: Ww in g = 0.00028*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '53WQ2'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46567512'; % Ency of Life
metaData.links.id_Wiki = 'Syngnathus_taenionotus'; % Wikipedia
metaData.links.id_ADW = 'Syngnathus_taenionotus'; % ADW
metaData.links.id_Taxo = '188606'; % Taxonomicon
metaData.links.id_WoRMS = '127391'; % WoRMS
metaData.links.id_fishbase = 'Syngnathus-taenionotus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Syngnathus_taenionotus}}';
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
bibkey = 'FranMacc2003'; type = 'Article'; bib = [ ... 
'author = {P. Franzoi and R. Maccagnani and R. Rossi and V. U. Ceccherelli}, ' ... 
'year = {2003}, ' ...
'title = {Life cycles and feeding habits of \emph{Syngnathus taenionotus} and \emph{S. abaster} ({P}isces, {S}yngnathidae) in a brackish bay of the {P}O {R}iver {D}elta ({A}driatic {S}ea)}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {67}, ' ...
'pages = {23–33}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Syngnathus-taenionotus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

