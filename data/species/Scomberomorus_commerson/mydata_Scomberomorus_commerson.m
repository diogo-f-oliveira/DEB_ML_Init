function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_commerson
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_commerson'; 
metaData.species_en = 'Narrow-barred Spanish mackerel'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MIN', 'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L_T'; 'L-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 12 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.tp = 135;    units.tp = 'd';   label.tp = 'age at puberty';            bibkey.tp = {'fishbase','McIlClae2005'};
  temp.tp = C2K(28);units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 21*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'McIlClae2005';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on max in tL data';

data.Lp  = 44;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty for female';  bibkey.Lp  = 'NoegBoer2018'; 
  comment.Lp = 'strong regional differences exist; fishbase and McIlClae2005 give 70 cm';
data.Li  = 240;     units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'NoegBoer2018';
  comment.Wwb = 'based on egg diameter of 0.5 mm: pi/6*0.05^3';
data.Wwp = 431;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 70e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';

% uni-variate data

% time-length
data.tL_f = [ ... % yr class (yr), fork length (cm)
0.264	48.835
0.296	45.319
0.298	53.758
0.394	50.945
0.395	56.571
0.396	59.736
0.426	50.945
0.494	64.308
0.524	55.165
0.526	66.418
0.558	61.495
0.562	81.187
0.590	63.956
0.592	70.989
0.596	88.923
0.629	93.846
0.654	58.681
0.689	73.451
0.789	85.758
0.848	61.495
0.850	68.879
0.885	80.484
0.911	53.407
0.912	56.923
0.922	107.209
0.923	108.615
0.946	65.363
0.947	70.637
0.949	77.670
0.949	81.538
0.950	86.110
0.951	89.275
0.951	91.736
0.952	94.198
0.953	97.011
0.953	101.231
0.954	102.989
1.013	75.209
1.989	108.967
1.989	110.022
1.990	114.242
1.991	118.462
2.015	75.912
2.015	79.077
2.015	80.484
2.020	104.396
2.021	106.154
2.022	112.835
2.046	72.747
2.049	86.110
2.049	87.868
2.050	89.626
2.050	92.440
2.051	95.604
2.051	97.363
2.081	84.352
2.084	100.527
2.084	101.934
2.929	121.978
2.984	75.912
2.985	81.187
2.985	83.297
2.986	85.407
2.986	87.868
2.987	93.143
2.988	95.956
2.988	97.363
2.989	99.121
2.989	100.879
2.990	104.396
2.990	105.802
2.990	107.560
2.992	116.000
2.993	119.165
3.055	110.022
3.056	111.429
3.057	117.407
3.995	125.143
3.996	126.901
4.022	94.901
4.022	97.011
4.024	108.615
4.025	112.132
4.026	114.593
4.026	119.165
4.027	120.571
5.031	132.527
5.062	127.253
5.062	129.011
5.063	131.121
5.064	136.747
5.965	120.923
6.030	122.681
6.066	137.099
7.002	132.527
8.037	141.319
8.038	145.187
8.098	119.868
10.039	132.527
10.041	140.967
10.067	111.429
10.108	153.626
11.041	136.044
11.044	150.813
12.041	125.143
13.073	119.516
15.147	146.593
17.088	159.253
20.155	145.187
20.158	164.879]; 
data.tL_f(:,1) = (0.5 + data.tL_f(:,1)) * 365;   % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'female'};  
temp.tL_f    = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'McIlClae2005';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % yr class (yr), fork length (cm)
0.220	54.474
0.253	60.000
0.285	56.842
0.348	51.579
0.349	53.684
0.380	48.158
0.385	69.737
0.415	61.579
0.478	54.737
0.480	63.158
0.481	66.842
0.511	56.842
0.515	70.526
0.541	49.211
0.609	60.000
0.610	64.474
0.640	54.474
0.645	73.684
0.708	69.211
0.744	81.053
0.772	66.316
0.809	83.158
0.866	55.526
0.868	64.211
0.871	75.263
0.900	61.053
0.902	68.684
0.904	76.842
0.931	56.842
0.935	71.316
0.937	79.211
0.938	81.053
0.939	84.737
0.940	89.474
0.940	91.053
0.943	99.474
0.945	107.105
0.946	110.526
0.971	86.316
0.972	87.368
0.973	92.632
0.973	93.421
0.974	94.737
0.974	96.316
0.974	97.368
0.998	66.316
1.000	73.421
1.911	95.263
1.938	77.368
1.939	78.947
1.939	80.526
1.939	81.579
1.940	82.895
1.943	96.842
1.944	99.737
1.945	101.579
1.945	102.632
1.948	111.842
1.948	112.632
1.972	83.947
1.979	107.368
1.979	110.000
1.982	120.000
1.998	61.053
2.006	87.368
2.006	88.947
2.006	90.000
2.007	91.053
2.007	92.632
2.007	93.684
2.010	105.000
2.011	106.316
2.037	85.789
2.943	87.368
2.943	88.947
2.943	90.000
2.944	91.579
2.946	101.842
2.947	103.684
2.948	107.368
2.948	108.684
2.949	110.263
2.949	112.105
2.950	115.000
2.950	116.579
2.951	117.895
2.951	118.947
2.951	120.000
2.955	132.632
2.978	98.158
2.978	99.474
3.009	95.789
3.010	97.105
3.886	110.000
3.921	122.632
3.958	138.158
3.983	111.842
3.984	116.053
3.987	127.895
4.956	123.421
5.015	103.947
5.018	115.263
5.990	125.263
6.056	130.526
7.054	118.947
7.992	121.579
9.026	121.053
10.034	146.053
10.058	115.263
10.060	121.842
10.063	133.684]; 
data.tL_m(:,1) = (0.5 + data.tL_m(:,1)) * 365;   % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'male'};  
temp.tL_m    = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'McIlClae2005';
comment.tL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
44.490	245255.474
44.997	280291.971
46.052	385401.460
46.989	404866.180
47.068	451581.509
47.613	428223.844
48.040	346472.019
48.042	416545.012
48.043	482725.061
48.044	506082.725
48.472	467153.285
49.015	377615.572
49.016	400973.236
49.016	424330.900
49.019	513868.613
49.019	533333.333
49.019	545012.165
49.023	685158.151
49.056	451581.509
49.099	595620.438
49.099	611192.214
49.099	626763.990
50.035	642335.766
50.037	696836.983
50.037	712408.759
50.110	498296.837
50.111	529440.389
51.012	704622.871
51.048	607299.270
51.049	657907.543
51.050	685158.151
51.052	782481.752
51.053	798053.528
51.091	759124.088
51.988	770802.920
51.988	794160.584
53.087	1090024.331
53.124	984914.842
54.023	1105596.107
54.026	1210705.596
54.098	977128.954
55.115	1097810.219
55.124	1494890.511];
units.LN   = {'cm', '#'};  label.LN = {'fork length', 'fecundity'};  
temp.LN    = C2K(28);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'NoegBoer2018';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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

