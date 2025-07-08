function [data, auxData, metaData, txtData, weights] = mydata_Dermochelys_coriacea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Dermochelyidae';
metaData.species    = 'Dermochelys_coriacea'; 
metaData.species_en = 'Leatherback turtle'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0bTd', 'biMp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCij'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wdb'; 'Wwi'; 'Ri'; 'pXi'; 'pAi'}; 
metaData.data_1     = {'t-L_f'; 't-Ww'; 't-JOe'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Michael Kearney','Bas Kooijman'};    
metaData.date_mod_1     = [2023 06 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 06 13];


%% set data
% zero-variate data

data.ab = 60;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = {'Jone2009','AnAge'};   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 15.3 * 365;     units.ap = 'd';    label.ap = 'age at puberty';    bibkey.ap = 'Jone2009';
  temp.ap = C2K(25);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 30 * 365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 6.31;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Jone2009';  
data.Lp  = 121;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Jone2009'; 
data.Li  = 175;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';

data.Ww0 = 85.5; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';          bibkey.Ww0 = 'Thom1993';
data.Wwb = 46; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Jone2009';
data.Wdb = 9.776; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';         bibkey.Wdb = 'Thom1993';
data.Wwi = 4.2e5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'AnAge';

data.Ri  = 8 * 70/ (4 * 365);    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Jone2009';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = ' 8 clutches, 70 eggs/clutch, nesting each 4 yr (wild guess, see "Facts")';

data.pAm  = 0.4;    units.pAm  = 'W/kg'; label.pAm  = 'mass-specific metabolic rate '; bibkey.pAm  = 'Jone2009';   
  temp.pAm = C2K(20);  units.temp.pAm = 'K'; label.temp.pAm = 'temperature';
  comment.pAm = 'about 350 kg; assume that production is small and metab rate corrspronds to assim rate'; 

data.pXm  = 0.54;    units.pXm  = 'W/kg'; label.pXm  = 'maximum intake of jellyfish of fully grown individual'; bibkey.pXm  = 'Jone2009';   
  temp.pXm = C2K(20);  units.temp.pXm = 'K'; label.temp.pXm = 'temperature';
  comment.pXm = 'about 350 kg, 82 kg jelly fish/d for 250-450 kg turtle wit 200 J/g  = 82/350*200000/24/60/60 W/kg';

% uni-variate data
% SCL = straight carapace length
tLW = [ ... (sime since birth (yr) SCL (cm) weight (kg)
0.003 6.31  0.046
0.01  6.53  0.05
0.03  7.22  0.06
0.05  7.81  0.08
0.07  8.31  0.10
0.08  8.91  0.12
0.10  9.59  0.15
0.12 10.28  0.18
0.14 10.76  0.21
0.16 11.33  0.24
0.18 12.10  0.28
0.20 12.77  0.32
0.22 13.20  0.37
0.24 13.64  0.41
0.26 14.35  0.45
0.28 14.92  0.51
0.30 15.49  0.56
0.32 16.04  0.62
0.33 16.49  0.68
0.35 17.50  0.82
0.37  18.23 0.91
0.39 18.88  1.01
0.41 19.41  1.10
0.43 20.10  1.21
0.45 20.55  1.28
0.47 21.19  1.39
0.49 22.04  1.51
0.51 22.61  1.68
0.53 23.68  1.87
0.55 24.40  2.03
0.56 25.14  2.28
0.58 25.82  2.40
0.60 26.27  2.63
0.62 27.57  2.81
0.64 28.10  3.03
0.66 28.61  3.20
0.68 29.31  3.47
0.70 30.21  3.77
0.72 30.92  4.15
0.74 31.74  4.30
0.76 32.29  4.51
0.78 32.89  4.85
0.79 33.36  5.10
0.83 34.30  5.49
0.85 35.21  5.92
0.87 35.36  6.15
0.89 36.21  6.61
0.91 36.81  6.75
0.93 38.26  7.55
0.95 39.06  8.00
0.97 39.75  8.40
0.99 40.44  8.76
1.01 41.28  9.12
1.02 42.61  9.68
1.04 42.53  9.89
1.06 43.21 10.57
1.08 43.75 11.30
1.10 44.97 11.53
1.12 45.46 11.63
1.14 46.02 12.26
1.16 46.08 11.89
1.18 46.34 12.05
1.22 47.36 12.87
1.24 47.57 12.79
1.25 47.86 13.23
1.31 50.30 15.44
1.33 52.00 17.26
1.35 53.10 17.99
1.37 53.90 18.68
1.39 52.60 17.28
1.45 54.50 18.76
1.47 55.45 18.72
1.49 56.30 19.88
1.51 56.10 20.20
1.53 56.70 20.02
1.55 57.10 20.28
1.56 57.70 21.14
1.59 58.20 23.06
1.60 58.70 22.92
1.62 59.50 23.56
1.67 61.50 25.60
1.69 60.20 25.38
1.72 62.50 27.20
1.85 67.00 31.96
1.93 69.00 34.84];
tLW(:,1) = 365 * tLW(:,1); % convert yr to d
tLW(:,3) = 1e3 * tLW(:,3); % convert kg to g
data.tL = tLW(:,1:2);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'straight carapace length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Jone2009';
comment.tL = ['captive animals, fed with Pacific Ocean squid, Todarodes pacificus; '...
  '(mantle and tentacles only), vitamins (ReptaviteTM), and calcium (Rep-CalTM), '...
  'blended with unflavored gelatin in hot water.'];
%
data.tW = tLW(:,[1 3]); 
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Jone2009';

% tL-data from Jone2009, collected from lit; temp 24 C?
data.tL1 = [ ... % SCL (cm), time since birth (yr)
0.061	5.869
0.062	4.338
0.091	13.525
0.092	12.504
0.093	6.890
0.154	14.545
0.156	7.400
0.218	8.421
0.249	13.270
0.279	21.180
0.279	18.373
0.281	10.973
0.312	9.952
0.373	21.180
0.500	14.545
0.529	24.753
0.563	13.270
0.564	10.463
0.594	14.801
0.625	16.587
0.652	40.064
0.654	28.836
0.685	34.450
0.782	21.691
0.810	35.215
0.967	38.788
1.217	46.699
1.279	48.740
1.341	55.885
1.721	43.126
1.904	69.410
3.694	84.976
8.810	131.930
9.880	129.633
13.683	139.585
14.188	132.695
14.880	127.592
15.288	134.226
16.325	138.820
16.637	150.813
17.361	148.262
18.182	130.144
20.473	152.344
21.261	142.137
21.485	125.550
22.582	139.585
22.865	143.413];
data.tL1(:,1) = 365 * data.tL1(:,1); % convert yr to d
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'straight carapace length'};  
temp.tL1    = C2K(24);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'Jone2009';

% time-respiration for embryo
data.tJO_e = [ ... % d, resp for mean of 6 eggs
12.0674, 0.2064
19.1258, 0.3033
26.1126, 0.6609
33.1134, 2.0351
40.2152, 5.3121
47.3265, 9.2928
51.2471, 10.5139
53.2681, 10.0686
55.3004, 10.4575
57.1662, 9.6475];
units.tJO_e   = {'d', 'ml/h'};  label.tJO_e= {'incubation time', 'O_2 consumption rate'};  
temp.tJO_e    = C2K(30);  units.temp.tJO_e = 'K'; label.temp.tJO_e = 'temperature';
bibkey.tJO_e = 'Thom1993';
comment.tJO_e = 'initial mass 85.5 g; hatchling mass 45.09 g wet, 9.776 g dry';

%% set weights for all real data
weights = setweights(data, []);
weights.pAm = 5 * weights.pAm;
weights.Ww0 = 0 * weights.Ww0;
weights.pAm = 0 * weights.pAm;
weights.tJO_e = 5 * weights.tJO_e;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Jone2009: 1.3e11 g jellyfish converts to 2.6e13 J, so jellyfish have 200 J/g';
D2 = 'mod_1: data on ingestion/metam revised, tJO_e, Ww0, Wdb data added';
D3 = 'mod_1: pAm was ignorned because of inconsistency with other data and because allometric correction was applied for obtaining the specific rate';
D4 = 'mod_1: Ww0 was ignorned because it needs detailed modelling of the contribution of water to weight';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = ['all 7 species of sea turtles nest on beaches; '...
     'females lay up to 7 clutches at 10 - 14 d intervals. '...
     'interbrood interval 2 - 8 yrs; males might return each yr. '...
     'Feeding starts 5-11 d after hatching'];
metaData.bibkey.F1 = 'Jone2009'; 
F2 = 'feeds on gelatinous zooplankton, mostly jellyfish: Aurelia, Chrysaora, Cyanea, Rhizostoma, Stomolophus';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '34XB9'; % Cat of Life
metaData.links.id_ITIS = '173843'; % ITIS
metaData.links.id_EoL = '46559482'; % Ency of Life
metaData.links.id_Wiki = 'Dermochelys_coriacea'; % Wikipedia
metaData.links.id_ADW = 'Dermochelys_coriacea'; % ADW
metaData.links.id_Taxo = '48459'; % Taxonomicon
metaData.links.id_WoRMS = '137209'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Dermochelys&species=coriacea'; % ReptileDB
metaData.links.id_AnAge = 'Dermochelys_coriacea'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dermochelys_coriacea}}';
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
bibkey = 'PricWall2006'; type = 'Article'; bib = [ ... 
'author = {Price, E. R. and Wallace, B. P. and Reina, R. D. and Spotila, J. R. and Paladino, F. V. and Piedra, R. and V\''{e}lez, E.}, ' ... 
'year = {2006}, ' ...
'title = {Size, growth, and reproductive output of adult female leatherback turtles \emph{Dermochelys coriacea}}, ' ...
'journal = {Endang Species Res}, ' ...
'volume = {1}, ' ...
'pages = {41--48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jone2009'; type = 'Phdthesis'; bib = [ ... 
'author = {Jones, T. T.}, ' ... 
'year = {2009}, ' ...
'title = {Energetics of the leatherback turtle, \emph{Dermochelys coriacea}}, ' ...
'howpublished = {\url{https://circle.ubc.ca/handle/2429/7454?show=full}}, ' ...
'school = {Univ Britisch columbia (Vancouver)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dermochelys_coriacea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Thom1993'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(93)90445-A}, ' ...
'author = {Thompson, M. B.}, ' ... 
'year = {1993}, ' ...
'title = {Oxygen consumption and energetics of development in eggs of the leatherback turtle, \emph{Dermochelys coriacea}}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A: Physiology}, ' ...
'volume = {104(3)}, ' ...
'pages = {449–453}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
