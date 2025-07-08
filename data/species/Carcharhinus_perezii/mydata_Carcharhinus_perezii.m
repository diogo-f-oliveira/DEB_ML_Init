function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_perezii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_perezii'; 
metaData.species_en = 'Caribbean reef shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW','MAg'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 11 02];              
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

data.ab = 19*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'ADW give 1 yr, but this is at odds with tL data';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'Tava2009';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 70;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase';
  comment.Lb = 'below 73 cm';
data.Lp  = 160;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = '152-168 cm';
data.Li  = 300;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwi = 208.7e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00437*Li^3.10, see F1, max measured 69.9 kg';

data.Ri  = 10/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10 pups per litter, 1 litter per 2 yrs';

% uni-variate data

% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.009	75.510
0.008	78.893
0.007	82.276
0.005	85.660
0.004	90.171
0.003	93.554
0.002	96.938
0.001	101.449
0.937	120.556
0.966	113.787
0.993	97.995
0.995	104.762
0.997	111.529
1.001	126.190
2.029	134.013
2.030	138.524
2.032	144.163
2.034	149.802
2.035	154.313
2.059	129.499
3.031	158.754
3.032	162.137
3.033	166.649
3.034	168.904
3.036	175.671
3.091	153.111
3.999	174.475
4.000	177.859
4.002	183.498
4.003	186.881
4.066	191.388
5.001	199.217
5.029	190.192
6.030	211.550
7.058	221.628
8.086	229.450
8.087	233.962
10.049	249.613
14.095	270.756];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'Tava2009';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.062	73.530
0.031	79.188
0.031	88.245
0.031	93.905
0.031	98.433
0.000	67.865
0.000	83.714
0.963	104.023
0.963	108.552
0.994	114.210
1.025	97.227
1.025	122.132
1.025	125.528
1.056	118.734
1.957	139.047
1.988	133.385
1.988	146.970
2.019	125.458
2.019	129.986
2.050	150.362
2.983	154.824
2.983	161.616
2.983	166.145
2.983	169.541
3.977	172.867
3.977	175.131
3.977	179.659
3.977	187.584
4.971	187.513
4.971	193.174
4.971	197.702
5.965	204.424
7.021	215.670];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'Tava2009';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Lb = 5 * weights.Lb;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
mmetaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: 0.00437*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 27 C,usually 20 - 65 m deep';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3Q4'; % Cat of Life
metaData.links.id_ITIS = '649702'; % ITIS
metaData.links.id_EoL = '46559806'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_perezi'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_perezii'; % ADW
metaData.links.id_Taxo = '298699'; % Taxonomicon
metaData.links.id_WoRMS = '271324'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-perezii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_perezi}}';
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
bibkey = 'Tava2009'; type = 'Article'; bib = [ ... 
'author = {Rafael Tavares}, ' ... 
'year = {2009}, ' ...
'title = {Fishery biology of the {C}aribbean reef sharks, \emph{Carcharhinus perezi} ({P}oey, 1876), in a {C}aribbean insular platform: {L}os {R}oques {A}rchipelago {N}ational {P}ark, {V}enezuela}, ' ...
'journal = {Pan-American Journal of Aquatic Sciences}, ' ...
'volume = {4(4)}, ' ...
'pages = {500-512}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-perezi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

