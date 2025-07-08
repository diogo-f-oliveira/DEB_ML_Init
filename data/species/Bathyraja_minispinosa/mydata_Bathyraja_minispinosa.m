function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_minispinosa

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_minispinosa'; 
metaData.species_en = 'Smallthorn Skate'; 

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

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 2*365; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 38*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'AinsEber2011';   
  temp.am = C2K(2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 12;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'AinsEber2011';
data.Lp  = 67.4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'AinsEber2011';
data.Lpm  = 70.1;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'AinsEber2011';
data.Li  = 82.5; units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';

data.Wwi = 3.3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00447*Li^3.06, see F1';

data.Ri  = 8/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Eber2005';   
  temp.Ri = C2K(2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	15.971
0.049	12.531
0.097	17.691
0.923	22.610
1.021	20.400
1.944	25.565
1.944	23.354
3.062	24.098
3.985	28.772
4.034	26.315
5.055	30.007
5.103	27.796
5.978	33.452
5.978	29.521
6.027	40.578
6.950	37.144
6.950	30.510
7.047	37.390
8.019	34.448
8.068	31.499
9.040	42.071
9.137	37.894
9.866	35.442
10.109	36.672
10.984	47.734
10.984	38.888
11.956	47.494
12.053	44.055
12.053	41.843
13.026	48.238
13.900	53.894
14.095	50.701
14.970	49.232
15.067	40.388
15.067	47.759
15.990	51.696
16.039	56.118
16.962	48.507
18.032	47.286
18.080	56.868
18.955	61.542
18.955	54.171
19.976	67.199
20.996	60.572
21.045	69.663
22.017	62.543
22.066	59.841
22.940	70.657
23.038	78.029
23.038	68.692
23.086	61.813
24.107	69.682
25.030	62.562
25.030	67.722
25.030	71.899
25.030	73.864
25.030	76.567
25.030	80.498
25.079	78.533
25.176	69.934
26.051	75.590
26.051	67.482
26.148	72.397
27.023	72.156
27.120	79.037
28.141	81.500
28.141	72.900
28.919	70.940
29.016	74.871
29.113	78.803
30.085	81.020
30.085	80.038
31.057	77.095
31.106	79.798
32.078	72.925
32.175	83.245
33.050	80.547
34.070	83.011
34.070	80.554
34.168	79.080
35.140	77.857
36.063	82.286
37.035	90.400];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(2); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AinsEber2011';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.146	15.235
1.215	17.207
2.139	22.372
2.916	25.080
4.131	21.156
5.006	27.795
5.200	30.990
6.027	35.664
7.193	32.477
7.971	37.150
8.894	33.470
8.943	29.539
8.943	34.945
10.012	49.693
14.095	49.227
17.157	59.074
18.129	51.217
20.024	56.143
20.996	62.046
21.045	56.886
21.045	54.675
22.066	66.721
24.107	71.156
25.030	56.665
26.100	82.470
26.100	81.487
27.072	74.368
28.092	76.831
28.092	75.603
29.064	82.734
29.162	84.209
30.036	66.278
30.036	78.809
30.134	74.387
30.134	76.352
31.106	75.867
31.203	72.182
32.078	84.473
32.175	79.313
32.175	77.102
32.224	75.137
33.001	84.478
33.147	71.948
34.070	75.885
35.140	76.875];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(2); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AinsEber2011';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 50 * weights.tL_f;
weights.tL_m = 50 * weights.tL_m;
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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g  = 0.00447 * (TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KXV8'; % Cat of Life
metaData.links.id_ITIS = '564264'; % ITIS
metaData.links.id_EoL = '46560772'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_minispinosa'; % ADW
metaData.links.id_Taxo = '163723'; % Taxonomicon
metaData.links.id_WoRMS = '271524'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-minispinosa'; % fishbase


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
bibkey = 'AinsEber2011'; type = 'Article'; bib = [ ...
'doi = {10.1093/icesjms/fsr072}, ' ...
'author = {Shaara M. Ainsley and David A. Ebert and Gregor M. Cailliet}, ' ...
'year = {2011}, ' ...
'title  = {Age, growth, and maturity of the whitebrow skate, \emph{Bathyraja minispinosa}, from the eastern {B}ering {S}ea}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {68(7)}, ' ...
'pages = {1426-1434}'];
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
'howpublished = {\url{http://www.fishbase.org/summary/Bathyraja-minispinosa.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

