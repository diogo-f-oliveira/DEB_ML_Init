function [data, auxData, metaData, txtData, weights] = mydata_Belone_euxini

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Belonidae';
metaData.species    = 'Belone_euxini'; 
metaData.species_en = 'Blacksea garfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAbl'};
metaData.ecoCode.habitat = {'biMcp'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 03];

%% set data
% zero-variate data

data.ab = 10;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(17);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp_f  = 34.4; units.Lp_f  = 'cm'; label.Lp_f  = 'total length at puberty for females';  bibkey.Lp_f  = 'fishbase'; 
data.Lp_m  = 33.3; units.Lp_m  = 'cm'; label.Lp_m  = 'total length at puberty for males';  bibkey.Lp_m  = 'fishbase'; 
data.Li_f  = 65.1; units.Li_f  = 'cm'; label.Li_f  = 'ultimate total length for females';  bibkey.Li_f  = 'fishbase';
data.Li_m  = 55.3; units.Li_m  = 'cm'; label.Li_m  = 'ultimate total length for males';    bibkey.Li_m  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 52.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00091*Lp^3.10, see F1';
data.Wwi = 381.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00091*Li_f^3.10, see F1';
 
data.Ri = 32453/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm) for females
    1 28.5 30.0
    2 34.0 33.0
    3 38.5 36.5
    4 42.0 42.5
    5 48.0 46.0
    6 52.5 48.0
    7 54.0 NaN];
data.tL_fm(:,1) = (0.8+data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm    = C2K(17.35);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'SamsSagl2023'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
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
% set1 = {'tL_f','tL_m'};
% subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00091*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'LBF3'; % Cat of Life
metaData.links.id_ITIS = '645293'; % ITIS
metaData.links.id_EoL = '2806613'; % Ency of Life
metaData.links.id_Wiki = 'Belone_euxini'; % Wikipedia
metaData.links.id_ADW = 'Belone_euxini'; % ADW
metaData.links.id_Taxo = '277726'; % Taxonomicon
metaData.links.id_WoRMS = '300045'; % WoRMS
metaData.links.id_fishbase = 'Belone-euxini'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Belone_belone}}';
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
bibkey = 'SamsSagl2023'; type = 'Article'; bib = [ ... 
'author = {Serap Samsun and Naciye Erdo\v{g}an Sa\v{g}lam}, ' ... 
'year = {2023}, ' ...
'title = {Determination of Growth and Reproduction Characteristics of Gar sh (Belone euxini Günther, 1866) in the South Black Sea}, ' ...
'journal = {Research Square}, ' ...
'doi = {10.21203/rs.3.rs-3791401/v1}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Belone-belone.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
