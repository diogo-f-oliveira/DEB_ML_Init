function [data, auxData, metaData, txtData, weights] = mydata_Raja_undulata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Raja_undulata'; 
metaData.species_en = 'Undulate ray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MAW','MAm'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 29];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 29]; 

%% set data
% zero-variate data;
data.ab = 9*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(13.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 13*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'CoelErzi2002';   
  temp.am = C2K(13.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 13; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'CoelErzi2002';
data.Lp  = 86.2; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SerrErzi2015';
data.Li  = 100;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 7.59e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.00302*Li^3.2, see F1';

data.Ri  = 69.8/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'SerrErzi2015';   
  temp.Ri = C2K(13.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '62-124 eggs per yr';
  
% uni-variate data at f
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.682	23.552
1.127	27.945
1.928	32.962
2.284	46.466
2.284	38.927
2.432	39.082
2.729	40.336
3.159	54.624
3.322	48.339
3.352	45.198
3.381	43.941
3.411	41.742
3.841	43.779
4.064	49.273
4.197	52.727
4.494	52.253
4.508	49.583
4.508	47.384
4.568	50.838
4.835	49.579
4.835	50.993
5.057	61.985
5.146	61.513
5.206	62.926
5.280	62.296
5.561	54.440
5.576	53.183
5.828	52.238
5.873	58.834
5.947	52.394
6.081	65.429
6.244	62.129
6.258	57.731
6.273	61.657
6.288	68.568
6.436	70.765
6.689	63.066
6.792	73.903
6.792	70.604
6.792	68.248
6.822	64.164
6.867	63.221
6.867	57.567
7.000	75.471
7.030	73.115
7.074	68.873
7.311	66.357
7.475	71.068
7.475	66.356
7.475	67.455
7.489	65.256
7.608	76.249
7.697	66.353
7.860	62.739
7.905	69.178
7.905	73.576
7.905	66.194
8.602	70.584
8.602	79.223
8.898	74.978
9.032	80.631
9.047	79.060
9.936	74.338
9.966	77.637
10.144	79.676
10.189	74.336
10.841	79.040
11.034	83.750
12.206	83.109
12.235	83.737];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(13.2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CoelErzi2002';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.653	23.238
0.771	22.609
1.157	30.615
1.720	29.038
2.076	42.385
2.343	43.324
2.373	42.381
2.551	41.908
3.144	40.488
3.411	40.171
3.515	47.081
3.574	41.583
3.708	54.461
3.708	48.021
3.722	52.105
3.782	53.046
3.782	48.020
3.826	47.077
4.019	55.714
4.405	53.353
4.494	61.991
4.538	57.593
4.568	50.524
4.627	51.623
4.790	50.051
5.028	59.315
5.057	55.545
5.309	67.008
5.472	57.896
5.532	61.037
5.828	55.851
6.095	68.570
6.110	59.303
6.244	59.773
6.258	62.128
6.288	61.343
6.318	64.484
6.377	66.682
6.377	68.410
6.792	58.824
7.059	74.685
7.148	72.956
7.297	66.358
8.083	77.972
8.112	71.060
8.172	72.631
8.201	77.970
8.246	70.745
8.261	72.158
8.587	72.940
8.928	69.795
9.225	75.289
9.684	81.881
10.025	80.934
10.070	74.808
10.144	83.603
10.218	77.948
10.381	83.129
10.604	82.341
10.752	81.240
10.841	78.255
10.989	77.625
11.123	82.650
11.894	82.013
12.191	84.523
12.235	85.779
13.214	88.281];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(13.2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CoelErzi2002';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 10 * weights.Li;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed; eurybathic, eurythermic';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00302 * (TL in cm)^3.20';
metaData.bibkey.F1 = 'fishbase';
F2 = 'ovoparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '793CL'; % Cat of Life
metaData.links.id_ITIS = '160900'; % ITIS
metaData.links.id_EoL = '46560555'; % Ency of Life
metaData.links.id_Wiki = 'Raja_undulata'; % Wikipedia
metaData.links.id_ADW = 'Raja_undulata'; % ADW
metaData.links.id_Taxo = '42072'; % Taxonomicon
metaData.links.id_WoRMS = '105891'; % WoRMS
metaData.links.id_fishbase = 'Raja-undulata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Raja_undulata}}'; 
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
bibkey = 'CoelErzi2002'; type = 'Article'; bib = [ ...
'doi = {10.1071/MF18010}, ' ...
'author = {Rui Coelho and Karim Erzini}, ' ...
'year = {2002}, ' ...
'title  = {Age and growth of the undulate ray, \emph{Raja undulata}, in the {A}lgarve (southern {P}ortugal)}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volmue = {82}, ' ...
'pages = {987-990}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SerrErzi2015'; type = 'Article'; bib = [ ...
'doi = {10.1111/jfb.12653}, ' ...
'author = {Serra-Pereira, B. and  Erzini, K. and  Figueiredo, I.}, ' ...
'year = {2015}, ' ...
'title  = {Using biological variables and reproductive strategy of the undulate ray \emph{Raja undulata} to evaluate productivity and susceptibility to exploitation}, ' ...
'journal = {J Fish Biol.}, ' ...
'volmue = {86(5)}, ' ...
'pages = {1471-90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Raja-undulata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  