%% Discussion
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '4VTWY'; % Cat of Life
metaData.links.id_ITIS = '172441'; % ITIS
metaData.links.id_EoL = '46577312'; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_commerson'; % Wikipedia
metaData.links.id_ADW = 'Scomberomorus_commerson'; % ADW
metaData.links.id_Taxo = '187066'; % Taxonomicon
metaData.links.id_WoRMS = '127024'; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-commerson'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_commerson}}';
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
bibkey = 'McIlClae2005'; type = 'Article'; bib = [ ... 
'author = {J. L. McIlwain and M. R. Claereboudt and H. S. Al-Oufi and S. Zaki and J. S. Goddard}, ' ... 
'year = {2005}, ' ...
'title = {Spatial variation in age and growth of the kingfish (\emph{Scomberomorus commerson}) in the coastal waters of the {S}ultanate of {O}man}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {73}, ' ...
'pages = {283-298}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NoegBoer2018'; type = 'Article'; bib = [ ... 
'doi = {10.1088/1755-1315/176/1/}, ' ...
'author = {T. Noegroho and  M. Boer and L. Adrianto and Sulistiono}, ' ... 
'year = {2018}, ' ...
'title = {Biological characteristics of {I}ndo-{P}acific King Mackerel (\emph{Scomberomorus guttatus}, {B}loch and {S}chneider 1801) in {M}oro Waters part of {K}epulauan {R}iau, {I}ndonesia}, ' ...
'journal = {Earth and Environmental Science}, ' ...
'volume = {176}, ' ...
'pages = {012022}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scomberomorus-commerson.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
