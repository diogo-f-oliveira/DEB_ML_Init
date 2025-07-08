function [data, auxData, metaData, txtData, weights] = mydata_Potamopyrgus_antipodarum
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Tateidae';
metaData.species    = 'Potamopyrgus_antipodarum'; 
metaData.species_en = 'New Zealand mudsnail'; 
metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0jFl', 'jiFc'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};
metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ab'; 'aj' ; 'ap'; 'am'; 'Lb'; 'Lj' ; 'Lp'; 'Li'; 'Wwb'; 'Wwj' ; 'Wdi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww' ; 'L-Ww'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Kim Rakel','Andre Gergs'};  
metaData.date_subm = [2017 02 03];   
metaData.email    = {'rakel@gaiac-eco.de'}; 
metaData.address  = {'gaiac - Research Institute for Ecosystem Analysis and Assessment, 52072 Aachen, Germany'};  
metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 15]; 

%% set data
% zero-variate data

data.ab = 32.5;     units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = 'PedeSelc2009';
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 198;      units.tj = 'd';    label.tj = 'time since birth at metam';  bibkey.tj = 'Gaia2016';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
    comment.tj = 'Measurements from cohort cultures, age class 173-223 days';
data.tp = 273;      units.tp = 'd';    label.tp = 'time since birth at first reproduction';  bibkey.tp = 'PedeSelc2009';
  temp.tp = C2K(17); units.temp.tp = 'K';  label.temp.tp = 'temperature'; 
data.am = 4*365;    units.am = 'd';    label.am = 'life span';  bibkey.am = 'Wall1992';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    comment.am = 'Wall1992: "snails generally lived well in the conditions provided (some individuals for well over 4 years)"';

data.Lb  = 0.03467; units.Lb  = 'cm';  label.Lb  = 'length at birth';   bibkey.Lb  = 'Gaia2016'; 
    comment.Lb = 'Measurements from cohort cultures, using smallest and lightest animal in the age class 0-14 days'; 
data.Lj  = 0.1416;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'Gaia2016';
    comment.Lj = 'Measurements from cohort cultures, age class 173-223 days';
data.Lp  = 0.305;   units.Lp  = 'cm';  label.Lp  = 'length at first reproduction';  bibkey.Lp  = 'GustBuro2009';
data.Li  = 0.65;    units.Li  = 'cm';  label.Li  = 'ultimate length';   bibkey.Li  = 'Wint1970';

data.Wwb = 0.000038; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Gaia2016';
    comment.Wwb = 'From own measurements, using smallest and lightest animal in the age class 0-14 days'; 
data.Wwj = 0.000681; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';  bibkey.Wwj = 'Gaia2016';
    comment.tj = 'Measurements from cohort cultures, age class 173-223 days';
data.Wdi = 0.00561375;   units.Wdi = 'g';   label.Wdi = 'dry weight at ultimate stage';     bibkey.Wdi = 'EkloAust2017';

data.Ri  = 0.53;     units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'GustBuro2011';    
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
%     uni-variate data
% t-L data
data.tL = [ ... % age (d), shell length (cm)
14 0.24	
14 0.36	
14 0.36	
14 0.48	
14 0.24	
14 0.36	
14 0.36	
14 0.36	
14 0.36	
14 0.35  
47 0.36	
47 0.48	
47 0.72	
47 0.48	
47 0.48	
47 0.48	
47 0.48	
47 0.48	
47 0.72	
47 0.48
75 0.48	
75 0.72	
75 0.60	
75 0.96	
75 0.96	
75 0.84	
75 1.08	
75 0.72	
75 0.72	
75 0.72
119	0.72	
119 1.20	
119 0.72	
119 0.84	
119 0.96	
119 1.08	
119 0.84	
119 0.72	
119 1.08	
119 0.84
173	0.96	
173 1.56	
173 1.44	
173 1.08	
173 1.32	
173 1.08	
173 1.08	
173 1.32	
173 1.08	
173 0.96
223	0.72	
223 2.28	
223 1.32	
223 1.32	
223 1.08	
223 1.56	
223 1.68	
223 1.20	
223 1.08	
223 1.92
251	2.88	
251 2.64	
251 2.76	
251 2.40	
251 3.24	
251 1.56	
251 2.88	
251 3.00	
251 2.28	
251 1.56
323	3.36	
323 4.32	
323 3.25	
323 3.36	
323 3.12	
323 2.52	
323 2.76	
323 3.36	
323 2.64	
323 3.84];
data.tL(:,2);
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'}; 
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gaia2016';
comment.tL = 'Measurements from cohort cultures, age classes 0-14 days, 14-47 days, 47-75 days, 75-119 days, 119-173 days, 173-223 days, 223-251 days and 251-323 days';

