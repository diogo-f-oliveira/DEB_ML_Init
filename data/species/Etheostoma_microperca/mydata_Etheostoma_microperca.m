  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_microperca
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_microperca'; 
metaData.species_en = 'Least darter'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 07 03];                           
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
data.tp = 0.6*365;   units.tp = 'd';  label.tp = 'time since birth at puberty';     bibkey.tp = 'JohnHatc1991';   
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on spawning in 2 yr';
data.am = 3.5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'JohnHatc1991';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.3;  units.Lp = 'cm'; label.Lp = 'standard total at puberty';  bibkey.Lp = 'JohnHatc1991'; 
data.Li = 4.4;  units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 7.75e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'JohnHatc1991';
  comment.Wwb = 'based on egg diameter of 1.14 mm: pi/6*0.114^3';
data.Wwi = 0.54;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00513*Li^3.14, see F1, F2';

data.Ri = 3*88/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'JohnHatc1991';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 clutches per yr, 88 eggs per clutch';
 
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.207	2.115
0.207	2.241
0.218	2.343
0.223	2.482
0.223	2.558
0.224	3.014
0.302	2.710
0.302	2.786
0.302	2.862
0.313	2.989
0.369	2.634
0.384	2.052
0.385	2.141
0.385	2.280
0.385	2.394
0.385	2.470
0.385	2.875
0.386	2.976
0.395	2.559
0.396	2.774
0.401	3.103
0.913	3.105
0.913	3.472
0.923	3.257
0.928	3.194
0.933	2.687
0.939	2.890
0.939	2.953
0.939	3.042
0.965	2.852
0.965	3.219
0.970	3.156
0.971	3.662
0.975	2.726
0.975	2.915
0.975	2.979
0.976	3.333
0.981	3.472
0.986	3.055
1.012	3.118
1.017	2.890
1.017	2.992
1.022	2.865
1.023	3.473
1.027	2.852
1.033	2.954
1.033	3.055
1.033	3.118
1.044	3.549
1.049	3.777
1.054	3.587
1.075	3.777
1.095	2.713
1.096	3.308
1.096	3.486
1.100	2.865
1.106	3.600
1.111	3.169
1.112	3.714
1.116	3.106
1.117	3.384
1.121	2.941
1.138	3.853
1.216	3.600
1.216	3.727
1.221	3.347
1.221	3.448
1.226	3.144
1.226	3.258
1.284	3.385
1.305	3.803
1.372	3.310
1.915	3.755
1.926	3.603
1.930	3.312
1.936	3.401
1.936	3.514
1.967	3.110
1.978	3.717
1.983	3.515
1.983	3.578
1.983	3.616
2.003	3.287
2.087	3.313
2.092	3.414
2.092	3.502
2.092	3.566
2.103	3.667
2.103	3.743
2.129	3.832
2.135	3.882
2.218	3.630
2.218	3.706
2.218	3.870
2.302	3.858
2.312	3.731
2.370	4.086
2.923	4.050
2.974	3.709
3.084	3.760];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));  % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JohnHatc1991';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.195	2.684
0.200	2.609
0.205	3.073
0.205	2.546
0.206	2.158
0.210	2.923
0.215	3.374
0.215	3.261
0.278	2.898
0.372	3.099
0.372	2.572
0.378	2.472
0.378	2.372
0.378	2.321
0.378	2.259
0.379	1.782
0.382	2.873
0.383	2.723
0.388	2.785
0.389	2.158
0.389	2.071
0.389	1.970
0.904	3.352
0.909	3.502
0.909	3.440
0.909	3.201
0.909	3.114
0.909	2.976
0.909	2.913
0.909	2.838
0.914	3.578
0.950	3.615
0.956	3.440
0.956	3.026
0.956	2.926
0.956	2.838
0.956	2.763
0.957	2.675
0.957	2.549
0.961	3.289
0.966	3.227
0.992	3.302
0.993	2.763
0.998	2.976
0.998	2.901
0.998	2.826
1.003	3.377
1.003	3.089
1.004	2.688
1.008	3.503
1.013	3.616
1.029	3.453
1.029	2.775
1.044	3.703
1.076	2.738
1.081	3.591
1.081	3.478
1.081	3.378
1.086	3.240
1.087	2.838
1.087	2.688
1.092	3.127
1.092	3.089
1.092	3.027
1.092	2.964
1.201	3.014
1.202	2.851
1.206	3.303
1.206	3.077
1.279	3.717
1.284	3.604
1.284	3.504
1.285	3.103
1.289	3.441
1.290	3.328
1.290	3.203
1.357	3.642
1.357	3.429
1.357	3.366
1.363	3.266
1.905	3.331
1.910	3.732
1.910	3.619
1.911	3.268
1.915	3.544
1.926	3.481
1.926	3.394
1.957	3.720
1.957	3.569
1.957	3.507
1.963	3.331
1.999	3.432
2.067	3.469
2.067	3.244
2.072	3.758
2.072	3.595
2.202	3.733
2.218	3.608
3.042	3.674];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JohnHatc1991';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  5 * weights.tL_f;
weights.tL_m =  5 * weights.tL_m;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mean temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00513*(TL in cm)^3.14 ';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BL53'; % Cat of Life
metaData.links.id_ITIS = '168411'; % ITIS
metaData.links.id_EoL = '207253'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_microperca'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_microperca'; % ADW
metaData.links.id_Taxo = '45184'; % Taxonomicon
metaData.links.id_WoRMS = '1019739'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-microperca'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_microperca}}';  
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
bibkey = 'JohnHatc1991'; type = 'article'; bib = [ ... 
'author = {James D. Johnsom and Jay T. Hatch}, ' ...
'year = {1991}, ' ...
'title = {Life History of the Least Darter \emph{Etheostoma microperca} at the Northwestern Limits of Its Range}, ' ... 
'journal = {Am. Midl. Nat.}, ' ...
'volume = {125}, '...
'pages = {87-103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-microperca.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
