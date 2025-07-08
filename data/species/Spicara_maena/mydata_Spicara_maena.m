function [data, auxData, metaData, txtData, weights] = mydata_Spicara_maena
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Spicara_maena'; 
metaData.species_en = 'Blotched picarel'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 06];

%% set data
% zero-variate data

data.am = 10*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'DulcKral200';   
  temp.am = C2K(14.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.5;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 27.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.48e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'DaloTale2019';
  comment.Wwb = 'based on egg diameter of 0.780 mm: pi/6*0.078^3';
data.Wwp = 17.94;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01096*Lp^3.03, see F1';
data.Wwi = 300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'DulcKral200';
  comment.Wwi = 'based on LW data; 0.01096*Li^3.03, see F1, gives 251.8';

data.R26  = 49125/365;   units.R26  = '#/d'; label.R26  = 'reprod rate at TL 26.3 cm';     bibkey.R26  = 'DaloTale2019';   
  temp.R26 = C2K(14.5);  units.temp.R26 = 'K'; label.temp.R26 = 'temperature';
data.R16  = 19875/365;   units.R16  = '#/d'; label.R16  = 'reprod rate at TL 16.9 cm';     bibkey.R16  = 'DaloTale2019';   
  temp.R16 = C2K(14.5);  units.temp.R16 = 'K'; label.temp.R16 = 'temperature';
 
% uni-variate data
% time-length-weight
data.tLW = [ ...  % time since birth (yr), total length (cm), weight (g)
    1  9.52   9.11
    2 15.96  51.73
    3 19.47  97.47
    4 21.52 122.92
    5 23.47 170.89
    6 24.68 224.87
    8 27.50 298.00]; 
data.tLW(:,1) = data.tLW(:,1) * 365; % convert yr to d
units.tLW   = {'d','cm','g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
temp.tLW    = C2K(14.5);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'DulcKral200'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % length (cm), weight (g)
7.898	4.100
8.188	6.834
8.319	6.150
8.611	4.784
8.772	7.517
8.967	8.200
9.291	7.517
9.485	8.884
9.714	6.150
9.971	11.617
10.199	8.884
10.458	11.617
10.651	13.667
11.008	14.351
13.306	27.335
13.598	27.335
13.694	30.752
13.855	32.802
13.921	29.385
13.924	24.601
14.178	36.902
14.180	32.118
14.309	34.169
14.372	38.269
14.474	28.018
14.499	43.736
14.633	33.485
14.665	36.219
14.695	42.369
14.922	42.369
15.050	45.103
15.055	33.485
15.182	39.636
15.373	48.519
15.470	50.569
15.476	36.902
15.602	43.736
15.669	38.952
15.759	56.036
15.800	37.585
15.860	48.519
15.864	39.636
16.052	53.303
16.178	64.237
16.244	60.820
16.247	54.670
16.443	51.253
16.502	63.554
16.506	56.036
16.696	64.920
16.828	60.820
16.863	53.986
16.891	65.604
16.993	53.303
17.023	58.770
17.149	69.704
17.276	75.171
17.339	79.954
17.345	66.287
17.402	84.055
17.414	56.720
17.537	72.437
17.639	60.820
17.728	79.271
17.891	78.588
17.900	58.087
17.962	64.920
18.018	84.738
18.025	69.704
18.346	75.854
18.371	93.622
18.381	71.754
18.409	82.005
18.438	88.838
18.439	86.105
18.451	58.087
18.571	80.638
18.602	84.055
18.697	90.888
18.757	100.456
18.833	75.854
18.895	82.005
18.952	101.822
18.956	90.888
18.986	97.722
19.123	80.638
19.125	76.538
19.247	94.305
19.276	101.822
19.338	109.339
19.346	89.522
19.348	84.738
19.350	79.954
19.406	101.822
19.491	53.986
19.499	112.073
19.533	107.289
19.633	101.139
19.637	92.255
19.667	98.405
19.691	116.856
19.705	86.105
19.726	110.706
19.763	101.822
19.833	88.155
19.839	76.538
20.018	112.073
20.026	92.255
20.053	104.556
20.061	87.472
20.108	128.474
20.113	116.856
20.246	109.339
20.284	97.722
20.338	121.640
20.369	125.740
20.383	92.938
20.386	85.421
20.408	110.706
20.508	103.872
20.531	125.057
20.580	87.472
20.598	120.957
20.625	133.941
20.731	112.756
20.738	97.039
20.829	112.073
20.854	129.841
20.863	107.289
20.922	122.323
20.982	133.257
20.989	116.173
21.025	109.339
21.028	101.822
21.154	110.023
21.282	115.490
21.310	124.374
21.312	119.590
21.337	138.041
21.375	123.690
21.409	120.957
21.417	102.506
21.448	105.923
21.511	110.706
21.606	115.490
21.695	134.624
21.791	138.724
21.834	114.806
21.956	131.891
22.030	110.706
22.084	136.674
22.143	150.342
22.152	127.790
22.157	118.223
22.243	142.825
22.342	140.091
22.382	120.957
22.385	115.490
22.468	148.975
22.477	127.790
22.566	145.558
22.832	131.891
22.890	147.608
23.214	148.292
23.273	161.959
23.376	150.342
23.890	161.276
23.950	172.210
24.040	189.977
24.299	189.977
24.769	230.296
24.875	209.112
24.935	220.046
25.028	230.979
26.025	250.797
26.351	246.697
26.631	274.032
27.400	297.950];
units.LW   = {'d', 'cm'};  label.LW = {'total length','weight'};  
bibkey.LW = 'DulcKral200';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 5 * weights.tLW;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01096*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
F2 = 'protogynous sequential hermaphrodite';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4Z2XJ'; % Cat of Life
metaData.links.id_ITIS = '647991'; % ITIS
metaData.links.id_EoL = '46578160'; % Ency of Life
metaData.links.id_Wiki = 'Spicara_maena'; % Wikipedia
metaData.links.id_ADW = 'Spicara_maena'; % ADW
metaData.links.id_Taxo = '187957'; % Taxonomicon
metaData.links.id_WoRMS = '126830'; % WoRMS
metaData.links.id_fishbase = 'Spicara-maena'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spicara_maena}}';
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
bibkey = 'DulcKral200'; type = 'article'; bib = [ ...  
'author = {Jakov Dul\v{c}i\''{c} and Miro Kraljevi\''{c} and Branka Grbec and Perica Cetini\''{c}}, ' ...
'year = {2000}, ' ...
'title  = {Age, growth and mortality of blotched picarel \emph{Spicara maena} {L}. ({P}isces: {C}entracanthidae) in the eastern central {A}driatic}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {48}, ' ...
'pages = {69-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DaloTale2019'; type = 'article'; bib = [ ... 
'doi = {10.17017/jfish.v7i1.2019.309}, ' ...
'author = {Fatiha Dalouche and Lotfi Bensahla Talet and Ahmed Bensahla Talet and Sidi Mohamed El Amine Abi Ayad}, ' ...
'year = {2019}, ' ...
'title  = {Fecundity of the blotched picarel, \emph{Spicara maena} ({L}innaeus, 1758) from {O}ran {B}ay ({W}estern {M}editerranean {S}ea)}, ' ...
'journal = {Journal of Fisheries}, ' ...
'volume = {48}, ' ...
'pages = {eISSN 2311-3111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Spicara-maena.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

