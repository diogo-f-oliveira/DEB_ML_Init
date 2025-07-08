function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_tukula

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_tukula'; 
metaData.species_en = 'Potato grouper'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 12 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 29];

%% set data
% zero-variate data

data.ab = 5; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(23.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 26 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(23.9); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 99;       units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 200;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.5e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.95 mm: pi/6*0.095^3';
data.Wwp = 17246;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01479*Lp^3.04, see F1';
data.Wwi = 146250;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01479*Li^3.04, see F1; max. published weight: 110.0 kg';

data.GSI = 0.045; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(23.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
6.053	74.953
7.193	82.524
7.193	80.252
7.982	90.095
7.982	85.552
8.070	86.688
8.947	81.388
9.123	72.681
9.123	84.795
9.123	86.309
9.123	90.095
9.123	91.987
10.000	83.659
10.000	78.360
10.000	77.224
10.877	90.473
11.053	75.331
11.316	87.445
11.842	81.388
11.842	77.981
11.930	84.795
12.018	98.423
12.018	95.016
12.018	90.852
12.018	83.281
12.895	84.795
12.895	89.716
13.947	79.874
14.211	102.587
14.649	86.688
14.737	90.852
14.825	95.773
14.912	106.751
15.000	101.830
15.965	74.953
16.053	98.044
16.053	96.530
16.053	81.009
16.140	102.587
17.018	85.174
17.018	104.101
17.018	106.751
18.947	112.050
19.035	98.044
19.825	118.864
19.912	114.700
20.000	99.180
20.965	109.401
21.667	107.129
21.930	111.672
22.807	129.464
22.895	119.243
23.947	120.379
25.000	119.243
25.877	119.243
25.965	125.300];
data.tL(:,1) = (0.95+data.tL(:,1)) * 365;
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(23.9);  units.temp.tL = 'K'; label.temp.tLW = 'temperature';
bibkey.tL = 'Gran2005'; 

% length-weight
data.LW = [ ... % total length (cm), weight (g)
72.540	7260.238
74.773	8244.333
75.254	5944.211
76.256	7914.777
78.238	8406.232
78.240	8734.777
79.232	9062.639
79.722	8240.946
79.976	9308.533
80.230	10458.259
81.957	9635.724
82.948	9799.316
83.701	11605.782
84.191	10866.226
86.174	11357.681
86.179	12261.168
86.413	10043.348
86.911	10535.824
86.918	11603.581
88.904	12752.115
89.646	12669.475
89.887	11683.681
91.133	13161.268
94.358	14391.093
94.878	18497.511
95.849	15539.971
97.098	17346.098
98.076	15538.447
98.341	18330.871
98.829	17262.775
101.065	18739.685
101.791	16192.987
102.045	17260.574
103.544	19559.341
105.516	18325.960
105.789	22432.553
106.520	20625.071
107.525	23170.579
109.522	25961.823
110.522	27685.982
111.723	21853.542
113.726	25548.267
118.917	24805.493
118.957	31294.171
119.443	29897.536
119.720	34579.071
121.204	34578.055
125.170	35725.240
128.655	39172.547];    
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'Gran2005'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
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

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01479*(TL in cm)^3.04'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6G62T'; % Cat of Life
metaData.links.id_ITIS = '551104'; % ITIS
metaData.links.id_EoL = '46579653'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_tukula'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_tukula'; % ADW
metaData.links.id_Taxo = '173935'; % Taxonomicon
metaData.links.id_WoRMS = '218246'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus-tukula'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_tukula}}';
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
bibkey = 'Gran2005'; type = 'article'; bib = [ ... 
'author = {Grandcourt, E.}, ' ... 
'year = {2005}, ' ...
'title = {Demographic characteristics of selected epinepheline groupers (Family: {S}erranidae; Subfamily: {E}pinephelinae) from {A}ldabra {A}toll, {S}eychelles}, ' ...
'journal = {Atoll Res. Bull.}, ' ...
'volume = {539}, '...
'pages = {200-216}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Epinephelus-tukula.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

