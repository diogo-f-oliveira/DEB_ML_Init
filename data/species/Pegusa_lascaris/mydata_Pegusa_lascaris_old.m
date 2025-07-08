function [data, auxData, metaData, txtData, weights] = mydata_Pegusa_lascaris
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Pegusa_lascaris'; 
metaData.species_en = 'Sand sole'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18.1); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'}; 
metaData.date_subm  = [2019 02 14]; 
metaData.email      = {'bas.kooijman@vu.nl'}; 
metaData.address    = {'VU University, Amsterdam'};

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2019 02 14]; 

%% set data
% zero-variate data
data.am = 15*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';  
  temp.am = C2K(18.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18;   units.Lp = 'cm';   label.Lp = 'total length at puberty';               bibkey.Lp = 'Deni1990';
data.Li = 28.5;    units.Li = 'cm';   label.Li = 'ultimate total length for females';    bibkey.Li = 'Deni1990';
data.Lim = 25.5;    units.Lim = 'cm';   label.Lim = 'ultimate total length for males'; bibkey.Lim = 'Deni1990';

data.Wwb = 1.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7  mm of Arnoglossun laterna: pi/6*0.07^3';
data.Wwp = 62.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = {'Deni1990','fishbase'};
  comment.Wwp = 'based on 0.00617*Lp^3.19, see F2';
data.Wwi = 270;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = {'Deni1990','fishbase'};
  comment.Wwi = 'based on 0.00617*Li^3.19, see F2';

data.Ri = 3e5/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(18.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Arnoglussus laterns';

% uni-variate data

% time-length data
data.tL_f = [ ... % age (years), total length (cm)
    0  6.7
    1  7.5
    2 18.8
    3 20.9
    4 22.4
    5 24.8
    6 25.2
    7 29.5];
data.tL_f(:,1) = (.75 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length'};  
temp.tL_f = C2K(18.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Deni1990';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (years), total length (cm)
    0  6.7
    1  7.5
    2 18.4
    3 20.3
    4 21.0
    5 22.3
    6 23.8
    7 24.7];
data.tL_m(:,1) = (.75 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length'};  
temp.tL_m = C2K(18.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Deni1990';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; comment1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.comment = {comment1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Preferred temperature 18.1 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Length-Weight relationship: Ww in g = 0.00617*(TL in cm)^3.19';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '75XN6'; % Cat of Life
metaData.links.id_ITIS = '173051'; % ITIS
metaData.links.id_EoL = '46570277'; % Ency of Life
metaData.links.id_Wiki = 'Pegusa_lascaris'; % Wikipedia
metaData.links.id_ADW = 'Pegusa_lascaris'; % ADW
metaData.links.id_Taxo = '513562'; % Taxonomicon
metaData.links.id_WoRMS = '127156'; % WoRMS
metaData.links.id_fishbase = 'Pegusa-lascaris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pegusa_lascaris}}';
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
bibkey = 'Deni1990'; type = 'article'; bib = [ ...
'author = {C. Deniel}, ' ... 
'year   = {1990}, ' ...
'title  = {Comparative study of growth of flatfishes on the west coast of {B}rittany}, ' ...
'journal = {Journalof Fish Biology}, ' ...
'page = {149-166}, ' ...
'volume = {37}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pegusa-lascaris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
