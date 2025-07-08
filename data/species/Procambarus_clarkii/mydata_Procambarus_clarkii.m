function [data, auxData, metaData, txtData, weights] = mydata_Procambarus_clarkii

%% set metaData 
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Cambaridae';
metaData.species    = 'Procambarus_clarkii'; 
metaData.species_en = 'Red swamp crayfish'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Aw', 'Cs', 'Cw'}; % Af, Am, Aw - tolerated; Cs, Cw - preferred (source https://www.cabi.org/isc/datasheet/110477)
metaData.ecoCode.ecozone = {'THp', 'TPam'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'}; % Marbled crayfish eat almost everything, but seem to prefer plant material and snails
metaData.ecoCode.gender  = {'D'}; 
metaData.ecoCode.reprod  = {'Apo'}; 

metaData.T_typical  = C2K(20); 
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'T-ab'};

metaData.COMPLETE = 3.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 03 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 19];

%% set data
% zero-variate data
data.tp = 3*30.5;    units.tp = 'd';    label.tp = 'time since birth at puberty at 20 C';   bibkey.tp = 'ADW';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6*365;    units.am = 'd';    label.am = 'life span';        bibkey.am = 'Wiki';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 11.1;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'WangYang2001';
    comment.Li = 'based in LW data'; 

data.Wwb = 5.6e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'JinaJacq2019';
  comment.Wwb = 'based on egg diameter of 2.2 mm: pi/6*0.22^3';
data.Wwp = 6.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'guess';
   comment.Wwp = 'based on (Lp/Lp)^3*Wwi';
data.Wwi = 72;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'WangYang2001';
    comment.Wwi = 'based in LW data'; 

data.Ri = 2*600/365; units.Ri = '#/d';    label.Ri = 'max reprod rate';        bibkey.Ri = 'JinaJacq2019';
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '600 eggs per clutch, 1 clutch per yr in Germany, 2 clutches in Portugal, more in USA';  

% uni-variate data
% time - length
data.tL = [ ... time since birth (d),carapace length (cm)
29.315	1.528
30.429	1.147
30.429	0.986
60.857	2.193
60.857	2.093
60.857	2.012
61.228	2.374
61.228	1.872
91.286	2.999
91.286	2.898
91.286	2.637
91.657	3.139
92.028	3.300
121.714	3.624
121.714	3.383
122.085	3.804
152.514	4.208
182.571	4.552];
data.tL(:,2) = data.tL(:,2)/ 0.555; % convert carapace length to total length
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FidaCarv2001'; comment.tL = 'Data from Frossos lagoon, Portugal; carapace length was converted to total length using F2';

% length - weight
data.LW = [ ... total length (cm), weight (g)
1.748	0.000
2.058	0.821
2.233	0.821
2.311	0.821
2.525	0.821
2.971	1.368
3.185	0.821
3.282	1.641
3.418	1.915
3.496	1.915
3.593	1.915
3.670	2.188
3.787	2.462
3.884	2.736
4.039	2.736
4.214	3.556
4.253	3.009
4.331	3.556
4.409	4.103
4.486	4.103
4.525	3.009
4.583	3.283
4.681	4.377
4.816	3.009
4.836	4.377
4.991	4.650
5.011	3.556
5.127	4.924
5.166	4.103
5.166	5.471
5.224	5.198
5.360	3.830
5.360	5.471
5.438	6.565
5.613	6.292
5.652	6.565
5.730	8.207
5.828	11.763
5.885	7.112
5.886	9.848
5.924	7.112
6.022	10.122
6.041	8.480
6.061	12.857
6.099	8.480
6.139	11.763
6.158	13.951
6.235	9.574
6.274	7.933
6.295	14.772
6.390	8.207
6.391	10.122
6.391	13.404
6.507	10.669
6.547	13.131
6.586	14.498
6.604	9.301
6.682	12.584
6.702	14.772
6.721	11.763
6.779	12.310
6.838	14.225
6.915	11.489
6.993	12.310
6.993	13.404
7.013	16.413
7.091	18.602
7.111	16.960
7.168	14.498
7.208	17.781
7.246	12.857
7.286	20.790
7.323	12.857
7.324	14.772
7.324	16.140
7.441	18.328
7.479	14.498
7.480	21.337
7.557	18.055
7.558	19.970
7.615	16.140
7.693	18.055
7.695	23.799
7.714	25.167
7.792	25.714
7.850	22.705
7.887	18.055
7.946	18.328
7.947	21.884
7.948	27.903
8.024	19.149
8.025	24.073
8.043	20.517
8.044	23.526
8.064	27.356
8.123	29.271
8.182	34.468
8.201	30.365
8.238	23.799
8.260	35.836
8.277	25.441
8.279	33.921
8.297	26.261
8.297	28.176
8.394	26.535
8.397	39.666
8.413	21.884
8.413	23.799
8.413	24.620
8.414	28.176
8.415	31.459
8.415	33.374
8.453	29.544
8.493	35.015
8.549	26.261
8.570	32.280
8.589	29.271
8.648	35.015
8.650	40.213
8.650	41.581
8.668	33.647
8.668	37.477
8.670	44.590
8.704	24.894
8.725	27.903
8.725	29.544
8.764	31.459
8.802	26.261
8.804	37.751
8.805	41.033
8.805	42.401
8.881	31.185
8.884	46.231
8.899	27.082
8.901	35.015
8.905	54.985
8.942	44.316
8.959	33.647
8.999	40.213
9.016	30.365
9.019	42.675
9.036	32.006
9.037	37.477
9.074	29.271
9.076	35.289
9.097	45.957
9.116	44.316
9.156	48.419
9.194	42.401
9.230	29.544
9.251	36.930
9.252	44.590
9.255	54.985
9.270	34.742
9.270	35.562
9.271	39.119
9.292	47.599
9.292	49.787
9.349	40.213
9.425	33.647
9.427	42.128
9.445	35.836
9.445	37.477
9.447	47.052
9.523	38.298
9.563	45.684
9.641	44.043
9.643	55.532
9.644	59.909
9.659	40.213
9.717	39.939
9.720	53.891
9.721	55.532
9.815	42.948
9.818	54.164
9.834	40.213
9.911	35.289
9.911	35.836
9.937	70.030
9.971	46.778
10.048	42.401
10.054	67.842
10.067	38.024
10.109	56.626
10.110	57.720
10.127	48.419
10.130	60.456
10.164	40.486
10.246	60.456
10.363	60.456
10.444	76.049
10.620	83.435
10.750	54.985
10.829	62.097
11.180	66.748];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'weight'};  
bibkey.LW = 'WangYang2001'; 
comment.LW = 'length: postorbital margin to the tip of the telson';

