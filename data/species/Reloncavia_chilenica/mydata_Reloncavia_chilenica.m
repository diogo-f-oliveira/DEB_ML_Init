function [data, auxData, metaData, txtData, weights] = mydata_Reloncavia_chilenica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cyamioida'; 
metaData.family     = 'Cyamiidae';
metaData.species    = 'Reloncavia_chilenica'; 
metaData.species_en = 'Bivalve'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mn'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(9); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; }; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 06]; 

%% set data
% zero-variate data

data.am = 365; units.am = 'd';    label.am = 'life span'; bibkey.am = 'Gall1993';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.05; units.Lb  = 'cm';  label.Lb  = 'shell length at birth'; bibkey.Lb  = 'Gall1993';
data.Lp  = 0.3; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Gall1993';
data.Li  = 1.2;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Gall1993';
  comment.tL = 'based on LN data, but somewhat large, in view at growth a 1 yr';

% uni-variate data

% time-length 
data.tL = [ ... % time since birth (mnth), shell length (cm)
    0 0.05 % Lb
    2 0.16 % april
    3 0.18 % may, start of winter
    4 0.21 % june
    5 0.25 % july
    6 0.30 % aug
    7 0.36 % sep
    8 0.45 % oct
    9 0.55 % nov
   10 0.65 % dec, start of summer
   11 0.70 % jan
   12 0.72];% feb
data.tL(:,1) = data.tL(:,1)*30.5; % convert mnth to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Gall1993';
comment.tL = 'Data from an intertidal flat at Queule River, Chili; extracted from frequent counts, but data is noisy';

% length-fecundity
data.LN = [ ... % shell length (cm), number of embryos (#)
0.298	12.284
0.300	32.348
0.318	40.655
0.323	9.955
0.332	17.280
0.340	33.070
0.341	14.034
0.342	24.595
0.344	17.177
0.351	27.692
0.351	39.319
0.351	54.117
0.361	40.292
0.361	47.691
0.362	10.686
0.362	22.313
0.363	33.931
0.370	79.326
0.372	46.541
0.372	51.826
0.372	62.396
0.372	72.966
0.375	15.860
0.380	106.725
0.391	82.321
0.394	60.096
0.400	111.842
0.413	31.398
0.420	73.622
0.431	48.152
0.435	73.492
0.441	99.871
0.444	74.474
0.444	110.413
0.445	93.491
0.454	123.013
0.458	88.094
0.465	53.157
0.465	134.547
0.466	223.335
0.478	78.414
0.480	192.561
0.482	136.521
0.492	169.204
0.492	85.692
0.494	118.450
0.504	157.475
0.505	71.839
0.521	201.729
0.523	47.379
0.526	152.004
0.531	323.210
0.535	76.873
0.540	185.716
0.543	384.414
0.548	154.988
0.549	260.689
0.552	43.966
0.554	115.823
0.563	237.314
0.564	165.428
0.566	135.813
0.575	313.325
0.586	257.201
0.590	129.266
0.591	405.154
0.591	327.983
0.594	107.032
0.595	277.210
0.596	206.381
0.601	387.101
0.614	377.476
0.622	394.323
0.622	345.691
0.624	369.993
0.624	136.377
0.632	229.328
0.641	458.642
0.642	486.115
0.652	37.833
0.656	198.470
0.665	274.509
0.667	455.247
0.671	327.313
0.682	558.722
0.684	465.678
0.691	369.425
0.691	507.902
0.756	41.177
0.791	346.381];
units.LN   = {'cm', '#'};  label.LN = {'shell length', 'fecundity'};  
temp.LN    = C2K(9);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Gall1993';
comment.LN = 'Data from an intertidal flat at Queule River, Chili';
    
% length-weight
data.LWd = [ ... % shell length (cm), dry weight (mg)
0.302	0.384
0.314	0.427
0.322	0.488
0.323	0.497
0.355	0.689
0.363	0.759
0.365	0.663
0.375	0.637
0.386	0.689
0.387	0.794
0.390	0.654
0.395	0.654
0.399	0.776
0.418	0.855
0.420	0.733
0.430	0.924
0.442	1.090
0.451	1.116
0.451	0.924
0.460	0.933
0.461	1.247
0.462	1.064
0.480	1.352
0.480	1.160
0.491	1.221
0.491	1.169
0.501	1.465
0.535	1.927
0.555	1.927
0.568	2.076
0.588	1.779
0.608	2.041
0.643	2.520];
data.LWd(:,2) = data.LWd(:,2)/1e3; % convert mg to g
units.LWd   = {'cm', 'g'};  label.LWd = {'shell length', 'tissue dry weight'};  
bibkey.LWd = 'GallFilu2006';
comment.LWd = 'Data for males, females loose weight during brooding';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.v = 5 * weights.psd.v;
%weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% discussion
D1 = 'Temperatures in C for tL data varies in time in d as T(t)=14+8*sin(2*pi*(t-180)/365)';
D2 = 'I invented the order-name Cyamioida myself, to comply to the species-list format; molluscabase has no order-level for this taxon';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Eggs/embryos are brooded in the hemibranchial chambers';
metaData.bibkey.F1 = 'Gall1993'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RR6Q'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46471844'; % Ency of Life
metaData.links.id_Wiki = ''; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3980592'; % Taxonomicon
metaData.links.id_WoRMS = '505210'; % WoRMS
metaData.links.id_molluscabase = '505210'; % molluscabase


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
bibkey = 'Gall1993'; type = 'Article'; bib = [ ... 
'author = {C. S. Gallardo}, ' ... 
'year = {1993}, ' ...
'title = {Reproductive habits and life cycle of the small clam \emph{Kingiella chilenica} ({B}ivalvia: {C}yamiidae) in an estuarine sand flat from the {S}outh of {C}hile}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {115}, ' ...
'pages = {595-603}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GallFilu2006'; type = 'Article'; bib = [ ... 
'author = {Carlos S. Gallardo and Marcela Fil\''{u}n and Cristian Manque}, ' ... 
'year = {2006}, ' ...
'title = {\emph{Kingiella chilenica} ({B}ivalvia: {C}yamiidae); population dynamics, rates of survival, embryo production and annual recruitment of a semelparous brooding clam}, ' ...
'journal = {J. Mar. Biol. Ass. U.K.}, ' ...
'volume = {86}, ' ...
'pages = {757-766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

