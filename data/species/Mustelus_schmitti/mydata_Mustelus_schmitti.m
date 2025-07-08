function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_schmitti
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_schmitti'; 
metaData.species_en = 'Narrownose smooth-hound '; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.9); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'WWi'; 'Ri'};  
metaData.data_1     = {'t-L_f'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 02];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 02];

%% set data
% zero-variate data;
data.ab = 365*11.5/12; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(7.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Mustelus_antarcticus';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MoliBlas2017';   
  temp.am = C2K(7.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 32;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'guess';
 comment.Lb = 'based on Mustelus_antarcticus'; 
data.Lp = 58.3;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty for females';bibkey.Lp  = 'fishbase';
data.Li  = 92;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwp = 765;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00257*Lp^3.10, see F1';
data.Wwi = 3.1e3;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00257*Li^3.10, see F1';

data.Ri  = 5/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'GracPola2021';   
  temp.Ri = C2K(7.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-7 pups per litter, 1 litter per 2 yr assumed';  
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.455	39.316
0.539	33.538
0.943	39.976
0.943	35.189
0.960	45.755
0.960	44.434
0.960	40.967
0.960	36.509
0.977	43.443
0.994	42.453
0.994	37.995
1.482	33.868
1.482	35.684
1.499	37.995
1.499	46.580
1.516	36.179
1.954	47.075
1.954	44.764
1.954	43.939
1.971	50.377
1.971	41.462
1.988	47.571
2.005	39.316
2.038	36.509
2.426	43.443
2.459	51.038
2.459	54.670
2.476	39.646
2.476	53.679
2.493	38.160
2.493	52.689
2.527	45.425
2.931	53.019
2.965	54.670
2.982	44.599
2.982	41.462
2.998	43.113
3.436	45.259
3.487	40.307
3.487	58.632
3.521	47.075
3.959	47.241
3.959	43.939
3.975	58.632
3.975	55.495
3.975	48.892
4.464	58.467
4.498	49.882
4.953	65.566
4.953	51.368
4.969	64.245
5.054	47.406
5.424	55.495
5.492	50.047
5.492	58.797
5.492	59.623
5.946	53.679
5.980	63.255
5.997	60.613
5.997	56.651
6.418	55.991
6.469	58.962
6.519	67.712
6.957	56.486
7.008	63.255
7.025	59.292
7.041	66.722
7.496	58.962
7.934	64.741
7.985	69.693
8.035	54.835
8.945	60.118
8.962	57.807
8.995	70.519
9.012	64.410
9.029	61.439
9.484	61.108
9.972	70.684
9.989	65.401
9.989	66.226
10.023	69.198
10.461	76.297
10.495	66.557
10.511	69.363
11.000	81.580
11.573	76.462];
data.tL_f(:,1) = (0+data.tL_f(:,1))*365; % % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MoliBlas2017';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.455	38.118
0.489	36.471
0.522	40.588
0.606	34.824
0.926	36.471
0.943	41.412
0.943	40.094
0.977	37.953
0.994	35.976
1.011	43.718
1.432	34.824
1.449	36.141
1.449	41.082
1.466	32.682
1.482	37.953
1.482	39.765
1.482	42.235
1.499	34.000
1.499	52.447
1.937	52.941
1.954	46.682
1.971	53.600
1.971	50.306
1.971	44.047
1.988	54.424
2.005	48.659
2.038	40.424
2.459	38.282
2.476	41.247
2.476	50.471
2.510	53.435
2.527	51.624
2.982	50.800
2.998	53.435
2.998	48.329
2.998	45.200
3.015	44.541
3.015	43.882
3.453	44.376
3.453	59.035
3.470	42.729
3.487	45.694
3.504	46.518
3.504	47.506
3.504	52.118
3.942	59.694
3.959	47.506
3.975	58.047
3.975	55.906
4.447	50.635
4.447	52.941
4.464	55.247
4.498	59.694
4.498	60.682
4.515	58.376
4.969	62.165
4.986	50.471
5.458	58.541
5.475	53.600
5.475	56.565
5.475	59.200
5.492	52.447
5.492	55.247
5.525	60.847
5.963	61.671
6.469	52.776
6.469	67.765
6.519	53.929
6.519	55.576
6.519	57.882
7.462	57.388
7.479	66.282
7.496	54.753
7.513	62.494
7.985	63.812
8.456	57.388
8.507	62.824
9.484	62.165
9.501	71.388
11.505	79.294];
data.tL_m(:,1) = (0+data.tL_m(:,1))*365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MoliBlas2017';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
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
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00257*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44R36'; % Cat of Life
metaData.links.id_ITIS = '160265'; % ITIS
metaData.links.id_EoL = '46560002'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_schmitti'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_schmitti'; % ADW
metaData.links.id_Taxo = '106433'; % Taxonomicon
metaData.links.id_WoRMS = '271393'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-schmitti'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...271393
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_schmitti}}';  
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
bibkey = 'MoliBlas2017'; type = 'article'; bib = [ ... 
'author = {Molina, J.M. and G.E. Blasina and A.C. Lopez Cazorla}, ' ...
'year = {2017}, ' ...
'title  = {Age and growth of the highly exploited narrownose smooth-hound (\emph{Mustelus schmitti}) ({P}isces: {E}lasmobranchii)}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {115}, ' ...
'pages = {365-379}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-schmitti.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

