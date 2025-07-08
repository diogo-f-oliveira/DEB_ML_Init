function [data, auxData, metaData, txtData, weights] = mydata_Cancer_pagurus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Cancridae';
metaData.species    = 'Cancer_pagurus'; 
metaData.species_en = 'Edible crab'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'biD', 'jiCi', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8); % K, body temp
metaData.data_0     = {'ab', 'aj','ap', 'am', 'Lp', 'Li','Wwb', 'Wwp', 'Wwi', 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 25]; 

%% set data
% zero-variate data

data.ab = 8*30.5;  units.ab = 'd'; label.ab = 'age at birth'; bibkey.ab = 'Wiki';   
  temp.ab = C2K(6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Large delay of onset of development can occur, HaigRayn2015';
data.tj = 331;  units.tj = 'd'; label.tj = 'time since birth at metam'; bibkey.tj = 'WeisThat2009';   
  temp.tj = C2K(15); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2.1*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Benn1974';
  temp.tp = C2K(8);    units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'From tW_f data for Wwp';
data.am = 100*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Wiki';   
  temp.am = C2K(8);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.7;   units.Lp  = 'cm';  label.Lp  = 'carapace width at puberty for females'; bibkey.Lp  = 'Wiki';
data.Lpm  = 11;   units.Lpm  = 'cm';  label.Lpm  = 'carapace width at puberty for males';  bibkey.Lpm  = 'Wiki';
data.Li  = 24.2;     units.Li  = 'cm';  label.Li  = 'ultimate carapace width for females'; bibkey.Li  = 'Benn1974';
data.Lim  = 26.7;  units.Lim = 'cm';  label.Lim  = 'ultimate carapace width for males';    bibkey.Lim  = 'Benn1974';

data.Wwb = 3.3e-5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'HaigRayn2015';
  comment.Wwb = 'Based on egg diameter of 400 mum: 4/3*pi*0.02^3';
data.Wwp = 452;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';       bibkey.Wwp = 'Wiki';
  comment.Wwp = 'Computed as (Lp/Lim)^3*Wwim';
data.Wwpm = 294;   units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'Wiki';
data.Wwi = 3.1e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';         bibkey.Wwi = 'Benn1974';
  comment.Wwi = 'Computed as (Li/Lim)^3 * Wwim';
data.Wwim = 4.2e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';         bibkey.Wwim = 'Benn1974';

data.Ri  = 3e6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Temp is guessed';
 
% uni-variate data
% t-L data
% females
data.tW_f = [ ... % time (yr), wet weight (g)
0.000	158.065
1.091	293.548
2.020	425.806
3.035	516.129
4.051	593.548
4.983	638.710
6.043	683.871
7.018	725.806
8.036	754.839
9.096	780.645
10.072	800.000
11.048	825.806
12.109	838.710
13.084	861.290
13.975	877.419
14.951	890.323
16.012	903.226
16.989	916.129
18.007	922.581
18.898	941.935
19.917	954.839]; 
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'wet weight', 'female'};  
temp.tW_f    = C2K(8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Benn1974';
comment.tW_f = 'Data for females';
% males
data.tW_m = [ ... % time (yr), wet weight (g)
0.000	158.065
0.873	438.710
1.964	735.484
3.018	925.806
4.032	1054.839
5.004	1141.935
6.105	1212.903
7.037	1277.419
8.011	1329.032
9.114	1370.968
10.046	1409.677
11.021	1445.161
12.082	1474.194
13.100	1503.226
14.075	1522.581
15.093	1548.387
15.985	1561.290
17.003	1577.419
18.021	1606.452
18.870	1616.129
20.016	1625.806]; 
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'wet weight', 'male'};  
temp.tW_m    = C2K(8);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Benn1974';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_f = 10 * weights.tW_f;
weights.tW_m = 10 * weights.tW_m;

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'After a short protozoea stage, five zoea stages occur before metamorphosing into the megalopa, which settles with 24 h';
metaData.bibkey.F1 = 'HaigRayn2015'; 
F2 = 'No  feeding  occurs during  brooding';
metaData.bibkey.F2 = 'HaigRayn2015'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '5WY3B'; % Cat of Life
metaData.links.id_ITIS = '98681'; % ITIS
metaData.links.id_EoL = '46505906'; % Ency of Life
metaData.links.id_Wiki = 'Cancer_pagurus'; % Wikipedia
metaData.links.id_ADW = 'Cancer_pagurus'; % ADW
metaData.links.id_Taxo = '34019'; % Taxonomicon
metaData.links.id_WoRMS = '107276'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cancer_pagurus}}';
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
bibkey = 'Benn1974'; type = 'Article'; bib = [ ... 
'author = {Bennet, D. B.}, ' ... 
'year = {1974}, ' ...
'title = {GROWTH OF THE EDIBLE CRAB (\emph{Cancer pagurus} {L}.) OFF {S}OUTH-{W}EST {E}NGLAND}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {54}, ' ...
'pages = {803--823}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaigRayn2015'; type = 'Techreport'; bib = [ ... 
'author = {Haig,  J. A. and Rayner, G. and  Akritopoulou, E. and  M. J. Kaiser}, ' ... 
'year = {2015}, ' ...
'title = {Fecundity  of \emph{Cancer pagurus} in {W}elsh waters, a comparison with published literature}, ' ...
'institution = {Bangor University}, ' ...
'series = {Fisheries \& Conservation Science}, ' ...
'number = {49}, ' ...
'howpublished = {\url{http://fisheries-conservation.bangor.ac.uk/wales/documents/49.pdf}]}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WeisThat2009'; type = 'Article'; bib = [ ... 
'author = {M. Weiss and S. Thatje and O. Heilmayer and K. Anger T. Brey and M. Keller}, ' ... 
'year = {2009}, ' ...
'title = {Growth of the edible crab (\emph{Cancer pagurus} {L}.) off {S}outh-{W}est {E}ngland}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {54}, ' ...
'pages = {803--823}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
