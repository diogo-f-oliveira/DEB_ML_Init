function [data, auxData, metaData, txtData, weights] = mydata_Lyciasalamandra_luschani

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Lyciasalamandra_luschani'; 
metaData.species_en = 'Luschan''s salamander'; 

metaData.ecoCode.climate = {'BSk', 'Csa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biTh', 'biTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1 = {'Bas Kooijman'};    
metaData.date_mod_1 = [2023 01 21];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SinsBock2017';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.3;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'SinsBock2017';
data.Lp  = 6.2;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'SinsBock2017'; 
data.Li  = 7.9;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'SinsBock2017';

data.Wwb = 0.95; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on length-weight of Salamandra_lanzai: (3.3/9.1)^3*20';
data.Wwp = 6.3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on length-weight of Salamandra_lanzai: (6.2/9.1)^3*20';
data.Wwi = 13;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Salamandra_lanzai: (7.9/9.1)^3*20';

data.Ri = 2/365;  units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';  bibkey.Ri = 'SinsBock2017';
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% univariate data
% time-length
data.tL_l = [... % time since birth (d), SVL (cm)
0.044	3.803
0.066	4.501
0.963	3.789
0.963	3.932
0.982	3.694
1.003	4.011
1.004	4.202
1.004	4.265
1.004	4.440
1.025	4.821
1.983	4.617
2.004	4.808
2.006	5.427
2.023	4.459
2.028	6.411
2.045	5.157
2.046	5.554
2.065	5.300
2.086	5.713
2.986	6.287
3.001	4.572
3.007	6.398
3.023	5.064
3.024	5.620
3.025	5.715
3.025	5.826
3.026	6.112
3.027	6.588
3.043	5.223
3.984	5.956
4.006	6.686
4.006	6.813
4.007	7.051
4.007	7.131
4.045	6.353
5.004	6.609
5.025	7.101
5.025	7.181
5.026	7.292
6.043	6.755
6.043	7.041
6.044	7.120
6.044	7.247
9.059	7.287];
data.tL_l(:,1) = (0.5 + data.tL_l(:,1)) * 365;
units.tL_l  = {'d', 'cm'}; label.tL_l = {'time since birth', 'SVL', 'lowland'};  
temp.tL_l   = C2K(20); units.temp.tL_l = 'K'; label.temp.tL_l = 'temperature';
bibkey.tL_l = 'SinsBock2017';
comment.tL_l = 'Data for L. l. basoglui in lowland';
%
data.tL_h = [... % time since birth (d), SVL (cm)
0.990	5.225
0.990	5.177
1.032	4.635
1.032	4.459
1.051	4.810
1.052	4.332
1.053	4.220
1.987	5.814
1.989	5.032
1.989	4.952
1.990	4.538
2.007	5.670
2.008	5.160
2.010	4.681
2.047	5.510
3.022	6.737
3.024	6.195
3.024	6.099
3.027	5.158
3.040	7.423
3.043	6.546
3.045	5.812
3.045	5.589
3.084	5.956
4.018	7.565
4.019	7.166
4.021	6.640
4.021	6.481
4.022	6.385
4.996	7.914
4.997	7.548
4.997	7.277
5.018	7.149
5.018	7.037
5.018	6.926
5.019	6.623
5.995	7.642
5.995	7.482
6.014	7.881
7.033	7.449
7.992	7.496
8.011	7.703
8.990	7.558
10.007	7.940
11.006	7.858];
data.tL_h(:,1) = (0.5 + data.tL_h(:,1)) * 365;
units.tL_h  = {'d', 'cm'}; label.tL_h = {'time since birth', 'SVL', 'highland'};  
temp.tL_h   = C2K(20); units.temp.tL_h = 'K'; label.temp.tL_h = 'temperature';
bibkey.tL_h = 'SinsBock2017';
comment.tL_h = 'Data for L. l. basoglui in highland';
%
data.tL_f = [ ... % time since birth (d), SVL (cm)
0.972	3.603
0.973	3.367
0.973	3.258
0.996	3.712
1.959	4.515
1.959	4.388
1.960	4.261
1.960	4.188
1.985	4.152
1.987	3.733
2.007	4.788
2.007	4.733
2.012	3.770
2.948	4.954
2.949	4.900
2.949	4.809
2.950	4.627
2.951	4.518
4.012	5.558
4.012	5.394
4.030	6.903
4.041	4.576
4.508	5.486
5.005	5.270
5.024	6.415
5.024	6.306
5.027	5.779
5.028	5.633
5.028	5.561
5.468	6.798
5.469	6.653
5.470	6.344
5.499	5.544
5.523	5.835
5.946	5.527
5.970	5.636
5.990	6.509
6.015	6.600
6.016	6.400
6.017	6.018
6.018	5.818
6.462	6.329
6.511	6.474
6.959	6.185
6.960	6.039
6.982	6.494
7.006	6.658
7.483	5.477
7.502	6.732
7.998	6.624
10.128	7.085];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'SVL', 'females'};  
temp.tL_f   = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'OlguMiau2001';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (d), SVL (cm)
1.000	3.313
1.003	3.605
1.004	3.696
1.026	3.404
1.995	3.681
2.000	4.156
2.005	4.703
2.007	4.813
2.046	3.791
2.050	4.229
2.051	4.320
2.052	4.393
2.053	4.484
3.020	4.524
3.024	4.925
3.055	5.564
4.003	6.096
4.049	5.713
4.050	5.914
4.969	6.008
5.020	6.172
6.032	5.701
6.038	6.339
6.039	6.394
6.039	6.449
6.041	6.595
6.536	6.505
6.538	6.724
6.539	6.852
6.542	7.126
7.030	6.342
7.032	6.598
7.033	6.671
7.034	6.762
8.019	6.108
8.023	6.491
8.025	6.656];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'SVL', 'males'};  
temp.tL_m   = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'OlguMiau2001';
comment.tL_m = 'Data for males';

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
set1 = {'tL_h','tL_l'}; subtitle1 = {'Data for L. l. basoglui in high-, low-land'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'Temperature ranges from 12 to 30 C in lowland, 7 to 30 C in highland';
D3 = 'mod_1: tL_f and tL_m data added; males differ from males by {p_Am} only';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'SinsBock2017'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6QPFN'; % Cat of Life
metaData.links.id_ITIS = '775929'; % ITIS
metaData.links.id_EoL = '2919410'; % Ency of Life
metaData.links.id_Wiki = 'Lyciasalamandra_luschani'; % Wikipedia
metaData.links.id_ADW = 'Lyciasalamandra_luschani'; % ADW
metaData.links.id_Taxo = '985992'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Lyciasalamandra+luschani'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lyciasalamandra_luschani}}';
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
bibkey = 'SinsBock2017'; type = 'Article'; bib = [ ... 
'author = {Ulrich Sinsch and Helen B\"{o}cking and Christoph Leskovar and Mehmet \"{O}z and Michael Veith}, ' ... 
'year = {2017}, ' ...
'title = {Demography and lifetime growth patterns in viviparous salamanders (genus \emph{Lyciasalamandra}): {L}iving underground attenuates interspecific variation}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {269}, ' ...
'pages = {48-56}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OlguMiau2001'; type = 'Article'; bib = [ ... 
'doi = {10.1139/cjz-79-9-155}, ' ...
'author = {Kurtulus Olgun and Claude Miaud and Patrick Gautier}, ' ... 
'year = {2001}, ' ...
'title = {Age, growth, and survivorship in the viviparous salamander \emph{Mertensiella luschani} from southwestern {T}urkey}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {79}, ' ...
'pages = {1559–1567}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Lyciasalamandra+luschani}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

