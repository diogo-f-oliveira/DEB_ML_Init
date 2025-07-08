function [data, auxData, metaData, txtData, weights] = mydata_Myoxocephalus_scorpius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Psychrolutidae';
metaData.species    = 'Myoxocephalus_scorpius'; 
metaData.species_en = 'Shorthorn sculpin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'am'; 'Lh'; 'Lj'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'L-N'; 'Ww-N'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 05 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 04 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.author_mod_2  = {'Bas Kooijman'};    
metaData.date_mod_2    = [2017 11 11];              
metaData.email_mod_2   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'}; 

metaData.author_mod_3  = {'Bas Kooijman'};    
metaData.date_mod_3    = [2023 12 10];              
metaData.email_mod_3   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 12 10];

%% set data
% zero-variate data

data.ah = 49;      units.ah = 'd';    label.ah = 'age at hatch';              bibkey.ah = 'LuksPede2004';   
  temp.ah = C2K(3.5); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.tb = 90;     units.tb = 'd';    label.tb = 'time since hatch at birth';  bibkey.tb = 'LuksPede2004';
  temp.tb = C2K(2);  units.temp.tb = 'K'; label.temp.tb = 'temperature';
data.am = 15 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'polarlife';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'temp is guessed: aquarium';
  
%data.L0  = 0.24;   units.L0  = 'cm';  label.L0  = 'egg diameter';             bibkey.L0  = 'LuksPede2004';  
data.Lh  = 0.82;   units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'LuksPede2004';  
data.Lj  = 2.2;    units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'LuksPede2004'; 
  comment.Lj = 'Start bentic life; Peak spawning in northern Norway: early Feb, bentic in April/May';
data.Lp  = 14;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'LuksPede2004'; 
data.Li  = 60;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7.2e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Lamp1965';
  comment.Wwb = 'based on egg diamter of 2.4 mm: pi/6*0.24^3';
data.Wwp = 37;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'LuksPede2004';
data.Wwi = 3736;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'LuksPede2004';
  comment.Wwi = 'Computed from (Li/30)^3 * 467 based on largest fish in LuksPede2004';
 
% uni-variate data
% time-length
data.tL_fm = [ ... % age (years), total length (cm) 
1	11.483 10.655
2	16.345 15.346
3	20.035 17.793
4	22.656 19.104];
data.tL_fm(:,1) = 365 * (0 + data.tL_fm(:,1)); % convert yr to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
treat.tL_fm = {1 {'females','males'}};
temp.tL_fm = C2K(9.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Lamp1965';

% length-fecundity from LuksPede2004 at 2C (-1.2 till 3C)
data.LN = [ ... % total length (cm), fecundity (#)
14.247	3914.926
15.123	3918.569
15.014	3336.396
15.068	4583.161
15.616	2507.875
15.781	1926.841
16.055	4587.259
16.329	5170.115
16.658	5420.788
17.041	5006.870
16.493	4173.568
17.534	3346.869
17.534	3762.381
17.863	4013.055
17.863	3597.543
17.918	2932.950
18.521	1439.610
19.288	3271.052
19.781	3854.819
18.575	4348.425
18.849	4848.178
18.521	5345.427
18.247	5676.699
17.808	5591.775
18.192	5011.651
18.959	6178.273
18.959	7009.298
18.575	6758.397
18.521	8420.219
19.945	8841.651
20.000	7429.137
20.000	8010.854
20.110	7678.899
20.548	7763.823
20.822	6933.937
19.507	6097.448
19.507	5681.935
19.890	5932.836
20.219	6432.817
20.493	6350.853
21.425	7019.544
22.027	7437.561
21.863	5857.930
21.973	9016.280
22.137	9931.091
22.082	13836.680
21.479	15163.816
22.082	19404.547
27.507	29565.592
28.603	26993.968
30.082	24756.348
27.014	17846.091
24.548	14844.156
25.425	13102.646
25.918	14018.823
28.055	14027.702
23.397	9770.123
23.836	9855.046
24.055	9274.240
23.507	8939.553];
units.LN  = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
temp.LN   = C2K(2); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'LuksPede2004';

% weight-fecundity from LuksPede2004 at 2C (-1.2 till 3C)
data.WN = [ ... % somatic weight (g), fecundity (#)
37.526	3823.529
45.700	4313.725
40.768	4607.843
55.586	3235.294
47.399	3039.216
52.358	2156.863
63.852	1764.706
99.936	1372.549
78.569	2549.020
71.989	3039.216
78.514	3725.490
93.259	3921.569
103.136	3039.216
114.575	3823.529
67.020	4117.647
58.791	4803.922
60.399	5490.196
80.112	4607.843
75.144	5686.275
81.705	5588.235
81.650	6764.706
75.139	5784.314
124.324	5686.275
117.739	6274.510
140.690	6274.510
130.822	6960.784
125.862	7843.137
116.077	6764.706
112.752	7745.098
94.715	7843.137
94.673	8725.490
106.185	7941.176
115.980	8823.529
153.635	9901.961
150.177	13725.490
133.710	15294.118
143.353	19411.765
380.576	29705.882
467.695	24705.882
379.680	13823.529
325.403	17647.059
266.515	14901.961
279.676	13921.569
243.647	13137.255
250.360	9803.922
201.231	8725.490
179.896	9215.686
174.946	9901.961
163.512	9019.608
171.764	7843.137
183.267	7254.902
173.495	5882.353];
units.WN  = {'g', '#'};  label.WN = {'somatic wet weight', 'fecundity'};  
temp.WN   = C2K(2); units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'LuksPede2004';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 50;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k = 0.1; weights.psd.k_J = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Small yolk sack at hatching, but length at birth is not given';
D2 = 'In plankton during early juvenile stage, later bentic, but age is not given. This event is indicated by metamorphosis, but no acceleration is assumed';    
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D4 = 'mod 3: tL data added; males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Links
metaData.links.id_CoL = '456LW'; % Cat of Life
metaData.links.id_ITIS = '167318'; % ITIS
metaData.links.id_EoL = '46568984'; % Ency of Life
metaData.links.id_Wiki = 'Myoxocephalus_scorpius'; % Wikipedia
metaData.links.id_ADW = 'Myoxocephalus_scorpius'; % ADW
metaData.links.id_Taxo = '44979'; % Taxonomicon
metaData.links.id_WoRMS = '127203'; % WoRMS
metaData.links.id_fishbase = 'Myoxocephalus-scorpius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Myoxocephalus_scorpius}}';
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
bibkey = 'LuksPede2004'; type = 'Article'; bib = [ ... 
'author = {J. A. Luksenburg and T. Pedersen and I. B. Falk-Petersen}, ' ... 
'year = {2004}, ' ...
'title = {Reproduction of the shorthorn sculpin \emph{Myoxocephalus scorpius} in northern {N}orway}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {51}, ' ...
'pages = {157-166}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'polarlife'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.polarlife.ca/Organisms/fish/marine/sculpins/shorthorn.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lamp1965'; type = 'PhDthesis'; bib = [ ... 
'author = {Lamp, F.}, ' ... 
'year = {1965}, ' ...
'title = {Beiträge zur Bestandskunde und Fortpflanzungsbiologie der Seeskorpione, \emph{Myoxocephalus scorpius} (Linnaeus 1758) und \emph{Taurulus bubalis} (Euphrasen 1786) in der Kieler F\"{o}rde}, ' ...
'school = {Kiel University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/SpeciesSummary.php?ID=1329&genusname=Myoxocephalus&speciesname=scorpius&AT=Myoxocephalus+scorpius&lang=English}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

