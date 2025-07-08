function [data, auxData, metaData, txtData, weights] = mydata_Coturnix_coturnix
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Galliformes'; 
metaData.family     = 'Phasianidae';
metaData.species    = 'Coturnix_coturnix'; 
metaData.species_en = 'Common quail'; 

metaData.ecoCode.climate = {'BSk','Cfb','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxCi','biHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.7); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-JOe'; 't-Wwe'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 21];

%% set data
% zero-variate data

data.ab = 18.5;        units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'bow';   
  temp.ab = C2K(36);   units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17-20 d';
data.tx = 17.5;          units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'bow';   
  temp.tx = C2K(40.7); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '16-19 d';
data.tp = 65;          units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'bow';
  temp.tp = C2K(40.7); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'young independent 50-70 d';
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'avibase'; 
  temp.tR = C2K(40.7);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'age at first breeding. average body temperature (38.17 C)';
data.am = 14.6*365;       units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Ww0 = 8.2; units.Ww0 = 'g';  label.Ww0 = ' intitial wet weight';          bibkey.Ww0 = 'avibase';
data.Wwb = 6.0;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'VlecHoyt1979';
data.Wwi = 155;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'bow';
  comment.Wwi = '70-155 g';
data.Wwim = 140;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'bow';
  comment.Wwim = '70-140 g';

