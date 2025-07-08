function [data, auxData, metaData, txtData, weights] = mydata_Oligocottus_maculosus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Oligocottus_maculosus'; 
metaData.species_en = 'Tidepool sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 17];

%% set data
% zero-variate data

data.am = 6 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'MichChad1976';   
  temp.am = C2K(9.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Clinocottus_analis';
  
data.Lp  = 4.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Clinocottus_analis';
data.Li  = 8.9;  units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp = 0.67;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00589*Lp^3.15, see F1';
data.Wwi = 5.76; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00589*Li^3.15, see F1'; 

data.Ri = 1e3/365; units.Ri = '#/d';   label.Ri = 'max reproduction rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(9.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Clinocottus_analis';

% uni-variate data
% time-length
data.tL_PB = [ ... % age (years), total length (cm) 
    1   4.03 NaN
    2   4.39 4.40
    3   5.19 4.73
    4   6.10 5.93
    5   6.48 6.20];
data.tL_PB(:,1) = 365 * (0.3 + data.tL_PB(:,1)); % convert yr to d
units.tL_PB = {'d', 'cm'}; label.tL_PB = {'time since birth', 'total length'};  
temp.tL_PB = C2K(9.1);  units.temp.tL_PB = 'K'; label.temp.tL_PB = 'temperature';
bibkey.tL_PB = 'MichChad1976'; 
treat.tL_PB = {1 {'Port Renfrew','Bruels Point'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_PB = weights.tL_PB * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00589*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '495YJ'; % Cat of Life
metaData.links.id_ITIS = '167333'; % ITIS
metaData.links.id_EoL = '46569119'; % Ency of Life
metaData.links.id_Wiki = 'Oligocottus_maculosus'; % Wikipedia
metaData.links.id_ADW = 'Oligocottus_maculosus'; % ADW
metaData.links.id_Taxo = '181720'; % Taxonomicon
metaData.links.id_WoRMS = '281872'; % WoRMS
metaData.links.id_fishbase = 'Oligocottus-maculosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Clinocottus_globiceps}}';
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
bibkey = 'MichChad1976'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.1976.tb03904.x}, ' ...
'author = {Michael, E. and Chadwick, P.}, ' ... 
'year = {1976}, ' ...
'title = {A comparison of growth and abundance for tidal pool fishes in {C}alifornia and {B}ritish {C}olumbia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {8(1)}, ' ...
'pages = {27–34}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Clinocottus-globiceps.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

