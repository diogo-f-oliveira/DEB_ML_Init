function [data, auxData, metaData, txtData, weights] = mydata_Buccinum_undatum

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Neogastropoda'; 
metaData.family     = 'Buccinidae';
metaData.species    = 'Buccinum_undatum'; 
metaData.species_en = 'Common whelk'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCim'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L','L-Ww', 'Wd-JO_T'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine','Bas Kooijman'};    
metaData.date_subm = [2017 02 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 02 01]; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 22];

%% set data
% zero-variate data

data.tp = 6*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'marlin';
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'marlin';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;    units.Lp  = 'cm';  label.Lp  = 'shell diam at puberty'; bibkey.Lp  = 'HaigPant2015';
  comment.Lp = 'Varies considerably: 4.5 till 7.6 cm in England';
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate shell length'; bibkey.Li  = 'marlin';

data.Wwb = 8.2e-6;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'marlin';
  comment.Wwb = 'Based on egg diameter of 250 mum:  4/3*pi*0.0125^3';

data.Ri  = 11500/365; units.Ri  = '#/d'; label.Ri = 'max reproduction rate';  bibkey.Ri  = 'marlin';   
  temp.Ri = C2K(12); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'marlin just gives fecundity 11500; the assumption is that this is the yearly number of eggs of an individual of 6 cm at 12 C';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), shell height (cm)
 3	3.895
 3	5.333
 4	4.982
 4	6.456
 4	4.456
 4 	4.596
 4	4.807
 4	4.877
 4	5.509
 4	5.649
 4	6.175
 4	5.368
 4	5.754
 4	5.860
 4	5.965
 4	6.035
 5	4.702
 5	4.947
 5	5.123
 5	5.544
 5	5.684
 5	5.825
 5	5.930
 5	6.000
 5	6.140
 5	6.246
 5	6.281
 5	6.421
 5	6.632
 5	6.702
 5	6.912
 5	7.088
 5	6.526
