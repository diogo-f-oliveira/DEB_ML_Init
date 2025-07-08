function [data, auxData, metaData, txtData, weights] = mydata_Contusus_richei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Tetraodontidae';
metaData.species    = 'Contusus_richei'; 
metaData.species_en = 'Prickly toadfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 01];

%% set data
% zero-variate data

data.am = 7 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(17.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 25.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.4e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.64 mm: pi/6*0.064^3';
data.Wwi = 285.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.88, see F1';
  
data.GSI = 0.11; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'guess';
  temp.GSI = C2K(17.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Lagocephalus sceleratus';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    0  5.4
    1  9.1
    2 12.2
    3 13.9
    4 15.5
    5 17.2
    6 18.3];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(17.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Habi1976';

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
F1 = 'length - weight: Ww in g = 0.02570*(TL in cm)^2.88';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5ZW6T'; % Cat of Life
metaData.links.id_ITIS = '173371'; % ITIS
metaData.links.id_EoL = '46571085'; % Ency of Life
metaData.links.id_Wiki = 'Contusus_richei'; % Wikipedia
metaData.links.id_ADW = 'Contusus_richei'; % ADW
metaData.links.id_Taxo = '171651'; % Taxonomicon
metaData.links.id_WoRMS = '280389'; % WoRMS
metaData.links.id_fishbase = 'Contusus-richei'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Contusus_richei}}';
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
bibkey = 'Habi1976'; type = 'article'; bib = [ ... 
'author = {Habib, G.}, ' ...
'year = {1976}, ' ...
'title  = {Measuring growth in irregularly shaped otolith by means of a planimeter}, ' ...
'journal = {Mauri Ora and Fish. Res. Publ. (278), New Zealand}, ' ...
'volume = {4}, ' ...
'pages = {133-137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Contusus-richei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

