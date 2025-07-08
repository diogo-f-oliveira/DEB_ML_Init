function [data, auxData, metaData, txtData, weights] = mydata_Abudefduf_vaigiensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Abudefduf_vaigiensis'; 
metaData.species_en = 'Indo-Pacific sergeant'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.2); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; }; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 03];

%% set data
% zero-variate data

data.ab = 21;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.2);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on P. amboinensis';
data.am = 4*365;   units.am = 'd';    label.am = 'life span';                  bibkey.am = 'Murt2002';   
  temp.am = C2K(28.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SudhSham2009';
data.Li  = 20;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.7e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.7 mm and egg diameter 1.4 mm of P. amboinensis: pi/6*0.17*0.14^2';
data.Wwp = 50.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwp = 'based on 0.02455*Lp^3.07, see F1';
data.Wwi = 242;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02455*Li^3.07, see F1';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), total length (mm)
133.418	76.374
226.701	98.060
285.817	118.142
316.731	117.699
347.645	125.628
365+13.559	130.417
365+74.302	140.012
365+131.248	146.521
365+225.617	161.912];
data.tL(:,1) = data.tL(:,1) + 30; % set origin at birth
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Murt2002';

% length-weight
data.LW_f = [ ... % log length (mm) log weight (g)
1.965	1.157
1.971	1.201
1.974	1.270
1.975	1.240
1.979	1.299
1.988	1.299
1.991	1.333
1.993	1.299
1.993	1.245
1.996	1.358
1.997	1.309
1.997	1.250
2.000	1.294
2.000	1.407
2.001	1.250
2.006	1.353
2.011	1.348
2.012	1.314
2.012	1.368
2.014	1.275
2.018	1.319
2.018	1.373
2.022	1.382
2.023	1.412
2.026	1.373
2.030	1.407
2.030	1.343
2.034	1.431
2.034	1.480
2.039	1.397
2.039	1.387
2.040	1.461
2.040	1.422
2.040	1.353
2.041	1.387
2.041	1.412
2.042	1.441
2.042	1.480
2.049	1.422
2.050	1.515
2.052	1.544
2.053	1.490
2.053	1.461
2.055	1.441
2.055	1.436
2.057	1.500
2.058	1.559
2.061	1.441
2.062	1.500
2.064	1.461
2.065	1.495
2.066	1.554
2.068	1.490
2.069	1.559
2.077	1.544
2.079	1.618
2.080	1.583
2.083	1.569
2.083	1.632
2.084	1.539
2.087	1.618
2.087	1.647
2.087	1.505
2.092	1.598
2.094	1.559
2.094	1.593
2.095	1.554
2.096	1.627
2.096	1.652
2.100	1.578
2.100	1.593
2.101	1.637
2.104	1.657
2.105	1.603
2.108	1.598
2.112	1.662
2.112	1.642
2.113	1.613
2.115	1.681
2.115	1.627
2.118	1.593
2.118	1.618
2.118	1.652
2.119	1.691
2.121	1.642
2.122	1.730
2.122	1.701
2.122	1.672
2.122	1.618
2.125	1.662
2.125	1.711
2.126	1.627
2.126	1.657
2.127	1.691
2.128	1.711
2.128	1.632
2.131	1.686
2.131	1.672
2.133	1.740
2.135	1.701
2.136	1.755
2.138	1.657
2.138	1.696
2.138	1.730
2.140	1.701
2.140	1.750
2.144	1.750
2.144	1.711
2.147	1.735
2.151	1.789
2.153	1.770
2.154	1.814
2.156	1.765
2.156	1.789
2.160	1.784
2.160	1.804
2.171	1.784
2.173	1.794
2.177	1.799];
data.LW_f = 10.^data.LW_f; % remove log transform
data.LW_f(:,1) = data.LW_f(:,1)/10;  % convert mm to cm
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length','weight','females'};  
bibkey.LW_f = 'SudhSham2009';
%
data.LW_m = [ ... % log length (mm) log weight (g)
1.873	0.911
1.910	1.017
1.924	1.052
1.930	1.058
1.956	1.251
1.972	1.239
1.976	1.239
1.976	1.303
1.990	1.327
1.995	1.251
1.998	1.315
2.002	1.350
2.006	1.321
2.009	1.362
2.010	1.280
2.014	1.333
2.015	1.309
2.018	1.356
2.022	1.380
2.022	1.415
2.025	1.420
2.025	1.385
2.030	1.327
2.032	1.385
2.032	1.426
2.034	1.344
2.036	1.397
2.042	1.473
2.045	1.415
2.050	1.502
2.053	1.467
2.056	1.514
2.062	1.479
2.071	1.473
2.077	1.538
2.078	1.461
2.079	1.497
2.081	1.520
2.087	1.543
2.088	1.514
2.091	1.608
2.093	1.684
2.094	1.590
2.095	1.573
2.099	1.655
2.101	1.549
2.101	1.526
2.103	1.684
2.110	1.608
2.114	1.690
2.114	1.631
2.115	1.742
2.117	1.660
2.118	1.620
2.123	1.754
2.125	1.678
2.125	1.614
2.126	1.620
2.128	1.666
2.130	1.666
2.132	1.801
2.132	1.713
2.132	1.678
2.134	1.742
2.136	1.713
2.137	1.760
2.137	1.701
2.138	1.672
2.139	1.660
2.142	1.707
2.143	1.678
2.145	1.748
2.145	1.807
2.147	1.731
2.147	1.766
2.150	1.742
2.151	1.737
2.154	1.778
2.155	1.725
2.155	1.725
2.157	1.865
2.159	1.848
2.160	1.701
2.160	1.742
2.160	1.813
2.161	1.789
2.164	1.813
2.166	1.748
2.170	1.772
2.174	1.865
2.174	1.824
2.176	1.783
2.180	1.871
2.181	1.842
2.188	1.871
2.192	1.877
2.196	1.877
2.198	1.848];
data.LW_m = 10.^data.LW_m; % remove log transform
data.LW_m(:,1) = data.LW_m(:,1)/10;  % convert mm to cm
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length','weight','males'};  
bibkey.LW_m = 'SudhSham2009';

