  function [data, auxData, metaData, txtData, weights] = mydata_Parambassis_ranga
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Ambassidae';
metaData.species    = 'Parambassis_ranga'; 
metaData.species_en = 'Indian glassy fish';

metaData.ecoCode.climate = {'Am','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFe', '0iFl', '0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs', 'Fg', 'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 01 19];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 19];

%% set data
% zero-variate data
data.am = 4*365;  units.am = 'd';   label.am = 'life span';                bibkey.am = 'IshiTach2012';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 2.65;   units.Lp = 'cm';  label.Lp = 'total length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 9.5;   units.Li = 'cm';  label.Li = 'ultimate total length';    bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm of Ambassis_agassizii: pi/6*0.07^3';
data.Wwp = 0.24;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';  bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01318*Lp^2.96, see F1';
data.Wwi = 10.3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^2.96, see F1; max. published weight: 11.53 g ';

data.GSI = 0.12;       units.GSI = 'g/g';  label.GSI = 'gonado somatic index';     bibkey.GSI = 'ArauHaiv2000';
  temp.GSI = C2K(17); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% uni-variate data

% time - length
data.tL_fm = [ ... % time since birth (yr), std length (cm)
    0 3.15 2.93
    1 3.55 3.35
    2 3.93 3.65
    3 4.96 4.40];
data.tL_fm(:,1) = (1 + data.tL_fm(:,1)) * 365; % convert yr to d
data.tL_fm(:,2:3) = data.tL_fm(:,2:3)/ 0.76; % convert SL to TL
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(25); units.temp.tL_fm = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_fm = 'IshiTach2012'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);
                                 
%% Links
metaData.links.id_CoL = '4D2MY'; % Cat of Life
metaData.links.id_ITIS = '645431'; % ITIS
metaData.links.id_EoL = '46580194'; % Ency of Life
metaData.links.id_Wiki = 'Parambassis_ranga'; % Wikipedia
metaData.links.id_ADW = 'Parambassis_ranga'; % ADW
metaData.links.id_Taxo = '182951'; % Taxonomicon
metaData.links.id_WoRMS = '282072'; % WoRMS
metaData.links.id_fishbase = 'Parambassis-ranga'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Parambassis_ranga}}';  
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
bibkey = 'IshiTach2012'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1439-0426.2011.01896.x}, ' ...
'author = {Ishikawa, T. and K. Tachihara}, ' ...
'year = {2012}, ' ...
'title = {Reproductive biology, growth, and age composition of non-native {I}ndian glassy fish \emph{Parambassis ranga} ({H}amilton, 1822) in {H}aebaru {R}esevoir, {O}kinawa-jima {I}sland, southern {J}apan}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {28(2)}, '...
'pages = {231-237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Parambassis-ranga.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
