  function [data, auxData, metaData, txtData, weights] = mydata_Hypophthalmichthys_molitrix

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Hypophthalmichthys_molitrix'; 
metaData.species_en = 'Silver carp'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am';'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 26]; 

%% set data
% zero-variate data
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                      bibkey.am = 'Beel2008';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 51.7;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
data.Li = 105;    units.Li = 'cm'; label.Li = 'ultimate total length';            bibkey.Li = 'fishbase';

data.Wwb = 1.41e-2;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';           bibkey.Wwb = 'LenaCoul2015';
  comment.Wwb = 'Computed from egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 17.5e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'Kami2014';

data.Ri = 2e5/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
1 25.5
2 49.81
3 68.91
4 89.94
5 94.47];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(29);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kami2014';

% time-weight
data.tW = [ ... % time since birth (yr), wet weight (g)
1 187.5
2 1548.6
3 4264.8
4 9646.8
5 11855.3];
data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(29);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Kami2014';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
25.415	197.790
25.993	349.777
26.570	349.959
27.148	312.190
27.581	388.229
28.303	236.655
28.448	388.503
28.881	388.640
31.625	351.558
32.491	389.782
32.924	389.919
36.390	504.867
43.899	848.798
44.188	1152.495
47.798	1684.945
48.809	774.449
50.830	1723.856
50.830	1951.560
51.986	1989.875
52.708	1610.598
53.141	2217.945
53.430	2028.282
55.884	2674.221
56.173	2370.706
59.928	2827.301
61.805	3283.303
63.971	3853.248
65.848	4157.448
68.159	4423.833
69.892	3817.171
71.625	4197.225
72.058	4728.672
72.491	4425.203
73.791	5564.134
74.079	4994.965
74.657	6475.224
74.801	5071.096
75.235	5412.789
75.523	7196.560
75.668	5185.222
77.978	6020.866
82.888	7426.593
83.899	8072.074
84.043	7654.663
84.910	8034.444
86.643	9439.166
86.643	9666.870
87.220	9894.757
87.798	8604.617
88.231	10122.780
90.253	10427.026
94.729	7999.598
94.729	11680.814
97.040	10770.728
97.184	11036.428
97.906	15514.835
98.628	13124.172
98.773	13465.774
100.217	13959.588
100.505	11416.985
100.939	10126.799
101.083	16540.508
101.661	12100.463
101.661	14073.897
101.661	14605.207
101.805	17565.404
101.949	15136.607
102.816	16389.253
103.827	16807.030
105.126	13999.092];
units.LW = {'cm', 'wet weight'}; label.LW = {'total length', 'wet weight'};  
temp.LW = C2K(20);  units.temp.LW = 'K'; label.temp.LW = 'temperature';
bibkey.LW = 'Kami2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6MR5M'; % Cat of Life
metaData.links.id_ITIS = '163691'; % ITIS
metaData.links.id_EoL = '220327'; % Ency of Life
metaData.links.id_Wiki = 'Hypophthalmichthys_molitrix'; % Wikipedia
metaData.links.id_ADW = 'Hypophthalmichthys_molitrix'; % ADW
metaData.links.id_Taxo = '43906'; % Taxonomicon
metaData.links.id_WoRMS = '154319'; % WoRMS
metaData.links.id_fishbase = 'Hypophthalmichthys-molitrix'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hypophthalmichthys_molitrix}}';  
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
bibkey = 'Kami2014'; type = 'Article'; bib = [ ...  
'doi = {10.14798/72.1.702}, ' ...
'author = {Bakhtiyar G. Kamilov}, ' ...
'year = {2014}, ' ...
'title = {AGE AND GROWTH OF SILVER CARP (\emph{Hypophthalmichthys molitrix} {V}al.) IN {T}UDAKUL {R}ESERVOIR, {U}ZBEKISTAN}, ' ... 
'journal = {Croatian Journal of Fisheries}, ' ...
'volume = {72}, '...
'pages = {12-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LenaCoul2015'; type = 'Article'; bib = [ ...  
'doi = {10.3391/ai.2015.10.4.08}, ' ...
'author = {Allison W. Lenaerts and Alison A. Coulter and Zachary S. Feiner and Reuben R. Goforth}, ' ...
'year = {2015}, ' ...
'title = {Egg size variability in an establishing population of invasive silver carp \emph{Hypophthalmichthys molitrix} ({V}alenciennes, 1844)}, ' ... 
'journal = {Aquatic Invasions}, ' ...
'volume = {10}, '...
'pages = {449-461}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hypophthalmichthys-molitrix.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
