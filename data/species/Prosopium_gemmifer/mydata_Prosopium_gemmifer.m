function [data, auxData, metaData, txtData, weights] = mydata_Prosopium_gemmifer
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Prosopium_gemmifer'; 
metaData.species_en = 'Bonneville cisco'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jiFl'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz','biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm   = [2020 09 11];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 11];


%% set data
% zero-variate data

data.am = 10*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranCord1965';   
  temp.am = C2K(4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'FranCord1965'; 
 comment.Lp = 'based on tp 2 or 3 yr and tL data';
data.Li  = 22;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';

data.Wwb = 4.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Shes2017';
  comment.Wwb = 'based on egg diameter of 2.1 mm (1.9 to 2.4 mm) for Prosopium cylindraceum: pi/6*0.21^3';
data.Wwp  = 13; units.Wwp  = 'g';	label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = {'fishbase','FranCord1965'}; 
  comment.Wwp = 'based on 0.00457*Lp^3.13, see F1';
data.Wwi  = 73; units.Wwi  = 'g';	label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = {'fishbase','FranCord1965'}; 
  comment.Wwi = 'based on 0.00457*Li^3.13, see F1';
  
data.Ri  = 1301/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'FranCord1965';   
  temp.Ri = C2K(9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';


% uni-variate data
% time-length
data.tL = [... %  time since birth (yr), total length (inch)
    1 2.1
    2 4.1
    3 5.7
    4 6.5
    5 7.0
    6 7.2
   10 7.7];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 2.54; % convert inch to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'Perry 1943'};  
temp.tL    = C2K(4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FranCord1965';
comment.tL = 'Data from Perry 1943';

data.tL1 = [... %  time since birth (yr), total length (inch)
    3 6.5
    4 7.1
    5 7.5
    6 7.8
    7 8.1];
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d
data.tL1(:,2) = data.tL1(:,2) * 2.54; % convert inch to cm
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length', 'Bangerter 1964'};  
temp.tL1    = C2K(4);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'FranCord1965';
comment.tL1 = 'Data from Bangerter 1964';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tL1 = 5 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from Perry (1943), Bangerter (1964)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: W in g = 0.00457 *(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '4MW96'; % Cat of Life
metaData.links.id_ITIS = '162013'; % ITIS
metaData.links.id_EoL = '215643'; % Ency of Life
metaData.links.id_Wiki = 'Prosopium_gemmifer'; % Wikipedia
metaData.links.id_ADW = 'Prosopium_gemmifer'; % ADW
metaData.links.id_Taxo = '184831'; % Taxonomicon
metaData.links.id_WoRMS = '1016966'; % WoRMS
metaData.links.id_fishbase = 'Prosopium-gemmifer'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Prosopium_gemmifer}}';
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
bibkey = 'FranCord1965'; type = 'Article'; bib = [ ... 
'author = {Ted C. Frantz and Alamo J. Cordone}, ' ... 
'year = {1965}, ' ...
'title = {INTRODUCTION OF THE BONNEVILLE CISCO (\emph{Prosopium gemmifer} {S}NYDER) INTO {L}AKE {T}AHOE, {C}ALIFORNIA AND {N}EVADA}, ' ...
'journal = {Calif. Fish and Game}, ' ...
'volume = {51(4)}, ' ...
'pages = {270-275}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shes2017'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945217020175}, ' ...
'author = {A. V. Shestakov}, ' ... 
'year = {2017}, ' ...
'title = {Biology of Round Whitefish \emph{Prosopium cylindraceum} ({C}oregonidae) of the {A}nadyr {R}iver}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {257-264}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Prosopium-gemmifer.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Perr1943'; type = 'phdthesis'; bib = [ ... 
'author = {Perry, L. Edward}, ' ... 
'year = {1943}, ' ...
'title = {Biology and economic significance of the peaknose cisco of Bear Lake, Idaho and Utah}, ' ...
'school = {Univ. of Michican}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bang1963'; type = 'techreport'; bib = [ ... 
'author = {Bangerter, Arnold}, ' ... 
'year = {1963}, ' ...
'title = {Bear Lake Bonneville cisco investigations, 1963}, ' ...
'series = {mimeo}, ' ...
'institution = {Utah State Dept. Fish and Game}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

