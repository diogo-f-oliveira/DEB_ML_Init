function [data, auxData, metaData, txtData, weights] = mydata_Lepisosteus_osseus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Lepisosteiformes'; 
metaData.family     = 'Lepisosteidae';
metaData.species    = 'Lepisosteus_osseus'; 
metaData.species_en = 'Longnose gar'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa','MB'};
metaData.ecoCode.ecozone = {'THn','MAE'};
metaData.ecoCode.habitat = {'0iFe', '0iFm', '0iMm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb';  'Ri_L'}; 
metaData.data_1     = {'t-L', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};                             
metaData.date_subm = [2020 06 30];                          
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
data.tp = 4*365;  units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'WallYeag1990';
  temp.tp = C2K(20); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 3*365;  units.tpm = 'd'; label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'WallYeag1990';
  temp.tpm = C2K(20); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 39*365; units.am = 'd';  label.am = 'life span';      bibkey.am = 'Wiki';   
  temp.am = C2K(20);units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 68;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WallYeag1990';
  comment.Lp = 'based on R68, reported TL 83.8 and 50 cm';
data.Li  = 200;       units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb  = 1.7e-2;  units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth'; bibkey.Wwb  = 'WallYeag1990';
  comment.Wwb = 'based on egg diameter of 3.2 mm: pi/6*0.32^3';

data.R68  = 1110/365; units.R68  = '#/d'; label.R68  = 'reprod rate at TL 68.6 cm';   bibkey.R68  = 'WallYeag1990';   
  temp.R68 = C2K(20);  units.temp.R68 = 'K'; label.temp.R68 = 'temperature';
data.R114  = 36000/365; units.R114  = '#/d'; label.R114 = 'reprod rate at TL 114.2 cm';   bibkey.R114  = 'WallYeag1990';   
  temp.R114 = C2K(20);  units.temp.R114 = 'K'; label.temp.R114 = 'temperature';
  comment.R114 = 'converted from SL 101.6 cm, see F1';
data.R142  = 77156/365; units.R142  = '#/d'; label.R142 = 'reprod rate at TL 142.2 cm';   bibkey.R142  = 'WallYeag1990';   
  temp.R142 = C2K(20);  units.temp.R142 = 'K'; label.temp.R142 = 'temperature';

% uni-variate data

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
0.951	69.461
2.056	86.288
2.971	97.103
3.916	102.804
5.018	105.797
5.931	109.093
7.002	111.183
8.041	112.673
8.922	114.465
9.961	116.556
11.000	117.444
11.945	119.236
12.984	120.726
13.960	121.614
15.030	123.705
15.975	127.903
17.014	127.287
17.927	129.380
18.872	134.179
19.880	139.579
20.953	151.895
22.054	151.278];
data.tL_f(:,1) = 365 * (3.5 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  bibkey.tL_f = 'Kell2012';
temp.tL_f = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
1.042	54.122
2.021	67.943
3.029	76.350
4.037	79.946
5.013	82.338
6.053	85.031
6.966	86.823
7.942	88.915
8.949	88.600
9.956	90.692
10.995	92.181
12.003	93.371
12.979	94.560
14.018	98.756];
data.tL_m(:,1) = 365 * (3.5 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  bibkey.tL_m = 'Kell2012';
temp.tL_m = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
comment.tL_m = 'Data for males';

% length - weight
data.LWw_f = [ ... % log10 total length (cm), wet weight (g)
3.051	3.671
3.057	3.682
3.063	3.647
3.073	3.707
3.082	3.747
3.092	3.778
3.096	3.869
3.105	3.818
3.115	3.911
3.140	3.947
3.180	4.142];
data.LWw_f = 10.^data.LWw_f; % undo log transform
data.LWw_f(:,1) = data.LWw_f(:,1)/10; % convert mm to cm
units.LWw_f = {'cm', 'g'};     label.LWw_f = {'total length', 'wet weight', 'female'};  bibkey.LWw_f = 'Kell2012';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % log10 total length (mm), wet weight (g)
2.894	3.095
2.902	3.227
2.909	3.084
2.924	3.269
2.939	3.235
2.943	3.287
2.943	3.309
2.952	3.300
2.963	3.382
2.967	3.318
2.978	3.409
2.996	3.471
2.998	3.496];
data.LWw_m = 10.^data.LWw_m; % undo log transform
data.LWw_m(:,1) = data.LWw_m(:,1)/10; % convert mm to cm
units.LWw_m = {'cm', 'g'};     label.LWw_m = {'total length', 'wet weight', 'male'};  bibkey.LWw_m = 'Kell2012';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 20 * weights.tL_f;
weights.tL_m = 20 * weights.tL_m;
weights.LWw_f = 3 * weights.LWw_f;
weights.LWw_m = 3 * weights.LWw_m;
weights.Li = 3 * weights.Li;
weights.R68 = 8 * weights.R68;
weights.Wwb = 3 * weights.Wwb;

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
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males ase assumed to differ froam females by {p_Am} only';
D2 = 'Addition of 2 yrs to back-calculated age in tL data was necessary to arrive at the correct origin';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'From photo: SL = 0.89 * TL';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.00141*(TL in cm)^3.120';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3TFQF'; % Cat of Life
metaData.links.id_ITIS = '161094'; % ITIS
metaData.links.id_EoL = '46582204'; % Ency of Life
metaData.links.id_Wiki = 'Lepisosteus_osseus'; % Wikipedia
metaData.links.id_ADW = 'Lepisosteus_osseus'; % ADW
metaData.links.id_Taxo = '42472'; % Taxonomicon
metaData.links.id_WoRMS = '157872'; % WoRMS
metaData.links.id_fishbase = 'Lepisosteus-osseus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepisosteus_osseus}}';  
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
bibkey = 'seriouslyfish'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.seriouslyfish.com/species/search/Lepisosteus_osseus}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepisosteus-osseus.html}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallYeag1990'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Robert Wallus and Bruce L. Yeager and Thomas P. Simon}, ' ...
'year = {1990}, ' ...
'title  = {The reproductive biology and early life history of fishes of the Ohio river}, ' ...
'publisher = {Tennessee Valley Authority}, ' ...
'volume  = {1: Acipenseridae through Esocidae}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lepisosteus_osseus/}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kell2012'; type = 'Article'; bib = [ ...  
'author = {Samuel W. Kelley}, ' ...
'year = {2012}, ' ...
'title  = {Age and growth of spawning longnose gar (\emph{Lepisosteus osseus}) in a north central {T}exas reservoir}, ' ...
'journal = {Western North American Naturalist}, ' ...
'volume = {72}, ' ...
'pages = {69-77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

