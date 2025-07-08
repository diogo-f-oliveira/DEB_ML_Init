function [data, auxData, metaData, txtData, weights] = mydata_Branchipus_schaefferi
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Branchipodidae';
metaData.species    = 'Branchipus_schaefferi'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'THp','TPi','TA'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'; 'T-ab'; 'T-ap'; 'T-am'; 'T-Ri'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 17]; 

%% set data
% zero-variate data

data.ab = 1.42;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'BelaPeir2003';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 10;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BelaPeir2003';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 70;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'BelaPeir2003';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.115; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'BelaPeir2003';
data.Lp  = 1.2;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'BelaPeir2003';
data.Li  = 2.0;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'BelaPeir2003';
  
data.Wdi  = 0.0136;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2/1)^3';

data.Ri  = 1734/17.64;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BelaPeir2003';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1734 eggs in 17.64 d';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (d), length (dm)
0.896	0.115
3.829	0.521
5.214	0.736
6.029	0.932
7.169	1.061
8.065	1.166
9.043	1.252
9.776	1.328
10.998	1.271
12.301	1.314
13.035	1.385
14.257	1.447
14.908	1.490
16.130	1.543
16.945	1.596
18.167	1.404
19.226	1.495
19.959	1.677
21.100	1.791
22.240	1.815
23.136	1.782
24.033	1.863
25.173	1.911
25.988	1.844
27.128	1.806
28.024	1.830
29.002	1.844
29.980	1.882
30.876	1.777
31.853	1.987
33.075	1.854
34.053	1.806
35.275	1.868
35.927	1.777
36.986	1.806
37.882	1.748
41.141	1.844
42.118	1.806
42.933	1.849
43.992	1.868
44.888	1.887
47.984	1.911
55.071	1.863
62.077	1.911
70.224	1.987];
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'length','female'};  
temp.tL_f = C2K(25); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = 'BelaPeir2003'; 
%
data.tL_m = [ ... % time since birth (d), length (dm)
0.000	0.057
0.896	0.119
2.037	0.196
3.014	0.349
3.910	0.549
4.969	0.697
6.110	0.893
7.088	1.027
7.821	1.104
9.206	1.185
10.020	1.242
10.998	1.175
11.976	1.285
12.872	1.338
14.175	1.352
14.990	1.443
15.886	1.419
17.108	1.471
17.841	1.447
18.982	1.424
20.041	1.548
20.774	1.533
21.914	1.529
22.811	1.562
24.114	1.600
25.173	1.677
26.069	1.629
27.047	1.639
28.024	1.619
28.921	1.629
30.143	1.629
31.120	1.629
32.016	1.739
32.831	1.705
34.216	1.639
34.786	1.701
36.090	1.615
36.823	1.404
37.800	1.696
38.859	1.753
40.896	1.562
41.955	1.715
43.096	1.519
44.155	1.576
44.969	1.562
54.990	1.849
62.159	1.581];
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'length','male'};  
temp.tL_m = C2K(25); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = 'BelaPeir2003'; 

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males as assumed to differ from females by {p_Am} only';   
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = 'N6W4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '328235'; % Ency of Life
metaData.links.id_Wiki = 'Branchipodidae'; % Wikipedia
metaData.links.id_ADW = 'Branchipus_schaefferi'; % ADW
metaData.links.id_Taxo = '751398'; % Taxonomicon
metaData.links.id_WoRMS = '1290407'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BelaPeir2003'; type = 'Article'; bib = [ ... 
'author = {Lynda Beladja and Nico Peiren and Tom T. M. Vandekerckhove and Johan Mertens}, ' ... 
'year = {2003}, ' ...
'title = {DIFFERENT LIFE HISTORIES OF THE CO-OCCURRING FAIRY SHRIMPS \emph{Branchipus schaefferi} AND \emph{Streptocephalus torvicornis} ({A}NOSTRACA)}, ' ...
'journal = {Journal of crustacean biology}, ' ...
'volume = {23(2)}, ' ...
'pages = {300–307}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
