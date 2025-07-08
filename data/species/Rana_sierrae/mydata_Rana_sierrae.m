function [data, auxData, metaData, txtData, weights] = mydata_Rana_sierrae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_sierrae'; 
metaData.species_en = 'Sierra Nevada yellow-legged frog'; 

metaData.ecoCode.climate = {'Dsc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 11]; 


%% set data
% zero-variate data

data.tj = 2.5*365;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'FellKlee2013';
  temp.tj = C2K(4);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 6*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'FellKlee2013';
  temp.tp = C2K(4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2-5th yr';
data.am = 16*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'FellKlee2013';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4.54;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'FellKlee2013';
data.Lpm  = 4.45;    units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';   bibkey.Lpm  = 'FellKlee2013';
data.Li  = 8.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'FellKlee2013';
data.Lim  = 7.1;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'FellKlee2013';

data.Wwb = 0.05;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'guess based on Bufo bufo';
data.Wwi = 73.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'FellKlee2013';
data.Wwim = 48.3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'FellKlee2013';

data.Ri  = 500/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on 500 eggs per clutch, 1 clutch per yr';
  
% univariate data
% time-length data
data.tL_f = [ ... % time since birth (yr), SVL (cm)
5.993	4.536
6.336	5.250
6.835	5.978
7.419	6.582
8.035	7.021
9.020	7.294
9.764	7.375
10.570	7.470
11.724	7.495
12.531	7.549
13.915	7.574];
data.tL_f(:,1) = (data.tL_f(:,1) - 6) * 365; % convert yr since birth to d since puberty
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since puberty', 'SVL', 'female'};  
temp.tL_f   = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FellKlee2013';
comment.tL_f = 'Stylized data for females';
%
data.tL_m = [ ... % time birth (yr), SVL (cm)
6.004	4.454
6.515	5.058
7.381	5.757
8.386	6.140
9.433	6.345
10.534	6.425
11.698	6.464
12.725	6.518
13.962	6.488];
data.tL_m(:,1) = (data.tL_m(:,1) - 6) * 365; % convert yr since birth to d since puberty
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since puberty', 'SVL', 'male'};  
temp.tL_m   = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FellKlee2013';
comment.tL_m = 'Stylized data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
weights.Lp = 5 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Breeding start directly after snow melts';
metaData.bibkey.F1 = 'FellKlee2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6X38T'; % Cat of Life
metaData.links.id_ITIS = '207011'; % ITIS
metaData.links.id_EoL = '2920193'; % Ency of Life
metaData.links.id_Wiki = 'Rana_sierrae'; % Wikipedia
metaData.links.id_ADW = 'Rana_sierrae'; % ADW
metaData.links.id_Taxo = '1396956'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+sierrae'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_sierrae}}';
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
bibkey = 'FellKlee2013'; type = 'Article'; bib = [ ... 
'author = {Gary M. Fellers and Patrick M. Kleeman and David A. W. Miller and Brian J. Halstead and William A. Link}, ' ... 
'year = {2013}, ' ...
'title = {POPULATION SIZE, SURVIVAL, GROWTH, AND MOVEMENTS OF \emph{Rana sierrae}}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {69}, ' ...
'pages = {147-162}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+sierrae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

