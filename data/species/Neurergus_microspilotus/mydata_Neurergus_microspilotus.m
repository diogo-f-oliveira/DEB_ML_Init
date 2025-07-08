function [data, auxData, metaData, txtData, weights] = mydata_Neurergus_microspilotus 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Neurergus_microspilotus'; 
metaData.species_en = 'Yellow spotted mountain newt'; 

metaData.ecoCode.climate = {'BSh'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp 
metaData.data_0     = {'ab';'aj';'ap'; 'Lb'; 'Lj'; 'Li'; 'Wwj'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2018 08 14];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromsoe Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 08 14]; 

% a lot of the data are from ambient temperatures which depend
% on the season. We use a standard temp of 15 deg C
T_assumed = 15; 

%% set data
% zero-variate data

data.ab = 28;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'SharVais2014';   
  temp.ab = C2K(mean([15;24]));  units.temp.ab = 'K'; label.temp.ab = 'temperature';
comment.ab = 'temp range is 15-24 deg C';
  data.tj = 18 * 7;    units.tj = 'd';    label.tj = 'time since birth at metamorphosis';           bibkey.tj = 'VaisShar2015';
  temp.tj = C2K(T_assumed);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
comment.tj = 'see fig. 1 - the arrow denotes the age between larval and post larval development';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';           bibkey.tp = 'SharVais2014';
  temp.tp = C2K(T_assumed);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
comment.tp  = 'range: 3-4 years';
  data.am = 14 * 365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(T_assumed);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
comment.am = 'Neurergus kaiseri longevity was estimated to be 14 yr in ';
  
data.Lb  = 14.94e-1;   units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'SharVais2014';  
comment.Lb = 'range: 13.08 to 14.94 mm';
data.Lj  = 34e-1;   units.Lj  = 'cm';  label.Lj  = 'length at metamorphosis';   bibkey.Lj  = 'VaisShar2015';  
comment.Lj = 'extracted from fig. 1';

data.Li  = 9;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'guess';
comment.Li = 'subadult size was recorded at 88mm SVL, table 1 SharVais2014';

data.Wwj = 1.5;   units.Wwj = 'g';   label.Wwj = 'wet weight at metamorphosis';     bibkey.Wwj = 'VaisShar2015';
comment.Wwj = 'extracted from fig. 1';

data.Ri  = 108/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ShariAssa2005';   
temp.Ri = C2K(T_assumed);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = 'spawns once per year' ;

% uni-variate data
% t-L data
data.tL_f1 = [ ... time since birth (weeks) , SVL mm
9.619e-001	6.957e+000
3.056e+000	1.017e+001
4.965e+000	1.605e+001
9.050e+000	1.883e+001
1.219e+001	2.460e+001
1.618e+001	2.663e+001
2.112e+001	3.036e+001
2.511e+001	3.260e+001
2.920e+001	3.591e+001
3.508e+001	3.601e+001
4.211e+001	3.739e+001
4.629e+001	4.070e+001
5.217e+001	4.068e+001
    ];  % SVL at f and T
data.tL_f1(:,1) = data.tL_f1(:,1) * 7; % week to day
data.tL_f1(:,2) = data.tL_f1(:,2)/ 10; % mm to cm
units.tL_f1   = {'d', 'cm'};  label.tL_f1 = {'time since birth', 'SVL', 'high food'};  
temp.tL_f1    = C2K(T_assumed);  units.temp.tL_f1 = 'K'; label.temp.tL_f1 = 'temperature';
bibkey.tL_f1 = 'VaisShar2016';
comment.tL_f1 = 'High food low density treatment.  Hatch to metamorphosis';

data.tL_f2 = [ ... % time since birth (weeks) , SVL (mm)
8.686e-001	7.814e+000
3.056e+000	1.027e+001
5.057e+000	1.498e+001
9.139e+000	1.583e+001
1.209e+001	1.989e+001
1.608e+001	2.149e+001
2.102e+001	2.458e+001
2.520e+001	2.746e+001
2.928e+001	2.788e+001
3.507e+001	2.819e+001
4.219e+001	2.861e+001
4.617e+001	2.892e+001
5.215e+001	2.987e+001
    ];  % SVL at f and T
data.tL_f2(:,1) = data.tL_f2(:,1) * 7; % week to day
data.tL_f2(:,2) = data.tL_f2(:,2)/ 10; % mm to cm
units.tL_f2   = {'d', 'cm'};  label.tL_f2 = {'time since birth', 'SVL', 'low food'};  
temp.tL_f2    = C2K(T_assumed);  units.temp.tL_f2 = 'K'; label.temp.tL_f2 = 'temperature';
bibkey.tL_f2 = 'VaisShar2016';
comment.tL_f2 = 'Low food low density treatment. Hatch to metamorphosis';

data.tL = [ ... % time since birth (weeks) , SVL (mm)
 1.124e+000	6.933e+000
7.116e+000	1.465e+001
8.739e+000	2.393e+001
1.124e+001	2.874e+001
1.423e+001	3.265e+001
1.598e+001	3.332e+001
1.823e+001	3.422e+001
2.384e+001	3.489e+001
2.622e+001	3.589e+001
3.021e+001	3.668e+001
4.020e+001	3.835e+001
4.494e+001	4.037e+001
4.794e+001	4.171e+001
5.306e+001	4.283e+001
5.830e+001	4.417e+001
6.304e+001	4.529e+001
6.829e+001	4.551e+001
7.515e+001	4.641e+001
8.227e+001	4.708e+001
8.402e+001	4.909e+001
8.739e+001	5.032e+001
9.113e+001	5.200e+001
9.612e+001	5.558e+001
    ];  % SVL at f and T
