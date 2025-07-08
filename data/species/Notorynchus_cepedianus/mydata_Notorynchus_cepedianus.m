function [data, auxData, metaData, txtData, weights] = mydata_Notorynchus_cepedianus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Hexanchiformes'; 
metaData.family     = 'Hexanchidae';
metaData.species    = 'Notorynchus_cepedianus'; 
metaData.species_en = 'Broadnose sevengill shark'; 

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MAS','MP','MI'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 25];


%% set data
% zero-variate data

data.ab = 12*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'fishbase';   
  temp.ab = C2K(14.2); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 49*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(14.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 46;     units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '40-53 cm';
data.Lp  = 150;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'ADW'; 
data.Lpm = 192;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ADW'; 
data.Li  = 300;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Ri  = 85/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(14.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '82-95 pups per litter, 1 litter each 2 yrs';

% uni-variate data
 
% time - length
data.tL = [ ... % time since birth (yr), total length (cm)
0.477	65.467
0.518	72.109
1.416	89.587
1.464	109.994
1.494	97.175
1.526	86.254
1.543	120.430
1.720	103.324
1.840	121.351
1.863	93.342
1.880	127.518
1.918	129.888
1.994	133.678
2.019	108.517
2.060	116.583
2.129	105.184
2.330	136.969
2.397	122.722
2.441	136.484
2.500	107.048
2.550	131.726
2.666	141.209
2.777	141.199
2.849	136.445
2.893	152.105
2.986	114.596
2.993	127.412
3.106	132.623
3.115	149.711
3.339	153.487
3.370	141.142
3.844	125.433
3.855	146.318
3.859	155.811
4.345	163.360
4.443	135.344
4.492	159.548
4.849	132.457
4.938	162.354
5.374	143.325
5.386	168.008
5.388	171.805
5.799	177.937
5.831	167.966
5.893	144.225
5.980	170.325
6.082	149.904
6.098	182.655
6.205	174.576
6.469	183.570
6.471	186.892
6.489	148.916];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(14.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'DijkhMoll1992';

data.LWw = [ ... % log total length (log  cm), log wet weight (log kg)
4.174	0.003
4.289	0.326
4.459	1.023
4.514	1.185
4.547	1.175
4.585	1.542
4.632	1.539
4.646	1.562
4.657	1.813
4.675	1.725
4.705	1.896
4.739	1.721
4.742	1.815
4.762	1.979
4.790	1.985
4.798	2.173
4.807	2.070
4.841	2.218
4.843	2.115
4.847	2.076
4.860	2.248
4.873	2.349
4.892	2.482
4.903	2.371
4.918	2.213
4.925	2.488
4.932	2.424
4.955	2.431
4.957	2.682
4.978	2.382
4.980	2.633
4.993	2.711
5.007	2.687
5.015	2.600
5.027	2.874
5.047	2.747
5.055	2.951
5.081	2.965
5.092	3.185
5.094	3.074
5.101	3.066
5.126	3.324
5.135	3.276
5.148	3.330
5.167	3.479
5.181	3.352
5.212	3.421
5.217	3.531
5.247	3.403];
data.LWw = exp(data.LWw); % remove log transform
data.LWw(:,2) = 1e3 * data.LWw(:,2); % convert kg to g
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw  = 'DijkhMoll1992';

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
D1 = 'males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'Ovoviviparous and histotrophic, therefore the stf model was applied';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);


%% Links
metaData.links.id_CoL = '47YCK'; % Cat of Life
metaData.links.id_ITIS = '159829'; % ITIS
metaData.links.id_EoL = '46560151'; % Ency of Life
metaData.links.id_Wiki = 'Notorynchus_cepedianus'; % Wikipedia
metaData.links.id_ADW = 'Notorynchus_cepedianus'; % ADW
metaData.links.id_Taxo = '41780'; % Taxonomicon
metaData.links.id_WoRMS = '217628'; % WoRMS
metaData.links.id_fishbase = 'Notorynchus-cepedianus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Notorynchus_cepedianus}}';
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
bibkey = 'DijkhMoll1992'; type = 'Article'; bib = [ ... 
'author = {Gilbert Van Dijkhuizen and Henry F. Mollet}, ' ... 
'year = {1992}, ' ...
'title = {Growth, age estimation and feeding of captive Sevengill Sharks, \emph{Notorynchus cepedianus}, at the {M}onterey {B}ay {A}quarium}, ' ...
'journal = {Aust. J. Mar. Freshwater Res.}, ' ...
'volume = {43}, ' ...
'pages = {297-318}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Notorynchus-cepedianus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Notorynchus_cepedianus/l}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

