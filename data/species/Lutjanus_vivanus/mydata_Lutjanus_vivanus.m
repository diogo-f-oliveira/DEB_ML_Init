function [data, auxData, metaData, txtData, weights] = mydata_Lutjanus_vivanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lutjaniformes'; 
metaData.family     = 'Lutjanidae';
metaData.species    = 'Lutjanus_vivanus'; 
metaData.species_en = 'Silk snapper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 14];

%% set data
% zero-variate data

data.am = 40*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(21.2);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 41.6; units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 83;  units.Li  = 'cm';  label.Li  = 'ultimate fork length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.85 mm of L. stellatus: 4/3*pi*0.0425^3'; 
data.Wwp = 952; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01479*Lp^2.97, see F1';
data.Wwi = 7407; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^2.97, see F1; max. published weight: 8.3 kg';

data.Ri  = 6.5e6/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at TL = 48.5 cm'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(21.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity Lutjanus_carponotatus: 749e3*7407/859';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
    1 21.4
    2 25.6
    3 29.8
    4 35.8
    5 41.1
    6 45.5
    7 49.3
    8 52.1
    9 54.1
   10 55.8];
data.tL(:,1) = 365 * (0.9+data.tL(:,1));  % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(21.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Erzi1991'; comment.tL = 'record 251';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 15 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length: Ww in g = 0.01479*(TL in cm)* TL^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3WGDM'; % Cat of Life
metaData.links.id_ITIS = '168861'; % ITIS
metaData.links.id_EoL = '46580729'; % Ency of Life
metaData.links.id_Wiki = 'Lutjanus_vivanus'; % Wikipedia
metaData.links.id_ADW = 'Lutjanus_vivanus'; % ADW
metaData.links.id_Taxo = '106202'; % Taxonomicon
metaData.links.id_WoRMS = '159801'; % WoRMS
metaData.links.id_fishbase = 'Lutjanus-vivanus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lutjanus_vivanus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Lutjanus-vivanus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
