function [data, auxData, metaData, txtData, weights] = mydata_Dolioletta_gegenbauri

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Thaliacea'; 
metaData.order      = 'Doliolida'; 
metaData.family     = 'Doliolidae';
metaData.species    = 'Dolioletta_gegenbauri'; 
metaData.species_en = 'Doliolid'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  
metaData.data_1     = {'T-r_X'; 'T-JX_X'; 'T-F_X'; 'L-WC'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 05 23];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 05 23]; 

%% set data
% zero-variate data
data.ab = 1; units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = 'PaffGibs1999';    
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'larvae appear <24h after egg release';
data.tp_asex = 4;  units.tp_asex = 'd';    label.tp_asex = 'time since birth at puberty';   bibkey.tp_asex = 'PaffGibs1999';
  temp.tp_asex = C2K(20); units.temp.tp_asex = 'K'; label.temp.tp_asex = 'temperature';
  comment.tp_asex = 'first gonozoids are released by phorozooids 4 d after phorozooid release';
data.am = 20.2; units.am = 'd';    label.am = 'life span';      bibkey.am = 'PaffGibs1999';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'averaged nurse life span';

data.Lb_asex  = 0.1;   units.Lb_asex  = 'cm';  label.Lb_asex  = 'length at birth, asex generation';   bibkey.Lb_asex  = 'PaffGibs1999';
  comment.Lb_asex = 'early oozooid, which produce a thread-like structure (cadophore) with 2 tiny trophozooids 5 d after oozoid appearence';
data.Lb_sex   = 0.15; units.Lb_sex  = 'cm';   label.Lb_sex  = 'length at birth, sex generation';     bibkey.Lb_sex  = 'PaffGibs1999';
  comment.Lb_sex = 'gonozooids are released at 1-2 mm; feeding starts when still attached to parent';
data.Lp_asex  = 0.5;  units.Lp_asex  = 'cm';  label.Lp_asex  = 'length at puberty, asex generation'; bibkey.Lp_asex  = 'PaffGibs1999';
  comment.Lp_asex = 'first gonozooids are released by phorozooids of 5 mm length';
data.Lp_sex  = 0.6;  units.Lp_sex  = 'cm';  label.Lp_sex  = 'length at puberty, sex generation'; bibkey.Lp_sex  = 'PaffGibs1999';
  comment.Lp_sex = 'start of egg release by gonozooids';
data.Li_asex  = 1;  units.Li_asex  = 'cm';  label.Li_asex  = 'ultimate length of phorozooid';   bibkey.Li_asex  = 'PaffGibs1999';

% asexual reproduction (budding, like foetal development)
data.Ri_asex  = 11; units.Ri_asex  = '#/d';label.Ri_asex  = 'maximum reprod rate, asex generation';  bibkey.Ri_asex  = 'PaffGibs1999';   
  temp.Ri_asex = C2K(20); units.temp.Ri_asex = 'K'; label.temp.Ri_asex = 'temperature';
  comment.Ri_asex = 'The number of gonozooids produced by a single phorozooid during its life span is 83-163';
data.Ri_sex  = 28; units.Ri_sex  = '#/d';label.Ri_sex  = 'maximum reprod rate, sex generation';  bibkey.Ri_sex  = 'PaffGibs1999';   
  temp.Ri_sex = C2K(20); units.temp.Ri_sex = 'K'; label.temp.Ri_sex = 'temperature';

% uni-variate data at f
% gonozooid length-carbon weight
data.LW = [ ... % gonozooid length (mm), carbon weight (mug C) 
2.350	2.765
2.457	3.935
2.613	5.365
2.924	5.873
3.343	9.118
3.488	8.328
3.490	11.070
4.218	12.604
4.302	5.679
4.327	16.778
4.425	18.994
4.437	21.475
4.615	10.235
4.675	13.497
4.717	19.242
5.068	23.274
5.498	29.131
5.729	24.027
5.806	23.370
6.114	36.547
6.694	33.255
6.794	38.605
6.798	45.265
6.873	40.168
7.088	44.207
8.154	57.740
8.370	63.607];
data.LW(:,1) = data.LW(:,1)/ 10;  % convert mm to cm
units.LW = {'cm', 'mug C'};   label.LW = {'gonozooid length', 'carbon weight'};  
food.LW = 60; units.food.LW = 'mug C/l'; label.food.LW = 'food density';
bibkey.LW = 'GibsPaff2000';
comment.LW = 'Data for gonozooid';

% food density - clearance rate
data.XF = [ ... % phytoplankton conc. (mug C/l), clearence rate (ml/d)
 20	116.667 364.583 507.176 
 60	119.907 343.519 567.130
160	 58.333 186.343 520.139
390	  9.722  29.167  97.222];
units.XF = {'mug C/l', 'ml/d'};     label.XF = {'phytoplankton conc.', 'filtering rate'};  
treat.XF = {2, [5; 15; 35]}; units.treat.XF = 'mug C'; label.treat.XF = 'zooid weight';
temp.XF = C2K(20); units.temp.XF = 'K'; label.temp.XF = 'temperature';
bibkey.XF = 'GibsPaff2000';
subtitle.XF = 'clearance rate';
comment.XF = 'Data for gonozooid';

% temperature - clearance rate
data.TF = [ ... % temperature (C), clearence rate (ml/d)
16.5 103.044 197.161  276.219
20	 117.611 343.491  554.313
23.5 135.958 301.619  753.410
26.5 108.668 507.739 1388.733];
units.TF = {'C', 'ml/d'};     label.TF = {'temperature', 'filtering rate'};  
treat.TF = {2, [5; 15; 35]}; units.treat.TF = 'mug C'; label.treat.TF = 'zooid C weight';
food.TF = 60; units.food.TF = 'mug C/l'; label.food.TF = 'food density';
bibkey.TF = 'GibsPaff2000';
subtitle.TF = 'clearance rate';
comment.TF = 'Data for gonozooid';

