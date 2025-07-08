function [data, auxData, metaData, txtData, weights] = mydata_Menidia_menidia

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Menidia_menidia'; 
metaData.species_en = 'Atlantic silverside'; 

metaData.ecoCode.climate = {'Dwa','MC'};
metaData.ecoCode.ecozone = {'THn','MANW'};
metaData.ecoCode.habitat = {'0iFe','0iMcp','0jMm'};
metaData.ecoCode.embryo  = {'Fc','Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab_T'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab_25 = 8;      units.ab_25 = 'd';    label.ab_25 = 'age at birth';      bibkey.ab_25 = 'BengBark1987';   
  temp.ab_25 = C2K(25);  units.temp.ab_25 = 'K'; label.temp.ab_25 = 'temperature';
data.ab_18 = 15;      units.ab_18 = 'd';    label.ab_18 = 'age at birth';      bibkey.ab_18 = 'BengBark1987';   
  temp.ab_18 = C2K(18);  units.temp.ab_18 = 'K'; label.temp.ab_18 = 'temperature';
data.am = 2*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'ConoRoss1982';
data.Li  = 15;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 8.4e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'BengBark1987';
  comment.Wwb = 'based on egg diameter of 1.17 mm: pi/6*0.117^3';
  
data.Ri = 167/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed'; 

% uni-variate data
% time - length
data.tL_f = [ ... time since birth (d), total length (cm)
13.958	1.925
25.594	3.570
39.919	5.126
53.080	6.501
66.607	7.539
80.486	7.969
94.379	8.669
105.557	8.987
119.822	9.439
135.626	9.892
365-41.775	10.220
365-29.063	10.447
365-14.453	10.180
365-0.953	10.723
365+11.740	10.590
365+24.840	10.862
365+39.107	11.360
365+52.219	11.835
365+66.132	12.896
365+79.627	13.348
365+93.075	12.946
365+108.508	13.646
365+120.045	13.491
365+134.691	13.876];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ConoRoss1982';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), total length (cm)
14.339	1.857
25.593	3.547
40.269	4.495
54.971	5.894
66.180	6.773
81.221	7.339
93.961	8.062
107.437	8.177
120.568	9.012
135.214	9.397
365-41.454	9.072
365-27.602	9.007
365-13.700	9.865
365-1.010	9.687
365+13.223	9.555
365+25.938	9.827
365+39.076	10.797
365+54.094	10.935
365+66.798	11.005
365+81.093	12.021
365+93.796	12.068
365+109.611	12.724
365+122.323	12.929
365+135.015	12.773];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ConoRoss1982';
comment.tL_m = 'Data for males';

% time - weight
data.tWw_f = [ ... time since birth (d), wet weight (g)
14.086	0.122
28.174	0.247
39.531	0.634
53.573	1.356
66.008	1.815
80.043	2.633
93.554	3.211
105.445	3.694
122.239	3.891
135.191	4.685
365-42.200	5.762
365-27.638	6.771
365-11.886	6.419
365-0.024	7.284
365+13.033	6.716
365+28.702	7.438
365+38.506	6.869
365+53.027	8.404
365+68.018	10.870
365+80.916	12.356
365+93.431	11.788
365+107.414	13.275
365+120.984	13.089
365+134.972	14.504];
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(21);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ConoRoss1982';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), wet weight (g)
13.544	0.122
28.174	0.247
39.000	0.490
54.678	1.094
66.569	1.576
80.093	1.988
93.067	2.494
106.607	2.691
121.721	3.581
135.785	4.016
365-41.030	4.664
365-27.458	4.454
365-10.215	5.846
365+0.703	4.895
365+13.157	5.115
365+27.756	5.646
365+41.293	5.890
365+51.584	6.038
365+67.156	8.003
365+82.265	8.941
365+92.508	9.709
365+106.559	10.312
365+118.950	11.344
365+134.658	11.565];
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(21);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ConoRoss1982';
comment.tWw_m = 'Data for males';

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
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f', 'tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'sex determination by temperature';
metaData.bibkey.F1 = 'PowlSand2008';
metaData.facts = struct('F1',F1);
 
%% Links
metaData.links.id_CoL = '3ZQLB'; % Cat of Life
metaData.links.id_ITIS = '165994'; % ITIS
metaData.links.id_EoL = '46566701'; % Ency of Life
metaData.links.id_Wiki = 'Menidia_menidia'; % Wikipedia
metaData.links.id_ADW = 'Menidia_menidia'; % ADW
metaData.links.id_Taxo = '179846'; % Taxonomicon
metaData.links.id_WoRMS = '159228'; % WoRMS
metaData.links.id_fishbase = 'Menidia-menidia'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Menidia_menidia}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.se/summary/Menidia-menidia}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'ConoRoss1982'; type = 'article'; bib = [ ... 
'author = {David O. Conover and Michael R. Ross}, ' ... 
'year = {1982}, ' ...
'title = {Patterns in Seasonal Abundance, Growth and Biomass of the {A}tlantic Silverside, \emph{Menidia menidia}, in a {N}ew {E}ngland Estuary}, ' ...
'journal = {Estuaries}, ' ...
'volume = {5(4)}, ' ...
'pages = {275-286}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'BengBark1987'; type = 'article'; bib = [ ... 
'author = {D. A. Bengsten and and R. C. Barkman and W. J. Berry}, ' ... 
'year = {1987}, ' ...
'title = {Relationships between maternal size, egg diameter, time of spawning season, temperature, and length at hatch of {A}tlantic silverside, \emph{Menidia menidia}}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {31}, ' ...
'pages = {697-704}'];
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
bibkey = 'PowlSand2008'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-007-9304-8}, ' ...
'author = {Percival M. Powles and Ian M. Sandeman}, ' ... 
'year = {2008}, ' ...
'title = {Growth, summer cohort output, and observations on the reproduction of brook silverside, \emph{Labidesthes sicculus} ({C}ope) in the {K}awartha {L}akes, {O}ntario}, ' ...
'journal = {Environ Biol Fish}, ' ...
'volume = {82}, ' ...
'pages = {421-431}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

