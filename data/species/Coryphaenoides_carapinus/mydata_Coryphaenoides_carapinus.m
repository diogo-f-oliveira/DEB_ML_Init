function [data, auxData, metaData, txtData, weights] = mydata_Coryphaenoides_carapinus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Macrouridae';
metaData.species    = 'Coryphaenoides_carapinus'; 
metaData.species_en = 'Carapine grenadier'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MA','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 07 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 07 31];

%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'BergHunt2021';   
  temp.am = C2K(3.6); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 17;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 45;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.2e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of C. rupestris of 2.6 mm: pi/6*0.26^3';
data.Wwp = 19;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00219*Lp^3.20, see F1';
data.Wwi = 427;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00219*Li^3.20, see F1';

data.Ri  = 800/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(3.6);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap=0.9';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (mm)
1.015	3.451
1.017	4.122
1.055	4.560
1.986	3.551
2.026	5.020
2.486	6.024
2.533	3.059
2.976	4.501
4.018	3.982
4.499	5.991
6.514	6.499
7.035	9.978
8.026	10.980
8.497	8.993
9.523	9.401
10.511	9.424
10.515	10.919
10.549	9.913
10.565	8.985
11.521	10.915
12.091	12.022
12.564	10.937];
data.tL(:,1) = 365*(data.tL(:,1)+0.2); % convert yr to d
data.tL(:,2) = data.tL(:,2)*3.57; % convert PAL to TL, see F2
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(3.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BergHunt2021';
comment.tL = 'PAL was converted to TL using TL=3.57*TL';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Wwi = 3 * weights.Wwi;
weights.Li = 3 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';  
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight Ww in g = 0.00219*(TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: TL = 3.57*PAL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'YS33'; % Cat of Life
metaData.links.id_ITIS = '622866'; % ITIS
metaData.links.id_EoL = '46564514'; % Ency of Life
metaData.links.id_Wiki = 'Coryphaenoides_carapinus'; % Wikipedia
metaData.links.id_ADW = 'Coryphaenoides_carapinus'; % ADW
metaData.links.id_Taxo = '171935'; % Taxonomicon
metaData.links.id_WoRMS = '158956'; % WoRMS
metaData.links.id_fishbase = 'Coryphaenoides-carapinus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coryphaenoides_carapinus}}';
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
bibkey = 'BergHunt2021'; type = 'article'; bib = [ ... 
'doi = {10.1111/jfb.14801}, ' ...
'author = {Odd Aksel Bergstad and Rebecca H. Hunter and Nicola J.Cousins and David M. Bailey and Terje J{/o}rgensen}, ' ... 
'year = {2021}, ' ...
'title = {Notes on age determination, size and age structure, longevity and growth of co-occurring macrourid fishes}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {99}, '...
'pages = {1032–1043}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coryphaenoides-carapinus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

