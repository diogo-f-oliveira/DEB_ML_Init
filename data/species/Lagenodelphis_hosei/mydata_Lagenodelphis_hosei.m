function [data, auxData, metaData, txtData, weights] = mydata_Lagenodelphis_hosei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Lagenodelphis_hosei'; 
metaData.species_en = 'Fraser''s dolphin'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 18]; 

%% set data
% zero-variate data

data.tg = 335;     units.tg = 'd';    label.tg = 'gestation time';           bibkey.tg =  'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 150;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 38*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 101; units.Lb = 'cm';   label.Lb = 'length at birth'; bibkey.Lb = 'guess';
data.Li = 240; units.Li = 'cm'; label.Li = 'ultimate length for females'; bibkey.Li = 'SiciRamo2007';

data.Wwi = 190e3; units.Wwi = 'g'; label.Wwi = 'ultimate weight'; bibkey.Wwi = 'EoL';
  comment.Wwi = '164 till 209 kg';

data.Ri  = 0.3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length data
data.tL = [ % time since birth (yr), length (cm)
0.931	142.627
0.931	149.539
1.819	181.797
1.862	178.917
2.877	200.806
8.039	217.512
8.970	218.088
9.859	207.719
9.859	207.143
9.986	244.009
11.975	238.825
13.879	216.359
13.921	243.433
13.921	241.129
13.921	227.880
18.872	245.737]; 
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length', 'Brazil'};  
temp.tL  = C2K(37);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SiciRamo2007';
% 
data.tL1 = [ ...
-0.028	123.039
0.489	156.306
0.496	136.164
0.512	147.994
0.968	181.259
1.020	148.650
1.021	144.813
2.304	199.206
2.483	209.762
2.507	200.811
3.296	209.468
3.480	208.195
3.643	207.241
4.473	215.261
5.465	226.802
5.484	230.000
7.297	218.229
7.316	223.984
7.461	214.078
7.475	234.540
7.479	221.432
8.208	229.767
8.411	229.774
8.425	248.318
8.450	234.251
8.465	252.476
8.488	244.483
9.288	222.449
9.488	230.448
9.491	221.176
9.505	240.360
9.524	244.197
10.259	235.588
10.276	244.860
10.302	229.834
10.303	224.719
10.445	225.683
10.499	246.786
10.503	236.555
10.504	233.358
10.518	250.623
11.234	235.939
11.257	230.185
11.459	233.388
11.491	258.967
11.493	253.851
11.496	244.260
11.497	241.702
11.498	237.546
11.522	226.996
11.523	224.119
11.743	235.955
12.235	223.502
12.472	242.053
12.488	254.522
12.496	230.864
12.498	224.469
12.742	224.797
13.463	258.070
13.471	232.493
13.474	223.542
13.488	244.323
14.241	241.150
14.486	236.043
14.496	268.015
14.505	241.159
15.218	237.345
15.236	243.101
15.282	227.436
15.459	245.665
15.463	232.237
15.481	239.911
15.487	222.007
15.498	250.462
15.506	226.804
16.270	251.446
16.493	254.011
17.331	238.691
17.498	227.187
17.510	250.207
17.534	239.337];
data.tL1(:,1) = 365 * data.tL1(:,1); % convert yr to d
units.tL1  = {'d', 'cm'};  label.tL1 = {'time since birth', 'length', 'Japan'};  
temp.tL1  = C2K(37);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'AmanMiya1996';
    

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

%% Group plots
set1 = {'tL'; 'tL1'}; subtitle1 = {'data from Brazil, Japan'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from femals';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3RWMF'; % Cat of Life
metaData.links.id_ITIS = '180440'; % ITIS
metaData.links.id_EoL = '46559262'; % Ency of Life
metaData.links.id_Wiki = 'Lagenodelphis_hosei'; % Wikipedia
metaData.links.id_ADW = 'Lagenodelphis_hosei'; % ADW
metaData.links.id_Taxo = '68721'; % Taxonomicon
metaData.links.id_WoRMS = '137099'; % WoRMS
metaData.links.id_MSW3 = '14300058'; % MSW3
metaData.links.id_AnAge = 'Lagenodelphis_hosei'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lagenodelphis_hosei}}';
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
bibkey = 'SiciRamo2007'; type = 'article'; bib = [ ... 
'author = {S. Siciliano and R. M. A. Ramo and A. P. M. Di Beneditto and M. C. O. Santos and A. B. Fragoso and J. L. Brito and A. F. Azevedo and A. F. C. Vicente and E. Zampirolli and F. S. Alvarenga and L. Barbosa and N. R. W. Lima}, ' ... 
'year = {2007}, ' ...
'title = {Age and growth of some delphinids in south-eastern {B}razil}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'doi = {10.1017/S0025315407053398}, ' ...
'volume = {87}, ' ...
'pages = {293--303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AmanMiya1996'; type = 'article'; bib = [ ... 
'author = {Masao Amano and Nobuyuki Miyazaki and Fumio Yanagisawa }, ' ... 
'year = {1996}, ' ...
'title = {LIFE  HISTORY  OF  {F}RASER''S  DOLPHIN, \emph{Lagenodelphis hosei}, BASED  ON  A SCHOOL  CAPTURED  OFF  THE  {P}ACIFIC COAST  OF  {J}APAN}, ' ...
'journal = {Marine Mammal Science}, ' ...
'volume = {12}, ' ...
'pages = {199-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lagenodelphis_hosei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/314247/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lagenodelphis_hosei/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

