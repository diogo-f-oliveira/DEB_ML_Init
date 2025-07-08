function [data, auxData, metaData, txtData, weights] = mydata_Kogia_breviceps
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Kogiidae';
metaData.species    = 'Kogia_breviceps'; 
metaData.species_en = 'Pygmy sperm whale';

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCic', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 14]; 

%% set data
% zero-variate data

data.tg = 335;     units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg =  'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Body temp from Orca';
data.tx = 365;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Plon2004';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2.5*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'Plon2004';
  temp.tpm = C2K(36);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tp = '2.5 till 5 yr';
data.am = 19*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Plon2004';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 120;     units.Lb = 'cm';   label.Lb = 'total length at birth';        bibkey.Lb = 'Plon2004';
data.Lp = 262;  units.Lp = 'cm';   label.Lp = 'total length at puberty';       bibkey.Lp = 'Plon2004';
data.Lpm = 241.5;  units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';       bibkey.Lpm = 'Plon2004';
data.Li = 300;    units.Li = 'cm';   label.Li = 'ultimate length of female';     bibkey.Li = 'Plon2004';

data.Wwb = 53e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Plon2004';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length data
data.tL = [ % time since birth (d), length (cm)
0.167	156.170
0.324	152.242
0.327	170.704
0.483	160.491
0.560	147.921
0.646	194.272
0.804	192.308
1.003	202.128
1.155	167.169
1.241	213.126
1.276	184.452
1.397	202.128
1.511	178.953
1.597	218.232
1.639	237.872
1.674	210.376
1.748	181.309
1.948	194.272
2.190	228.445
2.227	215.090
2.303	194.664
2.309	233.159
2.386	221.375
2.507	241.015
2.700	215.876
2.822	235.908
2.864	254.763
2.869	283.437
2.942	246.907
3.377	256.334
3.494	245.728
3.699	292.864
4.410	299.542
4.919	279.116
4.996	266.939
4.996	269.296
5.273	275.974
5.392	278.723
6.585	338.036
6.652	270.082
6.928	266.154
6.970	285.008
6.973	299.542
6.973	303.863
7.006	261.440
7.676	262.619
8.981	281.473
9.024	304.255
9.497	300.720
9.937	338.822
10.127	294.828
11.426	284.615
12.652	305.041
12.962	274.795
12.971	327.038
13.278	275.974
13.911	288.151
13.953	305.434
14.426	301.113
15.806	299.149
16.438	309.755
18.924	318.003
18.964	321.146];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Plon2004';

% length-weight
data.LW = [ ... % log10 length (cm), log10 weight (kg)
2.167	1.846
2.221	1.934
2.251	1.866
2.263	1.885
2.273	1.924
2.277	2.120
2.288	2.086
2.288	2.086
2.291	2.178
2.306	2.095
2.313	2.120
2.325	2.237
2.331	2.218
2.338	2.267
2.356	2.335
2.358	2.267
2.364	2.271
2.382	2.296
2.383	2.379
2.389	2.340
2.406	2.433
2.424	2.477
2.438	2.584
2.453	2.570
2.458	2.531
2.465	2.663
2.473	2.511
2.474	2.570
2.477	2.633];
data.LW = 10 .^ data.LW; % remove log transform
units.LW  = {'cm', 'kg'};  label.LW = {'length', 'weight'};  
bibkey.LW = 'Plon2004';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperature from Physeter';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Kogia can produce ink to evade predation, like cephalopods, ';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RBZN'; % Cat of Life
metaData.links.id_ITIS = '180491'; % ITIS
metaData.links.id_EoL = '46559333'; % Ency of Life
metaData.links.id_Wiki = 'Kogia_breviceps'; % Wikipedia
metaData.links.id_ADW = 'Kogia_breviceps'; % ADW
metaData.links.id_Taxo = '68817'; % Taxonomicon
metaData.links.id_WoRMS = '137113'; % WoRMS
metaData.links.id_MSW3 = '14300128'; % MSW3
metaData.links.id_AnAge = 'Kogia_breviceps'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kogia_breviceps}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Kogia_breviceps}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Kogia_breviceps/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Plon2004'; type = 'PhDthesis'; bib = [ ... 
'author = {S. Pl\"{o}n}, ' ... 
'year = {2004}, ' ...
'title = {The status and natural history of pygmy (\emph{Kogia breviceps}) and dwarf (\emph{K. sima}) sperm whales off {S}outhern {A}frica}, ' ...
'school = {Rhodes University Grahamstown South Africa}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

