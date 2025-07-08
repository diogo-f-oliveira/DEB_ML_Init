function [data, auxData, metaData, txtData, weights] = mydata_Scorpaena_porcus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Scorpaenidae';
metaData.species    = 'Scorpaena_porcus'; 
metaData.species_en = 'Black scorpionfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm', 'MAbl'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 21];

%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(13.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'BilgCeli2009';   
  temp.am = C2K(13.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 40.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.5 mm of Scorpaenichthys_marmoratus: pi/6*0.15^3';
data.Wwi = 978.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.03, see F1';
 
data.Ri = 32850/365;     units.Ri = '#/d';    label.Ri = 'max reproduction rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(13.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length 
data.tL_fm = [ ... %  year class (yr), total length(cm)
0	 6.225  6.686
1	 8.156  7.463
2	13.776 13.545
3	16.513 16.975
4	19.710 20.749
5	23.371 22.680
6	25.994 NaN
7	26.887 NaN
8	31.931 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.75) * 365; % convert yr to d
units.tL_fm = {'d' 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(13.9); units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BilgCeli2009'; treat.tL_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.Lp = 5 * weights.Lp;
weights.ab = 0 * weights.ab;

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
% set1 = {'tL_f','tL_m'}; subtitle1 = {'GrebCail2010 data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '79Z9Q'; % Cat of Life
metaData.links.id_ITIS = '166840'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scorpaena_porcus'; % Wikipedia
metaData.links.id_ADW = 'Scorpaena_porcus'; % ADW
metaData.links.id_Taxo = '187169'; % Taxonomicon
metaData.links.id_WoRMS = '127247'; % WoRMS
metaData.links.id_fishbase = 'Scorpaena-porcus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scorpaena_porcus}}';
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
bibkey = 'BilgCeli2009'; type = 'Article'; bib = [ ... 
'doi = {0.1111/j.1439-0426.2008.01157.x}, ' ...
'author = {S. Bilgin and E. \c{S}. \c{C}elik}, ' ... 
'year = {2009}, ' ...
'title = {Age, growth and reproduction of the black scorpionfish, \emph{Scorpaena porcus} ({P}isces, {S}corpaenidae), on the {B}lack {S}ea coast of {T}urkey}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {25}, ' ...
'pages = {55–60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scorpaena-porcus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