% t-W data
data.tW = [ ... % time since birth (d), wet weight (mg)
14	0.038
14	0.045
14	0.166
14	0.105
14	0.047
14	0.026
14	0.045
14	0.0528
14	0.018
47	0.056
47	0.084
47	0.22
47	0.106
47	0.051
47	0.055
47	0.06
47	0.036
47	0.115
47	0.044
75	0.109
75	0.123
75	0.101
75	0.208
75	0.236
75	0.217
75	0.28
75	0.146
75	0.129
75	0.104
119	0.148
119	0.93
119	0.146
119	0.201
119	0.32
119	0.287
119	0.15
119	0.157
119	0.269
119	0.227
173	0.297
173	0.643
173	0.483
173	0.365
173	0.468
173	0.324
173	0.338
173	0.312
173	0.634
173	0.305
223	0.159
223	1.428
223	0.493
223	0.845
223	0.287
223	0.767
223	0.943
223	0.432
223	0.338
223	1.122
251	2.479
251	1.846
251	1.771
251	1.837
251	3.455
251	0.716
251	2.448
251	2.884
251	1.353
251	0.942
323	3.703
323	6.494
323	4.184
323	3.827
323	2.913
323	1.626
323	1.936
323	3.752
323	2.305
323	3.638];
data.tW(:,2);
data.tW(:,2) = data.tW(:,2)/ 1000; % convert mg to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'}; 
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Gaia2016';
comment.tW = 'Measurements from cohort cultures, age classes 0-14 days, 14-47 days, 47-75 days, 75-119 days, 119-173 days, 173-223 days, 223-251 days and 251-323 days';

% t-L2 data
% data from gerard & poullain 2005 size vs time summed - AGE UNKNOWN
data.tL2 = [[0 7 14 21 28 35 42 49 56 63 70 77]; %time since start of experiment
    0.1319 0.1471 0.1503 0.1597 0.1874 0.2023 0.2328 0.2453 0.2625 0.2895 0.3223 0.3320]'; % shell length at f and T
units.tL2   = {'d', 'cm'};  label.tL2 = {'time since start experiment', 'shell length'};  
temp.tL2  = C2K(20);  units.temp.tL2 = 'K'; label.temp.tL2 = 'temperature';
bibkey.tL2 = 'GeraPoul2005';


% t-L3 data
% data from gerard & poullain 2005 size vs time summed "adults"- AGE UNKNOWN
data.tL3 = [0 7 14 21 28 35 ; %time since start of experiment
    0.4070 0.4087 0.4124 0.4152 0.4186 0.4206]'; % shell length at f and T
units.tL3   = {'d', 'cm'};  label.tL3 = {'time since start experiment', 'shell length'};  
temp.tL3  = C2K(20);  units.temp.tL3 = 'K'; label.temp.tL3 = 'temperature';
bibkey.tL3 = 'GeraPoul2005';

