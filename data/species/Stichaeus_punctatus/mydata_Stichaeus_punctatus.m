function [data, auxData, metaData, txtData, weights] = mydata_Stichaeus_punctatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Stichaeidae';
metaData.species    = 'Stichaeus_punctatus'; 
metaData.species_en = 'Arctic shanny'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MN', 'MPN', 'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mnf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-0.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm  = [2019 03 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 03 25];

%% set data
% zero-variate data

data.am = 17*365;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'DunbGree2017';   
  temp.am = C2K(2.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for female';  bibkey.Lp  = 'guess'; 
data.Li  = 22;     units.Li  = 'cm';   label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
  
data.Wwb = 2.6e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'FarwGree1976';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';

data.Ri  = 1624/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 11 cm';    bibkey.Ri  = 'FarwGree1976';   
  temp.Ri = C2K(2.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data
% time-length data
data.tL = [ ... % time since birth (yr), total length (cm)
0 3.88
1 5.15
2 6.89];
data.tL(:,1) = 365 * (0.5 + data.tL(:,1)); % convert yr 
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'DunbGree2017'};  
temp.tL   = C2K(3.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'DunbGree2017';

data.tL1 = [ ... % time since birth (yr), total length (cm)
0.478	4.385
0.479	4.148
0.482	2.568
0.514	4.030
1.413	7.506
1.414	6.795
1.415	6.637
1.453	5.136
1.480	8.731
1.482	7.980
1.482	7.783
1.483	7.111
1.485	6.242
1.486	6.005
1.486	5.847
2.454	9.481
2.455	9.165
2.458	7.980
2.459	7.388
2.459	7.269
3.430	9.758
3.497	10.746
4.437	11.259
4.439	10.430
4.440	10.153
6.527	12.247
7.402	10.430
8.375	11.733
8.443	12.602
8.449	9.758
14.508	13.037
16.526	14.459];
data.tL1(:,1) = 365 * (0.5 + data.tL1(:,1)); % convert yr 
units.tL1  = {'d', 'cm'};  label.tL1 = {'time since birth', 'total length', 'DunbGree2017'};  
temp.tL1   = C2K(3.6);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'DunbGree2017';

data.LW = [ ... % total length (cm), wet weight (g)
    2.6 0.09
    2.9 0.15
    10.52 12.5
    11.42 16.9
    10.2 11.3
    10.94 12.0
    5.56 1.5
    5.65 1.6
    3.14 0.23
    3.35 0.3
    6.35 2.2
    6.6 2.6
    5.69 1.4
    2.75 0.14
    3.34 0.3];
units.LW  = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'DunbGree2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 3 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.kap = 3 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'DunbGree2017, KeatStee1993'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'length-weight: Ww in g = 0.00251*(TL in cm)^3.23 for Lycodes_raridens';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '52HT4'; % Cat of Life
metaData.links.id_ITIS = '171596'; % ITIS
metaData.links.id_EoL = '217553'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Stichaeus_punctatus'; % ADW
metaData.links.id_Taxo = '596144'; % Taxonomicon
metaData.links.id_WoRMS = '159819'; % WoRMS
metaData.links.id_fishbase = 'Stichaeus-punctatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stichaeidae}}';
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
bibkey = 'DunbGree2017'; type = 'Article'; bib = [ ... 
'author = {R. Dunbrack and J. M. Green}, ' ... 
'year = {2017}, ' ...
'title = {Life History Differences and Latitudinal Variation in Recruitment in Two Species of {A}rctic-{B}oreal {P}erciform Fishes, the Fish Doctor \emph{Gymnelus viridis} and the {A}rctic \emph{Shanny Stichaeus punctatus}}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {57}, ' ...
'pages = {380-392}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KeatStee1993'; type = 'Article'; bib = [ ... 
'author = {Derek W. Keats and Donald H. Steele and John M. Green and Guy M. Martel}, ' ... 
'year = {1993}, ' ...
'title = {Diet and population size structure of the {A}rctic shanny, \emph{Stichaeus punctatus} ({P}isces: {S}tichaeidae), at sites in eastern {N}ewfoundland and the eastern {A}rctic}, ' ...
'journal = {Environ. Biol. Fishes}, ' ...
'volume = {37}, ' ...
'pages = {173-180}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FarwGree1976'; type = 'Article'; bib = [ ... 
'doi = {10.2307/1443388}, ' ...
'author = {Farwell, M. K. and Green, J. M. and Pepper, V. A.}, ' ... 
'year = {1976}, ' ...
'title = {Distribution and Known Life History of \emph{Stichaeus punctatus} in the {N}orthwest {A}tlantic}, ' ...
'journal = {Copeia}, ' ...
'volume = {1976}, ' ...
'pages = {598}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Stichaeus-punctatus-punctatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
