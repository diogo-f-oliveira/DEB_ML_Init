function [data, auxData, metaData, txtData, weights] = mydata_Muraena_helena
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Anguilliformes'; 
metaData.family     = 'Muraenidae';
metaData.species    = 'Muraena_helena'; 
metaData.species_en = 'Mediterranean moray'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.4); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 22];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 22];

%% set data
% zero-variate data

data.ab = 105;    units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(14.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 38*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(14.4);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'SallBear2016: 12-15 yr';

data.Lp  = 75.5;   units.Lp  = 'cm';  label.Lp  = 'total length puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 150;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 0.536;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'cibsub';
  comment.Wwb = 'based on egg diameter of 10 mm: pi/6*1^3';
data.Wwp = 774.6;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00056*(Lp)^3.27, see F1';
data.Wwi = 7.3e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00056*(Li)^3.27, see F1';
 
data.GSI = 0.125; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'SallBear2016';
  temp.GSI = C2K(14.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tLW = [ ... % time since birth (yr), total length (cm).weight (g)
    2 33.28   64.56
    3 41.06  109.20
    4 54.12  292.63
    5 61.95  430.73
    6 66.68  541.01
    7 75.40  834.29
    8 82.10  967.78  
    9 93.58 1688.94 
   10 99.00 2122.95];  
data.tLW(:,1) = (0.8+data.tLW(:,1))*365; % convert to yr to d
units.tLW   = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'wet weight'};  
temp.tLW    = C2K(14.4);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'SallBear2016'; treat.tLW = {1, {'total length','wet weight'}};
  
% length-weight
data.LW = [ ... total length (cm), weight (g)
30.857	22.846
32.044	27.615
33.231	56.470
34.286	46.793
35.341	70.836
36.923	75.589
37.582	65.929
43.253	157.223
43.385	113.866
43.912	80.126
46.945	185.977
48.659	195.542
49.714	132.879
49.846	229.213
51.165	205.075
51.429	392.926
52.484	209.839
52.484	282.094
52.747	416.958
53.934	248.317
54.198	233.855
54.462	296.465
55.385	257.892
56.440	315.653
56.571	219.309
56.571	277.113
56.835	431.245
57.363	262.630
57.758	344.502
58.418	416.730
58.549	305.935
59.341	373.340
59.473	344.434
59.473	320.349
60.000	387.765
60.264	421.473
60.659	368.471
60.791	325.113
61.582	445.505
62.110	416.582
62.110	474.385
62.374	358.768
62.505	378.031
62.637	498.449
63.033	440.630
63.165	353.919
63.297	450.253
63.297	377.999
63.429	546.587
63.956	483.945
63.956	382.789
63.956	281.633
64.088	527.292
64.352	512.831
64.484	411.670
64.747	353.856
64.879	469.457
64.879	377.935
65.143	440.545
65.275	560.964
65.407	416.450
65.670	296.015
65.802	493.505
66.066	421.240
66.330	454.948
66.462	474.211
66.462	522.380
66.593	570.545
66.593	401.951
67.253	633.138
67.253	512.715
67.385	536.794
67.780	565.680
67.780	445.256
68.176	599.383
68.571	570.465
68.571	498.211
69.099	652.332
69.231	628.242
69.231	503.001
69.363	1013.593
69.495	555.977
70.154	488.513
70.286	594.481
70.549	738.979
70.549	570.386
70.549	618.555
70.681	743.791
71.209	632.980
71.473	849.732
71.473	681.139
71.473	551.081
71.736	743.748
72.264	815.982
72.264	560.683
72.527	820.788
72.527	642.561
72.527	575.123
72.791	758.157
72.791	700.354
72.923	604.009
73.187	878.565
73.187	743.690
73.319	772.587
73.582	666.603
73.714	705.134
74.242	762.916
74.374	719.558
74.505	820.709
74.901	594.296
74.901	868.862
74.901	820.693
74.901	738.804
75.033	782.152
75.297	1090.426
75.560	1095.233
75.560	941.090
75.692	700.237
75.956	868.820
76.220	1191.545
76.615	1003.668
76.747	767.632
76.879	786.895
77.143	599.023
77.143	888.040
77.407	700.168
77.538	960.279
77.802	743.505
78.066	1225.190
78.066	979.525
78.198	786.842
78.330	753.118
78.725	1080.655
78.725	931.329
78.857	998.761
78.989	690.471
79.121	834.974
80.440	936.077
80.571	806.014
80.703	1451.481
81.231	1128.724
81.231	348.377
81.363	873.420
81.363	849.335
81.495	1181.700
81.495	1056.459
81.758	964.926
81.890	1070.894
82.022	1085.340
82.022	883.027
82.022	531.390
82.418	921.547
82.681	536.180
82.945	940.794
82.945	396.478
83.077	1128.650
83.209	1022.671
83.736	1196.061
83.736	897.409
84.000	704.721
84.264	1128.602
84.791	1277.906
84.791	950.354
84.923	593.894
85.451	1167.090
85.582	993.674
86.505	1248.936
86.901	1388.612
87.692	1176.634
87.956	1412.654
87.956	1075.467
89.143	1875.034
89.934	1142.825
90.857	1566.680
91.121	1768.982
92.967	651.374
94.418	1749.582
94.945	2168.636
96.527	1619.439
97.319	2105.920
97.451	2317.861
98.901	1826.473
100.352	2105.798];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'SallBear2016';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = weights.ab * 0;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.00056*(TL in cm)^3.27';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44L3Q'; % Cat of Life
metaData.links.id_ITIS = '161243'; % ITIS
metaData.links.id_EoL = '46561744'; % Ency of Life
metaData.links.id_Wiki = 'Muraena_helena'; % Wikipedia
metaData.links.id_ADW = 'Muraena_helena'; % ADW
metaData.links.id_Taxo = '42551'; % Taxonomicon
metaData.links.id_WoRMS = '126303'; % WoRMS
metaData.links.id_fishbase = 'Muraena-helena'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Muraena_helena}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'cibsub'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.cibsub.cat/bioespecie_en-muraena_helena-28086}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Muraena-helena.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SallBear2016'; type = 'article'; bib = [ ...  
'author = {Balkis Sallami and Philippe B\''{e}arez and mohamed Ben Salem}, ' ...
'year = {2016}, ' ...
'title  = {Age and growth of \emph{Muraena helena} ({M}uraenidae) from the north coast of {T}unisia}, ' ...
'journal = {Cybium}, ' ...
'volume = {40(2)}, ' ...
'pages = {155-161}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
