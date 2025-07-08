function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_limbatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_limbatus'; 
metaData.species_en = 'Blacktip shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 22];              
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

data.ab = 11*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'fishbase';   
  temp.ab = C2K(27.4); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '10-12 mnth';
data.am = 17*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'SmarTobi2015';   
  temp.am = C2K(27.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on the assumption that max back-calculated age is close to life span';

data.Lb  = 55;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';  
  comment.Lb = '38-72 cm';
data.Lp  = 165;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 275;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 152.5e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.08, see F1';

data.Ri  = 10/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 pups per litter, 1 litter each 2 yrs';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.899	99.246
0.901	83.543
0.902	80.402
0.902	77.261
0.971	88.568
0.974	69.724
1.881	119.347
1.881	113.065
1.918	102.387
1.954	99.246
1.990	92.337
2.865	121.859
2.899	130.653
2.900	119.347
2.901	113.693
2.968	135.050
3.882	135.678
3.882	133.794
3.883	128.769
3.951	148.241
3.986	145.101
4.864	156.407
4.865	147.613
4.866	143.216
4.901	138.819
4.933	160.804
5.882	162.688
5.883	158.291
5.917	167.714
5.955	148.869
6.831	168.342
6.902	159.548
6.903	155.779
6.935	173.995
7.885	170.226
7.886	162.060
7.918	185.302
7.919	181.533
7.919	176.508
8.866	195.980
8.868	179.648
8.902	186.558
8.937	190.955
8.939	173.367
9.745	195.980
9.816	187.814
9.849	203.518
9.888	177.764
10.869	202.261
10.870	194.724
10.907	182.789
11.044	209.171
11.852	214.824
11.852	209.171
11.923	204.774
12.800	219.221
12.907	211.055
13.854	227.387
13.890	222.362
13.890	217.337
14.873	231.156
14.979	224.246
15.856	236.809
15.893	227.387
16.911	234.925];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'SmarTobi2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.949	82.278
0.949	89.873
0.949	94.304
0.949	98.734
1.055	106.329
1.934	108.228
1.934	112.658
1.934	117.722
1.934	121.519
1.934	125.316
2.004	98.101
2.988	106.329
2.988	113.291
2.988	149.367
3.023	122.785
3.094	128.481
3.094	131.013
3.094	132.911
3.094	137.342
3.094	139.241
3.094	144.937
3.973	160.759
4.008	120.253
4.043	151.266
4.043	143.671
4.043	139.873
4.043	137.975
4.078	134.177
4.957	136.709
4.992	131.646
4.992	145.570
5.027	150.633
5.027	155.063
5.027	157.595
5.027	160.759
5.027	168.987
5.941	164.557
5.977	144.304
5.977	157.595
5.977	167.722
5.977	171.519
5.977	178.481
6.012	139.241
6.961	148.101
6.961	156.962
6.996	162.658
6.996	194.937
7.031	167.089
7.031	171.519
7.066	179.114
8.016	183.544
8.016	188.608
8.051	162.658
8.051	170.253
8.051	174.051
8.051	179.747
8.051	202.532
9.000	170.886
9.000	175.316
9.000	180.380
9.035	189.873
9.035	200.633
9.949	198.101
9.984	181.646
9.984	187.342
9.984	191.139
9.984	211.392
10.969	219.620
11.004	194.304
11.004	200.633
11.004	207.595
11.074	187.342
11.918	192.405
11.953	200.633
11.988	210.759
11.988	213.924
11.988	222.785
13.078	201.899
13.078	212.025
13.852	218.354
13.992	206.962
14.941	224.051
15.117	212.658
16.066	218.987];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'SmarTobi2015';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

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
F1 = 'length-weight: Ww in g  = 0.00468 * (TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'viviparous';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3P2'; % Cat of Life
metaData.links.id_ITIS = '160318'; % ITIS
metaData.links.id_EoL = '46559784'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_limbatus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_limbatus'; % ADW
metaData.links.id_Taxo = '41978'; % Taxonomicon
metaData.links.id_WoRMS = '105793'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-limbatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_limbatus}}';
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
bibkey = 'SmarTobi2015'; type = 'Article'; bib = [ ... 
'doi = {10.2989/1814232X.2015.1025428}, ' ...
'author = {J. J. Smart and A Chin, A. J.  Tobin and C. A.  Simpfendorfer and W. T. White }, ' ... 
'year = {2015}, ' ...
'title = {Age and growth of the common blacktip shark \emph{Carcharhinus limbatus} from {I}ndonesia, incorporating an improved approach to comparing regional population growth rates}, ' ...
'journal = {African Journal of Marine Science}, ' ...
'volume = {37(2)}, ' ...
'pages = {177-188}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-limbatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