% weight-fecundity
data.WN = [ % ... weight (g), fecundity (#)
32.796	21317.852
36.809	16180.445
37.173	38003.319
38.693	15844.898
39.179	19970.698
39.240	10692.613
39.970	16881.310
40.213	12243.178
40.699	10183.412
41.307	13966.092
42.036	27199.467
42.158	16203.424
42.219	34244.923
42.340	9675.000
42.888	29608.620
43.131	12083.892
43.191	20847.039
43.191	14146.008
43.252	24455.548
43.617	24628.936
43.799	21536.936
44.043	13977.843
44.103	17414.532
44.650	17245.058
44.954	26524.715
45.319	14326.968
45.502	18795.107
45.988	12783.454
46.596	23095.341
46.717	18800.329
46.717	16738.474
47.447	17428.893
47.629	11415.932
47.751	20522.982
48.298	18978.939
48.359	12449.990
48.602	14341.069
49.453	14172.904
50.608	35655.531
50.608	26549.000
51.520	27583.844
52.614	29306.758
52.918	13328.684
53.040	16421.989
53.587	23640.833
55.593	41518.866
56.079	23479.718
56.322	29494.508
57.599	20565.284
58.936	22117.419];
units.WN   = {'g', '#'};  label.WN = {'weight','fecundity'};  
temp.WN    = C2K(28.2);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'SudhSham2009';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Length-weight:  Ww in g = 0.02455*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8MT7'; % Cat of Life
metaData.links.id_ITIS = '615032'; % ITIS
metaData.links.id_EoL = '65340408'; % Ency of Life
metaData.links.id_Wiki = 'Abudefduf_vaigiensis'; % Wikipedia
metaData.links.id_ADW = 'Abudefduf_vaigiensis'; % ADW
metaData.links.id_Taxo = '159807'; % Taxonomicon
metaData.links.id_WoRMS = '212879'; % WoRMS
metaData.links.id_fishbase = 'Abudefduf-vaigiensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Abudefduf_vaigiensis}}';
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
bibkey = 'Murt2002'; type = 'techreport'; bib = [ ... 
'author = {Murty, V.S.}, ' ... 
'year = {2002}, ' ...
'title = {Marine ornamental fish resources of {L}akshadweep}, ' ...
'institution = {CMFRI Spec. Publ.}, ' ...
'volume = {72}, ' ...
'howpublished = {\url{https://eprints.cmfri.org.in/3536/1/Special_Publication_No_72.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SudhSham2009'; type = 'Article'; bib = [ ... 
'doi = {10.33997/j.afs.2009.22.4.006}, ' ...
'author = {G.V.S. Sudhakari and A. Shameem}, ' ... 
'year = {2009}, ' ...
'title = {Reproductive Biology, Length-Weight Relationship and Population Parameters of a Marine Ornamental Fish \emph{Abudefduf vaigiensis} ({Q}uoy \& {G}aimard, 1825) ({O}steichthys, {P}omacentridae) from the Shallow Waters of {V}isakhapatnam {C}oast}, ' ...
'journal = {Asian Fisheries Science}, ' ...
'volume = {22}, ' ...
'pages = {1117-1129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Abudefduf-vaigiensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
