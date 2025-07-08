function [data, auxData, metaData, txtData, weights] = mydata_Lampetra_planeri

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Cephalaspidomorphi'; 
metaData.order      = 'Petromyzontiformes'; 
metaData.family     = 'Petromyzontidae';
metaData.species    = 'Lampetra_planeri'; 
metaData.species_en = 'European brook lamprey'; 

metaData.ecoCode.climate = {'Cf'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Ft'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(10); % K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdb'; 'Wdp'; 'Wdi'; 'Ni'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Lara Ibrahim'};                             
metaData.date_subm = [2011 11 07];                          
metaData.email    = {'lara.ibrahim@bio5.rwth-aachen.de'};                 
metaData.address  = {'Inst Umweltforschung, Aachen University'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 01]; 

%% set data
% zero-variate data;
data.ab = 14;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'KellKing2011';    
  temp.ab = C2K(11); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temp from KellKing2001';
data.ap = 2372;    units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = {'Hard1961','KellKing2011'};
  temp.ap = C2K(11); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 2555;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp is guessed';

data.Lb  = 2.5;    units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';
data.Lp  = 12.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
data.Li  = 20;     units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wdb = 5.2e-3; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';   bibkey.Wdb = 'Carl1969';
data.Wdp = 0.38;   units.Wdp = 'g';   label.Wdp = 'dry weight at puberty'; bibkey.Wdp = 'Carl1969';
data.Wdi = 1.42;   units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'Carl1969';

data.NR  = 1500;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'KellKing2011';   
  temp.NR = C2K(11); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f
data.LW = [ ... % length (cm), wet weight(g)
3.986	0.211
4.577	0.304
4.706	0.317
4.783	0.250
4.963	0.290
4.989	0.344
5.092	0.290
5.221	0.290
5.271	0.424
5.272	0.384
5.298	0.344
5.451	0.437
5.452	0.411
5.452	0.370
5.580	0.397
5.580	0.344
5.581	0.277
5.631	0.464
5.709	0.464
5.709	0.370
5.811	0.504
5.837	0.397
5.863	0.437
5.888	0.531
5.889	0.383
5.991	0.504
6.017	0.517
6.043	0.544
6.069	0.437
6.094	0.638
6.145	0.584
6.249	0.504
6.274	0.664
6.325	0.571
6.377	0.490
6.403	0.544
6.582	0.651
6.583	0.597
6.711	0.651
6.788	0.597
6.866	0.570
6.891	0.637
6.993	0.825
7.071	0.691
7.096	0.771
7.148	0.704
7.174	0.650
7.200	0.610
7.302	0.730
7.405	0.824
7.482	0.891
7.611	0.730
7.661	1.011
7.661	0.944
7.713	0.864
7.790	1.038
7.791	0.797
7.892	1.239
7.893	0.864
7.996	0.971
8.072	1.145
8.201	1.051
8.407	0.944
8.433	1.078
8.483	1.252
8.509	1.158
8.535	1.104
8.638	1.131
8.740	1.278
8.792	1.252
8.793	1.024
8.971	1.426
9.177	1.519
9.229	1.372
9.280	1.479
9.280	1.398
9.408	1.586
9.511	1.505
9.514	0.916
9.563	1.425
9.614	1.586
9.717	1.519
9.741	1.867
9.896	1.773
9.997	2.148
10.282	1.706
10.563	2.080
10.691	2.388
10.717	2.241
10.819	2.375
10.870	2.469
11.000	2.308
11.101	2.642
11.281	2.602
11.333	2.575
11.459	3.071
11.589	2.870
11.666	2.816
11.768	3.004
11.769	2.963
11.971	3.700
12.180	3.110
12.279	3.941
12.280	3.767
12.486	3.699
12.638	4.248
12.641	3.431
12.768	3.779
12.794	3.846
12.795	3.605
12.973	4.061
13.104	3.592
13.281	4.275
13.486	4.355
13.689	4.957];
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  bibkey.LW = 'OCon2006';

%% set weights for all real data
weights = setweights(data, []);
weights.Wdb = 10 * weights.Wdb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'assumption: W_i excludes eggs';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'spawns once at end of life; no feeding as adult';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6NVMN'; % Cat of Life
metaData.links.id_ITIS = '159720'; % ITIS
metaData.links.id_EoL = '206412'; % Ency of Life
metaData.links.id_Wiki = 'Lampetra_planeri'; % Wikipedia
metaData.links.id_ADW = 'Lampetra_planeri'; % ADW
metaData.links.id_Taxo = '41687'; % Taxonomicon
metaData.links.id_WoRMS = '148719'; % WoRMS
metaData.links.id_fishbase = 'Lampetra-planeri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lampetra_planeri}}';  
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
bibkey = 'Carl1969'; type = 'book'; bib = [ ...  
'author = {Carlander, K. D.}, ' ...
'year = {1969}, ' ...
'title  = {Handbook of freshwater fishery biology: life history data on freshwater fishes of the United States and Canada, exclusive of Perciformes.}, ' ...
'publisher = {Ames: Iowa State University Press}, ' ...
'volume = {1}, ' ...
'page = {27--28}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KellKing2011'; type = 'article'; bib = [ ...  
'author = {Kelly, F. L. and King, J. J.}, ' ...
'year = {2011}, ' ...
'title  = {A Review of the ecology and distribution of the three lamprey species, \emph{Lampetra fluviatilis} ({L}.), \emph{Lampetra planeri} ({B}loch) and \emph{Petromyzon marinus} ({L}.): a context for conservation and biodiversity considerations in {I}reland}, ' ...
'journal = {Biology and Environment: proceedings of the royal irish academy.}, ' ...
'volume = {101B (3)}, ' ...
'page = {165-185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Hard1961'; type = 'article'; bib = [ ...  
'author = {Hardisty, M. W.}, ' ...
'year = {1961}, ' ...
'title  = {The growth of larval lampreys.}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'volume = {30(2)}, ' ...
'page = {357--371}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OCon2006'; type = 'article'; bib = [ ... 
'author = {O Conner, W.}, ' ...
'year = {2006}, ' ...
'title  = {A survey of juvenile lamprey populations in the {B}oyne {C}atchment}, ' ...
'institute = {Irish Wildlife Manuals 24. National Parks and Wildlife Service, Dept}, ' ...
'address = {Eviron, Heritage & Local Gov., Dublin, Ireland}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/Summary/speciesSummary.php?ID=4481&genusname=Lampetra&speciesname=planeri}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  