6.043	5.158
6.044	5.579
6.044	5.965
6.045	6.070
6.045	6.211
6.045	6.421
6.046	6.526
6.046	6.667
6.046	6.772
6.061	6.842
6.061	6.912
6.061	6.982
6.061	7.053
6.062	7.368
6.062	7.544
6.063	7.614
6.063	7.684
6.063	7.754
6.063	7.825
6.064	8.211
6.064	8.491
7.056	8.982
7.064	5.544
7.065	6.105
7.065	6.211
7.065	6.281
7.065	6.421
7.066	6.526
7.066	6.596
7.066	6.947
7.067	7.368
7.068	7.474
7.068	7.544
7.068	7.684
7.068	7.895
7.069	8.035
7.069	8.140
7.071	9.053
7.072	9.368
7.072	9.439
7.072	9.579
7.072	9.649
8.033	9.509
8.034	9.965
8.034	10.070
8.044	7.895
8.044	8.000
8.045	8.105
8.045	8.246
8.046	8.807
8.046	8.947
8.047	9.053
8.047	9.123
8.048	9.649
8.050	10.526
8.050	10.632
8.050	10.807
8.056	6.702
8.057	6.807
8.057	6.842
8.057	6.982
8.058	7.368
8.060	8.316
8.063	9.719
8.072	7.123
8.075	8.456
8.075	8.596
9.055	10.316
9.058	12.140
9.059	12.175
9.065	8.105
9.065	8.316
9.065	8.386
9.066	8.772
9.066	8.877
9.067	8.982
9.067	9.123
9.067	9.228
9.067	9.333
9.071	10.982
9.071	11.088
9.071	11.193
9.082	9.509
9.083	9.649
9.083	9.789
9.083	9.860
9.083	9.965
9.084	10.070
9.084	10.175
9.085	10.772
9.093	7.544
10.031	10.491
10.033	11.719
10.041	8.211
10.056	8.316
10.063	11.754
10.071	8.561
10.073	9.474
10.073	9.544
10.073	9.649
10.073	9.754
10.076	10.772
10.076	10.912
10.087	9.228
10.087	9.333
10.089	10.000
10.089	10.105
10.089	10.211
11.093	9.474
11.094	9.789
11.094	9.930
11.094	10.035
11.095	10.491];
data.tL_f(:,1) = data.tL_f(:,1)*365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'shell length', 'female'};  
temp.tL_f    = C2K(14);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ShelAdam2006';
comment.tL_f = 'Data for females at Shetland';
%
data.tL_m = [ ... % time since birth (yr), shell height (cm)
3.038	5.958
4.044	5.015
4.045	5.085
4.045	5.225
4.045	5.505
4.046	5.750
4.047	6.030
4.047	6.170
4.047	6.275
4.047	6.380
5.042	6.768
5.053	4.913
5.053	5.158
5.053	5.228
5.054	5.333
5.054	5.473
5.054	5.578
5.055	5.928
5.055	6.033
5.055	6.173
5.073	7.713
5.074	7.923
5.074	8.168
6.038	8.170
6.039	8.275
6.040	8.520
6.049	6.035
6.052	7.645
6.052	7.750
6.053	7.995
6.055	8.835
6.055	9.220
6.058	10.270
6.062	5.265
6.063	5.930
6.064	6.490
6.065	6.700
6.065	6.805
6.065	6.945
6.066	7.155
7.071	5.793
7.074	7.053
7.074	7.158
7.075	7.438
7.075	7.543
7.075	7.683
7.076	7.963
7.076	8.068
7.076	8.173
7.077	8.313
7.077	8.418
7.077	8.558
7.078	8.698
7.078	8.768
7.078	9.048
7.078	9.118
7.079	9.293
7.079	9.363
7.079	9.538
7.080	9.783
7.081	10.308
7.081	10.448
8.069	7.580
8.069	7.685
8.070	8.140
8.070	8.280
8.071	8.420
8.071	8.525
8.071	8.630
8.071	8.805
8.073	9.330
8.073	9.505
8.073	9.680
8.074	9.785
8.074	10.100
8.075	10.240
8.075	10.345
8.075	10.415
8.075	10.520
8.075	10.695
8.087	8.980
8.087	9.050
8.087	9.190
9.092	7.723
9.093	7.968
9.093	8.073
9.093	8.178
9.094	8.283
9.094	8.563
9.095	8.703
9.095	8.843
9.095	8.983
9.095	9.123
9.096	9.228
9.096	9.403
9.096	9.508
9.097	9.788
9.097	9.963
9.097	10.068
9.098	10.138
9.098	10.243
9.098	10.348
9.099	10.803
9.099	10.838
9.100	11.468
9.128	10.663
10.063	10.700
10.064	11.050
10.065	11.785
10.073	8.705
10.074	8.845
10.074	9.160
10.075	9.265
10.075	9.475
10.075	9.685
10.076	9.790
10.076	9.860
10.076	10.000
10.076	10.105
10.087	8.040
10.088	8.425
10.088	8.565
10.092	10.525
10.106	10.210
10.107	10.350
10.107	10.420
11.083	9.198
11.083	9.478
11.084	9.583
11.084	9.688
11.084	9.863
11.085	9.968
11.085	10.108
11.085	10.248
11.085	10.388
11.086	10.458
11.086	10.598
11.086	10.808
11.087	10.948
11.087	11.088
11.096	8.533
11.097	8.638
11.097	8.708
11.097	8.848
11.097	8.918
11.102	11.403
12.063	9.725
12.063	9.795
12.076	9.025
12.077	9.235
12.077	9.585
12.093	9.935
12.093	10.110
12.094	10.250
12.094	10.565];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'shell length', 'male'};  
temp.tL_m    = C2K(14);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ShelAdam2006';
comment.tL_m = 'Data for males at Shetland';

