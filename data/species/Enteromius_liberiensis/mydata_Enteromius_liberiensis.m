  function [data, auxData, metaData, txtData, weights] = mydata_Enteromius_liberiensis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Enteromius_liberiensis'; 
metaData.species_en = 'Barbel'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2018 11 04];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 04]; 

%% set data
% zero-variate data
data.ab = 9;        units.ab = 'd';  label.ab = 'age at birth';            bibkey.ab = 'guess'; 
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'guess based on Barbus barbus with temp correction';
data.tp = 365;      units.tp = 'd';  label.tp = 'age at puberty';          bibkey.tp = 'Payn1976';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 7;    units.Lp = 'cm'; label.Lp = 'total length at puberty';     bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on max SL of 5.5 cm and photo to convert SL to TL';
data.Li = 12.9;    units.Li = 'cm'; label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';
  comment.Li = 'based on max SL of 10 cm and photo to convert SL to TL';

data.Wwb = 1.0e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'Computed from egg diameter of 1.25 mm: 4/3*pi*0.062^3';
data.Wwp = 3.92;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Weim2007';
  comment.Wp = '3 g based on length-weight of Barbus barbus';
data.Wwi = 23.8;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'Weim2007';
  comment.Wwi = '18.8 g based on length-weight of Barbus barbus';

data.Ri = 5e2/365;   units.Ri = '#/d';  label.Ri = 'life span';            bibkey.Ri = 'guess';   
  temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.93';

% univariate data
% time-length
% females
data.tL_f = [ ... % time since birth (yr), total length (cm)
1  7.0
2  8.4
3  9.3
4 10.6];
data.tL_f(:,1) = 365 * data.tL_f(:,1);
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Payn1976';
comment.tL_f = 'Data for females';
% males
data.tL_m = [ ... % time since birth (yr), total length (cm)
1  7.0
2  8.1
3  9.5
4  9.9];
data.tL_m(:,1) = 365 * data.tL_m(:,1);
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(24);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Payn1976';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: weight (g) = 0.01259 * (TL in cm)^2.95';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39YBR'; % Cat of Life
metaData.links.id_ITIS = '688506'; % ITIS
metaData.links.id_EoL = '52230046'; % Ency of Life
metaData.links.id_Wiki = 'Enteromius_liberiensis'; % Wikipedia
metaData.links.id_ADW = 'Barbus_camptacanthus'; % ADW
metaData.links.id_Taxo = '5372305'; % Taxonomicon
metaData.links.id_WoRMS = '1467898'; % WoRMS
metaData.links.id_fishbase = 'Enteromius-liberiensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Barbus_barbus}}';  
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
bibkey = 'Payn1976'; type = 'Techreport'; bib = [ ...  
'author = {A. I. Payne}, ' ...
'year = {1976}, ' ...
'title = {The determination of age and growth from the scales in \emph{Barbus liberiensis} ({P}isces, {C}yprinidae)}, ' ... 
'journal = {J. Zool., Lond.}, ' ...
'volume = {180}, '...
'pages = {455-465}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/5313}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

