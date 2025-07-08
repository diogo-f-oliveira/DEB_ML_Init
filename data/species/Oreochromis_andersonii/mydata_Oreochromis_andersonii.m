function [data, auxData, metaData, txtData, weights] = mydata_Oreochromis_andersonii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Oreochromis_andersonii'; 
metaData.species_en = 'Three spotted tilapia'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TP','TH','TN'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 17];

%% set data
% zero-variate data

data.am = 13*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 20.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 61;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'guess';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.5 mm : pi/6*0.25^3';
data.Wwp = 135.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01622*Lp^2.98, see F1';
data.Wwi = 3391;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwim = 'based on 0.01622*Li^2.98, see F1; max published weight 4.7 kg';

data.Ri  = 730/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(30); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_fm = [ ... % time (yr), total length increment (cm/yr)
    1 13.90 13.64
    2  6.90  7.48
    3  4.37  5.57
    4  2.86  4.08
    5  2.24  3.39
    6  2.05  3.05
    7  1.75  2.56
    8  1.84  2.33];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1) + 0.2); % convert yr to d
data.tL_fm(:,2:3) = cumsum(data.tL_fm(:,2:3),1); % convert length increment to length
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time', 'total length'};  
temp.tL_fm    = C2K(30);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Dudl1974'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01622*(TL in cm)^2.98'; 
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7553J'; % Cat of Life
metaData.links.id_ITIS = '648837'; % ITIS
metaData.links.id_EoL = '46572763'; % Ency of Life
metaData.links.id_Wiki = 'Oreochromis_andersonii'; % Wikipedia
metaData.links.id_ADW = 'Oreochromis_andersonii'; % ADW
metaData.links.id_Taxo = '182107'; % Taxonomicon
metaData.links.id_WoRMS = '279194'; % WoRMS
metaData.links.id_fishbase = 'Oreochromis-andersonii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oreochromis_andersonii}}';
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
bibkey = 'Dudl1974'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1974)103<281:gototk>2.0.co;2}, ' ...
'author = {Dudley, R.G.}, ' ...
'year  = {1974}, ' ...
'title = {Growth of tilapia of the {K}afue floodplain, {Z}ambia: predicted effects of the {K}afue {G}orge dam}, ' ...  
'journal = {Trans. Am. Fish. Soc.}, ' ...
'volume = {103(2)}, ' ...
'pages = {281-291}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Oreochromis_andersonii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

