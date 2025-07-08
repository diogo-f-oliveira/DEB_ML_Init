function [data, auxData, metaData, txtData, weights] = mydata_Dipodomys_ordii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Heteromyidae';
metaData.species    = 'Dipodomys_ordii'; 
metaData.species_en = 'Ord''s kangaroo rat'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 14];              

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 34;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge'; 
  temp.tx = C2K(37);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '18 till 22 d';
data.tp = 61;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9.9*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Dipodomys merriami';

data.Wwb = 5;    units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 57;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3*2/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 2 litters per yr';
   
% uni-variate data
% time-weight data
data.tW = [ % time since birth (d), weight (g)
1.180	5.196
2.360	6.974
2.622	6.148
3.408	7.318
4.588	8.252
5.375	9.139
6.423	10.429
7.603	11.009
8.652	12.265
9.831	12.947
10.618	13.748
11.798	14.599
12.453	15.785
13.371	16.364
14.419	18.788
14.551	17.273
15.730	20.192
15.861	18.563
16.779	20.559
17.566	22.095
19.007	23.322
19.532	24.470
20.712	25.368
21.760	25.829
22.940	26.939
23.858	27.760
24.644	28.435
25.693	29.302
26.610	31.491
27.921	31.491
28.577	30.014
28.839	34.876
29.625	36.374
35.131	37.936
41.948	44.347
49.026	46.810
56.105	49.114
63.184	51.223
69.869	54.721]; 
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW  = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SmitRich1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '36PN2'; % Cat of Life
metaData.links.id_ITIS = '180244'; % ITIS
metaData.links.id_EoL = '328115'; % Ency of Life
metaData.links.id_Wiki = 'Dipodomys_ordii'; % Wikipedia
metaData.links.id_ADW = 'Dipodomys_ordii'; % ADW
metaData.links.id_Taxo = '62065'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12700071'; % MSW3
metaData.links.id_AnAge = 'Dipodomys_ordii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipodomys_ordii}}';
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
bibkey = 'SmitRich1978'; type = 'Article'; bib = [ ... 
'author = {H. Duane Smith and Gary H. Richins and Clive D. Jorgensen}, ' ...
'year = {1978}, ' ...
'title  = {Growth of \emph{Dipodomys ordii} (Rodentia: Heteromyidae)}, ' ...
'journal = {Great Basin Naturalist}, ' ...
'volume = {38(2)}, ' ...
'pages = {9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Dipodomys_ordii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

