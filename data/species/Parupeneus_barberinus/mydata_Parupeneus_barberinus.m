function [data, auxData, metaData, txtData, weights] = mydata_Parupeneus_barberinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Mullidae';
metaData.species    = 'Parupeneus_barberinus'; 
metaData.species_en = 'Dash-and-dot goatfish';

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MINE', 'MPSW'};
metaData.ecoCode.habitat = {'0pMp', 'piMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 29];

%% set data
% zero-variate data

data.am = 5 * 365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'fishbase';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 13;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 28;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';   bibkey.Li  = 'fishbase';

data.Wwb = 6.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 26.5;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01148*Lp^3.09, see F1';
data.Wwi = 285.5;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.09, see F1; max published weight 275.30 g';

data.Ri  = 26432/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [... % time (d), fork length (cm)
287.214	14.594
319.051	15.836
348.898	16.973
365+12.971	17.442
365+318.419	22.871]; 
data.tL(:,1) = data.tL(:,1) + 130; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Murt2002';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set2,set1};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '75ST7'; % Cat of Life
metaData.links.id_ITIS = '169460'; % ITIS
metaData.links.id_EoL = '46578776'; % Ency of Life
metaData.links.id_Wiki = 'Parupeneus_barberinus'; % Wikipedia
metaData.links.id_ADW = 'Parupeneus_barberinus'; % ADW
metaData.links.id_Taxo = '183286'; % Taxonomicon
metaData.links.id_WoRMS = '218660'; % WoRMS
metaData.links.id_fishbase = 'Parupeneus-barberinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Parupeneus_barberinus}}';
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
bibkey = 'Murt2002'; type = 'techreport'; bib = [ ... 
'author = {Murty, V.S.}, ' ... 
'year = {2002}, ' ...
'title = {Marine ornamental fish resources of Lakshadweep}, ' ...
'institution = {CMFRI Spec. Publ.}, ' ...
'volume = {72}, ' ...
'pages = {1-384}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Parupeneus-barberinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
