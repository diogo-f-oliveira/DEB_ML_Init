function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_sorrah
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_sorrah'; 
metaData.species_en = 'Spot-tail shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE','MPW'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 31];

%% set data
% zero-variate data

data.ab = 10*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'fishbase';   
  temp.ab = C2K(27.8); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 8*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'DaveStev1988';   
  temp.am = C2K(27.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 50;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
data.Lp  = 130;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 160;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 30.5e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00331*Li^3.16, see F1; fishbase gives 28 kg';

data.Ri  = 3/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-8 pups per litter, 1 litter each yr';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.154	48.979
0.154	50.939
0.154	55.141
0.154	56.822
0.154	58.222
0.154	59.343
0.249	73.638
0.249	59.913
0.249	58.512
0.249	57.672
0.249	54.031
0.522	65.264
0.593	77.036
0.593	79.557
0.593	80.957
0.736	87.415
0.736	86.575
0.736	75.090
0.736	72.009
0.748	78.453
0.748	77.052
0.760	70.891
0.831	88.826
1.056	78.205
1.056	79.606
1.080	81.849
1.080	83.810
1.080	93.894
1.151	75.134
1.151	77.094
1.519	69.850
1.567	71.256
1.579	77.980
1.579	83.022
1.579	85.263
1.579	89.464
1.745	89.762
1.745	87.801
1.745	86.401
1.745	79.678
1.769	80.521
1.816	92.570
1.828	90.611
1.840	87.531
2.053	92.315
2.053	93.436
2.053	95.957
2.564	107.215
2.564	108.615
2.564	110.296
2.588	103.016
2.588	87.890
2.588	85.929
2.599	94.053
2.599	88.731
2.611	101.057
2.611	98.816
2.611	97.976
2.718	90.704
2.730	96.028
2.730	98.549
2.730	101.630
2.730	102.750
2.742	97.150
2.801	87.632
2.801	90.993
2.837	102.201
3.062	92.141
3.074	105.028
3.252	115.691
3.573	113.483
3.585	100.879
3.585	102.000
3.585	103.961
3.585	106.202
3.585	107.602
3.596	112.365
3.763	103.699
3.763	102.019
3.786	105.663
3.798	108.185
3.822	113.229
3.834	102.586
3.858	96.987
4.059	104.011
4.154	119.987
4.582	108.267
4.582	113.589
4.724	116.125
4.819	105.211
4.831	115.016
4.831	116.977
5.092	120.085
5.104	115.045
5.151	124.013
5.175	120.654
5.246	117.581
5.377	122.636
5.567	105.850
5.567	108.090
5.567	110.331
5.567	113.133
5.840	111.481
5.840	117.643
5.840	119.884
6.053	121.027
6.053	118.786
6.053	117.385
6.148	124.118
6.148	120.477
6.813	125.028
7.228	118.069
7.240	116.670
7.252	126.195];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'DaveStev1988';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.132	48.370
0.147	60.627
0.148	58.399
0.149	57.007
0.151	54.221
0.393	64.831
0.420	60.377
0.422	58.149
0.543	71.254
0.544	69.304
0.557	85.183
0.570	83.513
0.571	81.006
0.576	74.321
0.582	66.244
0.626	70.705
0.710	69.043
0.731	73.223
0.741	75.731
0.763	95.511
1.078	86.351
1.093	81.339
1.095	95.824
1.099	90.532
1.099	89.696
1.262	95.284
1.588	86.683
1.589	85.291
1.590	83.898
1.595	93.369
1.596	91.698
1.599	88.077
1.723	80.569
1.726	76.670
1.759	97.007
1.826	85.872
1.840	100.359
1.846	90.888
1.848	88.939
1.849	87.546
1.855	95.903
2.068	95.926
2.082	93.699
2.083	92.027
2.173	99.001
2.174	97.329
2.232	99.564
2.233	97.336
2.235	95.664
2.247	94.552
2.557	93.470
2.558	91.798
2.559	90.406
2.561	87.621
2.562	85.949
2.567	95.142
2.811	86.811
2.828	96.005
2.841	94.614
2.842	93.221
3.174	92.699
3.227	102.453
3.757	107.801
3.855	103.912
3.856	101.683
4.201	117.318
5.602	99.916];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'DaveStev1988';
comment.tL_m = 'Data for males';

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00331 * (TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3QL'; % Cat of Life
metaData.links.id_ITIS = '160317'; % ITIS
metaData.links.id_EoL = '46559794'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_sorrah'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_sorrah'; % ADW
metaData.links.id_Taxo = '41986'; % Taxonomicon
metaData.links.id_WoRMS = '217339'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-sorrah'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_sorrah}}';
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
bibkey = 'DaveStev1988'; type = 'Article'; bib = [ ... 
'author = {Stephanie Davenport and John D. Stevens}, ' ... 
'year = {1988}, ' ...
'title = {Age and Growth of Two Commercially Important Sharks (\emph{Carcharhinus tilstoni} and \emph{C. sorrah}) from {N}orthern {A}ustralia}, ' ...
'journal = {Aust. J. Mar. Freshwater Res.}, ' ...
'volume = {39}, ' ...
'pages = {417-433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-sorrah.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

