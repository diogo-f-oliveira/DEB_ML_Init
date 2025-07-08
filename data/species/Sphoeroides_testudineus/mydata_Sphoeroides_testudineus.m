function [data, auxData, metaData, txtData, weights] = mydata_Sphoeroides_testudineus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Tetraodontidae';
metaData.species    = 'Sphoeroides_testudineus'; 
metaData.species_en = 'Checkered puffer'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 05];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'PaulYane2012';   
  temp.am = C2K(25.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on LN data';
data.Li  = 38.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.6e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'MerrLaro1977';
  comment.Wwb = 'based on egg diameter of 0.85 - 0.91 mm of Sphoeroides_maculatus: pi/6*0.088^3';
data.Wwp = 22.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02089*Lp^2.9, see F1';
data.Wwi = 944.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02089*Li^2.93, see F1; max. published weight: 400.00 g';

data.Ri  = 1146*944.5/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri  = 'sta';   
  temp.Ri = C2K(25.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on specific fecundity 1146 eggs';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (d), total lenfth (cm)
151.156	4.259
210.771	6.481
241.945	8.333
302.948	10.556
333.458	11.389
363.286	11.759
365+29.504	12.037
365+60.047	11.667
365+91.250	12.500
365+121.782	12.500
365+149.518	13.241
365+180.732	13.704
365+211.238	14.630
365+271.558	16.481
365+302.787	16.389
365+333.990	17.222
365+362.435	17.407
730-1.182	17.593
730+90.420	17.407
730+119.562	17.500
730+181.295	18.426
730+272.861	19.537
730+333.933	19.259
1095+28.574	20.556
1095+59.109	20.463
1095+120.166	20.741
1095+152.091	20.556
1095+213.844	20.741];
data.tL(:,1) = data.tL(:,1) - 20;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PaulYane2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

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
D2 = 'Temperature in tL data is assumed to vary as 18+10*sin(pi*2*(t-t_0)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length - weight: Ww in g = 0.02089*(TL in cm)^2.93';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4Z2GV'; % Cat of Life
metaData.links.id_ITIS = '173291'; % ITIS
metaData.links.id_EoL = '46570974'; % Ency of Life
metaData.links.id_Wiki = 'Sphoeroides_testudineus'; % Wikipedia
metaData.links.id_ADW = 'Sphoeroides_testudineus'; % ADW
metaData.links.id_Taxo = '154142'; % Taxonomicon
metaData.links.id_WoRMS = '158936'; % WoRMS
metaData.links.id_fishbase = 'Sphoeroides-testudineus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sphoeroides_testudineus}}';
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
bibkey = 'PaulYane2012'; type = 'incollection'; bib = [ ... 
'publisher = {Wiley-Blackwell}, ' ...
'author = {Daniel Pauly and Alejandro Y\''{a}\~{n}ez-Arancibia}, ' ... 
'editor = {John W. Day and Byron C. Crump and W. Michael Kemp,\ and Alejandro Y\''{a}\˜{n}ez-Arancibia}, ' ...
'year = {2012}, ' ...
'title = {FISHERIES IN LAGOON-ESTUARINE ECOSYSTEMS}, ' ...
'booktitle = {Estuarine Ecology}, ' ...
'chapter = {18}, ' ...
'pages = {465-482}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MerrLaro1977'; type = 'article'; bib = [ ...  
'author = {John V. Merriner and Joanne L. Laroche}, ' ...
'year = {1977}, ' ...
'title  = {Fecundity of the Northern Puffer, \emph{Sphoeroides maculatus}, from {C}hesapeake {B}ay}, ' ...
'journal = {Chesapeake Science}, ' ...
'volume = {18(1)}, ' ...
'pages = {81-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Sphoeroides-testudineus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sta'; type = 'Misc'; bib = ...
'howpublished = {\url{https://sta.uwi.edu/fst/lifesciences/sites/default/files/lifesciences/documents/ogatt/Sphoeroides_testudineus%%20-%%20Checkered%%20Puffer.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

