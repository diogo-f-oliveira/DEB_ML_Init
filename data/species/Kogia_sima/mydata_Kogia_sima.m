function [data, auxData, metaData, txtData, weights] = mydata_Kogia_sima
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Kogiidae';
metaData.species    = 'Kogia_sima'; 
metaData.species_en = 'Dwarf sperm whale';

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCic', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb';  'Ri'}; 
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
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Plon2004';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2.6 till 3 yr';
data.tpm = 5*365;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'Plon2004';
  temp.tpm = C2K(36);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 19*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'Plon2004';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 103;     units.Lb = 'cm';   label.Lb = 'total length at birth';        bibkey.Lb = 'Plon2004';
data.Lp = 215;  units.Lp = 'cm';   label.Lp = 'total length at puberty for females';       bibkey.Lp = 'Plon2004';
data.Lpm = 197;  units.Lpm = 'cm';   label.Lpm = 'total length at puberty for males';       bibkey.Lpm = 'Plon2004';
data.Li = 255;    units.Li = 'cm';   label.Li = 'ultimate length of female';     bibkey.Li = 'Plon2004';

data.Wwb = 14e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Plon2004';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length data
data.tL = [ % time since birth (d), length (cm)
0.000	103.098
0.209	135.938
0.796	161.342
0.921	151.738
1.382	180.551
1.633	187.057
1.675	202.547
1.801	184.888
1.926	188.296
2.010	208.124
2.010	220.207
2.094	189.535
2.513	177.762
2.554	204.406
2.931	221.756
3.015	195.731
3.266	210.602
3.308	205.645
3.476	200.998
3.685	229.191
3.811	214.630
4.188	226.093
4.481	214.630
4.564	223.924
4.899	254.596
5.528	263.580
5.737	219.897
5.988	224.544
6.072	231.050
6.575	229.811
6.575	229.811
6.700	214.940
6.951	232.909
7.245	238.485
7.621	250.568
8.040	215.559
8.459	227.022
8.543	249.639
9.841	263.580
11.851	260.172
12.940	253.976
13.987	235.697
14.447	254.596
15.955	256.145
16.960	251.497
21.441	244.062];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Plon2004';

% length-weight
data.LW = [ ... % log10 length (cm), log10 weight (kg)
2.014	1.499
2.017	1.159
2.135	1.671
2.168	1.791
2.186	1.787
2.207	1.770
2.219	1.873
2.234	1.985
2.248	2.041
2.252	2.011
2.267	2.041
2.278	2.049
2.278	2.101
2.296	2.088
2.298	2.015
2.303	2.153
2.307	2.092
2.314	2.200
2.322	2.144
2.324	2.062
2.333	2.239
2.334	2.260
2.346	2.131
2.352	2.226
2.358	2.308
2.363	2.308
2.363	2.243
2.364	2.376
2.369	2.230
2.374	2.209
2.374	2.325
2.375	2.273
2.381	2.256
2.384	2.273
2.407	2.484
2.416	2.424
2.425	2.432];
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
D1 = 'Males are assumed to differ from femals by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Kogia can produce ink to evade predation, like cephalopods, ';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6NMP9'; % Cat of Life
metaData.links.id_ITIS = '180492'; % ITIS
metaData.links.id_EoL = '46559334'; % Ency of Life
metaData.links.id_Wiki = 'Kogia_sima'; % Wikipedia
metaData.links.id_ADW = 'Kogia_sima'; % ADW
metaData.links.id_Taxo = '429872'; % Taxonomicon
metaData.links.id_WoRMS = '159025'; % WoRMS
metaData.links.id_MSW3 = '14300129'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kogia_sima}}';
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
'howpublished = {\url{http://animaldiversity.org/accounts/Kogia_sima/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Plon2004'; type = 'PhDthesis'; bib = [ ... 
'author = {S. Pl\"{o}n}, ' ... 
'year = {2004}, ' ...
'title = {The status and natural history of pygmy (\emph{Kogia breviceps}) and dwarf (\emph{K. sima}) sperm whales off {S}outhern {A}frica}, ' ...
'school = {Rhodes University Grahamstown South Africa}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

