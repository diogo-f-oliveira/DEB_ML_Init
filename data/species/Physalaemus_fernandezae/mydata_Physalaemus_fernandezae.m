function [data, auxData, metaData, txtData, weights] = mydata_Physalaemus_fernandezae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Leptodactylidae';
metaData.species    = 'Physalaemus_fernandezae'; 
metaData.species_en = 'Whistling dwarf frog”'; 

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.tp = 1.5*365;units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'guess';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'MaraBarr2012';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.9;  units.Lj  = 'cm';  label.Lj  = 'SVL at puberty for females'; bibkey.Lj  = 'MaraBarr2012';
data.Li  = 2.6;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'MaraBarr2012';
data.Lim = 2.3;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'MaraBarr2012';

data.Wwb = 1.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BrasMart2006';
  comment.Wwb = 'based on Physalaemus centralis: egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwi =  1.57;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'MaraBarr2012';
data.Wwim = 1.3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'MaraBarr2012';

data.Ri  = 775/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'BrasMart2006';   
temp.Ri  = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Physalaemus centralis of Li = 3.47 cm: 1549 to 2405 eggs per clutch: 1842*(2.6/3.47)^3'; 

% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (yr), SVL (cm)
3.021	2.314
3.021	2.294
3.021	2.237
3.994	2.318
4.008	2.342
4.008	2.366
4.023	2.213
4.023	2.237
4.023	2.280
4.038	2.409
4.996	2.199
5.011	2.027
5.011	2.266
6.013	2.185];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'females'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'MaraBarr2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (yr), SVL (cm)
0.015	0.867
0.015	0.910
0.015	0.948
0.015	0.986
0.015	1.015
0.015	1.077
0.015	1.120
0.015	1.215
0.973	0.977
1.002	1.402
1.002	1.215
1.002	1.144
1.002	1.029
1.017	1.316
1.017	1.301
1.017	1.273
1.975	1.975
2.004	2.018
2.019	2.075
2.019	2.103
3.006	2.075
3.006	2.056
3.021	2.151
3.021	2.113
3.021	1.998
3.021	1.960
3.036	1.927
3.036	1.827
3.994	2.170
3.994	2.132
4.008	2.056
4.008	2.113
4.023	1.884
4.023	2.018
4.981	2.103
5.011	2.170
6.027	2.032];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'males'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'MaraBarr2012';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since metam (yr), weight (g)
2.998	1.453
2.998	1.478
2.998	1.495
3.026	1.373
3.988	1.366
4.002	1.588
4.002	1.546
4.002	1.516
4.002	1.476
4.002	1.459
4.016	1.140
4.978	1.228
4.992	1.424
4.992	1.522
5.996	1.405];
data.tW_f(:,1) = 365 * data.tW_f(:,1); % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since metam', 'weight', 'females'};  
temp.tW_f    = C2K(20);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f  = 'MaraBarr2012';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since metam (yr), weight (g)
0.014	0.880
0.014	0.828
0.014	0.850
0.014	0.863
0.976	0.966
0.990	0.888
0.990	0.881
1.004	0.926
1.004	0.911
1.004	0.853
1.967	1.260
1.967	1.298
1.994	1.126
1.994	1.153
2.971	1.306
2.971	1.264
2.971	1.214
2.984	1.184
2.984	1.174
2.998	1.323
3.012	1.356
3.012	1.144
3.974	1.217
3.974	1.237
3.974	1.257
3.974	1.279
3.974	1.304
3.974	1.324
3.974	1.337
3.974	1.354
4.002	1.132
4.002	1.157
4.002	1.172
4.002	1.185
4.992	1.265
4.992	1.210
4.992	1.168
5.996	1.251];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
n=size(data.tW_m,1); for i=2:n; if data.tW_m(i,1)<=data.tW_m(i-1,1); data.tW_m(i,1)=data.tW_m(i-1,1)+1e-3; end; end
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since metam', 'weight', 'males'};  
temp.tW_m    = C2K(20);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m  = 'MaraBarr2012';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.tW_f = 3 * weights.tW_f;
weights.tW_m = 3 * weights.tW_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'Eggs in foam nest'; 
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4HF9K'; % Cat of Life
metaData.links.id_ITIS = '207832'; % ITIS
metaData.links.id_EoL = '1048168'; % Ency of Life
metaData.links.id_Wiki = 'Physalaemus_fernandezae'; % Wikipedia
metaData.links.id_ADW = 'Physalaemus_fernandezae'; % ADW
metaData.links.id_Taxo = '141057'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Physalaemus+fernandezae'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Physalaemus_fernandezae}}';
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
bibkey = 'MaraBarr2012'; type = 'Article'; bib = [ ... 
'author = {Federico Marangoni and Diego A. Barrasso and Rodrigo Cajade and Gabriela Agostini}, ' ... 
'year = {2012}, ' ...
'title = {Body size, age and growth pattern of \emph{Physalaemus fernandezae} ({A}nura: {L}eiuperidae) of {A}rgentina}, ' ...
'journal = {North-Western Journal of Zoology}, ' ...
'volume = {8(1)}, ' ...
'pages = {63-71}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrasMart2006'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00222930600835193}, ' ...
'author = {Brasileiro, Cinthia A. and Martins, Marcio}, ' ... 
'year = {2006}, ' ...
'title = {Breeding biology of \emph{Physalaemus centralis} {B}okermann, 1962 ({A}nura: {L}eptodactylidae) in southeastern {B}razil}, ' ...
'journal = {Journal of Natural History}, ' ...
'volume = {40(17-18)}, ' ...
'pages = {1199–1209}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Physalaemus+fernandezae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