% length-weight
data.LW = [ ... % 10 log shell length (mm), 10 log flesh wet weight (g)
1.655	1.119
1.655	0.957
1.658	1.097
1.658	1.164
1.661	1.067
1.662	1.156
1.662	1.094
1.663	1.102
1.663	1.044
1.664	1.144
1.665	1.122
1.667	1.119
1.667	0.995
1.667	1.089
1.668	1.137
1.668	1.099
1.669	0.992
1.669	1.112
1.670	1.084
1.672	1.040
1.672	1.085
1.672	1.144
1.674	1.085
1.674	1.070
1.675	1.157
1.675	1.095
1.675	1.125
1.675	1.062
1.675	1.105
1.677	1.142
1.678	1.077
1.679	1.125
1.680	1.127
1.681	1.185
1.682	1.185
1.685	1.092
1.686	1.152
1.687	1.122
1.688	1.098
1.692	1.182
1.692	1.197
1.693	1.205
1.694	1.158
1.694	1.138
1.694	1.232
1.699	1.125
1.699	1.215
1.701	1.163
1.701	1.223
1.701	1.230
1.701	1.248
1.702	1.148
1.702	1.058
1.703	1.235
1.703	1.230
1.704	1.138
1.704	1.220
1.705	1.175
1.705	1.193
1.705	1.203
1.706	1.148
1.708	1.243
1.708	1.208
1.708	1.113
1.709	1.146
1.709	1.158
1.709	1.223
1.711	1.176
1.711	1.223
1.711	1.153
1.713	1.176
1.713	1.263
1.717	1.271
1.718	1.243
1.720	1.193
1.720	1.153
1.721	1.243
1.722	1.188
1.723	1.223
1.723	1.286
1.724	1.286
1.724	1.141
1.725	1.213
1.725	1.233
1.726	1.248
1.726	1.273
1.726	1.316
1.727	1.258
1.728	1.288
1.730	1.236
1.730	1.331
1.732	1.358
1.732	1.231
1.734	1.358
1.734	1.201
1.738	1.241
1.738	1.259
1.738	1.296
1.740	1.221
1.741	1.276
1.741	1.296
1.743	1.251
1.744	1.324
1.744	1.399
1.745	1.309
1.745	1.299
1.745	1.364
1.746	1.291
1.746	1.356
1.747	1.341
1.747	1.279
1.749	1.349
1.752	1.309
1.752	1.359
1.752	1.396
1.753	1.319
1.753	1.249
1.755	1.344
1.757	1.389
1.758	1.314
1.758	1.402
1.758	1.414
1.758	1.374
1.759	1.332
1.760	1.337
1.760	1.267
1.761	1.362
1.761	1.392
1.762	1.429
1.764	1.409
1.765	1.369
1.766	1.449
1.767	1.404
1.769	1.417
1.769	1.464
1.771	1.367
1.772	1.439
1.772	1.452
1.772	1.317
1.773	1.385
1.773	1.417
1.774	1.469
1.776	1.397
1.780	1.460
1.782	1.450
1.782	1.377
1.782	1.485
1.782	1.490
1.782	1.502
1.783	1.457];
data.LW = 10.^data.LW; % remove log tranformation
data.LW(:,1) = data.LW(:,1)/10; % convert mm to cm
units.LW   = {'cm', 'g'};  label.LW = {'shell length', 'flesh wet weight'};  
bibkey.LW = 'HeudHegr2011';
comment.LW = 'Data for males and females';

