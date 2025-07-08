function [data, auxData, metaData, txtData, weights] = mydata_Lithognathus_lithognathus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Lithognathus_lithognathus'; 
metaData.species_en = 'White steenbras'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASE'};
metaData.ecoCode.habitat = {'0iMp','jiMc'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'L-dL_f'; 'Ww-dWw_f'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 10];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 10];

%% set data
% zero-variate data

data.ab = 6.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(16); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 22*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Benn1993';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 54;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 110;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Benn1993';
  comment.Li = 'Fishbase gives 200 cm, but this is hard to believe given the tL data';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwp = 2861;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.01549*Lp^3.04, see F1';
data.Wwi = 25e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.01549*Li^3.04, see F1';

data.GSI  = 0.05; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(16); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.978	18.457
0.981	20.938
0.993	14.271
1.039	16.442
1.050	23.264
1.980	24.976
1.985	28.077
2.054	31.023
2.068	26.217
2.085	22.962
2.990	36.922
3.008	34.442
3.032	35.837
3.035	38.008
3.041	41.884
3.044	44.054
3.070	32.272
3.080	39.403
3.082	40.334
4.011	55.845
4.034	42.512
4.050	52.899
4.056	56.775
4.064	47.628
4.072	38.946
4.079	57.861
4.081	44.993
4.083	46.388
4.161	40.652
5.049	42.830
5.050	57.558
5.058	62.985
5.064	53.062
5.066	53.837
5.080	49.031
5.096	59.419
5.097	45.621
5.098	60.969
5.099	47.016
5.100	47.946
5.103	50.272
5.104	65.000
5.105	51.512
5.112	55.853
5.159	44.381
6.029	63.457
6.043	58.341
6.047	61.132
6.066	59.427
6.070	62.062
6.075	64.853
6.083	56.326
6.089	74.465
6.101	67.799
6.107	71.675
6.108	72.450
6.120	66.249
6.123	54.311
6.125	69.505
7.035	72.147
7.042	76.643
7.057	58.039
7.061	75.403
7.071	81.605
7.082	74.473
7.087	77.884
7.090	79.745
7.094	82.845
7.096	83.776
7.097	70.597
7.098	85.171
7.101	87.186
7.102	73.078
7.110	78.970
7.116	68.582
8.050	86.884
8.053	74.791
8.067	69.675
8.076	75.566
8.078	76.962
8.080	78.357
8.081	64.869
8.082	79.597
8.084	80.993
8.089	84.248
8.092	86.109
8.095	88.590
8.109	83.008
9.025	89.527
9.053	94.023
9.065	87.822
9.066	74.023
9.091	90.923
9.115	92.473
9.124	84.101
9.149	86.427
10.042	91.550
10.046	94.496
10.065	92.791
10.081	89.070
10.091	95.737
10.094	83.334
10.100	87.055
10.112	80.698
10.113	81.939
10.147	90.156
11.051	88.768
11.059	93.884
11.061	95.279
11.077	91.713
11.092	86.752
11.115	87.683
12.024	89.860
12.072	92.961
12.080	98.388
12.091	91.411
12.119	95.597
13.043	93.434
13.046	94.985
13.062	91.574
14.045	99.488
14.082	95.148
15.010	95.310
15.044	104.147
15.054	96.395
15.060	99.961
15.090	91.124
17.022	99.511
17.042	98.271
17.047	101.527
17.052	104.783
17.071	103.233
17.078	93.775
17.104	96.256
17.145	94.861
18.060	100.915
18.069	106.961
18.100	98.900
19.071	98.752
19.077	102.783
19.087	109.450
19.095	100.768
20.025	102.170
20.071	103.721
20.129	99.225
21.064	104.194
21.090	107.450];
data.tL(:,1) = (0.5+data.tL(:,1)) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-1;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth','fork length'};  
temp.tL    = C2K(16);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Benn1993'; 

% length-length 62 d later-weight-weight 62 d later
LLWW = [ ... % length at t=0 (cm), length at 62 d (cm), wight at t=0 (g), weight at 62 d (g)
  10.197 11.652  27.21  39.94   % fed 1 times per day
  11.843 11.843  29.55  42.68   % fed 2 times per day
  10.262 11.503  28.47  39.83   % fed 3 times per day
  22.288 22.921 254.23 278.23   % fed 1 times per day
  21.544 23.000 234.25 279.23   % fed 2 times per day
  21.906 23.243 262.58 284.99]; % fed 3 times per day
data.LL = LLWW(:,1:2); units.LL  = {'cm', 'cm', 'g' ,'g'};  label.LL = {'length at t=0','length at t=62 d','weight at t=0','weight at t=62 d'};  
temp.LL   = C2K(16);  units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'HarrCook1995'; treat.LL = {0, {'length at t=62 d','weight at t=0','weight at t=62 d'}};
%
data.LW = LLWW(:,[1 3 4]); units.LW  = {'cm', 'g' ,'g'};  label.LW = {'length at t=0','weight at t=0','weight at t=62 d'};  
temp.LW   = C2K(16);  units.temp.LW = 'K'; label.temp.LW = 'temperature';
bibkey.LW = 'HarrCook1995'; treat.LW = {0, {'weight at t=0','weight at t=62 d'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.LL = 5 * weights.LL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_N','tL_S'}; subtitle1 = {'Data for northern, southern population'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.01549*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'known only from the Orange River mouth to Natal, South Africa';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3VKQJ'; % Cat of Life
metaData.links.id_ITIS = '647951'; % ITIS
metaData.links.id_EoL = '46579957'; % Ency of Life
metaData.links.id_Wiki = 'Lithognathus_lithognathus'; % Wikipedia
metaData.links.id_ADW = 'Lithognathus_lithognathus'; % ADW
metaData.links.id_Taxo = '179017'; % Taxonomicon
metaData.links.id_WoRMS = '218604'; % WoRMS
metaData.links.id_fishbase = 'Lithognathus-lithognathus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithognathus_lithognathus}}';
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
bibkey = 'HarrCook1995'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1365-2109.1995.tb00920.x}, ' ...
'author = {Harris, S. A. and Cook, P. A.}, ' ... 
'year = {1995}, ' ...
'title = {Growth and feeding of white steenbras, \emph{Lithognathus lithognathus} ({C}uvier) ({S}paridae), under experimental culture conditions}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {26(5)}, ' ...
'pages = {323–330}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Benn1993'; type = 'Article'; bib = [ ... 
'doi = {10.2989/025776193784287257}, ' ...
'author = {B.A. Bennet}, ' ... 
'year = {1993}, ' ...
'title = {ASPECTS OF THE BIOLOGY AND LIFE HISTORY OF WHITE STEENBRAS \emph{Lithognathus lithognathus} IN {S}OUTHERN {A}FRICA}, ' ...
'journal = {S.Afr. J. mar. Sci.}, ' ...
'volume = {13}, ' ...
'pages = {83-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lithognathus-lithognathus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
