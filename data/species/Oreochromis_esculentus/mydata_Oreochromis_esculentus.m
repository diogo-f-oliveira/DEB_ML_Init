function [data, auxData, metaData, txtData, weights] = mydata_Oreochromis_esculentus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Oreochromis_esculentus'; 
metaData.species_en = 'Singida tilapia'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TP','TH','TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 17];

%% set data
% zero-variate data

data.am = 13*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Garr1959';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 24.9;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 50;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'guess';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm : pi/6*0.25^3';
data.Wwp = 230.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01445*Lp^3.01, see F1';
data.Wwi = 1878;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwim = 'based on 0.01445*Li^3.01, see F1';

data.Ri  = 730/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Oreochromis_andersonii';
 
% uni-variate data

% time-length
data.tL = [ ... % time (yr), total length (cm)
    1 23.5
    2 26.3
    3 28.1
    4 29.4
    5 30.4
    6 31.2
    7 31.9
    8 32.4
    9 32.8
   10 34.0];
data.tL(:,1) = 365 * (data.tL(:,1) + 1.5); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'total length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Garr1959';
comment.tL = 'data from outside Kavirondo Gulf';

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
F1 = 'length-weight: Ww in g = 0.01445*(TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ST3G'; % Cat of Life
metaData.links.id_ITIS = '648840'; % ITIS
metaData.links.id_EoL = '221445'; % Ency of Life
metaData.links.id_Wiki = 'Oreochromis_esculentus'; % Wikipedia
metaData.links.id_ADW = 'Oreochromis_esculentus'; % ADW
metaData.links.id_Taxo = '182111'; % Taxonomicon
metaData.links.id_WoRMS = '1016104'; % WoRMS
metaData.links.id_fishbase = 'Oreochromis-esculentus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oreochromis_esculentus}}';
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
bibkey = 'Garr1959'; type = 'Article'; bib = [ ... 
'author = {Garrod, D.J.}, ' ...
'year  = {1959}, ' ...
'title = {The growth of \emph{Tilapia esculenta} {G}raham in {L}ake {V}ictoria}, ' ...  
'journal = {Hydrobiologia}, ' ...
'volume = {12(4)}, ' ...
'pages = {268-298}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Oreochromis-esculentus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

