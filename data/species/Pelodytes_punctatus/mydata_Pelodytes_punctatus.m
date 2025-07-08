function [data, auxData, metaData, txtData, weights] = mydata_Pelodytes_punctatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Pelodytidae';
metaData.species    = 'Pelodytes_punctatus'; 
metaData.species_en = 'Common parsley frog'; 

metaData.ecoCode.climate = {'BSk','Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTs', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 12];              
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

data.tj = 85;   units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'EsteSanc2004';   
  temp.tj = C2K(17);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 230; units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'EsteSanc2004';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 15*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'EsteSanc2004';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'ToxoOhm1993';  
data.Lj  = 1.8;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';    bibkey.Lj  = 'ToxoOhm1993'; 
data.Lp  = 4.0;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'EsteSanc2004';
data.Li  = 4.6;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'EsteSanc2004';
data.Lim = 4.0;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'EsteSanc2004';

data.Wwp = 7.0;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (4/4.6)^3*10.7';
data.Wwi = 13.1;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on LW data for Pelobates_fuscus';
data.Wwim = 8.6;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'guess';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi: (4/4.3)^3*10.7';

data.Ri  = 1300/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'amphibiaweb';   
temp.Ri  = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1000-1600; ToxoOhm1993: 360 eggs per clutch, upto 10 clutches per season';

% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (yr), SVL (cm)
 0  1.8 % added from Lj
 1	4.000
 2	3.955
 3	4.053
 4	4.250
 5	4.394
 6	4.470
 7	4.667
 8	4.629
 9	4.553
10	5.015];
data.tL_f(:,1) = data.tL_f(:,1)  * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'EsteSanc2004';
comment.tL_f = 'Data for female frogs';
% 
data.tL_m = [ ... % time since metam (yr), SVL (cm)
 0  1.8 % added from Lj
 1	3.318
 2	3.598
 3	3.758
 4	3.856
 5	3.818
 6	3.939
 7	4.152
 8	4.083];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EsteSanc2004';
comment.tL_m = 'Data for male frogs';
% female tadpole
data.tL_tf = [ ... % time since metam (d), SVL (cm)
0.000	0.185
13.880	0.360
55.712	1.588
67.818	2.483
73.263	2.252
82.720	2.068
92.891	1.726];
units.tL_tf   = {'d', 'cm'};  label.tL_tf = {'time since metam', 'SVL tadpole', 'female'};  
temp.tL_tf    = C2K(25);  units.temp.tL_tf = 'K'; label.temp.tL_tf = 'temperature';
bibkey.tL_tf  = 'ToxoOhm1993';
comment.tL_tf = 'Data for female tadpoles';
% male tadpole
data.tL_tm = [ ... % time since metam (d), SVL (cm)
0.000	0.166
15.145	0.249
21.890	0.295
28.088	0.332
30.652	0.480
33.757	0.563
36.302	0.508
41.785	0.702
47.452	0.905
52.576	1.154
56.228	1.246
68.669	1.818
74.126	1.726
89.059	1.662];
units.tL_tm   = {'d', 'cm'};  label.tL_tm = {'time since metam', 'SVL tadpole', 'male'};  
temp.tL_tm    = C2K(25);  units.temp.tL_tm = 'K'; label.temp.tL_tm = 'temperature';
bibkey.tL_tm = 'ToxoOhm1993';
comment.tL_tm = 'Data for male tadpoles';

% temperature-age at birth
data.Tab = [ ... % temp (C), age at birth (d)
8.379	14.095
8.838	12.054
9.817	7.051
9.847	8.039
10.306	13.093
14.801	6.040
16.911	4.073];
units.Tab  = {'C', 'd'};  label.Tab = {'temperature','age at birth'};  
bibkey.Tab = 'ToxoOhm1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.tL_tf = weights.tL_tf * 3;
weights.tL_tm = weights.tL_tm * 3;
weights.Tab = weights.Tab * 5;
weights.Lb = weights.Lb * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for female, male frogs'};
set2 = {'tL_tf','tL_tm'}; subtitle2 = {'Data for female, male tadpoles'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'tadpoles are assumed to differ from frogs by del_M only';
D2 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '76D3R'; % Cat of Life
metaData.links.id_ITIS = '664735'; % ITIS
metaData.links.id_EoL = '331126'; % Ency of Life
metaData.links.id_Wiki = 'Pelodytes_punctatus'; % Wikipedia
metaData.links.id_ADW = 'Pelodytes_punctatus'; % ADW
metaData.links.id_Taxo = '47569'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelodytes+punctatus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelodytes_punctatus}}';
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
bibkey = 'EsteSanc2004'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00222930310001618859}, ' ...
'author = {Esteban, M. and S\''{a}nchez-Herr\''{a}iz, M. J. and Barbadillo, L. J. and Castanet, J. }, ' ... 
'year = {2004}, ' ...
'title = {Age structure and growth in an isolated population of \emph{Pelodytes punctatusin} northern {S}pain}, ' ...
'journal = {Journal of Natural History}, ' ...
'volume = {38(21)}, ' ...
'pages = {2789–2801}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ToxoOhm1993'; type = 'Article'; bib = [ ... 
'author = {A.G. Toxopeus and M. Ohm and J.W. Arntzen1}, ' ... 
'year = {1993}, ' ...
'title = {Reproductive biology of the parsley frog, \emph{Pelodytes punctatus}, at the northernmost part of its range}, ' ...
'journal = {Amphiba-Reptilia}, ' ...
'volume = {14}, ' ...
'pages = {131-147}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Pelobates&where-species=punctatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
