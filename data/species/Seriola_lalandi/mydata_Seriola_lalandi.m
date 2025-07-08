function [data, auxData, metaData, txtData, weights] = mydata_Seriola_lalandi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Seriola_lalandi'; 
metaData.species_en = 'Yellowtail amberjack'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lh'; 'Lp'; 'Li'; 'WWb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 07];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 07];

%% set data
% zero-variate data

data.ab = 3;   units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'fishbase';   
  temp.ab = C2K(14.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'Baxt1960';   
  temp.am = C2K(14.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 51;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 250;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 1.6e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
 comment.Wwb = 'based on egg diameter of 1.44 mm: pi/6*0.144^3';
data.Wwi = 193.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
 comment.Wwi = 'based on 0.01820*Li^2.93, see F1';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), fork length (cm)
    1  50.5
    2  63.4
    3  70.6
    4  78.3
    5  83.1
    6  87.2 
    7  89.3
    8  95.8
    9 100.8
   10 103.5
   11 108.2
   12 112.7];
data.tL(:,1) = (0.3+data.tL(:,1))*365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(14.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Baxt1960';
  
% length-weight
data.LW = [ ... % fork length (cm), weight (pound)
38.327	2.048
39.527	1.987
40.575	2.221
41.625	2.219
42.524	2.217
44.022	2.568
45.670	2.977
46.869	3.033
47.468	3.209
48.366	3.384
49.564	3.734
50.313	4.027
51.361	4.319
52.111	4.142
53.459	4.551
54.658	4.667
55.706	4.959
57.053	5.427
57.802	5.779
58.551	5.836
59.598	6.364
60.947	6.538
61.545	6.772
62.893	7.181
63.791	7.415
64.989	7.766
65.438	8.059
66.486	8.469
67.534	8.820
69.031	9.347
70.228	9.816
70.977	10.050
72.024	10.518
72.623	10.694
73.670	11.280
74.868	11.631
75.766	11.982
77.113	12.568
77.562	12.803
78.460	13.154
79.358	13.447
80.555	14.033
81.451	14.737
82.649	15.205
83.696	15.733
84.443	16.320
85.939	16.964
86.537	17.434
87.585	17.785
88.182	18.372
88.185	17.784
89.080	18.900
89.677	19.369
90.424	19.956
91.467	21.484
92.213	22.424
94.763	22.125
96.553	24.299
97.451	24.532
98.353	23.942
99.390	27.058
101.492	26.231
103.437	27.110
105.666	31.871];
data.LW(:,2) = data.LW(:,2) * 454; % convert pound to g
units.LW   = {'cm', 'g'};  label.LW = {'fork length','weight'};  
bibkey.LW = 'Baxt1960';

% length-fecundity
data.LN = [ ... % fork length (cm), fecundity (#)
 56.8 729
 67.8 1158
 70.3 578
 70.8 979
 71.3 933
 71.4 516
 71.5 903
 71.7 1070
 72.3 1057
 72.3 1206
 72.4 996
 72.4 1071
 72.8 458
 73.1 960
 73.3 1071
 73.4 1705
 73.6 998
 74.2 1157
 74.2 1233
 74.6 1228
 74.7 1073
 75.2 1150
 75.2 726
 75.6 1232
 76.0 1485
 76.1 1938
 76.9 848
 77.1 1130
 78.3 1810
 79.6 921
 80.7 1581
 80.9 1043
 87.1 1440
 97.0 1611
105.3 3914];
data.LN(:,2) = 1e3*data.LN(:,2);
units.LN   = {'cm', '#'};  label.LN = {'fork length','fecundity'};  
bibkey.LN = 'Baxt1960';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4WV95'; % Cat of Life
metaData.links.id_ITIS = '168689'; % ITIS
metaData.links.id_EoL = '46578022'; % Ency of Life
metaData.links.id_Wiki = 'Seriola_lalandi'; % Wikipedia
metaData.links.id_ADW = 'Seriola_lalandi'; % ADW
metaData.links.id_Taxo = '45249'; % Taxonomicon
metaData.links.id_WoRMS = '126816'; % WoRMS
metaData.links.id_fishbase = 'Seriola-lalandi'; % fishbase

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Length-weight: Ww in g = 0.01820*(TL in cm)^2.93'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Seriola_lalandi}}';
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
bibkey = 'Baxt1960'; type = 'Article'; bib = [ ... 
'author = {Baxter, J.}, ' ... 
'year = {1960}, ' ...
'title = {A study of the yellowtail \emph{Seriola dorsalis} ({G}rill). }, ' ...
'journal = {Calif. Fish Game, Fish. Bull.}, ' ...
'volume = {110}, ' ...
'pages = {1-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Seriola-lalandi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

