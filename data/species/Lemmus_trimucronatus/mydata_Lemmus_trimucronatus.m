function [data, auxData, metaData, txtData, weights] = mydata_Lemmus_trimucronatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Lemmus_trimucronatus'; 
metaData.species_en = 'North American brown lemming'; 

metaData.ecoCode.climate = {'Dfc', 'ET'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iTht'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2016 12 31];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 02]; 

%% set data
% zero-variate data

data.tg = 19;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp and tg for L. lemmus';
data.tx = 13;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'BatzSten1974';   
  temp.tx = C2K(37.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'temp for L. lemmus from AnAge';
data.tp = 30;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BatzSten1974';
  temp.tp = C2K(37.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'temp for L. lemmus';
data.am = 3.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge for L. lemmus';

data.Wwb = 3.8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.am = 'AnAge for L. lemmus';
data.Wwi = 58; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
data.Wwim = 68;units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Wiki';


data.Ri  = 2.5*7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'AnAge for L. lemmus';
 
% uni-variate data
% t-W data
data.tW1 = [ ... % time since birth (d), weight (g)
7.527	7.025
7.991	7.240
8.474	7.687
8.939	8.116
10.012	8.903
10.495	9.136
11.013	9.243
11.478	9.637
12.014	9.727
12.532	9.959
12.997	10.263
13.479	10.335
14.015	10.407
14.498	10.747
14.998	10.783
15.481	11.177
15.999	11.552
17.000	12.054];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight'};  
temp.tW1    = C2K(37.8);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'BatzSten1974';
%
data.tW2 = [ ... % time since birth (d), weight (g)
1.985	3.448
2.950	3.877
3.969	4.718
4.988	5.254
5.972	6.184
6.991	6.864
8.028	7.669
10.994	8.850];
units.tW2   = {'d', 'g'};  label.tW2 = {'time since birth', 'wet weight'};  
temp.tW2    = C2K(37.8);  units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'BatzSten1974';
%
data.tW4 = [ ... % time since birth (d), weight (g)
2.021	3.840
4.987	4.951
9.977	9.081
12.013	9.423
13.998	10.729];
units.tW4   = {'d', 'g'};  label.tW4 = {'time since birth', 'wet weight'};  
temp.tW4    = C2K(37.8);  units.temp.tW4 = 'K'; label.temp.tW4 = 'temperature';
bibkey.tW4 = 'BatzSten1974';
%
data.tW5 = [ ... % time since birth (d), weight (g)
9.012	8.938
9.995	9.331
11.031	9.475
12.014	10.119
12.997	10.478];
units.tW5   = {'d', 'g'};  label.tW5 = {'time since birth', 'wet weight'};  
temp.tW5    = C2K(37.8);  units.temp.tW5 = 'K'; label.temp.tW5 = 'temperature';
bibkey.tW5 = 'BatzSten1974';
%
data.tW6 = [ ... % time since birth (d), weight (g)
2.970	5.145
6.047	8.256
8.997	10.259
11.982	12.137];
units.tW6   = {'d', 'g'};  label.tW6 = {'time since birth', 'wet weight'};  
temp.tW6    = C2K(37.8);  units.temp.tW6 = 'K'; label.temp.tW6 = 'temperature';
bibkey.tW6 = 'BatzSten1974';
%
data.tW7 = [ ... % time since birth (d), weight (g)
4.006	5.271
6.990	6.542
9.994	8.528];
units.tW7   = {'d', 'g'};  label.tW7 = {'time since birth', 'wet weight'};  
temp.tW7    = C2K(37.8);  units.temp.tW7 = 'K'; label.temp.tW7 = 'temperature';
bibkey.tW7 = 'BatzSten1974';
%
data.tW8 = [ ... % time since birth (d), weight (g)
2.952	4.931
5.991	6.738
8.957	7.920];
units.tW8   = {'d', 'g'};  label.tW8 = {'time since birth', 'wet weight'};  
temp.tW8    = C2K(37.8);  units.temp.tW8 = 'K'; label.temp.tW8 = 'temperature';
bibkey.tW8 = 'BatzSten1974';
%
data.tW9 = [ ... % time since birth (d), weight (g)
5.992	7.470
6.993	8.060
8.995	9.295
11.980	10.673];
units.tW9   = {'d', 'g'};  label.tW9 = {'time since birth', 'wet weight'};  
temp.tW9    = C2K(37.8);  units.temp.tW9 = 'K'; label.temp.tW9 = 'temperature';
bibkey.tW9 = 'BatzSten1974';
  
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
set1 = {'tW1','tW2','tW4','tW5','tW6','tW7','tW8','tW9'}; subtitle1 = {'Data for various litters'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6P8RJ'; % Cat of Life
metaData.links.id_ITIS = '203526'; % ITIS
metaData.links.id_EoL = '11022277'; % Ency of Life
metaData.links.id_Wiki = 'Lemmus_trimucronatus'; % Wikipedia
metaData.links.id_ADW = 'Lemmus_trimucronatus'; % ADW
metaData.links.id_Taxo = '62592'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13000236'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lemmus_trimucronatus}}';
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
bibkey = 'BatzSten1974'; type = 'Article'; bib = [ ... 
'author = {Batzli, G. O. and Stenseth, N. and Fitzgerald, B. M.}, ' ... 
'year = {1974}, ' ...
'title = {GROWTH AND SURVIVAL OF SUCKLING BROWN LEMMINGS, \emph{Lemmus trimucronatus}}, ' ...
'journal = {J. Mammal.}, ' ...
'volume = {55}, ' ...
'pages = {828--831}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lemmus_lemmus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