% temperature- age at hatch
data.Tab = [ ... temperature (C), age at hatch (d)
17	70.960
17	85.101
17	86.111
17	78.157
17	86.995
17	90.025
17	74.369
17	77.020
17	91.035
21	28.409
21	22.980
21	27.020
21	30.050
21	30.934
21	31.944
21	35.101
21	35.985
25	21.970
25	16.919
25	20.960
25	19.066
25	19.949
25	26.010];
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'JinaJacq2019'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Model  std is applied, instead of abj, since freshwater crayfish, unlike marine decapods, have no larval stage';
metaData.discussion = struct('D1',D1);  

%% Facts 
F1 = 'Reproduces sexually, but research suggests it may also reproduce by parthenogenesis';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'From photo: Carapace length = 0.555 * total length';
metaData.bibkey.F2 = 'https://commons.wikimedia.org/wiki/File:Rode_amerikaanse_rivierkreeft,_Red_Swamp_Crayfish,_Procambarus_clarkii_04.jpg'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7WLRT'; % Cat of Life
metaData.links.id_ITIS = '97491'; % ITIS
metaData.links.id_EoL = '344571'; % Ency of Life
metaData.links.id_Wiki = 'Procambarus_clarkii'; % Wikipedia
metaData.links.id_ADW = 'Procambarus_clarkii'; % ADW
metaData.links.id_Taxo = '33804'; % Taxonomicon
metaData.links.id_WoRMS = '465540'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Procambarus_clarkii}}';
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
bibkey = 'FidaCarv2001'; type = 'Article'; bib = [ ...
'author = {Maria Leonor Fidalgo and Ato\''{o}nio Paulo Carvalho and Paulo Santos}, ' ...
'year = {2001}, ' ...
'title = {POPULATION DYNAMICS OF THE RED SWAMP CRAYFISH, \emph{Procambarus clarkii} ({G}IRARD, 1852) FROM THE {A}VEIRO REGION, {P}ORTUGAL ({D}ECAPODA, {C}AMBARIDAE)}, ' ...
'journal = {Crustaceana}, ' ...
'volume = {74(4)}, ' ...
'pages = {369-375}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WangYang2001'; type = 'Article'; bib = [ ...
'doi = {10.1080/02705060.2011.56438}, ' ...
'author = {Q. Wang and J.X. Yang and G.Q. Zhou and Y.A. Zhu and H. Shan}, ' ...
'year = {2001}, ' ...
'title = {Length–weight and chelae length–width relationships of the crayfish \emph{Procambarus clarkii} under culture conditions}, ' ...
'journal = {Journal of Freshwater Ecology}, ' ...
'volume = {26(2)}, ' ...
'pages = {287-294}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JinaJacq2019'; type = 'Article'; bib = [ ...
'doi = {10.1016/j.aquaculture.2019.04.066}, ' ...
'author = {Shiyu Jina and Lisa Jacquinc and Feng Huang and Mantang Xiong and Ruojing Li and Sovan Lek and Wei Li and Jiashou Liu and Tanglin Zhang}, ' ...
'year = {2019}, ' ...
'title = {Optimizing reproductive performance and embryonic development of red swamp crayfish \emph{Procambarus clarkii} by manipulating water temperature}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {215}, ' ...
'pages = {32-42}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Procambarus_clarkii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
