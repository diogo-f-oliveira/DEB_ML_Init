function [data, auxData, metaData, txtData, weights] = mydata_Desmodillus_auricularis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Desmodillus_auricularis'; 
metaData.species_en = 'Cape short-eared gerbil'; 

metaData.ecoCode.climate = {'Csb', 'Dfa', 'Dfc'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2021 11 16];              

%% set data
% zero-variate data

data.tg = 29;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 33;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 77;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(36); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.1*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2.2;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'NelStut1973';
data.Wwi = 54.5;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3.3*4/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.3 pups per litter; 4 litters per yr assumed';
  
% univariate data
data.tWw = [ ... % time since birth (d), weight (g)
0.019	2.187
1.021	2.441
2.174	2.745
3.181	3.608
4.084	3.963
4.936	4.166
6.086	4.165
7.291	4.774
8.144	5.180
9.199	5.687
10.052	6.093
11.005	6.397
12.060	7.058
13.111	7.107
14.166	7.666
14.870	8.123
16.074	8.681
16.928	9.087
18.131	9.442
19.237	10.203
20.044	10.966
20.944	10.965
22.093	10.862
23.047	11.267
24.099	11.521
24.851	11.825
26.065	13.401
27.167	13.603
28.128	14.925
29.084	15.636
30.036	15.889
31.101	17.567
32.158	18.430
33.161	18.836
34.214	19.191
35.025	20.360
36.036	21.732
37.289	22.036
38.299	23.205
39.217	25.341
41.170	25.695
42.114	24.981
43.030	26.812
44.950	29.150];
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'NelStut1973';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 3 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '352YZ'; % Cat of Life
metaData.links.id_ITIS = '632910'; % ITIS
metaData.links.id_EoL = '1179688'; % Ency of Life
metaData.links.id_Wiki = 'Desmodillus_auricularis'; % Wikipedia
metaData.links.id_ADW = 'Desmodillus_auricularis'; % ADW
metaData.links.id_Taxo = '89019'; % Taxonomicon
metaData.links.id_MSW3 = '13001056'; % Mammal Spec World
metaData.links.id_AnAge = 'Desmodillus_auricularis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Desmodillus_auricularis}}';
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
bibkey = 'NelStut1973'; type = 'Article'; bib = [ ... 
'author = {J. A. J.  Nel and C. J. Stutterheim}, ' ... 
'year = {1973}, ' ...
'title = {Notes on the early post-natal development of the {N}amaqua gerbil \emph{Desmodillus auricularis}}, ' ...
'journal = {Koedoe}, ' ...
'volume = {16}, ' ...
'pages = {117-125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Desmodillus_auricularis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

