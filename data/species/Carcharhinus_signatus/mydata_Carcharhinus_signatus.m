function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_signatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_signatus'; 
metaData.species_en = 'Night shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAE'};
metaData.ecoCode.habitat = {'0iMpb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.7); % K, body temp
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

data.ab = 10*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'guess';   
  temp.ab = C2K(21.7); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 15*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'SantLess2004';   
  temp.am = C2K(21.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 60;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
data.Lp  = 202;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'SantLess2004'; 
data.Lpm  = 185;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'SantLess2004'; 
data.Li  = 280;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 154e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.08, see F1; fishbase gives 76.7 kg';

data.Ri  = 8/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(21.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-12 pups per litter, 1 litter each yr';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
2.596	142.201
2.596	117.134
2.683	113.087
3.548	159.948
3.577	131.645
3.577	127.602
3.577	125.176
3.606	134.070
3.663	142.153
4.529	167.991
4.558	142.113
4.558	140.496
4.558	137.262
4.644	159.091
4.644	156.665
4.644	152.622
4.644	144.535
4.673	162.324
4.673	148.577
5.567	178.456
5.596	176.029
5.596	172.794
5.596	169.560
5.596	163.900
5.596	162.282
5.596	159.048
5.596	156.622
5.596	155.005
5.596	151.770
5.683	167.939
6.519	152.537
6.548	155.771
6.548	150.110
6.577	180.837
6.577	148.492
6.606	189.730
6.606	179.218
6.606	175.984
6.635	173.556
6.635	171.939
6.635	169.513
6.635	167.087
6.635	165.470
6.635	159.810
7.587	198.581
7.615	176.747
7.615	172.704
7.615	168.661
7.673	188.065
7.673	179.979
8.596	193.684
8.625	187.214
8.625	181.553
8.625	170.232
8.683	196.106
9.548	205.771
9.577	207.386
9.577	201.726
9.606	196.873
9.606	191.213
10.529	208.152
10.673	211.380
11.538	201.638
12.577	220.190
15.490	237.040];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(21.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'SantLess2004';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.553	128.571
2.553	123.720
2.553	121.294
2.582	118.059
2.582	114.016
3.568	147.978
3.568	143.935
3.568	128.571
3.568	126.146
3.597	130.997
3.626	139.084
3.626	136.658
3.626	134.232
4.555	147.170
4.555	143.127
4.555	140.701
4.555	134.232
4.584	152.022
4.584	149.596
4.613	169.003
4.613	167.385
4.613	162.534
4.613	160.108
4.613	155.256
5.512	174.663
5.512	170.620
5.512	167.385
5.512	164.151
5.512	160.916
5.512	157.682
5.512	156.065
5.512	153.639
5.512	151.213
5.570	179.515
5.570	143.935
5.570	142.318
6.527	174.663
6.527	172.237
6.527	167.385
6.527	162.534
6.527	160.108
6.527	156.065
6.556	179.515
6.585	184.367
7.572	197.305
7.572	190.027
7.572	186.792
7.572	184.367
7.572	178.706
7.572	176.280
7.572	174.663
7.572	171.429
7.572	160.108
8.558	194.879
8.558	190.836
8.587	188.410
8.587	186.792
8.587	185.175
8.616	200.539
8.616	180.323
9.573	206.199
9.573	202.156
9.573	199.730
9.573	198.113
9.573	193.261
9.573	191.644
10.560	208.625
10.560	206.199
10.560	202.965
10.618	198.922
11.546	215.094
11.546	209.434];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(21.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'SantLess2004';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00447 * (TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3QK'; % Cat of Life
metaData.links.id_ITIS = '160413'; % ITIS
metaData.links.id_EoL = '46559789'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_signatus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_signatus'; % ADW
metaData.links.id_Taxo = '41985'; % Taxonomicon
metaData.links.id_WoRMS = '105798'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-signatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_signatus}}';
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
bibkey = 'SantLess2004'; type = 'Article'; bib = [ ... 
'author = {Francisco M. Santana and Rosangela Lessa}, ' ... 
'year = {2004}, ' ...
'title = {Age determination and growth of the night shark (\emph{Carcharhinus signatus}) off the northeastern {B}razilian coast}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {102}, ' ...
'pages = {156-167}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-signatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

