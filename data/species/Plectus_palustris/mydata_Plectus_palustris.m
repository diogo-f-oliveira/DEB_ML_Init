function [data, auxData, metaData, txtData, weights] = mydata_Plectus_palustris

%% set metaData
metaData.phylum     = 'Nematoda'; 
metaData.class      = 'Chromadorea'; 
metaData.order      = 'Plectida'; 
metaData.family     = 'Plectidae';
metaData.species    = 'Plectus_palustris'; 
metaData.species_en = 'Roundworm'; 

metaData.ecoCode.climate = {'A', 'B', 'C', 'D'};
metaData.ecoCode.ecozone = {'TH', 'TN', 'TP', 'TA'};
metaData.ecoCode.habitat = {'0iFm'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Ap'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap_f'; 'am_f'; 'Wwb_f'; 'Wwp_f'; 'Wwi_f'; 'Ri_f'}; 
metaData.data_1     = {'t-W_f'; 't-JO_f'; 'T-ab'}; 

metaData.COMPLETE = 2.9; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2024 11 18];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 18];

%% set data
% zero-variate data

data.tp_1 = 12.5;   units.tp_1 = 'd';    label.tp_1 = 'time since birth at puberty at high food'; bibkey.tp_1 = 'KlekSchi1979';
  temp.tp_1 = C2K(20);  units.temp.tp_1 = 'K'; label.temp.tp_1 = 'temperature';
data.tp_0 = 18.5;   units.tp_0 = 'd';    label.tp_0 = 'time since birth at puberty at low food'; bibkey.tp_0 = 'KlekSchi1979';
  temp.tp_0 = C2K(20);  units.temp.tp_0 = 'K'; label.temp.tp_0 = 'temperature';
data.am_1 = 17;      units.am_1 = 'd';    label.am_1 = 'life span at high food';                bibkey.am_1 = 'KlekSchi1979';   
  temp.am_1 = C2K(20);  units.temp.am_1 = 'K'; label.temp.am_1 = 'temperature'; 
data.am_0 = 26;      units.am_0 = 'd';    label.am_0 = 'life span at low food';                bibkey.am_0 = 'KlekSchi1979';   
  temp.am_0 = C2K(20);  units.temp.am_0 = 'K'; label.temp.am_0 = 'temperature'; 

data.Wwb_1 = 0.041; units.Wwb_1 = 'mug'; label.Wwb_1 = 'wet weight at birth at high food'; bibkey.Wwb_1 = 'SchiDunc1980';
data.Wwb_0 = 0.04;  units.Wwb_0 = 'mug'; label.Wwb_0 = 'wet weight at birth at low food'; bibkey.Wwb_0 = 'SchiDunc1980';
data.Wwp_1 = 1.49;  units.Wwp_1 = 'mug'; label.Wwp_1 = 'wet weight at puberty at high food';   bibkey.Wwp_1 = 'SchiDunc1980';
data.Wwp_0 = 1.12;  units.Wwp_0 = 'mug'; label.Wwp_0 = 'wet weight at puberty at low food';   bibkey.Wwp_0 = 'SchiDunc1980';
data.Wwi_1 = 2.4;   units.Wwi_1 = 'mug'; label.Wwi_1 = 'ultimate wet weight at high food';     bibkey.Wwi_1 = 'KlekSchi1979';
data.Wwi_0 = 1.5;   units.Wwi_0 = 'mug'; label.Wwi_0 = 'ultimate wet weight at low food';     bibkey.Wwi_0 = 'KlekSchi1979';

data.Ri_1  = 37.7;    units.Ri_1  = '#/d'; label.Ri_1  = 'maximum reprod rate';     bibkey.Ri_1  = 'SchiDunc1980';   
  temp.Ri_1 = C2K(20);  units.temp.Ri_1 = 'K'; label.temp.Ri_1 = 'temperature';
data.Ri_0  = 12.6;    units.Ri_0  = '#/d'; label.Ri_0  = 'maximum reprod rate';     bibkey.Ri_0  = 'SchiDunc1980';   
  temp.Ri_0 = C2K(20);  units.temp.Ri_0 = 'K'; label.temp.Ri_0 = 'temperature';
 
% uni-variate data

% time-weight-respiration
data.tWJO_1 = [ ... % time since birth (d), weight (mug), respiration (nL/h.ind)
    2.000 0.071 0.154
    2.001 0.071 0.124
    2.002 0.081 0.172
    2.003 0.072 0.223
    2.004 0.070 0.175
    2.005 0.069 0.216
    2.006 0.087 0.174
    2.007 0.060 0.238
    6.000 0.483 0.638
    6.001 0.390 0.340
    6.002 0.474 0.618
    6.003 0.289 0.469
    6.004 0.590 0.842
    6.005 0.465 0.623
    6.006 0.512 0.571
    6.007 0.500 0.657
    9.000 1.109 1.580
    9.001 1.138 1.400
    9.002 1.150 1.450
    9.003 0.896 1.150
    9.004 1.346 1.190
    9.005 1.189 1.660
    9.006 0.635 0.969
   11.000 1.460 1.630
   11.001 1.170 1.190
   11.002 1.593 1.790
   11.003 1.387 1.490
   11.004 1.332 1.270
   11.005 1.350 1.440
   11.006 0.979 0.891
   11.007 1.221 1.330
   13.000 1.836 1.040
   13.001 1.214 1.510
   13.002 1.090 1.430
   13.003 1.557 2.400
   13.004 1.741 2.940
   13.005 1.356 2.200
   13.006 1.686 2.870
   13.007 1.819 2.420
   17.000 2.450 1.720
   17.001 2.250 1.690
   17.002 2.300 1.490
   17.003 2.351 1.970
   17.004 2.193 1.740
   17.005 2.387 1.870
   17.006 2.380 2.110
   17.007 2.268 1.900];
