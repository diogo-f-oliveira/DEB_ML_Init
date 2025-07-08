function [data, auxData, metaData, txtData, weights] = mydata_Gallinago_gallinago
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Charadriiformes'; 
metaData.family     = 'Scolopacidae';
metaData.species    = 'Gallinago_gallinago'; 
metaData.species_en = 'Common snipe'; 

metaData.ecoCode.climate = {'Cfb','Dfb','Dfc','Dwb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iFm'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 06 26];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 26];

%% set data
% zero-variate data

data.ab = 19;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'GilsWier2020';   
  temp.ab = C2K(36); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17-21 d';
data.tx = 19.5;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'GilsWier2020';   
  temp.tx = C2K(41); units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '19-20 d';
data.tp = 58.5;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(41); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  
data.tR = 365;     units.tR = 'd';    label.tR = 'time since birth at 1st brood'; bibkey.tR = 'guess';
  temp.tR = C2K(41); units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 9.2*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(41); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 11.1;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Gree1985';
data.Wwi = 111;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 80–140 g; value from G. delicata';
data.Wwim = 94; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight of male'; bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: 80–140 g; value from G. delicata';
  
data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'GilsWier2020';   
  temp.Ri = C2K(41); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-5 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
 0.000	 11.102
 1.052	 11.272
 2.184	 14.175
 3.236	 19.004
 4.126	 21.744
 4.450	 29.136
 4.773	 27.533
 4.854	 24.321
 5.259	 26.413
 5.583	 24.167
 5.663	 30.754
 5.906	 33.006
 6.149	 24.655
 6.311	 31.243
 6.392	 39.115
 6.472	 33.814
 6.553	 20.643
 6.796	 29.641
 6.877	 36.871
 7.201	 33.982
 7.282	 35.589
 7.686	 37.842
 7.848	 32.864
 8.333	 48.130
 8.818	 43.476
 8.819	 40.423
 8.900	 42.513
 9.628	 47.018
10.275	 55.056
10.356	 46.221
11.408	 61.011
11.650	 62.941
12.621	 62.307
16.262	 67.644
16.748	 69.416
23.867	 89.243
25.000	 84.114
25.081	 92.307
25.971	103.882
33.657	111.667
34.790	 99.790
35.922	112.171
37.864	109.780
41.990	105.321
48.786	116.150];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(41);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Gree1985'; 

%% set weights for all real data
weights = setweights(data, []);
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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';     
D2 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3F6V9'; % Cat of Life
metaData.links.id_ITIS = '176587'; % ITIS
metaData.links.id_EoL = '45509177'; % Ency of Life
metaData.links.id_Wiki = 'Gallinago_gallinago'; % Wikipedia
metaData.links.id_ADW = 'Gallinago_gallinago'; % ADW
metaData.links.id_Taxo = '53709'; % Taxonomicon
metaData.links.id_WoRMS = '158949'; % WoRMS
metaData.links.id_avibase = '9151E0BA75761647'; % avibase
metaData.links.id_birdlife = 'common-snipe-gallinago-gallinago'; % birdlife
metaData.links.id_AnAge = 'Gallinago_gallinago'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gallinago_gallinago}}';
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
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=9151E0BA75761647&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GilsWier2020'; type = 'Misc'; bib = [ ... 
'doi = {10.2173/bow.comsni.01}, ' ...
'author = {Van Gils, J. and P. Wiersma and G. M. Kirwan and C. J. Sharpe}, ' ... 
'year = {2020}, ' ...
'title = {Common Snipe (\emph{Gallinago gallinago}), version 1.0. In Birds of the World (J. del Hoyo, A. Elliott, J. Sargatal, D. A. Christie, and E. de Juana, Editors). Cornell Lab of Ornithology, Ithaca, NY, USA}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Gallinago_gallinago}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gree1985'; type = 'Article'; bib = [ ...  
'doi = {10.1080/03078698.1985.9673848}, ' ...
'title = {Growth of Snipe chicks \emph{Gallinago gallinago}}, ' ...
'journal = {Ringing \& Migration}, ' ...
'year = {1985}, ' ...
'author = {Green, R. E.}, ' ...
'volume = {6}, ' ...
'number = {1}, ' ...
'pages = {1-6}'];
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

