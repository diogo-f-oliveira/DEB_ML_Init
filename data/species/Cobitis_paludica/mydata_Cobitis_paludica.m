  function [data, auxData, metaData, txtData, weights] = mydata_Cobitis_paludica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cobitidae';
metaData.species    = 'Cobitis_paludica'; 
metaData.species_en = 'Iberian loach'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'OlivTorr2002';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'OlivTorr2002'; 
data.Lpm = 5;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty foremales';  bibkey.Lpm = 'OlivTorr2002'; 
data.Li = 13;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';
data.Lim = 12;  units.Lim = 'cm'; label.Lim = 'ultimate total length for males'; bibkey.Lim = {'fishbase','OlivTorr2002'}; 
  comment.Lim = 'fishbase gives 7 cm, but OlivTorr2002 data show that males are only a little bit smaller than females';

data.Wwb = 7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'OlivTorr2002';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';
data.Wwp = 1.6;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = {'fishbase','OlivTorr2002'};
  comment.Wwp = 'based on based on 0.00603*Lp^3.06, see F1';
data.Wwi = 15.45; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00603*Li^3.06, see F1';

data.Ri = 1986/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate at TL 9 cm';      bibkey.Ri = 'OlivTorr2002';
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0 5.48
1 7.65
2 8.43
3 8.90
4 8.84];
data.tL_f(:,1) = (1.5 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OlivTorr2002';
comment.tL_f = 'Data for females for spring 1989';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0 5.38
1 6.12
2 7.29
3 8.32];
data.tL_m(:,1) = (1.5 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OlivTorr2002';
comment.tL_m = 'Data for males for spring 1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 5 * weights.Ri;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'WK2K'; % Cat of Life
metaData.links.id_ITIS = '687863'; % ITIS
metaData.links.id_EoL = '213690'; % Ency of Life
metaData.links.id_Wiki = 'Cobitis_paludica'; % Wikipedia
metaData.links.id_ADW = 'Cobitis_paludica'; % ADW
metaData.links.id_Taxo = '171517'; % Taxonomicon
metaData.links.id_WoRMS = '1014050'; % WoRMS
metaData.links.id_fishbase = 'Cobitis-paludica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cobitis_paludica}}';  
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
bibkey = 'OlivTorr2002'; type = 'Article'; bib = [ ...  
'doi = {10.1006/jfbi.2001.1851}, ' ...
'author = {F. J. Oliva-Paterna and M. M. Torralva and C. Fernandez-Delgado}, ' ...
'year = {2002}, ' ...
'title = {Age, growth and reproduction of Cobitis paludica in a seasonal stream}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {60}, '...
'pages = {389-404}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cobitis-paludica.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