% weight-respiration
data.WJO7 = [ % ... dry weight (g), O2 consumption (ml/h)
  0.50 0.06
  0.51 0.70
  0.75 0.10
  0.94 0.30
  1.01 0.29
  1.74 0.41
  2.19 0.60
  3.41 0.77
  3.47 1.00
  4.13 0.80
  4.33 0.72
  4.95 1.35
  7.67 2.29
  9.66 2.84
  9.98 3.45
 10.18 1.91
 10.66 2.16
 10.67 0.90
 11.35 1.32
 12.28 2.80
 13.61 4.44
];
units.WJO7   = {'g', 'ml/h'};  label.WJO7 = {'dry weight', 'O_2 consumption', '7.5 C'};  
temp.WJO7    = C2K(7.5);  units.temp.WJO7 = 'K'; label.temp.WJO7 = 'temperature';
bibkey.WJO7 = 'Kide1998';
%
data.WJO10 = [ % ... dry weight (g), O2 consumption (ml/h)
 0.49 0.51
 0.60 0.32
 0.62 0.41
 0.77 0.43
 1.17 0.66
 1.61 0.72
 2.07 0.76
 2.24 1.45
 2.31 0.87
 2.65 1.23
 4.14 0.97
 7.09 1.87
 7.23 2.46
 7.24 2.34
 8.19 1.64
 9.65 2.59
 9.87 2.46
10.30 3.55
11.92 2.37
13.14 4.44
14.49 4.13];
units.WJO10   = {'g', 'ml/h'};  label.WJO10 = {'dry weight', 'O_2 consumption', '10.5 C'};  
temp.WJO10    = C2K(10.5);  units.temp.WJO10 = 'K'; label.temp.WJO10 = 'temperature';
bibkey.WJO10 = 'Kide1998';

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males at Shetland'};
set2 = {'WJO10','WJO7'}; subtitle2 = {'Data at 10.5, 7.5 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Reproduction efficiency set to 0.95/2 because of hermaphroditism';
D2 = 'Males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: males equal to females upto b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Hermaphrodite; direct Development';
metaData.bibkey.F1 = 'marlin'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'NLPP'; % Cat of Life
metaData.links.id_ITIS = '73795'; % ITIS
metaData.links.id_EoL = '46459765'; % Ency of Life
metaData.links.id_Wiki = 'Buccinum_undatum'; % Wikipedia
metaData.links.id_ADW = 'Buccinum_undatum'; % ADW
metaData.links.id_Taxo = '36715'; % Taxonomicon
metaData.links.id_WoRMS = '138878'; % WoRMS
metaData.links.id_molluscabase = '138878'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Buccinum_undatum}}';
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
bibkey = 'Kide1998'; type = 'Article'; bib = [ ... 
'author = {A. E. KIDEYS}, ' ... 
'year = {1998}, ' ...
'title = {Physiological energetics of \emph{Buccinum undatum} {L}. ({G}astropoda) off {D}ouglas, {I}sle of {M}an (the {I}rish {S}ea)}, ' ...
'journal = {Tr. J. Zoology}, ' ...
'volume = {22}, ' ...
'pages = {49--61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeudHegr2011'; type = 'Article'; bib = [ ... 
'author = {C. Heude-Berthelin and L. H\''{e}gron-Mac\''{e} and V. Legrand and A. Jouaux and B. Adeline and M. Mathieu and K. Kellner}, ' ... 
'year = {2011}, ' ...
'title = {Growth and reproduction of the common whelk \emph{Buccinum undatum} in {W}est {C}otentin ({C}hannel), {F}rance}, ' ...
'journal = {Aquat. Living Resour.}, ' ...
'volume = {24}, ' ...
'pages = {317-327}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ShelAdam2006'; type = 'Techreport'; bib = [ ... 
'author = {R. Shelmerdine and J. Adamson and C. Laurenson and B. Leslie}, ' ... 
'year = {2006}, ' ...
'title = {Size variation in populations of the common whelk, \emph{Buccinum undatum}}, ' ...
'institution = {NAFC Marine Centre}, ' ...
'series = {Fisheries Development Note}, ' ...
'number = {24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HaigPant2015'; type = 'Techreport'; bib = [ ... 
'author = {Haig, J. A. and  Pantin, J.R. and Salomonsen, H. and Murray, L. G. and Kaiser, M. J.}, ' ... 
'year = {2015}, ' ...
'title = {The size at maturity for the common whelk, \emph{Buccinum undatum} in {W}elsh waters, with an industry perspective on minimum landing sizes}, ' ...
'institution = {Fisheries & Conservation, Bangor University}, ' ...
'series = {Fisheries Development Note}, ' ...
'number = {50}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6184}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