% food density - ingestion rate
data.XJX = [ ... % phytoplankton conc. (mug C/l), ingestion rate (mug C/d)
20	3.059  7.620 10.471
60	6.328 15.259 30.081
160 7.753 25.995 69.321
390	4.171 12.533 38.757];
units.XJX = {'mug C/l', 'mug C/d'};     label.XJX = {'phytoplankton conc.', 'ingestion rate'};  
treat.XJX = {2, [5; 15; 35]}; units.treat.XJX = 'mug C'; label.treat.XJX = 'zooid C weight';
temp.XJX = C2K(20); units.temp.XJX = 'K'; label.temp.XJX = 'temperature';
bibkey.XJX = 'GibsPaff2000';
subtitle.XJX = 'ingestion rate';
comment.XJX = 'Data for gonozooid';

% temperature - ingestion rate
data.TJX = [ ... % temperature (C), ingestion rate (mug C/d)
16.5 4.590  8.798 14.918
20	 6.694 15.301 29.645
23.5 7.077 14.153 34.809
26.5 6.503 22.377 62.350];
units.TJX = {'C', 'mug C/d'};     label.TJX = {'temperature', 'ingestion rate'};  
treat.TJX = {2, [5; 15; 35]}; units.treat.TJX = 'mug C'; label.treat.TJX = 'zooid C weight';
food.TJX = 60; units.food.TJX = 'mug C/l'; label.food.TJX = 'food density';
bibkey.TJX = 'GibsPaff2000';
subtitle.TJX = 'ingestion rate';
comment.TJX = 'Data for gonozooid';

% food density - growth rate
data.Xr = [ ... % food density (mug C/l), growth rate (1/d)
20	0.598 0.468 0.193
60	0.700 0.383 0.509 
160	0.712 0.371 0.610 
390	0.505 0.349 0.184];
units.Xr = {'mu C/l', '1/d'};     label.Xr = {'phytoplankton conc.', 'growth rate'};  
treat.Xr = {2, [5; 15; 35]}; units.treat.Xr = 'mug C'; label.treat.Xr = 'zooid C weight';
temp.Xr= C2K(20); units.temp.Xr = 'K'; label.temp.Xr = 'temperature';
bibkey.Xr = 'GibsPaff2000';
subtitle.Xr = 'growth rate';
comment.Xr = 'Data for gonozooid measured daily while growing from 2 to 8 mm zooid length';

% temperature - growth rate
data.Tr = [ ... % temperature (C), growth rate (1/d)
16.5  0.303 0.258 0.084
20	  0.509 0.702 0.335
23.5  0.566 0.492 0.276
26.5  0.609 0.694 0.469];
units.Tr = {'C', '1/d'};     label.Tr = {'temperature', 'growth rate'};  
treat.Tr = {2, [5; 15; 35]}; units.treat.Tr = 'mug C'; label.treat.Tr = 'zooid C weight';
food.Tr = 60; units.food.Tr = 'mug C/l'; label.food.Tr = 'food density';
bibkey.Tr = 'GibsPaff2000';
subtitle.Tr = 'growth rate';
comment.Tr = 'Data for gonozooid measured daily while growing from 2 to 8 mm zooid length';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.food = food;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
txtData.subtitle = subtitle;

%% Discussion
D1 = 'kap_R is set to 0.95/2 becasue of hermaphroditism';
D2 = 'Parameter esitomates tuned by hand'; 
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '377Q6'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46585488'; % Ency of Life
metaData.links.id_Wiki = 'Dolioletta_gegenbauri'; % Wikipedia
metaData.links.id_ADW = 'Dolioletta_gegenbauri'; % ADW
metaData.links.id_Taxo = '114890'; % Taxonomicon
metaData.links.id_WoRMS = '137241'; % WoRMS

%% Facts
F1 = ['The gonozooid is hermaphrodite and the eggs are fertilised by sperm from another individual. ', ...
      'These develop into oozooids, known as "nurses" without reproductive organs, as they develop a tail of zooids produced asexually. ', ...
      'Some of these are known as gastrozooids, have a nutritional function and are arranged in lateral rows. ', ...
      'Others are phorozooids, have a transport function and are arranged in a single central row. ' ...
      'Other zooids link to the phorozooids which then detach themselves from the nurse. ' ... 
      'The zooids develop into gonozooids and when these are mature they separate from the phorozooids to live independently ', ...
      'and start the cycle over again. Meanwhile, the phorozooids have served their purpose and die.'];
metaData.bibkey.F1 = 'Wiki';
F2 = 'max chain-length in the field: 15 cm';
metaData.bibkey.F2 = 'PaffGibs1999';
metaData.facts = struct('F1',F1, 'F2',F2);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dolioletta_gegenbauri}}';   
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
bibkey = 'GibsPaff2000'; type = 'Article'; bib = [ ... 
'author = {D.M.Gibson and G.-A.Paffenh&ouml;fer}, ' ...
'year = {2000}, ' ...
'title  = {Feeding and growth rates of the doliolid, \emph{Dolioletta gegenbauri} {U}ljanin ({T}unicata, {T}haliacea)}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {22(8)}, ' ...
'pages = {1485–1500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PaffGibs1999'; type = 'Article'; bib = [ ... 
'author = {G.-A.Paffenh&ouml;fer and D.M.Gibson}, ' ...
'year = {1999}, ' ...
'title  = {Determination of generation time and asexual fecundity of doliolids ({T}unicata, {T}haliacea)}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {21}, ' ...
'pages = {1193–1189}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];