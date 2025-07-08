function [data, auxData, metaData, txtData, weights] = mydata_Urobatis_halleri
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urotrygonidae';
metaData.species    = 'Urobatis_halleri'; 
metaData.species_en = 'Haller''s round ray'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 06 08];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 08];

%% set data
% zero-variate data;
data.ab = 3*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'Babe1967';    
  temp.ab = C2K(23.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 14*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'HaleLowe2008';   
  temp.am = C2K(23.6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 7;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'Babe1967';
data.Lp = 15.0;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'HaleLowe2008';
data.Lpm = 16.7;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'HaleLowe2008'; 
data.Li  = 25;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'HaleLowe2008'; 
data.Lim  = 26;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'HaleLowe2008'; 

data.Wwi  = 2.6e3;  units.Wwi  = 'g';  label.Wwi  = 'wet weight at disc width';   bibkey.Wwi  = 'fishbase'; 
  comment.Wwi = 'based on 0.02291*(1.7567*25)^3.08, see F1,F2';
data.Wwim  = 3e3;  units.Wwim  = 'g';  label.Wwim  = 'wet weight at disc width';   bibkey.Wwim  = 'fishbase'; 
  comment.Wwim = 'based on 0.02291*(1.7567*26)^3.08, see F1,F2';

data.Ri  = 2.5/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-3 pups per litter, 1 litter per yr';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.000	9.895
0.000	8.799
0.018	11.617
0.018	7.742
0.036	9.543
0.219	8.566
0.492	12.246
0.510	10.211
0.547	10.015
0.565	10.798
0.747	10.447
0.802	11.543
1.021	9.470
1.039	11.114
1.094	11.662
1.513	14.874
2.005	13.350
2.005	12.176
2.005	10.141
2.023	11.550
2.497	15.232
2.497	15.036
2.497	12.805
2.497	12.492
2.516	14.449
2.534	15.467
2.534	14.097
3.518	13.907
3.518	18.878
3.536	15.551
4.029	15.201
4.047	15.710
4.503	17.591
4.503	15.478
4.521	16.613
4.521	14.460
4.521	14.186
4.539	19.470
4.539	16.261
5.013	14.972
5.013	17.751
5.031	14.033
5.031	15.207
5.068	18.064
5.487	17.832
5.487	17.440
5.505	15.444
5.505	14.701
5.505	13.487
5.560	18.302
6.016	15.682
6.016	16.582
6.052	18.500
6.508	18.699
6.508	15.920
6.581	18.112
7.036	16.823
7.073	17.528
7.492	19.448
7.492	17.178
8.021	15.967
8.021	17.220
8.513	17.653
8.531	20.510
8.531	13.857
9.042	19.613
9.479	16.993
9.552	19.890
9.990	19.344
10.500	18.603
11.047	25.378
11.047	18.763
11.521	20.175
11.576	22.054
12.031	24.483
12.505	19.632
14.036	21.441];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(23.6); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'HaleLowe2008';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.000	8.329
0.000	7.429
0.000	8.055
0.018	9.504
0.055	6.099
0.073	8.604
0.091	10.170
0.510	11.189
0.529	11.933
0.547	11.581
1.021	12.132
1.549	11.665
1.549	11.117
2.042	12.607
2.534	18.050
2.552	11.671
3.008	15.704
3.008	14.061
3.026	12.534
3.482	16.607
3.536	15.042
3.536	19.700
3.555	12.694
3.555	17.430
3.609	13.633
4.047	12.657
4.047	10.583
4.065	14.888
4.521	18.257
4.685	19.197
5.068	17.516
5.469	19.593
5.487	14.427
5.542	18.184
5.742	16.307
5.997	17.052
6.016	13.412
6.508	16.585
6.526	20.186
6.526	18.581
6.982	20.071
7.000	21.050
7.109	17.058
7.255	19.603
7.529	16.473
8.003	19.177
8.003	20.272
8.021	17.963
8.477	18.553
8.513	20.471
8.531	23.211
8.531	21.019
8.531	18.123
8.987	17.147
9.005	18.282
9.023	19.456
9.023	20.513
9.042	22.040
9.479	21.103
9.479	20.750
9.497	20.437
9.534	22.003
9.534	21.768
10.008	24.432
10.500	18.486
10.518	21.617
10.992	21.072
11.029	25.143
11.029	23.538
11.503	21.662
11.521	21.427
11.521	21.153
11.539	22.132
12.286	25.463
14.018	24.103];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(23.6); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'HaleLowe2008';  
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02291*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: TL =  1.7567 * DW';
metaData.bibkey.F2 = 'Babe1967'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7DW7Z'; % Cat of Life
metaData.links.id_ITIS = '564424'; % ITIS
metaData.links.id_EoL = '61158769'; % Ency of Life
metaData.links.id_Wiki = 'Urobatis_halleri'; % Wikipedia
metaData.links.id_ADW = 'Urobatis_halleri'; % ADW
metaData.links.id_Taxo = '189775'; % Taxonomicon
metaData.links.id_WoRMS = '283085'; % WoRMS
metaData.links.id_fishbase = 'Urobatis-halleri'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urobatis_halleri}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Urobatis-halleri}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaleLowe2008'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2008.01940.x}, ' ...
'author = {L. F. Hale and C. G. Lowe}, ' ...
'title = {Age and growth of the round stingray \emph{Urobatis halleri} at {S}eal {B}each, {C}alifornia}, ' ...
'year = {2008}, ' ...
'journal = {J. Fish Biol.}, '...
'volume = {73(3)}, ' ...
'pages = {510–523}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Babe1967'; type = 'article'; bib = [ ...  
'author = {Babel, J. S.}, ' ...
'title = {Reproduction, life history, and ecology of the round stingray, \emph{Urolophus halleri} {C}ooper}, ' ...
'year = {1967}, ' ...
'journal = {California Department of Fish and Game Fish Bulletin}, '...
'volume = {137}, ' ...
'pages = {2–104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
