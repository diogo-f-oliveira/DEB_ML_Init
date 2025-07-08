  function [data, auxData, metaData, txtData, weights] = mydata_Dolloidraco_longedorsalis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Artedidraconidae';
metaData.species    = 'Dolloidraco_longedorsalis'; 
metaData.species_en = 'Barbeled plunderfish'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 15];

%% set data
% zero-variate data
data.ab = 150;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(-1.1); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'MoraMora2000';   
  temp.am = C2K(-1.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 11;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'MeneRigi2016'; 
data.Li = 13.7; units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0072;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'MeneRigi2016';
  comment.Wwb = 'based on egg diameter of 2.4 mm: pi/6*0.24^3';
data.Wwp = 7.48;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','MeneRigi2016'};
  comment.Wwp = 'based on 0.00562*Lp^3.08, see F1';
data.Wwi = 14.4; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00562*Li^3.08, see F1; max published weight 13.9 g';

data.Ri = 209/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'MeneRigi2016';   
  temp.Ri = C2K(-1.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL_fm = [ ... % time(yr), total length (cm)
    2  5.2  5.2
    3  6.5  6.5
    4  7.7  8.1
    5  8.8  9.2
    6  9.0  8.9
    7  9.9  9.6
    8 10.8 10.1 
    9 11.1 10.6
   10 10.5 10.7
   11 10.7 10.9
   12 11.0 10.4
   13 11.1  9.6
   14 12.1 NaN
   19 12.2 NaN];
data.tL_fm(:,1) = 365 * (0.7+data.tL_fm(:,1));  % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time', 'total length'};  
temp.tL_fm = C2K(-1.1);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'MoraMora2000'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm =  5 * weights.tL_fm;
weights.Wwi =  3 * weights.Wwi;
weights.ab =  0 * weights.ab;

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
% set1 = {'LW_f', 'LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69TG8'; % Cat of Life
metaData.links.id_ITIS = '642773'; % ITIS
metaData.links.id_EoL = '46573088'; % Ency of Life
metaData.links.id_Wiki = 'Chionodraco_myersi'; % Wikipedia
metaData.links.id_ADW = 'Chionodraco_myersi'; % ADW
metaData.links.id_Taxo = '170838'; % Taxonomicon
metaData.links.id_WoRMS = '234646'; % WoRMS
metaData.links.id_fishbase = 'Chionodraco-myersi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Chionodraco_myersi}}';  
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
bibkey = 'MoraMora2000'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s003000000132}, ' ...
'author = {Beatriz Morales-Nin and Joan Moranta and Eduardo Balguerias}, ' ...
'year = {2000}, ' ...
'title = {Growth and age validation in high-{A}ntarctic fish}, ' ... 
'journal = {Polar Biology}, ' ...
'volume = {23(9)}, ' ...
'pages = {626–634}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeneRigi2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-016-1919-9}, ' ...
'author = {Claudia Meneghesso and Emilio Riginella and Mario La Mesa and Fortunata Donato and Carlotta Mazzoldi}, ' ...
'year = {2016}, ' ...
'title = {Age and reproduction in two {A}ntarctic plunderfishes ({A}rtedidraconidae) from the {W}eddell {S}ea}, ' ... 
'journal = {Polar Biology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Chionodraco-myersi.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
