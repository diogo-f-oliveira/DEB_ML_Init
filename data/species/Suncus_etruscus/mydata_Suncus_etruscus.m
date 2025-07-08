function [data, auxData, metaData, txtData, weights] = mydata_Suncus_etruscus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Suncus_etruscus'; 
metaData.species_en = 'Etruscan shrew'; 

metaData.ecoCode.climate = {'Am', 'BWh', 'Csa'};
metaData.ecoCode.ecozone = {'THp','TP'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 05 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 05 25]; 

%% set data
% zero-variate data

data.tg = 27;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 5*30;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Fons1973';
  temp.tp = C2K(37.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'breeding form Mar/Apr till Sept/Oct, no reprod in breeding season of birth, ';
data.am = 3.2*365;    units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(37.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.19; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 2.06;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 2.1;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 4*3.4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.4 litters per yr, 4 pups per litter';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.891	0.232
1.866	0.407
1.967	0.354
2.115	0.330
2.800	0.407
2.839	0.616
3.087	0.577
3.925	0.543
3.965	0.723
4.018	0.650
4.848	0.771
4.941	0.868
5.003	0.611
5.877	0.854
5.919	0.994
6.080	0.718
6.958	0.874
6.997	1.072
7.002	0.970
7.928	1.140
7.933	1.048
7.934	1.014
8.902	1.334
8.909	1.199
9.202	1.233
9.884	1.359
9.928	1.465
9.985	1.310
10.854	1.635
10.859	1.543
11.108	1.490
11.930	1.757
12.081	1.699
12.085	1.607
12.856	1.936
13.004	1.922
13.059	1.810
13.935	2.004
13.986	1.961
13.988	1.927
15.013	2.087
15.024	1.864
15.067	1.976
16.044	2.111
16.046	2.082
16.053	1.923
16.833	2.073
16.928	2.131
17.025	2.160
17.908	2.204
17.911	2.146
17.955	2.267
19.039	2.214
19.041	2.180
19.044	2.108
20.122	2.200
20.127	2.089
20.128	2.064
20.912	2.137
20.913	2.113
20.957	2.220
21.995	2.113
21.997	2.075
22.041	2.167];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Fons1973';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;
%weights.tp = 5 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'One of the smallest mammals on earth';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1', F1);

%% Links
metaData.links.id_CoL = '53G5S'; % Cat of Life
metaData.links.id_ITIS = '633726'; % ITIS
metaData.links.id_EoL = '1178715'; % Ency of Life
metaData.links.id_Wiki = 'Suncus_etruscus'; % Wikipedia
metaData.links.id_ADW = 'Suncus_etruscus'; % ADW
metaData.links.id_Taxo = '61228'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700270'; % MSW3
metaData.links.id_AnAge = 'Suncus_etruscus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Suncus_etruscus}}';
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
bibkey = 'Fons1973'; type = 'Article'; bib = [ ...
'doi = {10.1515/mamm.1973.37.2.288}, ' ...
'author = {Roger Fons}, ' ... 
'year = {1973}, ' ...
'title = {MODALITES DE LA REPRODUCTION ET DEVELOPPEMENT POSTNATAL EN CAPTIVITE CHEZ \emph{Suncus etruscus} ({S}AVI, 1822)}, ' ...
'journal = {Mammalia}, ' ...
'volume = {37}, ' ...
'pages = {288-324}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Suncus_etruscus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

