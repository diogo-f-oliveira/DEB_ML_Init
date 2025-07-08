function [data, auxData, metaData, txtData, weights] = mydata_Gymnocanthus_pistilliger
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Gymnocanthus_pistilliger'; 
metaData.species_en = 'Threaded sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNW'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 3 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 12 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(7.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 15.8;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Panc2012'; 
  comment.Lp = 'based on ap = 2.5 yr, from tL_f data';
data.Lpm  = 14.6;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Panc2012'; 
  comment.Lpm = 'based on ap = 2.5 yr, from tL_m data';
data.Li  = 28;     units.Li  = 'cm';  label.Li  = 'ultimate total length for';    bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'baed on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
 
data.Ri = 4.35e3/365;   units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(2.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.94 as found for Cottis volki';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    1 9.0
    2 14.0
    3 17.1
    4 18.9
    5 20.5
    6 21.7
    7 22.9
    8 23.9
    9 25.0];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Panc2012';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    1 8.3
    2 13.2
    3 16.0
    4 17.7
    5 19.3
    6 20.5
];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Panc2012';
comment.tL_m = 'data for males';

% length-weight
data.LW = [ ... % total length (cm), wet weight (g)
6.834	6.645
8.631	11.628
10.684	23.671
10.877	15.365
10.941	7.890
11.166	22.841
11.647	14.120
12.160	20.349
12.578	24.086
12.578	18.688
13.059	33.223
13.187	21.179
13.380	14.120
13.508	34.468
13.829	25.748
14.053	32.392
14.310	29.070
14.471	34.053
14.535	43.605
14.824	29.900
14.920	40.698
15.241	45.681
15.465	36.545
15.626	40.698
15.690	49.419
15.754	34.468
15.979	39.037
16.107	54.817
16.396	63.123
16.492	49.003
16.588	58.970
16.781	45.266
16.845	55.648
17.037	63.953
17.134	70.598
17.230	49.834
17.390	71.429
17.422	58.140
17.647	72.259
17.711	62.708
17.711	50.664
17.904	55.648
17.968	80.980
18.032	77.658
18.032	63.953
18.064	100.498
18.193	80.565
18.193	59.801
18.289	72.259
18.578	82.226
18.578	69.767
18.610	96.761
18.802	90.532
18.834	84.718
18.930	71.844
18.963	58.555
19.091	102.159
19.219	97.176
19.219	78.488
19.251	87.209
19.412	70.598
19.476	100.498
19.636	81.395
19.668	93.854
19.765	110.465
19.765	71.013
19.797	87.209
19.861	105.897
19.861	81.395
19.989	98.007
20.214	121.262
20.214	80.565
20.246	105.066
20.246	90.532
20.246	97.176
20.406	134.967
20.406	110.465
20.631	92.608
20.727	71.013
20.824	84.302
20.856	110.880
20.888	98.007
20.984	121.678
21.144	105.066
21.241	121.678
21.273	117.525
21.401	135.382
21.497	130.399
21.561	119.601
21.594	144.934
21.658	125.831
21.658	111.296
21.786	136.213
21.914	151.578
22.043	122.924
22.043	115.449
22.075	128.738
22.139	144.518
22.396	120.432
22.556	140.781
22.684	125.415
22.749	135.382
22.941	160.299
23.070	150.748
23.070	140.365
23.198	162.375
23.294	186.462
23.551	166.113
23.583	145.349
23.872	187.292
24.032	140.781
25.251	196.844
25.989	215.532];
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Panc2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Ri = weights.Ri * 0;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '6L76Q'; % Cat of Life
metaData.links.id_ITIS = '167274'; % ITIS
metaData.links.id_EoL = '46568957'; % Ency of Life
metaData.links.id_Wiki = 'Gymnocanthus'; % Wikipedia
metaData.links.id_ADW = 'Gymnocanthus_pistilliger'; % ADW
metaData.links.id_Taxo = '175539'; % Taxonomicon
metaData.links.id_WoRMS = '254519'; % WoRMS
metaData.links.id_fishbase = 'Gymnocanthus-pistilliger'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gymnocanthus}}';
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
bibkey = 'Panc2012'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S0032945210040028}, ' ...
'author = {V. V. Panchenko}, ' ... 
'year = {2012}, ' ...
'title = {Growth and Age of Staghorn Sculpins of the Genus \emph{Gymnocanthus} ({C"}ottidae) in {P}eter the {G}reat {B}ay and Adjacent Waters of {P}rimorye ({S}ea of {J}apan)}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {52}, ' ...
'pages = {226-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Gymnocanthus-pistilliger.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

