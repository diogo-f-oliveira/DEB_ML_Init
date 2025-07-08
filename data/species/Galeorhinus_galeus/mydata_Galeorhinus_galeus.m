function [data, auxData, metaData, txtData, weights] = mydata_Galeorhinus_galeus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Galeorhinus_galeus'; 
metaData.species_en = 'School shark'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.3); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data

data.ab = 12*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'fishbase';   
  temp.ab = C2K(12.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 17 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'DureWorm2015';
  temp.tp = C2K(12.3); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 12 * 365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'DureWorm2015';
  temp.tpm = C2K(12.3); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 55*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = {'DureWorm2015','fishbase'};   
  temp.am = C2K(12.3); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = '46 to 59 yr';

data.Lb  = 32;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase'; 
  comment.Lb = '30 to 36  cm';
data.Lp  = 155;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'DureWorm2015'; 
data.Lpm  = 121; units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'DureWorm2015'; 
data.Li  = 199;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'fishbase';
data.Lim  = 178; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 140;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00398*Lb^3.02, see F3';
data.Wwp = 16.4e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00398*Lp^3.02, see F3';
data.Wwpm = 7.76e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'fishbase';
  comment.Wwpm = 'based on 0.00398*Lpm^3.02, see F3';
data.Wwi = 34.9e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00398*Lim^3.02, see F3';
data.Wwim = 24.9e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00398*Lim^3.02, see F3';
 
data.Ri  = 20/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(12.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 till 52 pups per litter, one litter per yr';

 % uni-variate data
 
% time-length data 
data.tL_f = [ ... % time since birth (yr), total length (cm)
5.102	83.686
5.330	87.794
5.939	94.978
6.244	90.344
6.853	95.986
6.853	99.585
7.462	98.542
7.538	104.196
7.919	105.216
8.376	108.290
8.376	108.290
8.680	111.882
8.680	113.425
9.061	115.987
9.061	116.501
9.289	113.411
9.594	120.602
9.898	118.538
10.279	124.185
10.355	122.641
10.812	122.630
10.812	129.314
10.888	132.911
11.117	123.138
11.117	126.222
11.117	128.793
11.345	138.557
11.726	134.949
11.726	132.892
12.183	131.854
12.259	134.937
13.173	137.486
13.173	139.543
13.249	126.688
13.477	142.107
13.477	145.192
13.706	139.017
14.010	143.637
14.162	141.063
14.467	140.542
14.772	146.190
14.772	143.105
14.772	140.535
15.990	161.072
15.990	152.332
16.294	152.325
17.132	146.651
17.284	151.788
17.513	155.382
17.817	157.432
18.122	157.939
18.426	152.791
19.340	163.052
22.081	173.787];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
temp.tL_f    = C2K(12.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'DureWorm2015';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
12.792	125.033
13.858	125.946
14.239	131.548
15.000	131.532
15.457	131.523
15.609	134.793
15.838	133.853
16.371	139.452
16.675	139.913
16.980	140.842
16.980	142.245
17.665	139.425
17.893	141.758
17.970	143.627
18.426	144.085
18.426	145.487
19.340	144.533
20.025	151.064
20.178	145.918
20.254	148.254
20.939	145.903
21.472	150.567
22.310	155.225
22.386	151.015
22.843	155.214
23.299	151.464
24.594	157.515
25.279	156.098
26.041	160.758
33.046	166.690];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
temp.tL_m    = C2K(12.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'DureWorm2015';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 0 * weights.Wwb;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.kap = 5 * weights.psd.kap;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Ovoviparity (aplacental viviparity)';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 12.3 C, usually 0 - 1100 m deep';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Ww (in g) = 0.00398*(TL in cm)^3.02';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3F43C'; % Cat of Life
metaData.links.id_ITIS = '160181'; % ITIS
metaData.links.id_EoL = '46559964'; % Ency of Life
metaData.links.id_Wiki = 'Galeorhinus_galeus'; % Wikipedia
metaData.links.id_ADW = 'Galeorhinus_galeus'; % ADW
metaData.links.id_Taxo = '41946'; % Taxonomicon
metaData.links.id_WoRMS = '105820'; % WoRMS
metaData.links.id_fishbase = 'Galeorhinus-galeus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galeorhinus_galeus}}';
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
bibkey = 'DureWorm2015'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12830}, ' ...
'author = {M. Dureuil and B. Worm}, ' ... 
'year = {2015}, ' ...
'title = {Estimating growth from tagging data: an application to north-east {A}tlantic tope shark \emph{Galeorhinus galeus}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {87}, ' ...
'pages = {1389-1410}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Galeorhinus-galeus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

