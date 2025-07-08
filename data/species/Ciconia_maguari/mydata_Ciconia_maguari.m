function [data, auxData, metaData, txtData, weights] = mydata_Ciconia_maguari

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Ciconiiformes'; 
metaData.family     = 'Ciconiidae';
metaData.species    = 'Ciconia_maguari'; 
metaData.species_en = 'Maguari stork'; 

metaData.ecoCode.climate = {'Af', 'Aw', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tncfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40.5); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't-pX'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 07 01];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 01];

%% set data
% zero-variate data

data.ab = 30;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tx = 66.5;    units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 199.5;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'guess';
  temp.tR = C2K(40.5);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
data.am = 20.4*365; units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(40.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 138;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Thom1984';
data.Wwi = 3800; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'avibase';
data.Wwim = 4200; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'avibase';

data.Ri  = 3.07/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'avibase';   
  temp.Ri = C2K(40.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time - weight
data.tW = [ ... % age (d) weight (g)
0.000	138.049
0.694	157.706
1.987	203.622
2.939	236.414
3.821	223.089
8.867	617.645
9.887	650.426
10.912	768.873
11.800	874.163
12.824	979.431
13.913	1025.380
14.738	1209.758
15.696	1354.576
16.786	1420.294
17.812	1578.280
18.967	1584.679
22.919	1834.440
23.895	2335.103
25.052	2387.631
25.872	2473.163
26.760	2591.633
27.849	2630.992
29.686	2696.587
30.643	2828.225
31.934	2841.192
32.750	2854.237
37.862	3222.423];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(40.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Thom1984';
  
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
%txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'scaled functional response turned out to vary';
D3 = 'Males are assumed to differ from females by {p_Am} only';
D4 = 'mod_1: v is reduced';
D5 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4, 'D5',D5);

%% Links
metaData.links.id_CoL = '5Z653'; % Cat of Life
metaData.links.id_ITIS = '559261'; % ITIS
metaData.links.id_EoL = '45511506'; % Ency of Life
metaData.links.id_Wiki = 'Ciconia_maguari'; % Wikipedia
metaData.links.id_ADW = 'Ciconia_maguari'; % ADW
metaData.links.id_Taxo = '51855'; % Taxonomicon
metaData.links.id_WoRMS = '1558267'; % WoRMS
metaData.links.id_avibase = '4AB9F632125B2091'; % avibase
metaData.links.id_birdlife = 'maguari-stork-ciconia-maguari'; % birdlife
metaData.links.id_AnAge = 'Ciconia_maguari'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ciconia_maguari}}';
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
bibkey = 'Thom1984'; type = 'Article'; bib = [ ... 
'author = {Betsy Trent Thomas}, ' ... 
'year = {1984}, ' ...
'title = {Maguari Stork Nesting: Juvenile Growth and Behavior}, ' ...
'journal = {The Auk}, ' ...
'volume = {101(4)}, ' ...
'pages = {812-823}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=4AB9F632125B2091&sec=lifehistory}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ciconia_maguari}}';
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

