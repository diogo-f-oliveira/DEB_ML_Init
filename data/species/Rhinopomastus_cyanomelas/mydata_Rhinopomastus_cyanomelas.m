function [data, auxData, metaData, txtData, weights] = mydata_Rhinopomastus_cyanomelas

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Bucerotiformes'; 
metaData.family     = 'Phoeniculidae';
metaData.species    = 'Rhinopomastus_cyanomelas'; 
metaData.species_en = 'Common scimitarbill'; 

metaData.ecoCode.climate = {'Aw','BSh','Cwa','Cwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTh'};
metaData.ecoCode.embryo  = {'Tnwf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 10 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];


%% set data
% zero-variate data

data.ab = 13.5;        units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'Stey1999';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '13 to 14 d';
data.tx = 22.5;        units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'Stey1999';   
  temp.tx = C2K(40); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '21 to 24 d';
data.tp = 67.5;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '21 to 24 d';
data.tR = 365;       units.tR = 'd';    label.tR = 'time since birth at 1st brood';bibkey.tR = 'guess';
  temp.tR = C2K(40); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(40); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Upupa epops';

data.Ww0 = 3.2;   units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';     bibkey.Ww0 = 'avibase';
data.Wwb = 2.2;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'guess';
  comment.Wwb = 'beased on Ww0';
data.Wwi = 30.3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 35;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'avibase';

data.Ri  = 2*2.9/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'Stey1999';   
  temp.Ri = C2K(40); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.9 eggs per clutch, assumed: 2 clutches per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 2	 4.337  3.538  3.472  4.470
 3	 6.672  4.808  4.542  6.738
 4	 9.539  8.607  6.610  9.605
 5	12.007 11.341  9.944 12.007
 6	15.606 13.476 13.610 15.739
 7	18.673 16.410 15.079 20.869
 8	19.942 21.807 18.878 21.607
 9	26.672 23.275 19.948 23.542
10	28.073 25.544 24.147 26.077
11	30.009 28.345 26.148 26.947
12	31.145 29.215 28.550 28.284
13	33.347 33.613 28.023 28.954
14	34.684 31.821 30.025 27.961
15	36.153 33.025 32.493 26.968
16	33.030 33.629 33.097 27.440
17	34.699 30.040 30.040 26.646
18	35.171 32.575 31.909 24.855
19	34.643 32.581 NaN    NaN
21	31.060 28.864 29.995 22.940];  
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Stey1999'; treat.tW = {1, {'nestling 1','nestling 2','nestling 3','nestling 4'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

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

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'Feeding is intitially reduced after hatch';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '4S9NX'; % Cat of Life
metaData.links.id_ITIS = '554476'; % ITIS
metaData.links.id_EoL = '45514094'; % Ency of Life
metaData.links.id_Wiki = 'Rhinopomastus_cyanomelas'; % Wikipedia
metaData.links.id_ADW = 'Rhinopomastus_cyanomelas'; % ADW
metaData.links.id_Taxo = '55359'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B0DD1318B279EC02'; % avibase
metaData.links.id_birdlife = 'common-scimitarbill-rhinopomastus-cyanomelas'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinopomastus_cyanomelas}}';
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
bibkey = 'Stey1999'; type = 'Article'; bib = [ ...
'doi = {10.1080/00306525.1999.9634231}, ' ...
'author = {Steyn, P}, ' ... 
'year = {1999}, ' ...
'title = {The breeding biology of the Scimitarbilled Woodhoopoe}, ' ...
'journal = {Ostrich}, ' ...
'volume = {70(3-4)}, ' ...
'pages = {173–178}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=B0DD1318B279EC02&sec=lifehistory}}';
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

