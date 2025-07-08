function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_maculata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_maculata'; 
metaData.species_en = 'White-blotched Skate'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 30];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 30]; 

%% set data
% zero-variate data;
data.ab = 3*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 36*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'Maur2009';   
  temp.am = C2K(2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 22.1;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Maur2009';
data.Lp  = 95;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'Maur2009';
data.Li  = 134; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwi = 13.7e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00316*Li^3.12, see F1';

data.Ri  = 14/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Eber2005';   
  temp.Ri = C2K(2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.960	30.372
0.961	32.071
1.053	24.212
3.999	38.018
4.096	43.965
4.191	45.664
4.948	40.779
5.045	44.602
6.090	49.487
6.140	55.221
6.989	45.451
8.037	55.858
8.892	58.619
8.892	60.531
8.988	63.080
9.033	55.858
11.927	57.770
11.928	60.743
12.783	65.628
12.934	86.230
12.975	69.451
13.023	72.000
14.069	78.372
14.203	58.195
14.973	85.168
15.068	87.080
15.157	72.637
15.873	82.407
15.967	80.708
16.159	86.230
16.916	81.345
17.013	88.142
17.161	102.159
18.150	84.319
18.864	91.965
19.005	87.717
19.055	95.363
20.001	88.991
20.008	105.345
20.855	88.991
20.905	95.363
20.905	97.062
20.952	93.664
20.996	86.655
21.896	84.531
21.897	86.442
21.945	87.929
21.996	97.062
21.997	98.761
23.035	85.593
23.042	103.434
23.135	97.274
23.183	100.460
24.894	109.593
24.990	112.566
25.033	100.885
25.034	102.796
25.981	99.611
25.986	111.504
26.126	107.469
26.975	95.575
27.073	103.646
29.070	114.690
31.010	103.221
32.057	112.354];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Maur2009';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
2.955	36.956
4.903	46.301
5.047	49.912
5.948	51.611
5.992	41.841
6.042	47.788
6.992	52.885
7.086	50.336
10.034	68.177
10.934	66.478
11.027	62.442
11.978	67.752
12.974	67.327
12.977	75.823
14.066	71.575
15.013	66.903
16.916	83.681
17.055	74.124
17.910	77.310
17.959	80.708
18.867	98.549
18.954	78.159
19.011	104.708
19.912	103.221
19.949	77.735
19.953	85.805
20.006	100.248
20.146	95.575
20.956	104.920
21.093	91.752
21.946	89.416
21.951	101.310
21.999	105.133
22.002	111.504
22.857	114.478
22.948	104.496
22.991	94.513
22.996	106.407
23.082	84.956
23.889	86.442
23.896	104.920
23.946	110.442
24.037	101.310
24.939	103.646
24.940	105.770
25.077	91.115
25.080	98.549
25.983	104.708
26.032	109.168
26.978	101.310
27.071	98.761
28.071	107.257
28.071	108.956
30.062	104.708
30.063	107.681
31.011	108.106
31.014	114.265
32.008	110.442];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Maur2009';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.kap = 3 * weights.psd.kap;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g  = 0.00316 * (TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KXV2'; % Cat of Life
metaData.links.id_ITIS = '564250'; % ITIS
metaData.links.id_EoL = '46560768'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja_maculata'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_maculata'; % ADW
metaData.links.id_Taxo = '163719'; % Taxonomicon
metaData.links.id_WoRMS = '271520'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-maculata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja}}'; 
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
bibkey = 'Maur2009'; type = 'Article'; bib = [ ...
'author = {Jasmine Rae Fry Maurer}, ' ...
'year = {2009}, ' ...
'title  = {Life history of two Bering Ses slope skates: \emph{Bathyraja lindbergi} and \emph{B. maculata}}, ' ...
'school = {The Faculty of Moss Landing Marine Laboratories and California State University, Monterey Bay}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Eber2005'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1095-8649.2005.00628.x}, ' ...
'author = {David A. Ebert}, ' ...
'year = {2005}, ' ...
'title  = {Reproductive biology of skates, \emph{Bathyraja} ({I}shiyama), along the eastern {B}ering {S}ea continental slope}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {66}, ' ...
'pages = {618-649}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bathyraja-maculata.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

