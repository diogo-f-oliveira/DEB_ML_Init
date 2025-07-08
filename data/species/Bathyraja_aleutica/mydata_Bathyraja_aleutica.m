function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_aleutica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_aleutica'; 
metaData.species_en = 'Aleutian skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(1.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 27];                          
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
data.ab = 1.9*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(1.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 18*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'HaasEber2016';   
  temp.am = C2K(1.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 28;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'HaasEber2016';
data.Lp = 112;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 161;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase'; 

data.Wwi = 23.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 

data.Ri  = 16/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Eber2005';   
  temp.Ri = C2K(1.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '16 eggs per clutch, assumed 1 clutch per 2 yrs';
  
% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.060	31.175
1.941	60.911
1.994	56.455
2.023	63.649
2.024	68.103
2.976	69.780
3.001	58.815
3.001	61.556
3.002	64.639
3.084	67.035
4.012	88.241
4.936	83.752
4.962	81.353
4.966	99.511
5.016	75.526
5.018	87.860
5.996	80.286
6.000	108.380
6.921	87.445
6.922	92.242
7.033	107.998
7.928	89.120
8.012	103.849
8.036	87.060
8.037	95.283
8.038	98.024
8.091	93.225
8.094	110.698
8.989	92.848
8.989	96.960
8.993	118.887
9.019	109.293
9.019	112.034
9.996	98.292
9.996	100.690
9.996	103.431
9.997	109.255
9.998	114.737
9.999	118.163
10.975	99.968
10.976	105.792
10.979	124.978
11.005	118.125
11.006	121.551
11.956	117.061
11.957	119.459
11.957	122.543
11.981	101.642
11.981	104.383
11.985	126.996
11.986	130.764
11.986	133.505
12.988	107.086
13.015	104.687
13.016	113.594
13.047	135.520
13.097	111.193
13.969	118.355
13.969	122.466
13.971	132.744
14.023	116.640
14.949	127.911
14.977	132.363
14.978	138.530
15.957	136.095
15.957	138.493
16.008	120.333
16.010	131.982
16.990	138.111
17.015	121.322
17.017	132.971
17.043	128.859
18.022	129.849];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(1.5); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'HaasEber2016'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.031	22.611
0.034	42.140
0.060	32.889
0.061	37.342
0.086	28.091
0.140	25.348
0.140	25.348
0.987	47.243
0.987	48.956
1.012	37.649
1.013	40.047
1.013	42.788
1.039	32.166
1.042	51.352
1.042	53.750
1.968	58.854
1.992	43.093
1.993	48.232
1.993	50.631
2.021	54.398
2.023	66.047
2.976	70.122
2.976	72.178
2.976	74.919
3.004	77.659
3.005	81.085
3.955	73.168
3.956	77.965
3.956	80.706
3.982	69.056
3.982	71.454
4.012	86.186
4.067	93.721
4.992	96.084
5.015	70.730
5.045	88.887
5.046	91.971
5.967	72.749
5.967	74.462
5.968	75.833
5.998	95.018
5.998	96.731
5.999	99.472
6.081	102.895
7.003	90.183
7.005	100.804
7.033	104.572
7.089	113.135
8.011	100.080
8.012	107.275
8.013	112.414
8.014	115.841
8.043	130.914
8.939	121.287
8.994	123.683
8.996	135.332
9.021	125.738
9.022	128.479
9.047	116.829
9.968	98.636
9.973	125.359
10.028	128.098
10.056	132.551
10.979	126.691
10.980	131.488
11.090	135.938
12.015	139.671
12.993	133.809
12.994	139.976
12.994	144.773
12.995	148.199
13.045	125.242
15.031	126.194
15.032	133.732
16.037	131.638];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(1.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'HaasEber2016'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 50 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'temperatures are guessed';
D3 = 'mod_1: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00372*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68DZR'; % Cat of Life
metaData.links.id_ITIS = '160935'; % ITIS
metaData.links.id_EoL = '46560755'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja_aleutica'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_aleutica'; % ADW
metaData.links.id_Taxo = '163701'; % Taxonomicon
metaData.links.id_WoRMS = '271506'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-aleutica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja_aleutica}}';  
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
bibkey = 'HaasEber2016'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-016-0518-5}, ' ...
'author = {Diane L. Haas and David A. Ebert and Gregor M. Cailliet}, ' ...
'year = {2016}, ' ...
'title  = {Comparative age and growth of the {A}leutian skate, \emph{Bathyraja aleutica}, from the eastern {B}ering {S}ea and {G}ulf of {A}laska}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {99}, ' ...
'pages = {813-828}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eber2005'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2005.00628.x}, ' ...
'author = {DD. A. Ebert}, ' ...
'year = {2005}, ' ...
'title  = {Reproductive biology of skates, \emph{Bathyraja} ({I}shiyama), along the eastern {B}ering {S}ea continental slope}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {66}, ' ...
'pages = {618-649}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja-aleutica.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