%  L-Ww data
% Length vs. wet mass
data.LWw = [...	length, (mm)	Wet mass, (mg)
0.24	0.038
0.36	0.045
0.36	0.166
0.48	0.105
0.24	0.047
0.36	0.026
0.36	0.045
0.36	0.0528
0.36	0.018
0.36	0.056
0.48	0.084
0.72	0.22
0.48	0.106
0.48	0.051
0.48	0.055
0.48	0.06
0.48	0.036
0.72	0.115
0.48	0.044
0.48	0.109
0.72	0.123
0.6	    0.101
0.96	0.208
0.96	0.236
0.84	0.217
1.08	0.28
0.72	0.146
0.72	0.129
0.72	0.104
0.72	0.148
1.2	    0.93
0.72	0.146
0.84	0.201
0.96	0.32
1.08	0.287
0.84	0.15
0.72	0.157
1.08	0.269
0.84	0.227
0.96	0.297
1.56	0.643
1.44	0.483
1.08	0.365
1.32	0.468
1.08	0.324
1.08	0.338
1.32	0.312
1.08	0.634
0.96	0.305
0.72	0.159
2.28	1.428
1.32	0.493
1.32	0.845
1.08	0.287
1.56	0.767
1.68	0.943
1.2     0.432
1.08	0.338
1.92	1.122
2.88	2.479
2.64	1.846
2.76	1.771
2.4     1.837
3.24	3.455
1.56	0.716
2.88	2.448
3       2.884
2.28	1.353
1.56	0.942
3.36	3.703
4.32	6.494
3.36	3.827
3.12	2.913
2.52	1.626
2.76	1.936
3.36	3.752
2.64	2.305
3.84	3.638];
data.LWw(:,1) = data.LWw(:,1)/10; %convert mm to cm
data.LWw(:,2) = data.LWw(:,2)/1000; %convert mg to g
units.LWw   = {'cm', 'g'};  label.LWw = {'length', 'wet weight'}; 
temp.LWw  = C2K(20); units.temp.LWw = 'K'; label.temp.LWw = 'temperature'; 
bibkey.LWw = 'Gaia2016';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = weights.Lb * 30;  %gives a better fit / focuses on Lb
weights.Wdi = weights.Wdi * 30;  %gives a better fit / focuses on Wdi
weights.tp = weights.tp * 30;  %gives a better fit / focuses on tp

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'The tL-dataset of GeraPoul2005 has been split up, because we think the "adults" are food limited. This is indicated by slower growth after reaching 0.3320 cm. Therefore during parametrisation the "adults" (tL3) got a lower f than the younger snails (tL2) ';
D2 = 'Gaia2016 are measurements from cohort cultures, age classes 0-14 days, 14-47 days, 47-75 days, 75-119 days, 119-173 days, 173-223 days, 223-251 days and 251-323 days';
metaData.discussion = struct('D1', D1, 'D2', D2);
%% Facts
F1 = '\emph{Potamopyrgus antipodarum} is ovoviviparous and parthenogenic.';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);
%% Acknowledgment
metaData.acknowledgment = 'This entry was financially supported by the CEFIC Long-range Research Initiative (project number ECO28)';

