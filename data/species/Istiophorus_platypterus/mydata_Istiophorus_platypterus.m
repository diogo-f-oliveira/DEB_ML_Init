function [data, auxData, metaData, txtData, weights] = mydata_Istiophorus_platypterus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Istiophoriformes'; 
metaData.family     = 'Istiophoridae';
metaData.species    = 'Istiophorus_platypterus'; 
metaData.species_en = 'Indo-Pacific sailfish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf', 'jiCic'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 13*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'fishbase';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 20;   units.Lj  = 'cm';  label.Lj  = 'LJFL at metam';  bibkey.Lj  = 'marinebio'; 
  comment.Lj = 'end of larval appearance';
data.Lp  = 150;   units.Lp  = 'cm';  label.Lp  = 'LJFL at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 348;   units.Li  = 'cm';  label.Li  = 'ultimate LJFL';    bibkey.Li  = 'fishbase';
  comment.Li = 'fishbase specifies FL, not LJFL explicitly';

data.Wwb = 1.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter 0f 1.3 mm: pi/6*0.13^3';
data.Wwi = 1e5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'marinebio';

data.R33  = 4.8e6/365;    units.R33  = '#/d'; label.R33  = 'reprod rate at 33 kg'; bibkey.R33  = 'marinebio';   
  temp.R33 = C2K(26);  units.temp.R33 = 'K'; label.temp.R33 = 'temperature';
  comment.R33 = 'data for Istiophorus albicans';
 
% uni-variate data
% time-length
data.tL_f = [ ...  % time since birth (d), LJFL (cm)
0.000	129.995
0.000	133.483
0.024	141.335
0.024	143.951
0.024	157.033
0.990	145.925
1.007	148.419
1.007	152.156
1.007	155.894
1.024	128.487
1.024	133.471
1.024	139.077
1.024	141.569
1.024	160.256
2.000	168.461
2.035	155.383
2.035	174.694
2.993	164.208
2.993	168.569
3.010	146.768
3.010	175.423
3.986	172.415
3.986	174.283
3.986	178.644
3.986	187.988
4.997	161.312
4.997	183.737
5.014	177.510
6.007	195.683
6.007	198.798
6.983	174.610
6.983	188.937
7.976	197.766];
data.tL_f(:,1) = (1.25 + data.tL_f(:,1)) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'LJFL', 'female'};  
temp.tL_f    = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Hool2006';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ...  % time since birth (d), LJFL (cm)
0.000	144.930
0.000	147.991
0.000	124.012
0.000	131.666
0.000	135.747
0.000	140.849
0.000	142.380
0.959	161.829
0.973	136.830
0.973	139.891
0.973	140.911
0.973	143.972
0.973	145.503
0.973	150.095
0.987	131.218
1.961	143.015
2.977	142.570
2.977	151.243
2.977	153.794
2.977	156.345
2.977	160.427
2.977	168.590
3.964	175.286
5.968	160.107];
data.tL_m(:,1) = (1.25 + data.tL_m(:,1)) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'LJFL', 'male'};  
temp.tL_m    = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Hool2006';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ...  % time since birth (d), LJFL (cm)
0.026	10044.239
0.025	13364.957
0.003	10930.435
0.003	12148.039
0.004	14251.153
0.004	14915.296
0.004	15358.051
0.005	18236.003
0.980	14384.784
0.980	15159.622
0.981	19476.543
0.982	21026.208
0.982	21579.657
0.982	22022.417
0.982	22575.872
0.995	16377.552
1.010	19809.290
1.010	20362.739
1.012	24236.900
1.012	24790.355
1.012	25675.876
1.024	18370.652
1.040	23241.366
1.989	28687.464
1.989	28798.153
1.990	31786.793
2.001	22378.449
2.991	21294.831
2.991	22512.429
2.991	23619.328
2.993	26940.040
2.993	28379.015
3.008	29707.634
3.986	36039.934
4.012	29620.568
4.013	32166.448
5.001	26433.836
5.002	28758.333
5.003	32300.422
5.029	24442.086
5.984	46713.117
6.007	32324.045
6.981	25373.503
6.983	31682.850
6.996	28915.930
7.978	46538.642];
data.tW_f(:,1) = (1.25 + data.tW_f(:,1)) * 365; % convert yr to d
n=size(data.tW_f,1); for i=2:n; if data.tW_f(i,1)<=data.tW_f(i-1,1); data.tW_f(i,1)=data.tW_f(i-1,1)+1e-3; end; end
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(26);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Hool2006';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ...  % time since birth (d), LJFL (cm)
0.041	18259.012
0.040	19697.072
0.040	20250.169
0.029	10183.958
0.028	12617.594
0.028	13281.314
0.028	13723.799
0.027	15936.198
0.026	21135.330
0.960	14401.174
0.960	15396.755
0.961	17830.385
0.961	18494.106
0.962	23472.002
0.963	24135.723
0.975	17277.486
0.976	21149.182
0.989	16613.969
0.990	20375.041
1.977	17955.054
2.965	20955.446
2.966	21729.785
2.966	23499.706
2.966	24384.663
2.967	25712.105
3.997	23845.814
6.002	30289.474];
data.tW_m(:,1) = (1.25 + data.tW_m(:,1)) * 365; % convert yr to d
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(26);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Hool2006';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'Since yr class in tL and tW data was indicated by 0+, and this cohort had high LJFL and weight, 1.25 yr was added for time since birth';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '3QDCH'; % Cat of Life
metaData.links.id_ITIS = '172488'; % ITIS
metaData.links.id_EoL = '46581444'; % Ency of Life
metaData.links.id_Wiki = 'Istiophorus_platypterus'; % Wikipedia
metaData.links.id_ADW = 'Istiophorus_platypterus'; % ADW
metaData.links.id_Taxo = '46717'; % Taxonomicon
metaData.links.id_WoRMS = '158812'; % WoRMS
metaData.links.id_fishbase = 'Istiophorus-platypterus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Istiophorus_platypterus}}';
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
bibkey = 'Hool2006'; type = 'Article'; bib = [ ... 
'author = {John P. Hoolihan}, ' ... 
'year = {2006}, ' ...
'title = {Age and growth of Indo-Pacific sailfish, \emph{Istiophorus platypterus}, from the {A}rabian {G}ulf}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {78}, ' ...
'pages = {218-226}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Istiophorus-platypterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marinebio'; type = 'Misc'; bib = ...
'howpublished = {\url{http://marinebio.org/species.asp?id=146}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

