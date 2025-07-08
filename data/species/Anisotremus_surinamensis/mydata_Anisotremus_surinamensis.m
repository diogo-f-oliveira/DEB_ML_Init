function [data, auxData, metaData, txtData, weights] = mydata_Anisotremus_surinamensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Haemulidae';
metaData.species    = 'Anisotremus_surinamensis'; 
metaData.species_en = 'Black margate'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2025 02 18]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 18];

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BurtPott2019';   
  temp.am = C2K(25.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 29; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 76;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of Lutjanus stellatus: pi/6*0.085^3'; 
data.Wwp = 515;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02042*Lp^3.01, see F1';
data.Wwi = 9361; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02042*Li^3.01, see F1; max. published weight: 5.8 kg';

data.Ri  = 2.2e6/365;   units.Ri  = '#/d'; label.Ri  = 'max reoduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(25.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Haemulon_album';
  
% uni-variate data
% time-length
data.tL = [ ... % time (D), total length (cm)
    3 34.2
    4 29.5
    5 33.6
    6 35.3
    7 39.1
    8 40.9
    9 40.8
   10 41.1
   11 50.2
   12 42.9
   13 49.4
   14 35.4
   15 57.6
   16 46.2
   17 48.5
   18 47.9];
data.tL(:,1) = (data.tL(:,1) + 0.9)*365;  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BurtPott2019'; comment.tL = 'record 223';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Wwi = 2 * weights.Wwi;
weights.Li = 2 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = 'weight-length relationship: W in g = 0.02042*(TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5V58G'; % Cat of Life
metaData.links.id_ITIS = '169084'; % ITIS
metaData.links.id_EoL = '46578507'; % Ency of Life
metaData.links.id_Wiki = 'Anisotremus_surinamensis'; % Wikipedia
metaData.links.id_ADW = 'Anisotremus_surinamensis'; % ADW
metaData.links.id_Taxo = '160983'; % Taxonomicon
metaData.links.id_WoRMS = '279623'; % WoRMS
metaData.links.id_fishbase = 'Anisotremus-surinamensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Anisotremus_surinamensis}}';
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
bibkey = 'BurtPott2019'; type = 'techreport'; bib = [ ... 
'doi = {10.3390/fishes4030044}, ' ...
'author = {Michael L. Burton and Jennifer C. Potts and Andrew D. Ostrowski}, ' ... 
'year = {2019}, ' ...
'title = {Preliminary Estimates of Age, Growth and Natural Mortality of Margate, \emph{Haemulon album}, and Black Margate, \emph{Anisotremus surinamensis}, from the {S}outheastern {U}nited {S}tates}, ' ...
'journal = {Fishes}, ' ...
'volume = {4}, ' ...
'pages = {44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Anisotremus-surinamensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
