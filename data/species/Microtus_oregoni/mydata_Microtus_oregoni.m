function [data, auxData, metaData, txtData, weights] = mydata_Microtus_oregoni
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_oregoni'; 
metaData.species_en = 'Creeping vole'; 

metaData.ecoCode.climate = {'Csb', 'Dfa', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
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

data.tg = 23;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 20;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'guess';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 50;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37.9); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5.3*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(37.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 2;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'CowaArse1954';
data.Wwi = 27.5;     units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '14.5-27.5 g';

data.Ri  = 4.5*3.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(37.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-4 pups per litter; 4-5 litters per yr';
  
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.969	2.114
1.946	2.528
2.832	2.917
3.894	3.390
4.781	3.968
5.670	4.746
6.642	5.321
7.660	6.228
8.591	7.290
9.471	7.606
10.440	8.108
11.498	8.895
12.334	9.281
13.173	10.111
14.183	10.473
15.110	11.408
16.211	12.248
17.046	12.688
18.015	13.525
18.982	14.111
20.871	14.817
22.674	16.129
24.695	17.179
26.540	18.040
28.562	19.493
32.294	21.035
34.225	21.460
36.025	22.214];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(38.1);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'CowaArse1954';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 50 * weights.Wwi;

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

%% Links
metaData.links.id_CoL = '7VV88'; % Cat of Life
metaData.links.id_ITIS = '180313'; % ITIS
metaData.links.id_EoL = '310272'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_oregoni'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '62712'; % Taxonomicon
metaData.links.id_MSW3 = '13000288'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_oregoni}}';
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
bibkey = 'CowaArse1954'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z54-019}, ' ...
'author = {Cowan, I. M. and Arsenault, M. G.}, ' ... 
'year = {1954}, ' ...
'title = {REPRODUCTION AND GROWTH IN THE CREEPING VOLE, \emph{Microtus oregoni serpens} {M}ERRIAM}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {32(3)}, ' ...
'pages = {198–208}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

