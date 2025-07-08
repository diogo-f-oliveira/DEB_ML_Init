function [data, auxData, metaData, txtData, weights] = mydata_Lampanyctus_crocodilus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Lampanyctus_crocodilus'; 
metaData.species_en = 'Jewel lanternfish'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MA','MAm'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.9); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 01];

%% set data
% zero-variate data
data.am = 9*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SionCarl2011';  
  temp.am = C2K(7.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 17;   units.Lp = 'cm';   label.Lp = 'standard length fat puberty';    bibkey.Lp = 'guess';
data.Li = 30;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 1.4e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.3 mm of Lampanyctus_ritteri: pi/6*0.03^3';
data.Wwp = 33.1; units.Wwp = 'g'; label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'guess','fishbase'};  
  comment.Wwi = 'based on 0.00417*Lp^3.17, see F1';
data.Wwi = 201; units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';  
  comment.Wwi = 'based on 0.00417*Li^3.17, see F1';

data.Ri = 360e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(7.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.9';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr),standard length (cm)
    0  3.8
    1  5.5
    2  7.0
    3  8.5
    4 10.2
    5 11.9
    6 13.6
    7 15.3
    8 15.6];
data.tL(:,1) = (data.tL(:,1) + 0.8)* 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(7.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SionCarl2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

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
D2 = 'scaled functional response for tL data is high, but measured length exceeds L_m';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Length-Weight relationship: W in g = 0.00417*(SL in cm)^3.17';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3S2MT'; % Cat of Life
metaData.links.id_ITIS = '162649'; % ITIS
metaData.links.id_EoL = '46564165'; % Ency of Life
metaData.links.id_Wiki = 'Lampanyctus_crocodilus'; % Wikipedia
metaData.links.id_ADW = 'Lampanyctus_crocodilus'; % ADW
metaData.links.id_Taxo = '42959'; % Taxonomicon
metaData.links.id_WoRMS = '126612'; % WoRMS
metaData.links.id_fishbase = 'Lampanyctus-crocodilus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampanyctus_crocodilus}}';
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
bibkey = 'SionCarl2011'; type = 'article'; bib = [ ...
'doi = {10.1007/bf00410339}, ' ...
'author = {L. Sion and R. Carlucci and D. Battista and F. Capezzuto and G. D''onghia}, ' ... 
'year   = {2011}, ' ...
'title  = {GROWTH OF \emph{Lampanyctus crocodilus} ({R}ISSO, 1810) IN THE {I}ONIAN {S}EA}, ' ...
'journal = {Biol. Mar. Mediterr.}, ' ...
'page = {148-149}, ' ...
'volume = {18(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lampanyctus-crocodilusi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

