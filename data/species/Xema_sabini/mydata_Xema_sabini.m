function [data, auxData, metaData, txtData, weights] = mydata_Xema_sabini

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Laridae';
metaData.species    = 'Xema_sabini'; 
metaData.species_en = 'Sabine''s gull'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN'};
metaData.ecoCode.habitat = {'0iMm', 'biMc'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'biCvf', 'biCi', 'biSi', 'biSv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.9); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 08 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 10 20];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 27];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 27];

%% set data
% zero-variate data

data.ab = 23.5;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '26 to 28 d. Temperature is guessed based on being the optimal temperature for artificial incubation for several species; It depends on environmental conditions and parental care. ';
data.tx = 26.5;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '35-54 d';
data.tp = 79.5;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '35-54 d';
data.tR = 5.5*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.9);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'avibase';   
  temp.am = C2K(40.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 24;      units.Ww0 = 'g';   label.Ww0 = 'initital wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 16; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MallBoad2012';
data.Wwi = 177; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of females';     bibkey.Wwi = 'avibase';
data.Wwim = 194; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males';     bibkey.Wwim = 'avibase';

data.Ri  = 2.3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.3 egg per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
0.000	16.129
0.001	14.979
0.002	11.531
1.070	18.466
1.071	18.466
1.993	29.419
1.994	26.546
3.021	35.203
3.022	30.605
3.023	25.433
3.941	57.075
4.046	48.458
4.919	57.685
4.971	53.089
5.024	49.643
5.945	69.216
5.947	61.745
5.950	46.228
6.052	49.680
6.917	89.941
6.918	84.194
6.920	76.723
8.970	107.831
9.025	95.764
9.891	126.829
9.993	129.706
9.996	118.212
11.992	160.238
12.002	122.882
15.945	193.713
15.948	181.644];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'MallBoad2012'};  
temp.tW    = C2K(40.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MallBoad2012';
%
data.tW1 = [ ... % since since birth (d), weight (g)
 0	 15.917
 1	 22.669
 2	 30.617
 3	 40.557
 4	 52.888
 5	 64.024
 6	 73.167
 7	 92.669
 8	102.211
 9	125.699
10	119.702
11	152.351
12	140.379
13	161.076
14	159.063
15	184.541
16	167.390
17	177.730
18	160.577
19	191.634
20	164.124
21	168.089];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Abra1986'};  
temp.tW1    = C2K(40.9);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Abra1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tW1 = weights.tW1 * 2;
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data of MallBoad2012, Abra1986'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Long tp cannot be captured by std model';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: tW1 data added';
D4 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '7G8T5'; % Cat of Life
metaData.links.id_ITIS = '176866'; % ITIS
metaData.links.id_EoL = '45509271'; % Ency of Life
metaData.links.id_Wiki = 'Xema_sabini'; % Wikipedia
metaData.links.id_ADW = 'Xema_sabini'; % ADW
metaData.links.id_Taxo = '53833'; % Taxonomicon
metaData.links.id_WoRMS = '137167'; % WoRMS
metaData.links.id_avibase = '86182656472B476B'; % avibase
metaData.links.id_birdlife = 'sabines-gull-xema-sabini'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xema_sabini}}';
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
bibkey = 'MallBoad2012'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00300-011-1079-x}, ' ...
'author = {Mark L. Mallory and Kelly A. Boadway and Shanti E. Davis and Mark Maftei}, ' ... 
'year = {2012}, ' ...
'title = {Breeding biology of Sabine''s gull (\emph{Xema sabini}) in the {C}anadian high Arctic}, ' ...
'journal = {Polar Biol}, ' ...
'volume = {35}, ' ...
'pages = {335–344}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=86182656472B476B&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Abra1986'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z86-135}, ' ...
'author = {Diana M. Abraham}, ' ... 
'year = {1986}, ' ...
'title = {Observations on the breeding biology of Sabine''s Gulls (\emph{Xema sabini})}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {64}, ' ...
'pages = {898-903}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

