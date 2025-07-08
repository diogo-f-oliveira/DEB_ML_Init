function [data, auxData, metaData, txtData, weights] = mydata_Vulpes_zerda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Vulpes_zerda'; 
metaData.species_en = 'Fennec'; 

metaData.ecoCode.climate = {'BWh'};
metaData.ecoCode.ecozone = {'TP'};
metaData.ecoCode.habitat = {'0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 04];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 04]; 

%% set data
% zero-variate data

data.tg = 51;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg =  'AnAge';   
  temp.tg = C2K(38.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 66;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 274;    units.tp = 'd';    label.tp = 'time since birth at puberty';bibkey.tp = 'AnAge';
  temp.tp = C2K(38.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.3*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'AnAge';   
  temp.am = C2K(38.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 43;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Weih1976';
data.Wwi = 1500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '700 till 1600 g';
  
data.Ri  = 2.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = {'AnAge'};   
  temp.Ri = C2K(38.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.2 pups per litter, 1 litter per yr';
  
% uni-variate data
% time-weight data
data.tW = [ % time since birth (d), wet weight (g)
0.000	42.785
0.356	45.606
0.717	49.180
2.281	54.609
3.631	61.799
4.670	67.447
5.810	74.623
6.898	81.795
7.722	90.218
8.387	98.883
9.261	108.070
10.664	115.517
11.598	120.904
12.060	126.006
13.256	131.918
14.450	138.591
15.385	143.217
16.003	149.344
16.673	155.474
17.031	160.316
17.398	160.847
18.072	164.696
18.745	169.559
19.100	175.921]; 
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(38.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Weih1976';

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


%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '5BSG4'; % Cat of Life
metaData.links.id_ITIS = '621865'; % ITIS
metaData.links.id_EoL = '328001'; % Ency of Life
metaData.links.id_Wiki = 'Vulpes_zerda'; % Wikipedia
metaData.links.id_ADW = 'Vulpes_zerda'; % ADW
metaData.links.id_Taxo = '66461'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000938'; % MSW3
metaData.links.id_AnAge = 'Vulpes_zerda'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Vulpes_zerda}}';
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
bibkey = 'Weih1976'; type = 'Article'; bib = [ ... 
'author = {Weiher, E.}, ' ... 
'doi = {10.1111/j.1748-1090.1976.tb00177.x}, ' ...
'year = {1976}, ' ...
'title = {Hand-rearing Fennec foxes at {M}elbourne {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {16}, ' ...
'pages = {200-202}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Vulpes_zerda}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Vulpes_zerda/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

