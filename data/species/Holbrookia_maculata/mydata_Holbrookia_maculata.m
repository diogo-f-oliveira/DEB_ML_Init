function [data, auxData, metaData, txtData, weights] = mydata_Holbrookia_maculata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Phrynosomatidae';
metaData.species    = 'Holbrookia_maculata'; 
metaData.species_en = 'Lesser earless lizard'; 

metaData.ecoCode.climate = {'B', 'Cfa', 'Dfa', 'BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-tL'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 01];

%% set data
% zero-variate data

data.ab = 62;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Sceloporus undulatus';
data.am = 5*465;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'JoneBall1987';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.45;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';    bibkey.Lb  = 'JoneBall1987';  
data.Lp  = 4.1;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'JoneBall1987';  
data.Li  = 5.7;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';    bibkey.Li  = 'JoneBall1987';

data.Wwb = 0.35;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'JoneBall1987';  

data.Ri  = 2*5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'JoneBall1987';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 eggs per clutch, 2 clutches per yr';
 
% univariate data
% time-length
data.tL_fm = [ ... % time since birth (mnth), SVL (cm)
0	2.568 2.567
1	3.070 2.988
2	3.402 3.205
9	3.492 3.634
10	4.378 4.502
11	4.892 4.839
12	5.122 5.140
13	5.370 5.211
21	5.752 5.281
22	5.648 5.611
23	5.730 5.578
24	5.785 5.578
25	NaN   5.653
33  NaN   5.539
34	5.803 5.669
35	5.844 5.790
36	5.797 5.627];
data.tL_fm(:,1) = data.tL_fm(:,1) * 30.5; % convert mnth to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL'};  
temp.tL_fm   = C2K(30);  units.temp.tL_fm = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_fm = 'JoneBall1987'; treat.tL_fm = {1, {'females','males'}};

% length-weight
data.LW_f = [ ... SVL (cm), weight (g)
2.499	0.417
2.621	0.511
2.792	0.616
2.852	0.423
3.011	1.020
3.096	0.779
3.217	0.800
3.425	1.289
3.523	1.383
3.645	1.897
3.742	1.583
3.864	1.881
3.950	2.155
4.756	4.013
4.962	3.625
5.084	4.019
5.183	4.629
5.279	4.207
5.389	4.685
5.487	4.912
5.621	5.101
5.793	5.878
6.096	5.573];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight','females'};  
bibkey.LW_f = 'Genn1974'; comment.LW_f = 'data for females';
%
data.LW_m = [ ... SVL (cm), weight (g)
2.110	0.256
2.414	0.431
2.512	0.729
2.841	1.023
2.902	0.902
3.036	1.200
3.121	1.018
3.194	1.017
3.340	1.206
3.522	1.275
3.632	1.285
3.730	1.703
3.839	1.785
4.144	2.092
4.243	2.774
4.449	2.650
4.560	3.140
4.669	3.258
4.743	3.545
4.839	3.039
4.950	3.805
5.073	4.715
5.195	4.809
5.293	4.903
5.377	4.493
5.500	5.211
5.720	5.771];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight','males'};  
bibkey.LW_m = 'Genn1974'; comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'T is assumed to vary as T(t) = 11+25*sin(2*pi*(t+100)/365) in C';
D2 = 'Males are assued to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3M7BF'; % Cat of Life
metaData.links.id_ITIS = '173927'; % ITIS
metaData.links.id_EoL = '793268'; % Ency of Life
metaData.links.id_Wiki = 'Holbrookia_maculata'; % Wikipedia
metaData.links.id_ADW = 'Holbrookia_maculata'; % ADW
metaData.links.id_Taxo = '413344'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Holbrookia&species=maculata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Holbrookia_maculata}}';
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
bibkey = 'JoneBall1987'; type = 'Article'; bib = [ ... 
'author = {Steven M. Jones and Royce E. Ballinger}, ' ... 
'year = {1987}, ' ...
'title = {Comparative Life Histories of \emph{Holbrookia Maculata} and {Sceloporus undulatus} in {W}estern {N}ebraska}, ' ...
'journal = {Ecology}, ' ...
'volume = {68(6)}, ' ...
'pages = {1828-1838}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Genn1974'; type = 'Article'; bib = [ ... 
'author = {A. L. Gennaro}, ' ... 
'year = {1974}, ' ...
'title = {Growth, Size, and Age at Sexual Maturity of the Lesser Earless Lizard, \emph{Holbrookia maculata maculata}, in {E}astern {N}ew {M}exico}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {30(1)}, ' ...
'pages = {85-90}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
