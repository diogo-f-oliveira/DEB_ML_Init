function [data, auxData, metaData, txtData, weights] = mydata_Cathartes_aura

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Cathartiformes'; 
metaData.family     = 'Cathartidae';
metaData.species    = 'Cathartes_aura'; 
metaData.species_en = 'Turkey vulture'; 

metaData.ecoCode.climate = {'A','B','C'};
metaData.ecoCode.ecozone = {'TN','THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnsfm'};
metaData.ecoCode.migrate = {'Ms'};
metaData.ecoCode.food    = {'biSvm', 'biSvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(40); % K, body temp
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 09 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_1     = [2023 07 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 04];

%% set data
% zero-variate data

data.ab = 39;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'avibase';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '38-41 d, AnAge: 39 d';
data.tx = 75;  units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'avibase';   
  temp.tx = C2K(40);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '66-88 d';
data.tp = 225;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(40);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '66-88 d';
data.tR = 2*365;  units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'avibase';
  temp.tR = C2K(40);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'AnAge: 11 yr';
data.am = 20.8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(40);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 80;  units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';         bibkey.Ww0 = 'avibase';
data.Wwb = 60;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 1552; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'avibase';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(40);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 eggs per clutch, 1 clutch per yr';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
3.623	86.705
7.999	240.848
10.013	202.312
10.245	356.455
14.183	414.258
16.101	462.428
19.857	756.262
21.007	606.936
21.140	818.882
23.902	814.065
23.914	905.588
28.062	944.123
29.906	1242.775
29.990	1069.364
34.040	1170.520
36.009	1608.863
36.016	1666.667
40.024	1435.453
42.929	1724.470
42.931	1743.738
49.864	1950.867
49.948	1777.457
57.065	1772.640
57.098	2032.755
68.437	1801.541];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'hand-reared'};  
temp.tW    = C2K(40);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ColeFras1989';

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
D1 = 'body temperature is guessed';
D2 = 'males are assumed not to differ from females';
D3 = 'mod_1: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1= 'uses urohidrosis, defecating on its legs, to lower its body temperature; lacks a voice box';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5XG3M'; % Cat of Life
metaData.links.id_ITIS = '175265'; % ITIS
metaData.links.id_EoL = '45511376'; % Ency of Life
metaData.links.id_Wiki = 'Cathartes_aura'; % Wikipedia
metaData.links.id_ADW = 'Cathartes_aura'; % ADW
metaData.links.id_Taxo = '52303'; % Taxonomicon
metaData.links.id_WoRMS = '159144'; % WoRMS
metaData.links.id_avibase = '36B3872DAFE1EC1C'; % avibase
metaData.links.id_birdlife = 'turkey-vulture-cathartes-aura'; % birdlife
metaData.links.id_AnAge = 'Cathartes_aura'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cathartes_aura}}';
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
bibkey = 'ColeFras1989'; type = 'Article'; bib = [ ... 
'author = {John S. Coleman and James D. Fraser}, ' ... 
'year = {1989}, ' ...
'title = {Age Estimation and Growth of Black and Turkey Vultures (Estimativos de la Edad y el Crecimiento de Coragyps atratus y Cathartes aura)}, ' ...
'journal = {Journal of Field Ornithology}, ' ...
'volume = {60(2)}, ' ...
'pages = {197-208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Cathartes_aura}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'avibase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=36B3872DAFE1EC1C&sec=lifehistory}}';
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

