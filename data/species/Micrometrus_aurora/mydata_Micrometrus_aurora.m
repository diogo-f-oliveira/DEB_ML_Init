function [data, auxData, metaData, txtData, weights] = mydata_Micrometrus_aurora
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Embiotocidae';
metaData.species    = 'Micrometrus_aurora'; 
metaData.species_en = 'Reef perch'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.9); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 10];

%% set data
% zero-variate data

data.am = 7*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Hubb1921';   
  temp.am = C2K(15.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 1.2*3; units.Lb  = 'cm';  label.Lb  = 'std length at birth'; bibkey.Lb  = 'Hubb1921'; 
data.Lp  = 1.2*5.9; units.Lp  = 'cm';  label.Lp  = 'std length at puberty for females'; bibkey.Lp  = 'Hubb1921'; 
data.Li  = 18;  units.Li  = 'cm';  label.Li  = 'ultimate standard length for females'; bibkey.Li  = 'fishbase';

data.Wwi  = 88.8;  units.Wwi  = 'g';  label.Wwi  = 'ultimate weight'; bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.01318*Li^3.05, see F1';

% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (d), std length (cm)
0.000	3.177
0.523	7.336
1.005	9.045
1.506	9.708
2.523	10.873
3.039	11.668
3.508	11.711
3.524	11.875
4.024	12.767
4.549	12.877
5.073	13.933
5.535	13.290
6.076	13.661];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
data.tL_f(:,2) = 1.2 * data.tL_f(:,2); % convert SL to TL
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length','female'};  
temp.tL_f    = C2K(15.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Hubb1921'; 
%
data.tL_m = [ ... % time since birth (d), std length (cm)
    0 2.6
  0.5 5.0
  1.5 6.3
  2.5 7.3
  3.5 8.4
  4.5 8.9];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
data.tL_m(:,2) = 1.2 * data.tL_m(:,2); % convert SL to TL
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length','male'};  
temp.tL_m    = C2K(15.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Hubb1921'; 

% length-fecundity
data.LN = [ ... % std length (cm), fecundity
    5.9  7
    6.1  7
    6.5  7
    6.7 10
    7.1  9
    7.3 10
    7.4 10
    8.6 13
    9.2 17
    9.2 17
    9.2 19
   10.6 22
   10.7 23
   11.0 24
   11.3 25
   11.6 19];
data.LN(:,1) = data.LN(:,1) * 1.2;
units.LN   = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN    = C2K(15.9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Hubb1921';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.01318*(TL in cm)^3.05 ';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Viviparous';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'From photo: TL = 1.2 * SL'; 
metaData.bibkey.F3 = 'Hubb1921'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '42Z5C'; % Cat of Life169765
metaData.links.id_ITIS = '169765'; % ITIS
metaData.links.id_EoL = '46572857'; % Ency of Life
metaData.links.id_Wiki = 'Micrometrus_aurora'; % Wikipedia
metaData.links.id_ADW = 'Micrometrus_aurora'; % ADW
metaData.links.id_Taxo = '180039'; % Taxonomicon
metaData.links.id_WoRMS = '281561'; % WoRMS
metaData.links.id_fishbase = 'Micrometrus-aurora'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Micrometrus-aurora}}';
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
bibkey = 'Hubb1921'; type = 'techreport'; bib = [ ... 
'author = {Hubbs, C. L.}, ' ... 
'year = {1921}, ' ...
'title = {The ecology and life history of \emph{Micrometrus aurora} and other viviparous perches of {C}alifornia}, ' ...
'institution = {STATE OF CALIFORNIA DEPARTMENT OF FISH AND GAME MARINE RESOURCES OPERATIONS}, ' ...
'series = {Biol. Bulletin}, ' ...
'volume = {40(4)}, ' ...
'pages = {181-209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Micrometrus-aurora.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
