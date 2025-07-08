function [data, auxData, metaData, txtData, weights] = mydata_Amblyraja_georgiana

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Amblyraja_georgiana'; 
metaData.species_en = 'Antarctic starry skate'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MAS','MS'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 26];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data;
data.ab = 9.5*30.5; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'FranMaol2005';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 18;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'FranMaol2005';
  comment.Lb = 'based on PL 10-12 cm, see F2';
data.Lp  = 85;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'fishbase';
  comment.Lp = 'TL 80-90 cm';
data.Li  = 115; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwi = 16.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.13, see F1';

data.Ri  = 36/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kappa = 0.7';

% uni-variate data
data.tL_f = [ ... % time since birth (yr), pelvic length (cm)
1.984	35.607
1.985	38.095
1.986	40.334
1.986	41.578
1.986	43.070
2.011	45.558
2.013	52.523
2.951	46.321
2.974	43.088
2.974	43.834
3.969	71.215
3.969	72.707
3.992	66.489
3.992	67.981
4.037	55.793
4.980	67.750
4.980	68.248
4.981	69.740
5.005	70.984
5.006	73.223
5.966	59.559
5.990	58.315
5.994	74.982
5.994	76.972
6.016	67.271
6.016	68.515
6.041	70.257
6.065	71.501
6.982	75.497
7.001	54.851
7.002	57.338
7.003	61.567
7.003	63.557
7.028	66.543
7.053	70.026
7.078	73.509
8.015	61.834
8.015	63.575
8.015	64.073
8.016	65.068
8.016	68.302
8.017	70.540
8.018	75.267
8.018	76.511
9.004	66.080
9.004	68.319
9.005	69.314
9.024	51.404
9.994	76.546
10.017	70.078
11.004	65.370
11.005	72.335
11.006	73.579
11.026	59.151
12.015	61.159
13.005	69.137
14.016	67.413
14.018	75.125
1.968	68.940
3.961	36.389
3.961	38.130
4.972	32.178
5.986	41.649
6.999	45.149];
data.tL_f(:,1) = (0.8+data.tL_f(:,1)) * 365; % convert yr to d
data.tL_f(:,2) = data.tL_f(:,2)/ 0.6; % convert PL to TL
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
  temp.tL_f = C2K(4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranMaol2005';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), pelvic length (cm)
0.960	34.625
0.960	32.870
0.985	30.864
1.943	50.944
1.947	36.900
1.969	42.167
1.970	40.913
1.992	47.183
2.017	43.672
2.955	50.460
2.956	47.451
2.957	44.442
2.957	43.188
3.032	35.916
3.945	43.205
3.961	70.541
3.966	54.491
4.015	49.476
4.034	66.530
4.980	47.487
4.996	74.321
5.966	52.270
5.984	72.584
5.985	70.577
5.987	65.060
5.987	63.305
6.007	76.346
6.952	59.059
6.952	58.557
6.973	69.843
6.973	68.589
6.980	47.021
6.996	73.856
7.019	77.618
7.027	50.533
7.981	82.651
7.983	76.883
7.984	74.375
7.989	57.322
8.059	64.094
8.978	53.828
8.998	65.616
9.000	61.603
9.000	59.848
9.002	54.581
9.984	73.157
10.038	53.597
11.018	79.946
11.981	83.725
12.033	72.441
3.997	31.169
5.994	39.230
5.996	32.458];
data.tL_m(:,1) = (data.tL_m(:,1)+0.8) * 365; % convert yr to d
data.tL_m(:,2) = data.tL_m(:,2)/ 0.6; % convert PL to TL
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
  temp.tL_m = C2K(4); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranMaol2005';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f; weights.tL_f(end-5:end) = 0; % ignore outliers
weights.tL_m = 3 * weights.tL_m; weights.tL_m(end-2:end) = 0; % ignore outliers
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;
weights.Lb = 5 * weights.Lb;
weights.Ri = 0 * weights.Ri;

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
D1 = 'males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
D3 = 'points in tL data that are identified as outliers bt the authors are ignorned in the fit';
D4 = 'mod_1: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: pelvic length PL = 0.6 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5TZNG'; % Cat of Life
metaData.links.id_ITIS = '564206'; % ITIS
metaData.links.id_EoL = '46560461'; % Ency of Life
metaData.links.id_Wiki = 'Amblyraja_georgiana'; % Wikipedia
metaData.links.id_ADW = 'Amblyraja_georgiana'; % ADW
metaData.links.id_Taxo = '160615'; % Taxonomicon
metaData.links.id_WoRMS = '234607'; % WoRMS
metaData.links.id_fishbase = 'Amblyraja-georgiana'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amblyraja_georgiana}}'; 
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
bibkey = 'FranMaol2005'; type = 'Article'; bib = [ ... 
'author = {M.P. Francis and C. \''{O} Maolag\''{a}in}, ' ...
'year = {2005}, ' ...
'title  = {AGE AND GROWTH OF THE ANTARCTIC SKATE (\emph{Amblyraja georgiana}) IN THE {R}OSS {S}EA}, ' ...
'journal = {CCAMLR Science}, ' ...
'volume = {12}, ' ...
'pages = {183-194}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Amblyraja-georgiana.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

