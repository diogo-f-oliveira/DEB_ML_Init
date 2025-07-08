function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_kasmira
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_kasmira'; 
metaData.species_en = 'Bluestripe snapper'; 
metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(26.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 03 13]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 13]; 

%% set data
% zero-variate data

data.ab = 0.75;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(26.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'base on other Lutjanus species';
  
data.Lp  = 21; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = '17 to 25 cm';
data.Li  = 40;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 2.9e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.82 mm: pi/6*0.082^3'; 
data.Wwp = 129; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on length-weight of 0.01479*Lp^2.98, see F1';
data.Wwi = 879; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on length-weight of 0.01479*Li^2.98, see F1';

data.Ri  = 749e3/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lutjanus_carponotatus';
  
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1 16.7 
2 21.5
3 24.2 
4 26.1 
5 27.7 
6 30.8];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MoraRals1990';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01479*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; brackish; reef-associated; depth range 3 - 35 m. Tropical';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '73235'; % Cat of Life
metaData.links.id_ITIS = '168862'; % ITIS
metaData.links.id_EoL = '46580739'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_kasmira'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_kasmira'; % ADW
metaData.links.id_Taxo = '106186'; % Taxonomicon
metaData.links.id_WoRMS = '218482'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-kasmira'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_kasmira}}';
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
bibkey = 'MoraRals1990'; type = 'Article'; bib = [ ... 
'author = {B. Morales-Nin and S. Ralston}, ' ... 
'year = {1990}, ' ...
'title = {Age and growth of \emph{Lutjanus kasmira} ({F}orsk\o{l}) in {H}awaiian waters}, ' ...
'journal = {J. fish. Biol.}, ' ...
'volume = {36}, ' ...
'pages = {191-203}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lutjanus-kasmira.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
