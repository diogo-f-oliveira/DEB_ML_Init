function [data, auxData, metaData, txtData, weights] = mydata_Chaetodon_larvatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Chaetodontiformes'; 
metaData.family     = 'Chaetodontidae';
metaData.species    = 'Chaetodon_larvatus'; 
metaData.species_en = 'Hooded butterflyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIr'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2017 04 10]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 04 10]; 

%% set data
% zero-variate data

data.ab = 30/24;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Zeke2003';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 25*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Zeke2003';   
  temp.am = C2K(30);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6.7; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'ZekeWeer2006'; 
data.Li  = 12;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = {'Leis1989'};
  comment.Wwb = 'based egg diameter of 0.75 mm: 4/3*pi*0.038^3'; 
data.Wwp = 9.3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.02570 * Lp^3.1, see F1';
data.Wwi = 57; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570 * Li^3.1, see F1';

data.GSI  = 0.06;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'Zeke2003';   
  temp.GSI = C2K(30);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (g)
0.089	3.044
0.177	3.280
0.192	4.906
0.222	5.733
0.237	5.852
0.266	3.724
0.340	4.847
0.990	6.087
0.990	7.151
0.990	8.067
0.990	9.131
0.990	9.249
0.990	9.397
1.005	6.678
1.005	6.885
1.005	8.569
1.005	8.747
1.981	8.508
1.981	10.341
1.996	8.745
1.996	9.011
1.996	9.306
1.996	9.572
1.996	9.749
1.996	9.868
1.996	9.986
1.996	10.488
1.996	10.666
1.996	10.813
1.996	11.109
1.996	11.523
1.996	11.789
2.011	10.104
3.001	9.363
3.001	9.481
3.001	9.600
3.001	9.747
3.001	9.895
3.001	10.043
3.001	11.136
3.001	11.314
3.001	11.550
3.016	10.338
3.016	10.516
3.016	10.989
3.031	10.191
3.977	9.184
3.992	7.056
3.992	9.597
3.992	9.804
3.992	10.543
3.992	10.661
3.992	10.809
3.992	11.016
4.006	8.208
4.006	10.041
4.006	10.218
4.006	10.336
4.006	11.430
4.006	11.785
4.967	10.512
4.997	9.182
4.997	9.359
4.997	11.162
4.997	11.517
5.012	9.980
5.012	10.157
5.012	10.837
5.012	11.014
5.973	11.367
5.973	11.574
6.002	10.037
6.002	10.687
6.002	10.923
6.017	10.509
6.046	8.706
6.046	8.825
6.993	10.921
6.993	11.305
7.022	8.734
7.022	10.300
7.022	10.596
7.983	11.037
7.983	11.215
7.983	11.510
7.983	11.865
8.013	8.909
8.013	9.116
8.013	10.830
8.988	10.828
8.988	11.006
8.988	11.183
8.988	11.419
9.003	9.853
9.003	11.951
9.018	10.621
10.038	9.378
10.038	9.792
10.038	11.299
10.984	10.824
11.014	11.474
11.014	11.711
12.019	10.792
12.995	10.938
14.000	10.995];
data.tL(:,1) = 365 * (.5 + data.tL(:,1));
for i=2:size(data.tL,1);if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(30);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ZekeWeer2006';
comment.tL = 'temp varies between 27.5 and 33 C';

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

%% Facts
F1 = 'weight-length relationship: W in g = 0.02570*(TL in cm)^3.1';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 3 - 12 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'TBYC'; % Cat of Life
metaData.links.id_ITIS = '610301'; % ITIS
metaData.links.id_EoL = '46578202'; % Ency of Life
metaData.links.id_Wiki = 'Chaetodon_larvatus'; % Wikipedia
metaData.links.id_ADW = 'Chaetodon_larvatus'; % ADW
metaData.links.id_Taxo = '45422'; % Taxonomicon
metaData.links.id_WoRMS = '218716'; % WoRMS
metaData.links.id_fishbase = 'Chaetodon-larvatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetodon_larvatus}}';
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
bibkey = 'ZekeWeer2006'; type = 'Article'; bib = [ ... 
'author = {Z. A. Zekeria and S. Weertman and B. Samuel and T. Kale-ab and J. J. Videler}, ' ... 
'year = {2006}, ' ...
'title = {Growth of \emph{Chaetodon larvatus} ({C}haetodontidae: {P}isces) in the southern {R}ed {S}ea}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {148}, ' ...
'pages = {1113--1122}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Zeke2003'; type = 'Phdthesis'; bib = [ ... 
'author = {Z. A. Zekeria}, ' ... 
'year = {2003}, ' ...
'title = {Butterflyfishes of the Southern {R}ed {S}ea: Ecology and population dynamics}, ' ...
'school = {Groningen University, the Netherlands}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Leis1989'; type = 'Article'; bib = [ ... 
'author = {Leis, J. M.}, ' ... 
'year = {1989}, ' ...
'title = {Larval biology of butterflyfishes ({P}isces, {C}haetodontidae): What do we really know?}, ' ...
'journal = {Envir. Biology of Fishes}, ' ...
'volume = {25}, ' ...
'pages = {87--100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/12287}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
