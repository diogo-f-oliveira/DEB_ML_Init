function [data, auxData, metaData, txtData, weights] = mydata_Trimma_benjamini

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Trimma_benjamini'; 
metaData.species_en = 'Ring-eye pygmygoby'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'biMr'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 21];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 21];

%% set data
% zero-variate data

data.ab = 6;   units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 140;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'WintAlof2011';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 1.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'WintAlof2011'; 
data.Li  = 3.0;   units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2.771e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg length 1.08 mm, width 0.7 mm of Pomatoschistus minutus: pi/6*0.108*0.07^2';
data.Wwp = 0.0146;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00437*Lp^2.97, see F1';
data.Wwi = 0.144;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwp = 'based on 0.00437*Li^2.97, see F1';

data.Ri  = 357/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';

% uni-variate data

% time-length
data.tL_f = [... %  time since birth (d), std length (cm)
47.916	1.033
50.608	1.340
52.664	1.177
59.625	1.250
60.955	1.224
61.556	1.325
61.848	1.286
64.656	1.242
66.014	1.534
68.992	1.736
72.532	1.610
72.695	1.779
73.131	1.686
73.991	1.386
74.714	1.206
74.742	1.513
76.234	1.639
76.515	1.480
76.659	1.437
76.963	1.531
77.109	1.502
77.269	1.639
78.125	1.296
78.289	1.466
78.750	1.650
78.893	1.599
78.904	1.718
79.348	1.722
80.684	1.758
81.128	1.768
82.027	1.880
84.387	1.801
86.013	1.786
88.224	1.700
88.525	1.754
89.428	1.920
90.011	1.823
90.302	1.765
90.316	1.920
90.726	1.549
91.184	1.700
91.648	1.920
91.949	1.977
92.222	1.732
92.837	1.977
93.570	1.905
94.122	1.473
94.858	1.430
94.901	1.891
94.905	1.938
96.681	1.945
96.810	1.740
96.973	1.898
97.270	1.916
97.275	1.970
98.130	1.617
103.507	2.158
124.214	2.064];
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'std length', 'females'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WintAlof2011';
%
data.tL_m = [ ... %  time since birth (d), std length (cm)
62.014	1.477
71.065	1.750
72.216	1.397
72.385	1.628
74.156	1.577
76.111	1.913
81.279	1.801
82.455	1.711
82.745	1.646
86.026	1.927
86.283	1.502
89.881	2.017
90.050	2.237
93.548	1.660
95.181	1.725
95.353	1.981
96.837	2.032
98.454	1.913
99.191	1.884
99.349	1.995
99.947	2.064
105.411	1.949
106.592	1.913
108.076	1.959
113.999	2.014
115.313	1.815
118.135	1.931
120.195	1.808
122.903	2.295
140.508	2.262];
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'std length', 'males'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WintAlof2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 0 * weights.Ri;

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
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: weight in g = 0.01023*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58V4R'; % Cat of Life
metaData.links.id_ITIS = '638148'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Trimma'; % Wikipedia
metaData.links.id_ADW = 'Trimma_benjamini'; % ADW
metaData.links.id_Taxo = '189473'; % Taxonomicon
metaData.links.id_WoRMS = '278488'; % WoRMS
metaData.links.id_fishbase = 'Trimma-benjamini'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trimma}}';
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
bibkey = 'WintAlof2011'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10641-011-9782-6}, ' ...
'author = {Winterbottom, R. and Alofs, K.M. and Marseu, A}, ' ... 
'year = {2011}, ' ...
'title = {Life span, growth and mortality in the western {P}acific goby \emph{Trimma benjamini}, and comparisons with \emph{T. nasa}}, ' ...
'journal = {Environ. Biol. Fish}, ' ...
'volume = {91}, ' ...
'pages = {295–301}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [ ...
'author = {Anonymous}, ' ...
'year = {2015}, ' ...
'howpublished = {\url{https://www.fishbase.de/summary/Trimma-benjamini.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