units.tWJO_1  = {'d', '{\mu}g', 'nL/h'};  label.tWJO_1 = {'time', 'weight', 'O_2 consumption'};  
temp.tWJO_1   = C2K(20);  units.temp.tWJO_1 = 'K'; label.temp.tWJO_1 = 'temperature'; 
bibkey.tWJO_1 = 'KlekSchi1979'; treat.tWJO_1 = {1 {'weight','respiration'}};
comment.tWJO_1 = 'high food'; label.treat.tWJO_1 = 'high food';
%
data.tWJO_0 = [ ... % time since birth (d), weight (mug), respiration (nL/h.ind)
    3.000 0.071 0.124
    3.001 0.072 0.157
    3.002 0.125 0.283
    3.003 0.120 0.254
    7.000 0.182 0.336
    7.001 0.150 0.168
    7.002 0.166 0.246
    7.003 0.155 0.216
    7.004 0.179 0.269
    7.005 0.267 0.354
   12.000 0.661 0.569
   12.001 0.476 0.499
   12.002 0.619 0.600
   12.003 0.395 0.348
   12.004 0.385 0.383 
   12.005 0.438 0.397
   12.006 0.483 0.480 
   12.007 0.393 0.596
   16.000 0.800 0.935
   16.001 0.820 0.909
   16.002 0.738 0.705
   16.003 0.927 1.030
   16.004 0.652 0.971
   16.005 0.931 0.998
   16.006 0.841 1.240
   16.007 0.791 1.100
   19.000 1.175 1.270
   19.001 1.175 1.320
   19.002 1.156 1.380
   19.003 1.161 1.430
   19.004 1.001 1.130
   19.005 1.079 1.240
   19.006 1.141 1.380
   26.000 1.450 1.150
   26.001 1.450 1.060
   26.002 1.400 1.350
   26.003 1.300 1.270
   26.004 1.250 1.410
   26.005 1.475 0.830
   26.006 1.500 1.290];
units.tWJO_0  = {'d', '{\mu}g', 'nL/h'};  label.tWJO_0 = {'time', 'weight', 'O_2 consumption'};  
temp.tWJO_0   = C2K(20);  units.temp.tWJO_0 = 'K'; label.temp.tWJO_0 = 'temperature'; 
bibkey.tWJO_0 = 'KlekSchi1979'; treat.tWJO_0 = {1 {'weight','respiration'}};
comment.tWJO_0 = 'low food'; label.treat.tWJO_0 = 'low food';

% temperature-age at birth
data.Tab = [ ... % temperature (C), ab (h)
     5 655
    15 116
    20 72];
data.Tab(:,2) = data.Tab(:,2)/24; % convert h to d
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'SchiDunc1980'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi_1 = 3 * weights.Wwi_1;
weights.Wwi_0 = 3 * weights.Wwi_0;
%weights.Tab = 0 * weights.Tab;
weights.Ri_1 = 5 * weights.Ri_1;
weights.Ri_0 = 5 * weights.Ri_0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Food levels 6e8-9e3 and 6e9-9e9 cells Actinetobacter/ml; dry weight 0.269e-12 g/cell; distribution unknown, global assumed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Parthenogenetic, freshwater';
metaData.bibkey.F1 = 'SchiDunc1980'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '88YLR'; % Cat of Life
metaData.links.id_ITIS = '59871'; % ITIS
metaData.links.id_EoL = '481575'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = 'Plectus_palustris'; % ADW
metaData.links.id_Taxo = '13744'; % Taxonomicon
metaData.links.id_WoRMS = '229344'; % WoRMS

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
bibkey = 'SchiDunc1980'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00572681}, ' ...
'author = {Schiemer, F. and A. Duncan and R. Z. Klekowski}, ' ... 
'year = {1980}, ' ...
'title = {A bioenergetic study of a benthic nematode, \emph{Plectus palustris} de {M}an 1880, throughout its life cycle: {II}. {G}rowth, fecundity and energy budgets at different densities of bacterial food and general ecological considerations}, ' ...
'journal = {Oecologia}, ' ...
'volume = {44}, ' ...
'pages = {205-212}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KlekSchi1979'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF00346410}, ' ...
'author = {R. Z. Klekowski and Schiemer, F. and A. Duncan}, ' ... 
'year = {1980}, ' ...
'title = {A bioenergetic study of a benthic nematode, \emph{Plectus palustris} de {M}an 1880, throughout its life cycle: {I}. {R}espiratory metabolism at different densities of bacterial food}, ' ...
'journal = {Oecologia}, ' ...
'volume = {44}, ' ...
'pages = {119-124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