%% Links
metaData.links.id_CoL = '4M4N5'; % Cat of Life
metaData.links.id_ITIS = '205006'; % ITIS
metaData.links.id_EoL = '586334'; % Ency of Life
metaData.links.id_Wiki = 'Potamopyrgus_antipodarum'; % Wikipedia
metaData.links.id_ADW = 'Potamopyrgus_antipodarum'; % ADW
metaData.links.id_Taxo = '155529'; % Taxonomicon
metaData.links.id_WoRMS = '147123'; % WoRMS
metaData.links.id_molluscabase = '147123'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Potamopyrgus_antipodarum}}';
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
bibkey = 'PedeSelc2009'; type = 'Article'; bib = [ ... 
'author = {Pedersen, S. and Selck, H. and Salvito, D. and Forbes, V. E.}, ' ... 
'year = {2009}, ' ...
'title = {Effects of the polycyclic musk {H}{H}{C}{B} on individual- and population-level endpoints in \emph{Potamopyrgus antipodarum}}, ' ...
'journal = {Ecotoxicology and Environmental Safety}, ' ...
'volume = {72}, ' ...
'number = {4}, '...
'pages = {1190--1199}, '...
'DOI = {10.1016/j.ecoenv.2008.10.012}, '...
'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S0147651308003126}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GustBuro2009'; type = 'Article'; bib = [ ... 
'author = {Gust, M. and Buronfosse, T. and Giamberini, L. and Ramil, M. and Mons, R. and Garric, J.}, ' ... 
'year = {2009}, ' ...
'title = {Effects of fluoxetine on the reproduction of two prosobranch mollusks: \emph{Potamopyrgus antipodarum} and \emph{Valvata piscinalis}}, ' ...
'journal = {Environmental Pollution}, ' ...
'volume = {157}, ' ...
'pages = {423--429}, '...
'DOI = {10.1016/j.envpol.2008.09.040},'...
'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S0269749108004867}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GustBuro2011'; type = 'Article'; bib = [ ... 
'author = {Gust, M. and Buronfosse, T. and Andr\''{e}, C. and Mons, R. and Gagn\''{e}, F. and Garric, J.}, ' ... 
'year = {2011}, ' ...
'title = {Is exposure temperature a confounding factor for the assessment of reproductive parameters of {N}ew {Z}ealand mudsnails \emph{Potamopyrgus antipodarum} ({G}ray)?}, ' ...
'journal = {Aquatic Toxicology}, ' ...
'volume = {101}, ' ...
'pages = {396--404}, '...
'DOI = {10.1016/j.aquatox.2010.11.013},'...
'howpublished = {\url{http://www.sciencedirect.com/science/article/pii/S0166445X10004303}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'GeraPoul2005'; type = 'Article'; bib = [ ... 
'author = {Gerard, C. and Poullain, V.}, ' ... 
'year = {2005}, ' ...
'title = {Variation in the response of the invasive species \emph{Potamopyrgus antipodarum} ({S}mith) to natural (cyanobacterial toxin) and anthropogenic (herbicide atrazine) stressors}, ' ...
'journal = {Environmental Pollution}, ' ...
'volume = {138}, ' ...
'pages = {28--33}, '...
'DOI = {10.1016/j.envpol.2005.02.028}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'EkloAust2017'; type = 'Article'; bib = [ ... 
'author = {Ekloef, A. A. and Bergstroem, U. and Donadi, S. and Eriksson, B.K. and Hansen, J. and Sundblad, G.}, ' ... 
'year = {2017}, ' ...
'title = {Size matters: relationships between body size, dry weight and ash-free dry weight of common coastal, aquatic invertebrates in the {B}altic sea}, ' ...
'journal = {PeerJ}, ' ...
'volume = {5:e2906}, ' ...
'DOI = {10.7717/peerj.2906}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Wall1992'; type = 'Article'; bib = [ ... 
'author = {Wallace, C.}, ' ... 
'year = {1992}, ' ...
'title = {Parthenogenesis, Sex and Chromosomes in \emph{Potamopyrgus}}, ' ...
'journal = {Journal of Molluscan Studies }, ' ...
'volume = {58}, ' ...
'pages = {93--107}, '...
'DOI = {10.1093/mollus/58.2.93},'...
'howpublished = {\url{http://mollus.oxfordjournals.org/content/58/2/93.abstract}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Wint1970'; type = 'Article'; bib = [ ... 
'author = {Winterbourn, M.}, ' ... 
'year = {1970}, ' ...
'title = {The {N}ew {Z}ealand Species of \emph{Potamopyrgus} ({G}astropoda: {H}ydrobiidae)}, ' ...
'journal = {Malacologia}, ' ...
'volume = {10}, ' ...
'pages = {283--321}, '...
'howpublished = {\url{http://biostor.org/reference/59543}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'Gaia2016'; type = 'Misc'; bib = [ ...
'author = {Gaiac}, ' ...
'note = {Unpublished}, ' ...
'year = {2016}'];
 metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

%
