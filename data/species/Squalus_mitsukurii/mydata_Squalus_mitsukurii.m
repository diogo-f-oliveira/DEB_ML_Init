function [data, auxData, metaData, txtData, weights] = mydata_Squalus_mitsukurii

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Squalidae';
metaData.species    = 'Squalus_mitsukurii'; 
metaData.species_en = 'Shortspine spurdog'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11.4); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'};
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 18];                          
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
data.am = 26*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'CottGrub2011';   
  temp.am = C2K(11.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 21;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';        bibkey.Lb  = 'CottGrub2011';
data.Lp  = 64;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';        bibkey.Lp  = 'CottGrub2011';
data.Lpm  = 47;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'CottGrub2011';
data.Li  = 94.3;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';
data.Lim  = 89.8;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males'; bibkey.Lim  = 'fishbase';

data.Wwi = 3.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00282*Li^3.08';
data.Wwim = 2.92e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00282*Li^3.08';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	22.516
0.000	21.174
0.000	26.709
0.000	24.193
0.000	23.019
3.114	38.952
3.944	42.138
4.411	44.990
4.878	47.505
4.930	39.455
5.553	42.642
6.902	45.828
7.006	44.486
7.110	42.138
7.473	48.008
7.888	45.325
7.940	54.046
8.407	52.201
8.926	53.543
8.926	48.847
8.978	44.654
9.445	56.562
9.964	50.524
9.964	49.853
10.431	54.382
10.431	55.220
10.898	48.679
10.950	47.841
11.002	63.103
11.002	57.065
11.417	54.214
11.469	59.916
11.936	52.872
11.936	51.530
11.988	59.413
11.988	54.046
12.040	55.388
12.403	54.885
12.403	56.059
12.818	61.929
12.974	59.413
12.974	58.742
12.974	56.226
12.974	55.220
12.974	51.866
13.441	69.644
13.493	53.711
13.960	67.799
13.960	56.226
13.960	57.400
14.012	63.438
14.375	58.071
14.427	55.723
14.842	61.090
14.894	52.872
14.946	61.761
15.828	66.960
15.880	61.593
15.984	68.637
15.984	69.979
15.984	72.830
16.295	67.296
16.451	63.103
16.814	65.451
16.866	71.488
16.866	65.954
16.918	60.252
16.970	79.203
16.970	67.799
17.437	65.786
17.489	73.166
17.956	78.532
18.060	76.855
18.060	74.172
18.060	68.470
18.112	65.451
18.994	66.457
19.409	82.725
19.876	67.631
19.928	73.166
19.980	78.029
20.395	77.694
20.551	71.992
20.914	79.371
21.018	84.570
21.018	81.216
21.018	77.358
21.018	73.836
21.537	83.229
21.900	80.042
21.952	81.384
21.952	84.906
22.056	82.725
22.108	92.453
22.419	78.868
22.471	86.247
22.523	84.570
22.938	74.507
22.938	77.694
22.938	88.260
22.990	85.912
23.509	92.956
23.872	78.532
24.495	87.589
24.962	90.273
25.429	91.279
25.533	91.782
25.844	81.384
25.948	101.342];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(11.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CottGrub2011';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.000	20.962
0.000	21.280
0.000	22.763
0.000	23.822
0.000	26.682
0.108	21.916
5.879	43.573
7.379	40.937
7.898	42.742
9.507	45.827
9.974	46.996
10.392	49.754
10.969	57.280
11.949	53.050
11.950	54.533
11.951	55.169
11.952	55.593
12.107	56.124
12.887	58.990
12.892	63.227
12.932	51.999
13.868	56.032
13.869	56.774
14.385	54.659
14.904	56.252
15.897	64.523
16.876	59.658
16.877	60.506
16.878	61.353
16.926	57.540
17.912	59.349
18.948	59.781
19.465	58.514
19.525	67.201
22.523	61.399];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(11.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CottGrub2011';
comment.tL_m = 'Data for males';

% length - fecundity
data.LN = [ ... % total length (cm), 2-yearly fecundity (#)
65.125	4.009
65.725	4.009
67.519	3.021
67.981	4.998
69.931	4.998
70.281	1.016
72.550	3.981
73.082	5.054
73.150	4.009
74.056	5.026
74.063	6.071
76.687	5.929
77.056	4.969
77.288	6.014
77.913	10.024
78.107	5.054
78.500	7.991
78.550	4.038
79.019	6.974
79.219	2.993
79.606	5.026
81.113	6.014
81.200	7.991
82.394	7.002
82.637	9.995
83.213	6.014
84.556	4.998
84.644	7.002
84.737	9.995
86.131	5.026
86.162	9.995
87.587	9.995
88.256	8.979
90.262	5.958
92.163	10.024
101.294	7.002];
units.LN = {'cm', '#'};     label.LN = {'total length', '2-yearly fecundity'};  
temp.LN = C2K(11.4);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CottGrub2011';

%% set weights for all real data
weights = setweights(data, []);

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.00282 * (TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Ovoviviparous. Depth around 48 - 533 m';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6ZFNC'; % Cat of Life
metaData.links.id_ITIS = '160625'; % ITIS
metaData.links.id_EoL = '46560205'; % Ency of Life
metaData.links.id_Wiki = 'Squalus_mitsukurii'; % Wikipedia
metaData.links.id_ADW = 'Squalus_mitsukurii'; % ADW
metaData.links.id_Taxo = '41844'; % Taxonomicon
metaData.links.id_WoRMS = '217371'; % WoRMS
metaData.links.id_fishbase = 'Squalus-mitsukurii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Squalus_mitsukurii}}';  
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
bibkey = 'CottGrub2011'; type = 'Article'; bib = [ ... 
'author = {Charles F. Cotton and R. Dean Grubbs and Toby S. Daly-Engel and Patrick D. Lynch and John A. Musick}, ' ...
'year = {2011}, ' ...
'title  = {Age, growth and reproduction of a common deep-water shark, shortspine spurdog (\emph{Squalus cf. mitsukurii}), from {H}awaiian waters}, ' ...
'journal = {Marine and Freshwater Research}, ' ...
'volume = {62}, ' ...
'pages = {811-822}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://fishbase.org/summary/Squalus-mitsukurii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

