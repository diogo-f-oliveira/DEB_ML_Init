function [data, auxData, metaData, txtData, weights] = mydata_Gymnothorax_kidako
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Muraenidae';
metaData.species    = 'Gymnothorax_kidako'; 
metaData.species_en = 'Kidako moray'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPW','MPh'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.8); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 23];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 23];

%% set data
% zero-variate data

data.ab = 93;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(21.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v and Wwb';
data.am = 34*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'OomoKats2023';   
  temp.am = C2K(21.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 62.1;   units.Lp  = 'cm';  label.Lp  = 'total length puberty';  bibkey.Lp  = 'OomoKats2023';
data.Lpm  = 47.4;   units.Lpm  = 'cm';  label.Lpm  = 'total length puberty for males';  bibkey.Lpm  = 'OomoKats2023';
data.Li  = 91.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 0.536;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 10 mm of Muraena_helena: pi/6*1^3';
data.Wwp = 441.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00058*Lp^3.28, see F1';
data.Wwi = 1.57e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00058*Li^3.28, see F1';
 
data.GSI = 0.1; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'OomoKats2023';
  temp.GSI = C2K(19); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
3.878	30.630
4.767	40.200
5.734	40.397
6.708	61.445
6.748	59.533
8.438	56.098
9.607	57.061
9.618	89.009
10.534	59.936
11.546	73.524
12.557	85.390
13.318	72.577
13.437	67.604
13.440	76.787
13.480	74.682
14.364	70.670
14.365	72.009
15.295	81.388
15.296	86.362
15.372	72.780
16.176	68.575
16.297	70.489
16.298	71.637
16.300	78.524
16.339	72.976
16.341	79.098
16.382	80.629
16.385	89.811
17.103	71.833
17.185	74.320
17.226	76.616
18.193	78.343
18.232	74.900
19.081	83.704
20.167	78.354
20.168	82.562
20.975	86.584
22.903	70.143
22.945	77.030
22.987	80.473
23.028	82.961
23.829	69.574
23.872	77.035
23.875	84.687
24.925	94.258
25.768	85.080
25.850	90.246
26.693	81.450
26.771	75.329
26.854	82.599
26.856	86.042
27.700	83.369
27.777	71.700
27.780	82.221
28.705	77.826
30.598	76.115
30.720	81.664
31.564	76.503
32.530	73.639];  
data.tL_f(:,1) = (0+data.tL_f(:,1))*365; % convert to yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(19);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OomoKats2023'; 
comment.tL_m = 'temperature oscillates between 14 and 24 C';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.869	25.077
2.871	31.390
2.910	28.138
3.839	34.838
4.928	38.862
5.777	47.666
6.624	50.923
6.669	62.976
6.706	55.515
7.638	70.442
7.675	61.642
7.717	65.660
8.526	74.273
8.565	72.551
8.601	61.647
8.639	53.995
8.683	62.987
8.684	66.621
9.529	63.756
9.613	73.513
10.455	62.996
10.496	66.057
10.537	66.823
11.508	79.646
12.433	76.781
12.515	80.608
13.280	80.612
13.484	86.161
13.518	69.517
14.325	73.539
14.366	75.261
14.367	77.174
14.372	91.139
14.489	82.340
14.536	98.601
15.252	76.414
15.294	78.710
15.413	75.649
16.302	84.072
17.229	84.651
18.196	85.804
18.235	81.021
19.118	73.757
20.089	86.771
21.018	91.941
21.100	95.576
21.898	76.259
21.980	80.085
23.029	85.830
23.880	98.652
23.914	81.818
23.918	93.296
27.702	87.769
27.743	89.108
28.668	87.009
28.671	94.087
31.570	91.042
32.579	98.126];  
data.tL_m(:,1) = (0+data.tL_m(:,1))*365; % convert to yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(19);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OomoKats2023';
comment.tL_m = 'temperature oscillates between 14 and 24 C';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'incubation time is ignored';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: weight in g = 0.00058*(TL in cm)^3.28';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44L3Q'; % Cat of Life
metaData.links.id_ITIS = '161243'; % ITIS
metaData.links.id_EoL = '46561744'; % Ency of Life
metaData.links.id_Wiki = 'Gymnothorax_kidako'; % Wikipedia
metaData.links.id_ADW = 'Gymnothorax_kidako'; % ADW
metaData.links.id_Taxo = '42551'; % Taxonomicon
metaData.links.id_WoRMS = '126303'; % WoRMS
metaData.links.id_fishbase = 'Gymnothorax-kidako'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnothorax_kidako}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Gymnothorax-kidako.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OomoKats2023'; type = 'article'; bib = [ ...  
'doi = {10.1007/s10228-022-00902-0}, ' ...
'author = {Naoya Oomori and Katsuyuki Hamasaki and Tomoki Sunobe}, ' ...
'year = {2023}, ' ...
'title  = {Reproductive ecology, age, and growth of the {K}idako moray \emph{Gymnothorax kidako} from {T}ateyama {B}ay, {C}hiba, {J}apan}, ' ...
'journal = {Ichthyological Research}, ' ...
'volume = {70}, ' ...
'pages = {439–445}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
