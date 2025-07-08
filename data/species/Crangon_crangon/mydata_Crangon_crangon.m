function [data, auxData, metaData, txtData, weights] = mydata_Crangon_crangon

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Crangonidae';
metaData.species    = 'Crangon_crangon'; 
metaData.species_en = 'Brown shrimp'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0bMb', 'bjMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'T-ab'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 03 08];              
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

data.tj = 35;  units.tj = 'd';      label.tj = 'time since birth at metam'; bibkey.tj = 'fao';
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 21*30.5;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'fao';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'fao';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'fao';
data.Lj  = 0.6; units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'fao';
data.Lp  = 3.0; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fao';
  comment.Lp = 'based on LN data';
data.Li  = 8.6; units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'fao';
data.Lim = 6.2; units.Lim = 'cm';  label.Lim = 'ultimate total length for male';  bibkey.Lim  = 'fao';

data.Wwb = 2.8e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'fao';
  comment.Wwb = 'based on egg diameter of 0.35 to 0.40 mm: 4/24*pi*0.0375^3'; 
  
% uni-variate data
% t-L data
data.tL_f = [ ... % time since birth (d), length (cm)
10.694	1.043
65.854	1.572
106.942	2.067
139.587	2.572
167.167	3.089
180.113	3.549
190.807	3.953
212.758	4.515
245.403	5.065
287.617	5.582
326.454	6.021
439.587	6.575];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f    = C2K(14);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'fao';
comment.tL_f = 'Data for females; salinity 30 promille';
%
data.tL_m = [ ... % time since birth (d), length (cm)
18.011	0.987
70.919	1.505
112.008	1.977
153.659	2.562
191.932	3.505
207.692	4.032
226.266	4.538
275.235	5.055
377.674	5.541];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m    = C2K(14);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'fao';
comment.tL_m = 'Data for males; salinity 30 promille';

% length-weight data
data.LW_f = [ ... % length (cm), wet weight (g)
3.1 0.20
4.4 0.57
5.5 1.16
6.4 1.90
7.5 3.14];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'length', 'wet weight'};  
bibkey.LW_f = 'fao';
comment.LW_f = 'Data for females';

% length-fecundity data
data.LN = [ ... % length^3 (cm^3), fecundity (g)
28.842	1535.484
94.517	3548.387
98.294	3187.097
193.366	6748.387
199.366	6412.903
265.711	8812.903
338.730	11238.710
422.043	14180.645
431.729	13974.194];
data.LN(:,1) = data.LN(:,1).^(1/3); % untransform lengths
units.LN   = {'cm', '#'};  label.LN = {'length', 'fecundity'};  
temp.LN    = C2K(14);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'fao';
comment.LN = '5 spawnings per yr';

% temperature-incubation
data.Tab = [ ... % temperature (C), incubation time (weeks)
 6  10
13.5 4.5
15.5 3.5
16.5 3.5
15.5 3.5];
data.Tab(:,2) = 7 * data.Tab(:,2); % convert w to d
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'incubation time'};  
bibkey.Tab = 'fao';

%% set weights for all real data
weights = setweights(data, []);
weights.Tab = 5 * weights.Tab; 
weights.tL_f = 5 * weights.tL_f; 
weights.tL_m = 5 * weights.tL_m; 
weights.tp = 0 * weights.tp; 
weights.Lp = 5 * weights.Lp; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M; 
weights.psd.v = 10 * weights.psd.v; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'};  subtitle1 = {'Data for female, male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
D3 = 'mod_1: tp genorged due to inconsistency with tL and Lp data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Larva hatches as 2 mm zoea, develops to a mysis of 3.3 mm';
metaData.bibkey.F1 = 'fao'; 
F2 = 'A 86mm female went through 34 moults, a 62 mm trought 30';
metaData.bibkey.F2 = 'fao'; 
F3 = 'Joana Campos applied the DEB model to this species';
metaData.bibkey.F3 = 'Camp2009'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '97118'; % ITIS
metaData.links.id_EoL = '46514566'; % Ency of Life
metaData.links.id_Wiki = 'Crangon_crangon'; % Wikipedia
metaData.links.id_ADW = 'Crangon'; % ADW
metaData.links.id_Taxo = '33878'; % Taxonomicon
metaData.links.id_WoRMS = '107552'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crangon_crangon}}';
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
bibkey = 'Camp2009'; type = 'Phdthesis'; bib = [ ... 
'author = {J. Campos}, ' ... 
'year = {2009}, ' ...
'title = {The eco-geography of the brown shrimp in {E}urope}, ' ...
'school = {VU University Amsterdam}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fao'; type = 'Misc'; bib = [ ...
'author = {Tiews, K.}, ' ... 
'series = {FAO Fisheries Synopsis}, ' ...
'volume = {91}, ' ...
'howpublished = {\url{http://www.fao.org/docrep/005/ac765t/AC765T02.htm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

