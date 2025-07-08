function [data, auxData, metaData, txtData, weights] = mydata_Melichthys_niger

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Balistidae';
metaData.species    = 'Melichthys_niger'; 
metaData.species_en = 'Black triggerfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 22];

%% set data
% zero-variate data

data.am = 13 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'KavaOlne2006';   
  temp.am = C2K(27.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 20;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 50;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.25e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BranVian2013';
  comment.Wwb = 'based on egg diameter of 0.35 mm of B.capriscus: pi/6*0.035^3';
data.Wwp = 172;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02570*Li^2.94, see F1';
data.Wwi = 2540;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.94, see F1';

data.Ri  = 9.6e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.9';
  
% univariate data
% time-length
data.tL_BJ = [ ... % time since birth (yr), std length (cm)
 1 15.771 11.869
 2 17.935 13.194
 3 19.097 14.765
 4 20.416 15.414
 5 21.418 16.536
 6 22.067 17.245
 7 23.129 18.456
 8 23.839 18.935
 9 22.117 18.588
10 22.496 18.491
11 24.144 17.800];
data.tL_BJ(:,1) = 365 * (0.9 + data.tL_BJ(:,1)); % convert yr to d
units.tL_BJ   = {'d', 'cm'};  label.tL_BJ = {'time since birth', 'std length'};  
temp.tL_BJ    = C2K(27.4);  units.temp.tL_BJ = 'K'; label.temp.tL_BJ = 'temperature';
bibkey.tL_BJ = 'KavaOlne2006'; treat.tL_BJ = {1 {'Belize','Johnston Atoll'}};

%% set weights for all real data
weights = setweights(data, []);
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02570*(TL in cm)^2.94';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6QYS5'; % Cat of Life
metaData.links.id_ITIS = '173174'; % ITIS
metaData.links.id_EoL = '46570696'; % Ency of Life
metaData.links.id_Wiki = 'Melichthys_niger'; % Wikipedia
metaData.links.id_ADW = 'Melichthys_niger'; % ADW
metaData.links.id_Taxo = '47008'; % Taxonomicon
metaData.links.id_WoRMS = '219881'; % WoRMS
metaData.links.id_fishbase = 'Melichthys-niger'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Melichthys_niger}}';
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
bibkey = 'KavaOlne2006'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-006-9044-1}, ' ...
'author = {Kathryn D. Kavanagh and John E. Olney}, ' ... 
'year = {2006}, ' ...
'title = {Ecological correlates of population density and behavior in the circumtropical black triggerfish \emph{Melichthys niger} ({B}alistidae)}, ' ...
'journal = {Environ. Biol. Fish}, ' ...
'volume = {76}, ' ...
'pages = {387–398}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BranVian2013'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-006-9044-1}, ' ...
'author = {Ilka S. L. Branco and Danielle L. Viana and Renata T. S. F\''{e}lix and Dr\''{a}usio P. V\''{e}ras and F\''{a}bio H. V. Hazin¹}, ' ... 
'year = {2013}, ' ...
'title = {Oocyte development and ovarian maturation of the black triggerfish, \emph{Melichthys niger} ({A}ctinopterygii: {B}alistidae) in S\~{a}o Pedro e S\~{a}o {P}aulo {A}rchipelago, {B}razil}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {11(3)}, ' ...
'pages = {597-606}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Melichthys-niger}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

