function [data, auxData, metaData, txtData, weights] = mydata_Balistes_capriscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Balistidae';
metaData.species    = 'Balistes_capriscus'; 
metaData.species_en = 'Grey triggerfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW','MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 27];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 27];

%% set data
% zero-variate data

data.am = 15 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'BurtPott2015';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 66;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.95e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MacK2008';
  comment.Wwb = 'based on egg diameter of 0.62 mm: pi/6*0.062^3';
data.Wwi = 3950;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.90, see F1; max published weight 6.2 kg';

data.Ri  = 1.99e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    0 17.3
    1 30.5
    2 33.3
    3 35.3
    4 37.5
    5 39.1
    6 41.1
    7 42.8
    8 44.4
    9 46.8
   10 46.4
   11 41.6
   12 48.2
   13 41.0
   14 49.6
   15 46.7];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BurtPott2015';

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02089*(TL in cm)^2.90';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KH43'; % Cat of Life
metaData.links.id_ITIS = '1054593'; % ITIS
metaData.links.id_EoL = '46570657'; % Ency of Life
metaData.links.id_Wiki = 'Balistes_capriscus'; % Wikipedia
metaData.links.id_ADW = 'Balistes_capriscus'; % ADW
metaData.links.id_Taxo = '47003'; % Taxonomicon
metaData.links.id_WoRMS = '154721'; % WoRMS
metaData.links.id_fishbase = 'Balistes-capriscus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Balistes_capriscus}}';
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
bibkey = 'BurtPott2015'; type = 'Article'; bib = [ ... 
'doi = {10.7755/FB.113.1.3}, ' ...
'author = {Michael L. Burton and Jennifer C. Potts and Daniel R. Carr and Michael Cooper and Jessica Lewis}, ' ... 
'year = {2015}, ' ...
'title = {Age, growth, and mortality of gray triggerfish (\emph{Balistes capriscus}) from the southeastern {U}nited {S}tates}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {113}, ' ...
'pages = {27–39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MacK2008'; type = 'Phdthesis'; bib = [ ... 
'author = {C. MacKichan Simmons}, ' ... 
'year = {2008}, ' ...
'title = {Gray triggerfish \emph{Balistes capriscus}, reproductive behaviour, early life history, and competitive iteractions between red snapper, \emph{Lutjanus campechanus}, in the nothern {G}ulf of {M}exico}, ' ...
'school = {Auburn University}, ' ...
'volume = {59}, ' ...
'pages = {231--239}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Balistes-capriscus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

