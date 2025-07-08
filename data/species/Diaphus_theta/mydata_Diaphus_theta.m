function [data, auxData, metaData, txtData, weights] = mydata_Diaphus_theta
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Diaphus_theta'; 
metaData.species_en = 'California headlightfish';

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MP'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMpb'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.9); % in K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 26]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 26]; 

%% set data
% zero-variate data
data.tj = 71; units.tj = 'd';    label.tj = 'time since birth at metam';   bibkey.tj = 'MokuIshi2001';  
  temp.tj = C2K(7.9); units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';  
  temp.am = C2K(7.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 6.5;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
data.Li = 10;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';
  comment.Li = 'converted from TL of 11.4 cm, on the basis of photo';

data.Wwb = 5.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 2.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';  
  comment.Wwp = 'based on 0.00933*Lp^3.03, see F3';
data.Wwi = 10;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00933*Li^3.03, see F3';

data.Ri = 1.3e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate ';         bibkey.Ri = 'guess';
  temp.Ri = C2K(7.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.95';
  
% uni-variate data
% tL data
data.tL = [ ... % time since birth (d), standard length (cm) 
18.996	0.590
19.539	0.533
23.881	0.590
27.408	0.705
29.308	0.659
30.393	0.739
35.007	0.796
37.720	0.796
42.605	0.871
44.776	0.968
45.047	0.842
48.847	0.922
81.954	1.369
83.582	1.397
84.125	1.437
87.381	1.374
94.980	1.586
105.563	1.758
108.005	1.798
110.990	1.815
112.619	1.781
113.704	1.936
115.061	1.976
117.503	1.947
119.132	1.947
119.403	1.763
119.403	1.798
121.031	1.826
122.659	2.067
125.373	2.021
126.187	1.941
128.087	2.010
130.801	2.033
130.801	2.107
131.886	1.878
134.328	2.210
135.957	2.061
138.399	2.354
142.741	2.210
145.997	2.239
147.083	2.267
157.938	2.359
166.621	2.582
169.878	2.347
173.948	2.674
176.119	2.427
179.919	2.760
180.733	2.719];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(7.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MokuIshi2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Preferred temperature 7.9 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Differences between males and females are small';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Length-Weight relationship: W in g =  0.00933*(SL in cm)^3.03';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '35CLC'; % Cat of Life
metaData.links.id_ITIS = '162584'; % ITIS
metaData.links.id_EoL = '46564122'; % Ency of Life
metaData.links.id_Wiki = 'Diaphus'; % Wikipedia
metaData.links.id_ADW = 'Diaphus_theta'; % ADW
metaData.links.id_Taxo = '173098'; % Taxonomicon
metaData.links.id_WoRMS = '272694'; % WoRMS
metaData.links.id_fishbase = 'Diaphus-theta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diaphus}}';
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
bibkey = 'MokuIshi2001'; type = 'article'; bib = [ ...
'author = {Masatoshi Moku and Kimie Ishimaru and Kouichi Kawaguchi}, ' ... 
'year   = {2001}, ' ...
'title  = {Growth of larval and juvenile \emph{Diaphus theta} ({P}isces: {M}yctophidae) in the transitional waters of the western {N}orth {P}acific}, ' ...
'journal = {Ichthyol Res}, ' ...
'page = {385-390}, ' ...
'volume = {48}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Diaphus-theta.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

