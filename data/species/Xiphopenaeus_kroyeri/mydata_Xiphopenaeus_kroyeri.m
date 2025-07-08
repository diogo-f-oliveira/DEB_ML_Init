function [data, auxData, metaData, txtData, weights] = mydata_Xiphopenaeus_kroyeri

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Penaeidae';
metaData.species    = 'Xiphopenaeus_kroyeri'; 
metaData.species_en = 'Atlantic seabob'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 19]; 

%% set data
% zero-variate data

data.tp = 96;  units.tp = 'd';      label.tp = 'time since birth at puberty for females'; bibkey.tp = 'CastBaue2015';
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 78;  units.tpm = 'd';      label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'CastBaue2015';
  temp.tpm = C2K(23);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 2.1*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'CastBaue2015';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 1.55;   units.Lp  = 'cm'; label.Lp  = 'carapace length at puberty for females'; bibkey.Lp  = 'CastBaue2015';
data.Lpm  = 1.48;   units.Lpm  = 'cm'; label.Lpm  = 'carapace length at puberty for males'; bibkey.Lpm  = 'CastBaue2015';
data.Li  = 3;   units.Li  = 'cm'; label.Li  = 'ultimate carapace length';   bibkey.Li  = 'CastBaue2015';

data.Wwb = 2.74e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on value for Palaemonetes varians';
data.Wwi = 12.48;     units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'CastBaue2015','sealifebase'};
  comment.Wwi = 'based on 0.6762 * Li^2.654, see F1';

data.GSI  = 0.14; units.GSI  = '-'; label.GSI  = 'gonado-somatic index'; bibkey.GSI = 'guess';   
  temp.GSI = C2K(23); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Haliporoides sibogae';
  
% uni-variate data
% time-length data
data.tL = [ ... % time since birth (d), carapace length (cm)
29.111	0.723
30.244	0.645
36.072	0.811
36.098	0.898
38.842	1.061
42.700	1.074
46.542	1.035
48.074	1.003
48.860	1.055
48.886	1.146
51.929	1.009
57.347	1.088
57.372	1.172
64.284	1.088
68.983	1.348
68.994	1.387
69.806	1.530
72.893	1.543
76.769	1.621
79.890	1.751
82.892	1.472
86.022	1.635
89.099	1.615
90.620	1.544
92.945	1.589
93.007	1.804
97.605	1.713
98.359	1.654
103.836	1.941
104.496	1.557
104.617	1.973
105.346	1.830
106.912	1.915
111.568	2.025
113.829	1.850
113.843	1.895
113.888	2.052
123.913	2.071
125.417	1.941
125.473	2.136
126.161	1.850
126.183	1.928
136.295	2.247
147.852	2.234
150.111	2.052
151.677	2.137
154.751	2.105
157.155	2.423
160.127	2.040
167.135	2.287
169.520	2.541
171.767	2.313
174.075	2.300
179.465	2.281
181.040	2.398
191.822	2.372
198.067	2.645
202.588	2.288
202.691	2.646
213.419	2.431
215.752	2.503
219.610	2.516
231.979	2.646
249.677	2.549
254.309	2.575
346.071	2.740
400.858	2.969
415.547	3.126];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CastBaue2015';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.6762 * (CL in cm)^2.654';
metaData.bibkey.F1 = 'sealifebase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '95750'; % ITIS
metaData.links.id_EoL = '46502158'; % Ency of Life
metaData.links.id_Wiki = 'Xiphopenaeus_kroyeri'; % Wikipedia
metaData.links.id_ADW = 'Xiphopenaeus_kroyeri'; % ADW
metaData.links.id_Taxo = '634107'; % Taxonomicon
metaData.links.id_WoRMS = '377690'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Xiphopenaeus_kroyeri}}';
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
bibkey = 'CastBaue2015'; type = 'Article'; bib = [ ...
'author = {Antonio L. Castilho and Raymond T. Bauer and F\''{u}lvio A. M. Freire and Vivian Fransozo and Rog\''{e}rio C. Costa and Raphael C. Grabowski and and Adilson Fransozo}, ' ...
'year = {2015}, ' ...
'title = {Lifespan and reproductive dynamics of the commercially important sea bob shrimp \emph{Xiphopenaeus kroyeri} ({P}enaeoidea): synthesis of a 5-year study}, ' ...
'journal = {Journal of Crustacean Biology}, ' ...
'volume = {35}, ' ...
'pages = {30-40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Xiphopenaeus-kroyeri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