data.tL(:,1) = data.tL(:,1) * 7; % week to day
data.tL(:,2) = data.tL(:,2)/ 10; % mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL    = C2K(T_assumed);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'VaisShar2015';
comment.tL = 'The water temperature in aquarium during summer time species has recently been impacted by water pollution,ranged from 15-21ddeg C and during winter time is ranged from water abstraction and severe droughts which has led to 3-12 degC.';
 
data.tWw = [ ... % time since birth (weeks) , wet weight (g)
1.096e+000	2.176e-001
5.977e+000	5.248e-001
1.012e+001	8.192e-001
1.525e+001	1.037e+000
1.708e+001	1.536e+000
2.208e+001	1.638e+000
2.501e+001	2.086e+000
3.416e+001	2.394e+000
3.782e+001	2.470e+000
4.112e+001	2.598e+000
4.930e+001	2.982e+000
5.612e+001	3.827e+000
6.234e+001	4.493e+000
6.808e+001	4.864e+000
7.784e+001	5.299e+000
8.431e+001	5.696e+000
9.615e+001	5.978e+000
    ];  % SVL at f and T
data.tWw(:,1) = data.tWw(:,1) * 7; % week to day
units.tWw     = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw      = C2K(T_assumed);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw    = 'VaisShar2015';
comment.tWw   = 'The water temperature in aquarium during summer time species has recently been impacted by water pollution,ranged from 15-21deg C and during winter time is ranged from water abstraction and severe droughts which has led to 3-12 degC.';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 *  weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f1','tL_f2'}; subtitle1 = {'Data for high food, low food'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'A lot of the data are from ambient temperatures which depend on the season. We use a standard temp of 15 deg C ';
D2 = 'I tried to use two shape coeffients (one pre and one post metamorphosis) but this did not improve the fit.';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'Metamorphosed juveniles  begin to stay more in the terrestrial component of their habitat at a body length of 70.13 to 78.09 mm.';
metaData.bibkey.F1 = 'SharVais2014'; 
F2 = 'Larval period: hatching to the loss of branchia and closure of branchia slit';
metaData.bibkey.F2 = 'VaisShar2015'; 

metaData.facts = struct('F1',F1, 'F2',F2);


%% Links
metaData.links.id_CoL = '73YPX'; % Cat of Life
metaData.links.id_ITIS = '1106289'; % ITIS
metaData.links.id_EoL = '37136879'; % Ency of Life
metaData.links.id_Wiki = 'Neurergus_derjugini'; % Wikipedia
metaData.links.id_ADW = 'Neurergus_microspilotus'; % ADW
metaData.links.id_Taxo = '149411'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Neurergus+derjugini'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Kurdistan_spotted_newt}}';
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
bibkey = 'VaisShar2016'; type = 'article'; bib = [ ... 
'author = {Somaye Vaissi and Mozafar Sharifi}, ' ... 
'year = {2016}, ' ...
'title = {Variation in Food Availability Mediate the Impact of Density on Cannibalism, Growth, and Survival in Larval Yellow Spotted Mountain Newts (\emph{Neurergus microspilotus}): Implications for Captive Breeding Programs}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {35}, ' ...
'doi = {10.1002/zoo.21327}, ' ...
'pages = {513-521}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShariAssa2004'; type = 'article'; bib = [ ... 
'author = {Sharifi, M. and Assadian, S.}, ' ... 
'year = {2004}, ' ...
'title = {Distribution and Conservation Status of \emph{Neurergus microspilotus} (Caudata: Salamandridae) in {W}estern {I}ran}, ' ...
'journal = {Asiatic Herpetological Research}, ' ...
'volume = {10}, ' ...
'pages = {224--229}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShariAssa2005'; type = 'article'; bib = [ ... 
'author = {Sharifi, M. and Assadian, S.}, ' ... 
'year = {2005}, ' ...
'title = {REPRODUCTIVE CYCLE OF THE YELLOW SPOTTED NEWT \emph{Neurergus microspilotus} (CAUDATA: SALAMANDRIDAE) IN {W}estern {I}ran}, ' ...
'journal = {Russian Journal of Herpetology}, ' ...
'volume = {12}, ' ...
'number = {1}, ' ...
'pages = {1--6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SharVais2014'; type = 'article'; bib = [ ... 
'author = {Mozafar Sharifi and Somaye Vaissi}, ' ... 
'year = {2014}, ' ...
'title = {Captive breeding and trial reintroduction of the Endangered yellow-spotted mountain newt \emph{Neurergus microspilotus} in {W}estern {I}ran}, ' ...
'journal = {Endangered Species Research}, ' ...
'volume = {23}, ' ...
'doi = {10.3354/esr00552}, ' ...
'pages = {159-166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VaisShar2015'; type = 'article'; bib = [ ... 
'author = {S. Vaissi and M. Sharifi}, ' ... 
'year = {2015}, ' ...
'title = {Larval and Post-Metamorphic Growth in the Endangered Yellow Spotted Mountain Newt \emph{Neurergus microspilotus} (Caudata, Salamandridae)}, ' ...
'journal = {World Journal of Zoology}, ' ...
'volume = {10}, ' ...
'number = {4}, ' ...
'doi = {10.3354/esr00552}, ' ...
'pages = {365-373}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FaraShar2016'; type = 'article'; bib = [ ... 
'author = {Hossein Farasat and Mozafar Sharifi}, ' ... 
'year = {2016}, ' ...
'title = {Ageing and Growth of the Endangered Kaiser''s Mountain Newt, \emph{Neurergus kaiseri} (Caudata: Salamandridae), in the {S}outhern {Z}agros Range, {I}ran}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {50}, ' ...
'number = {1}, ' ...
'doi = {10.1670/14-142}, ' ...
'pages = {120-125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];