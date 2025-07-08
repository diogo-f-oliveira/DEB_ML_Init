function [data, auxData, metaData, txtData, weights] = mydata_Scorpaena_guttata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Scorpaena_guttata'; 
metaData.species_en = 'California scorpionfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 15];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(20.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 21*365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(20.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 21; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
data.Li  = 43; units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Scorpaenichthys_marmoratus: pi/6*0.15^3';
data.Wwp = 229;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01995*Li^3.07, see F1';
data.Wwi = 2064;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01995*Li^3.07, see F1';
 
data.Ri = 32850/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(20.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Scorpaena_elongata';

% uni-variate data
% time-length 
data.tL = [ ... %  year class (yr), total length(cm)
    2 20.4
    3 21.2
    4 22.5
    5 24.9
    6 25.0
    8 29.2
   10 29.4];
data.tL(:,1) = (data.tL(:,1) + 1.9) * 365; % convert yr to d
units.tL = {'d' 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(20.8); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Erzi1991'; comment.tL = 'record 419';

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'GrebCail2010 data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01995*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VWRQ'; % Cat of Life
metaData.links.id_ITIS = '166827'; % ITIS
metaData.links.id_EoL = '46567896'; % Ency of Life
metaData.links.id_Wiki = 'Scorpaena_guttata'; % Wikipedia
metaData.links.id_ADW = 'Scorpaena_guttata'; % ADW
metaData.links.id_Taxo = '187143'; % Taxonomicon
metaData.links.id_WoRMS = '274713'; % WoRMS
metaData.links.id_fishbase = 'Scorpaena-guttata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpaena_guttata}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Scorpaena-guttata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

