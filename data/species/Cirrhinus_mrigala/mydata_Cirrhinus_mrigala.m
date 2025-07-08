  function [data, auxData, metaData, txtData, weights] = mydata_Cirrhinus_mrigala

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Cyprinidae';
metaData.species    = 'Cirrhinus_mrigala'; 
metaData.species_en = 'Mrigal carp'; 

metaData.ecoCode.climate = {'Am', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'W-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 03 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 08]; 

%% set data
% zero-variate data
data.ab = 7;        units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;      units.tp = 'd';  label.tp = 'age at puberty for females';         bibkey.tp = 'MayaTyag2015';
  temp.tp = C2K(28); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tp and tL';
data.am = 25*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'MayaTyag2015'; 
  comment.Lp = 'based on Wwp and F1';
data.Li = 99;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 5.236e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'Based on egg diameter of 1 mm for Cirrhinus cirrhosus: pi/6*0.1^3';
data.Wwp = 340;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'IqbaKaus2009';
  comment.Wwp = 'based on tp and tL';
data.Wwi = 14635;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Li and F1';
    
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm), females, males
    0 21.81 22.41
    1 30.29 30.19
    2 46.98 48.61
    3 59.73 60.63
    4 68.38 72.36
    5 77.62 76.25
    6 81.00 82.05
    7 86.40 86.00
    8 89.80 NaN
    9 91.70 NaN
   10 94.30 NaN];
data.tL(:,1) = 365 * (0.9+data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MayaTyag2015'; treat.tL = {1, {'females','males'}};
comment.tL = 'Data from Yamuna river at Allahaba';

% weight-fecundity
data.WN = [ ... % weight (g), fecundity
    342  34122
    840 132129
   1133 228000];
units.WN = {'g', '#'}; label.WN = {'weight', 'fecundity'};  
temp.WN = C2K(28);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'IqbaKaus2009'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 3;
weights.ab = weights.ab * 0;
weights.Wwb = weights.Wwb * 5;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'TL-weight: weight (in g) = 0.0083 * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'VGTK'; % Cat of Life
metaData.links.id_ITIS = '163679'; % ITIS
metaData.links.id_EoL = '210098'; % Ency of Life
metaData.links.id_Wiki = 'Cirrhinus_mrigala'; % Wikipedia
metaData.links.id_ADW = 'Cirrhinus_mrigala'; % ADW
metaData.links.id_Taxo = '319841'; % Taxonomicon
metaData.links.id_WoRMS = '314143'; % WoRMS
metaData.links.id_fishbase = 'Cirrhinus-mrigala'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cirrhinus_mrigala}}';  
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
bibkey = 'MayaTyag2015'; type = 'article'; bib = [ ...  
'author = {Priyanka Mayank and R. K. Tyagi1 and Amitabh Chandra Dwivedi}, ' ...
'year = {2015}, ' ...
'title = {Studies on age, growth and age composition of commercially important fish species, \emph{Cirrhinus mrigala} ({H}amilton, 1822) from the tributary of the {G}anga river, {I}ndia}, ' ... 
'journal = {European Journal of Experimental Biology}, ' ...
'volume = {5(2)}, ' ...
'pages = {16-21}, ' ...
'howpublished = {\verb+\url{www.pelagiaresearchlibrary.com}+}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IqbaKaus2009'; type = 'article'; bib = [ ...  
'author = {Zafar Iqbal and Sumaira Kausar}, ' ...
'year = {2009}, ' ...
'title = {FECUNDITY OF \emph{Cirrhinus mrigala} ({H}AMILTON) REARED IN EARTHEN POND}, ' ... 
'journal = {Punjab Univ. J. Zool.}, ' ...
'volume = {24(1-2))}, ' ...
'pages = {31-39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cirrhinus-mrigala}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

