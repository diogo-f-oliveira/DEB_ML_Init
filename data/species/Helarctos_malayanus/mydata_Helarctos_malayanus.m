function [data, auxData, metaData, txtData, weights] = mydata_Helarctos_malayanus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Ursidae';
metaData.species    = 'Helarctos_malayanus'; 
metaData.species_en = 'Sun bear'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiHn', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 30]; 

%% set data
% zero-variate data

data.tg = 95;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2-4 yrs';
data.am = 35.9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 325;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 65e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 25-65 kg';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: 1-2 pups each 3 yr';
 
% uni-variate data
% time-weight
data.tW_1 = [ ... % time since birth (d), body weight (g)
0.820	262.459
7.007	418.939
13.606	627.870
21.443	889.101
28.039	1255.595
35.463	1464.378
42.058	1935.913
48.654	2354.928
55.663	2668.826
63.083	3192.736
69.678	3611.751
77.509	4188.109
83.278	4659.788
91.109	5288.669
98.113	5917.695
105.120	6441.679
139.317	9639.473
209.770	16402.349
299.613	23371.914];
units.tW_1 = {'d', 'g'};  label.tW_1 = {'time since birth', 'wet weight'};  
temp.tW_1  = C2K(38.1);  units.temp.tW_1 = 'K'; label.temp.tW_1 = 'temperature';
bibkey.tW_1 = 'AZA2019';
comment.tW_1 = 'Data for Zoo 2';
%
data.tW_2 = [ ... % time since birth (d), body weight (g)
0.000	262.603
6.182	419.083
41.629	2933.886
91.082	6916.826];
units.tW_2 = {'d', 'g'};  label.tW_2 = {'time since birth', 'wet weight'};  
temp.tW_2  = C2K(38.1);  units.temp.tW_2 = 'K'; label.temp.tW_2 = 'temperature';
bibkey.tW_2 = 'AZA2019';
comment.tW_2 = 'Data for Zoo 1';

  
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
set1 = {'tW_1','tW_2'}; subtitle1 = {'Data for zoo 2, zoo 1'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '6LGHJ'; % Cat of Life
metaData.links.id_ITIS = '621847'; % ITIS
metaData.links.id_EoL = '328074'; % Ency of Life
metaData.links.id_Wiki = 'Helarctos_malayanus'; % Wikipedia
metaData.links.id_ADW = 'Helarctos_malayanus'; % ADW
metaData.links.id_Taxo = '66535'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000943'; % MSW3
metaData.links.id_AnAge = 'Helarctos_malayanus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Helarctos_malayanus}}';
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
bibkey = 'AZA2019'; type = 'techreport'; bib = [ ... 
'author = {AZA Bear Taxon Advisory Group}, ' ... 
'year = {2019}, ' ...
'title = {Sloth Bear Care Manual}, ' ...
'institution = {Silver Spring, MD: Association of Zoos and Aquariums}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Helarctos_malayanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

