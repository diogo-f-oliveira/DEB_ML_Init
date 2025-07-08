function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_kuda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_kuda'; 
metaData.species_en = 'Estuary seahorse'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW', 'MIE'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp';  'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 11];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'sta@akvaplan.niva.no'}; 
metaData.date_acc  = [2019 02 11]; 

%% set data
% zero-variate data

data.ab = 24;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'fishbase';   
  temp.ab = C2K(27.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = '20 till 28 d';
data.tp = 14*7;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(27.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(27.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 14;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'fishbase';  
data.Li  = 30;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 3.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'SaavMasd2014';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwp = 11.7;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00427*Lp^3.00, see F2';
data.Wwi = 115;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00427*Li^3.00, see F2';

data.Ri  = 1e3/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length data
data.tL = [ ...
0.764	0.984
3.592	1.119
6.208	0.907
8.815	1.215
11.427	1.215
13.821	1.273
15.779	1.331
19.040	1.582
21.006	1.235
23.614	1.447
26.447	1.293
29.052	1.717
31.669	1.447
34.053	2.045
36.674	1.543
38.846	1.833
41.673	1.987
44.503	1.987
46.239	2.315
49.943	2.122
51.887	2.990
55.165	2.277
57.115	2.797
59.504	3.145
62.320	3.878
64.711	4.129
67.753	4.437
70.576	4.842
72.958	5.518
75.776	6.154
77.280	7.254
80.114	7.061
82.722	7.331
85.087	8.932
88.372	7.852
90.319	8.547
93.577	8.932
95.745	9.473
98.359	9.338
100.526	9.916
103.144	9.588
105.744	10.302
108.587	9.569
110.736	11.132
113.792	10.688
116.606	11.576
119.222	11.344
120.955	11.826
124.000	12.000];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(27.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ChooLiew2006';

% time-weight data
data.tW = [ ...
24.761	0.079
27.739	0.134
36.862	0.222
44.867	0.299
50.638	0.442
59.947	0.717
61.064	0.903
67.207	1.090
73.165	1.759
74.468	1.387
77.633	1.749
80.984	2.023
86.011	1.935
87.872	2.242
88.803	2.681
94.574	2.276
98.298	3.109
103.138	2.627
105.186	3.822
109.840	3.384
112.074	4.162
116.543	4.108];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(27.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'ChooLiew2006';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Optimal temperature for reproduction is 27.8 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00427*(TL in cm)^3.00';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3LZMR'; % Cat of Life
metaData.links.id_ITIS = '166495'; % ITIS
metaData.links.id_EoL = '46567778'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_kuda'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_kuda'; % ADW
metaData.links.id_Taxo = '44857'; % Taxonomicon
metaData.links.id_WoRMS = '212237'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus-kuda'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_kuda}}';
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
bibkey = 'ChooLiew2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2006.01105.x}, ' ...
'author = {C. K. Choo and H. C. Liew}, ' ... 
'year = {2006}, ' ...
'title = {Morphological development and allometric growth patterns in the juvenile seahorse \emph{Hippocampus kuda} {B}leeker}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {69}, ' ...
'pages = {426-445}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaavMasd2014'; type = 'Article'; bib = [ ... 
'author = {M. Saavedra and M. Masdeu and P. Hale and C. M. Sibbons and W. V. Holt}, ' ... 
'year = {2014}, ' ...
'title = {Dietary fatty acid enrichment increases egg size and quality of yellow seahorse \emph{Hippocampus kuda}}, ' ...
'journal = {Animal Reproduction Science}, ' ...
'volume = {69}, ' ...
'pages = {54-61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus-kuda.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Hippocampus_kuda/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
