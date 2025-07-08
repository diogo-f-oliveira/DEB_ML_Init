function [data, auxData, metaData, txtData, weights] = mydata_Plectropomus_pessuliferus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Plectropomus_pessuliferus'; 
metaData.species_en = 'Roving coralgrouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.1); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 01];

%% set data
% zero-variate data

data.ab = 3; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 26 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(27.1); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 63;       units.Lp  = 'cm';  label.Lp  = 'std length at puberty';  bibkey.Lp  = 'Ferr1993'; 
data.Li  = 120;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.8e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AlmaAli2023';
  comment.Wwb = 'based on egg diameter of 0.48 mm: pi/6*0.048^3';
data.Wwp = 3.4e3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Ferr1993','fishbase'};
  comment.Wwp = 'based on 0.01148*Lp^3.04, see F1';
data.Wwi = 24e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^3.04, see F1';
 
data.Ri = 1843450/365; units.Ri = '#/d';  label.Ri = 'reproduction rate at TL 64.6 cm';    bibkey.Ri = 'AlmaAli2023';
  temp.Ri = C2K(17.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% time-length
data.tL_S = [ ... % time since birth (yr), total length (cm)
0.970	46.532
1.083	23.707
1.954	51.622
2.063	41.711
3.012	45.600
3.045	53.107
3.077	62.717
3.079	55.209
3.113	58.812
3.114	57.911
3.920	68.710
3.992	64.204
4.028	59.699
4.064	57.597
4.941	68.394
4.975	71.697
5.966	56.667
6.946	74.670
6.983	68.364
6.984	65.060
8.075	68.648
10.956	84.220
13.037	75.780
14.061	66.756
17.118	84.127
19.055	84.098];
data.tL_S(:,1) = (0.6+data.tL_S(:,1)) * 365;
units.tL_S   = {'d', 'cm'};  label.tL_S = {'time since birth', 'total length', 'Red Sea South'};  
temp.tL_S    = C2K(27.1);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'DesR2011'; 
%
data.tL_C = [ ... % time since birth (yr), total length (cm)
0.999	37.879
1.104	35.758
1.138	32.727
1.989	49.091
2.022	42.121
2.031	66.667
3.015	63.939
3.046	49.697
3.049	59.394
3.115	46.364
3.964	56.970
4.032	50.606
4.035	59.697
4.039	71.515
5.129	66.970
6.014	80.000
6.080	66.061
12.039	92.121
13.059	86.970
13.060	91.818
16.123	89.394];
data.tL_C(:,1) = (0.6+data.tL_C(:,1)) * 365;
units.tL_C   = {'d', 'cm'};  label.tL_C = {'time since birth', 'total length', 'Red Sea Central'};  
temp.tL_C    = C2K(27.1);  units.temp.tL_C = 'K'; label.temp.tL_C = 'temperature';
bibkey.tL_C = 'DesR2011'; 
%
data.tL_N = [ ... % time since birth (yr), total length (cm)
0.703	28.721
1.019	37.794
1.090	42.328
1.091	35.379
1.092	32.660
1.125	30.849
1.160	33.569
2.074	52.327
2.109	36.619
3.023	36.646
3.058	52.357
3.093	50.546
3.163	57.798
4.007	58.126
4.991	60.271
5.026	61.480
5.132	68.130
6.046	80.242
6.081	60.606
6.116	69.972
7.030	66.374
7.031	69.093
7.032	75.136
8.014	75.166
8.046	69.426
8.047	67.614
8.084	63.083
9.069	79.125
11.072	76.768
13.076	90.122
13.111	93.144
19.016	96.344];
data.tL_N(:,1) = (0.6+data.tL_N(:,1)) * 365;
units.tL_N   = {'d', 'cm'};  label.tL_N = {'time since birth', 'total length', 'Red Sea North'};  
temp.tL_N    = C2K(27.1);  units.temp.tL_N = 'K'; label.temp.tL_N = 'temperature';
bibkey.tL_N = 'DesR2011'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_S = 5 * weights.tL_S;
weights.tL_C = 5 * weights.tL_C;
weights.tL_N = 5 * weights.tL_N;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_S','tL_C','tL_N'}; subtitle1 = {'Data for Red Sea South, Central, North'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '782LF'; % Cat of Life
metaData.links.id_ITIS = '551117'; % ITIS
metaData.links.id_EoL = '46579754'; % Ency of Life
metaData.links.id_Wiki = 'Plectropomus_pessuliferus'; % Wikipedia
metaData.links.id_ADW = 'Plectropomus_pessuliferus'; % ADW
metaData.links.id_Taxo = '105917'; % Taxonomicon
metaData.links.id_WoRMS = '218265'; % WoRMS
metaData.links.id_fishbase = 'Plectropomus-pessuliferus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plectropomus_pessuliferus}}';
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
bibkey = 'DesR2011'; type = 'phdthesis'; bib = [ ...
'howpublished = {https://repository.kaust.edu.sa/server/api/core/bitstreams/1fe74db0-296f-48de-98fb-99cab40b4a66/content}, ' ...
'author = {Noah J.D. DesRosiers}, ' ... 
'year = {2011}, ' ...
'title = {Growth and Maturation of \emph{Plectropomus spp.} in the Saudi Arabian Red Sea}, ' ...
'school = {King Abdullah University of Science and Technology, Thuwal, Kingdom of Saudi Arabia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AlmaAli2023'; type = 'article'; bib = [ ... 
'doi = {10.22271/fish.2023.v11.i6a.2880  }, ' ...
'author = {Mona Ibrahim Mohamed Almahy and Sayed Mohamed Ali}, ' ... 
'year = {2023}, ' ...
'title = {Some reproductive traits, fishery status, and the degree of r-selection of the squaretail coral grouper \emph{Plectropomus areolatus} ({R}\"{u}ppell, 1830) and the roving coral grouper \emph{Plectropomus pessuliferus} ({F}owler, 1904) in the Red Sea}, ' ...
'journal = {International Journal of Fisheries and Aquatic Studies}, ' ...
'volume = {11(6)}, '...
'pages = {63-71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Plectropomus-pessuliferus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