data.Ri  = 11/300;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'bow';   
  temp.Ri = C2K(40.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8-13 eggs/clutch, 1 clutch per yr assumed';
  
% uni-variate data
% time-weight
data.tW_fm = [ ... % time since birth (d), wet weight (g)
 1   9.22   9.16
 7  28.57  28.14
14  67.66  66.61
21 115.91 113.47
28 169.36 164.11
35 219.58 211.51
42 246.05 238.16];
units.tW_fm   = {'d', 'g'};  label.tW_fm = {'time since birth', 'wet weight'};  
temp.tW_fm    = C2K(40.7);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm  = 'CamaArau2023'; treat.tW_fm = {1, {'females','males'}};
%
data.tWe = [ ... time (d), embryo weight (g)
9.702	1.550
9.727	1.637
10.329	2.075
10.905	2.062
11.081	2.512
11.131	2.087
11.206	2.375
11.783	2.825
12.033	2.987
12.159	2.875
12.886	3.912
12.886	3.475
13.061	3.437
13.914	4.712
14.014	4.412
14.039	4.650
14.265	4.612
14.992	4.637
15.017	4.887
15.017	4.812
15.042	5.200
15.994	5.325
16.220	5.025
16.270	5.412
16.320	6.037
16.345	6.000
17.599	4.962
18.075	4.500];
units.tWe   = {'d', 'g'};  label.tWe = {'age', 'wet weight'};  
temp.tWe    = C2K(37.5);  units.temp.tWe = 'K'; label.temp.tWe = 'temperature';
bibkey.tWe = 'VlecHoyt1979';

% time-respiration in embryo
data.tJOe1 = [ ... % time (d), O2 consumption (cm^3/h)
0.803	0.125
3.492	0.188
5.050	0.376
6.796	0.626
8.993	1.440
10.056	2.160
10.837	2.881
11.073	3.100
11.831	4.008
12.114	4.102
12.800	4.540
13.013	4.759
13.745	4.885
14.123	5.104
14.878	5.135
15.161	5.072
15.868	5.104
16.106	5.542
16.534	6.669
16.866	7.577
16.868	8.016
17.105	8.329
17.296	9.237
17.463	9.957
17.584	11.053
17.869	11.554
17.894	11.992
18.169	17.378
18.194	9.863];
data.tJOe1(:,2) = data.tJOe1(:,2) * 24; % convert h to d
units.tJOe1   = {'d', 'ml O_2/d'};  label.tJOe1 = {'age', 'O_2 consumption'};  
temp.tJOe1    = C2K(37.5);  units.temp.tJOe1 = 'K'; label.temp.tJOe1 = 'temperature';
bibkey.tJOe1 = 'VlecHoyt1979';
%
data.tJOe2 = [ ... % time (d), O2 consumption (cm^3/h)
0.755	0.063
3.468	0.125
5.026	0.438
6.820	0.814
8.969	1.503
9.986	2.442
10.838	3.413
10.980	3.507
11.833	4.665
12.022	4.916
12.804	5.855
13.017	6.231
13.963	6.951
14.200	7.233
14.765	7.108
14.884	7.452
15.097	7.577
15.852	7.421
15.995	8.047
16.039	6.951
16.562	8.172
16.871	9.205
17.051	6.168
17.173	7.389
17.411	8.141
17.555	9.049
17.768	9.393
17.933	9.268
18.102	10.489
18.269	11.241
18.613	15.875];
data.tJOe2(:,2) = data.tJOe2(:,2) * 24; % convert h to d
units.tJOe2   = {'d', 'ml O_2/d'};  label.tJOe2 = {'age', 'O_2 consumption'};  
temp.tJOe2    = C2K(37.5);  units.temp.tJOe2 = 'K'; label.temp.tJOe2 = 'temperature';
bibkey.tJOe2 = 'VlecHoyt1979';
%
data.tJOe3 = [ ... % time (d), O2 consumption (cm^3/h)
0.732	0.063
3.468	0.157
6.749	0.595
8.875	1.566
10.058	2.818
11.005	3.789
11.857	4.947
12.805	6.231
13.089	6.607
13.845	6.826
14.106	7.389
14.886	7.859
14.910	8.016
15.052	8.172
15.972	8.329
16.138	8.579
16.492	8.454
16.705	8.767
16.928	12.399
16.953	12.806
17.096	13.245];
data.tJOe3(:,2) = data.tJOe3(:,2) * 24; % convert h to d
units.tJOe3   = {'d', 'ml O_2/d'};  label.tJOe3 = {'age', 'O_2 consumption'};  
temp.tJOe3    = C2K(37.5);  units.temp.tJOe3 = 'K'; label.temp.tJOe3 = 'temperature';
bibkey.tJOe3 = 'VlecHoyt1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_fm = weights.tW_fm * 2;
weights.tWe = weights.tWe * 3;
weights.Wwi = weights.Wwi * 3;
%weights.tJOe = weights.tJOe * 3;
weights.tp = weights.tp * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tJOe3','tJOe2','tJOe1'}; subtitle1 = {'Data for 3 eggs'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'YYSJ'; % Cat of Life
metaData.links.id_ITIS = '553871'; % ITIS
metaData.links.id_EoL = '45513806'; % Ency of Life
metaData.links.id_Wiki = 'Coturnix_coturnix'; % Wikipedia
metaData.links.id_ADW = 'Coturnix_coturnix'; % ADW
metaData.links.id_Taxo = '53097'; % Taxonomicon
metaData.links.id_WoRMS = '1461947'; % WoRMS
metaData.links.id_avibase = 'CAFE345DCABD8BF8'; % avibase
metaData.links.id_birdlife = 'common-quail-coturnix-coturnix'; % birdlife
metaData.links.id_AnAge = 'Coturnix_coturnix'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coturnix_coturnix}}';
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
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Coturnix_coturnix}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CamaArau2023'; type = 'Article'; bib = [ ...  
'doi = {10.1371/journal.pone.0287056}, ' ...
'title = {Growth curve mixed nonlinear models in quails}, ' ...
'journal = {PLoS ONE : }, ' ...
'year = {2023}, ' ...
'author = {Raimundo Nonato Colares Camargo and Cl\''{a}udio Vieira de Ara\''{u}jo and Fl\''{a}vio Luiz de Menezes and Simone Inoe de Ara\''{u}jo and Naiana Leticia Pavan and M\''{e}rik Rocha-Silva and Welligton Concei\c{c}\~{a}o da Silva and Jos\''{e} Ribamar Felipe Marques and Andr\''{e} Guimar\~{a}es Maciel e Silva and Hip\''{o}crates de Menezes Chalkidis and Jos\''{e} de Brito Louren\c{c}o}, ' ...
'volume = {18(6)}, ' ...
'pages = {e0287056}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=CAFE345DCABD8BF8&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VlecHoyt1979'; type = 'Article'; bib = [...
'author = {Vleck, C. M. and Hoyt, D. F. and Vleck, D.}, '...
'year = {1979},'...
'title = {Metabolism of avian embryos: patterns in artricial and precocial birds}, '...
'journal = {Physiol. Zool. }, ' ...
'volume = {52}, ' ...
'pages = {363-377}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'bow'; type = 'Misc'; bib = ...
'howpublished = {\url{https://birdsoftheworld.org/bow/species/comqua1/cur/introduction?login}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

